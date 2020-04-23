# Removes current image if exists
#rm -f ./graalvm-basic

# Builds GraalVM native-image
native-image --no-fallback \
  --allow-incomplete-classpath \
  -H:IncludeResources='.*/webapp/WEB-INF/web.xml$' \
  -H:+ReportUnsupportedElementsAtRuntime \
  -H:+ReportExceptionStackTraces \
  -H:+PrintClassInitialization \
  -H:EnableURLProtocols=http,https \
  -H:Log=registerResource \
  -H:ReflectionConfigurationFiles=api/src/main/resources/META-INF/native-image/reflect-config.json \
  -H:ResourceConfigurationFiles=api/src/main/resources/META-INF/native-image/resource-config.json \
  -cp api/target/classes:api/target/dependency/* com.kumuluz.ee.EeApplication graalvm-basic