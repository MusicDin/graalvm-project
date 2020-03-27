# GraalVM Project

## SUMMARY
Goal of this project is to make KumuluzEE framework compatible with GraalVM.

## GraalVM installation
Installation steps are avaible on [GraalVM official site](https://www.graalvm.org/docs/getting-started/#install-graalvm).

*Note that in this project is used GraalVM Community Edition(CE)*

## Project elements
+ Simple service:
 + API which return constants
 + Servlet which returns constants
 + Only one module (no business logic and no DB connectivity)
+ Dockerfile for building an docker image
 + Folder *Dockerfiles* contains backups and different type of docker files

## Goals
| Goal | Goal description | Status |
| :--- | :--------------- | :----- |
| Simple service | Create basic service in KumuluzEE framework | DONE |
| Fallback image | Create native fallback image of *simple service* | DONE |
| No-fallback image | Create native no-fallback image of *simple service* | FAILED |
| Docker image | Create docker image that uses no-fallback native image | FAILED |
| Intermediate service | Expend functionality of simple service | |
| Fallback image | Create native fallback image of *intermediate service* | |
| No-fallback image | Create native no-fallback image of *intermediate service* | |
| Complex service | Whole KumuluzEE functionality | |
| Expand KumuluzEE maven-plugin| Final goal | |

## Tracing agent

Use native-image-agent to generate configuration files for native-image:

```
sudo java -agentlib:native-image-agent=config-merge-dir=api/src/main/resources/META-INF/native-image -jar api/target/graalvm-basic.jar 
```

After configuration files are generated, repackage application using maven:
```
mvn clean package 
```

Then generate native-image:
```
sudo native-image --no-fallback \
        --allow-incomplete-classpath \ 
        --enable-https \
        -H:+JNI \
        -H:+ReportUnsupportedElementsAtRuntime \
        -H:+ReportExceptionStackTraces \
        -H:EnableURLProtocols=http,https,jar,jrt \
        -H:ConfigurationFileDirectories=api/src/main/resources/META-INF/native-image/ \
        -H:ReflectionConfigurationFiles=api/src/main/resources/META-INF/native-image/reflect-config.json \
        -H:ResourceConfigurationFiles=api/src/main/resources/META-INF/native-image/resource-config.json \
        -H:JNIConfigurationFiles=api/src/main/resources/META-INF/native-image/jni-config.json \
        -jar api/target/graalvm-basic.jar
```

If everything is done right, you should be able to start native-image:
```
./graalvm-basic 
```


## Errors
+ When docker image is run with ```copy-dependencies``` type of packaging the following error occurs:
```
Main entry point class 'com.kumuluz.ee.EeApplication' not found.
```

+ When run locally or in docker image with ```repackage``` type of packaging the following error occurs:
```
Exception in thread "main" com.kumuluz.ee.loader.exception.EeClassLoaderException: Not a JAR: <name_of_native_image> java.util.zip.ZipException: zip END header not found
```

## Notes
+ GraalVM ```native-image``` allows *ahead-of-time*(AoT) compilation in comparison to classic *just-in-time*(JiT) compilation used in JVM.
It can create fallback or no-fallback image:
 + ```fallback``` image is JDK dependent
 + ```no-fallback``` image is stand-alone (or JDK independent)
 
## Used native-image tags 
General options:
+ ```-cp <classpath>``` or ```-jar <jar>``` according to packaging type
+ ```--no-fallback``` generates no-fallback image or throws exception
+ ```--report-unsupported-elements-at-runtime``` reports usage of unsupported methods and fields at run time
+ ```--language:<languageId>``` makes sure that given language is available as language for the image

*Note that all options are available on [GraalVM official site](https://www.graalvm.org/docs/reference-manual/native-image/) or using command ```native-image --help```.*

Expert options:
+ ```-H:IncludeResourceBundles=META-INF/kumuluzee/boot-loader```
+ ```-H:+ReportExceptionStackTraces```

*Note that all options are available using command ```native-image --expert-options```.*

## Useful links
+ [Github - JakaBernard/graalvm-diploma-aplikacija](https://github.com/JakaBernard/graalvm-diploma-aplikacija)
+ [Github - service loader error](https://github.com/cstancu/native-image-service-loader-demo/blob/master/reflection_config.json)


## Technologies used in project
+ [KumuluzEE](https://ee.kumuluz.com/)
+ [GraalVM](https://www.graalvm.org/)

  