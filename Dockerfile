#### Build stage ####
FROM maven:3.6.3-jdk-8-slim AS build

COPY api /usr/src/app/api
COPY reflectionConfig.json /usr/src/app
COPY pom.xml /usr/src/app

RUN mvn -f /usr/src/app/pom.xml clean install


##### Production stage ####
FROM oracle/graalvm-ce:20.0.0-java8

## FAT JAR (copies only jar)
#COPY --from=build /usr/src/app/api/target/graalvm-basic.jar /usr/app/graalvm-basic.jar

## COPY DEPENDENCIES (copies whole target)
COPY --from=build /usr/src/app/api/target /usr/app/api/target

## Reflection config file
#COPY --from=build /usr/src/app/reflectionConfig.json /usr/app/reflectionConfig.json

EXPOSE 8080

RUN gu install native-image
RUN gu install R

# FAT JAR
#RUN native-image -jar /usr/app/graalvm-basic.jar --no-fallback -H:IncludeResourceBundles=META-INF/kumuluzee/boot-loader runme
#RUN native-image --language:js --language:R -jar /usr/app/graalvm-basic.jar -H:IncludeResourceBundles=META-INF/kumuluzee/boot-loader -H:+ReportExceptionStackTraces --no-fallback --report-unsupported-elements-at-runtime runme

# COPY-DEPENDENCIES
#RUN ["native-image","--language:js","-cp","/usr/app/api/target/classes:/usr/app/api/target/dependency/*","com.kumuluz.ee.EeApplication","-H:IncludeResourceBundles=META-INF/kumuluzee/boot-loader","-H:+ReportExceptionStackTraces","--no-fallback","--report-unsupported-elements-at-runtime","runme"]
RUN native-image --language:js -cp /usr/app/api/target/classes:/usr/app/api/target/dependency/* com.kumuluz.ee.EeApplication -0 -H:+ReportExceptionStackTraces --no-fallback --report-unsupported-elements-at-runtime runme
ENTRYPOINT ["./runme"]

# To use reflection file when generating native-image
# -H:ReflectionConfigurationFiles=/usr/app/reflectionConfig.json
# --static (builds statically linked executable !!REQUIRES: libc and zlib !!!)
# -0 (0 - no optimization, 1 - basic optimization)
