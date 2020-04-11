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

*Note: To change between uber-jar or exploded, maven-plugin goal must be set to repackage for uber-jar and to copy-dependencies for exploded.*

### UBER(FAT) JAR

Use native-image-agent to generate configuration files for native-image (application will start):

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
        -H:+PrintClassInitialization \
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

### EXPLODED 


Use native-image-agent to generate configuration files for native-image (application will start):

```
sudo java -agentlib:native-image-agent=config-output-dir=api/src/main/resources/META-INF/native-image -cp api/target/classes:api/target/dependency/* com.kumuluz.ee.EeApplication
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
        -H:+PrintClassInitialization \
        -H:+ReportExceptionStackTraces \
        -H:EnableURLProtocols=http,https \
        -H:ConfigurationFileDirectories=api/src/main/resources/META-INF/native-image/ \
        -H:ReflectionConfigurationFiles=api/src/main/resources/META-INF/native-image/reflect-config.json \
        -H:ResourceConfigurationFiles=api/src/main/resources/META-INF/native-image/resource-config.json \
        -H:JNIConfigurationFiles=api/src/main/resources/META-INF/native-image/jni-config.json \
        -cp api/target/classes:api/target/dependency/* com.kumuluz.ee.EeApplication \
        graalvm-basic
```

If everything is done right, you should be able to start native-image:
```
./graalvm-basic 
```

## Extra

Force org.eclipse.jetty package to be resolved at run time instead in build time
```--initialize-at-run-time=org.eclipse.jetty``` 

 
## Useful links

### Knowledge base
+ [Class initialization in Native Image](https://github.com/oracle/graal/blob/master/substratevm/CLASS-INITIALIZATION.md)
+ [Github - JakaBernard/graalvm-diploma-aplikacija](https://github.com/JakaBernard/graalvm-diploma-aplikacija)
+ [Github - Oracle/GraalVM/native-image-limitations](https://github.com/oracle/graal/blob/master/substratevm/LIMITATIONS.md)
+ [Medium - Updates on Class Initialization in GraalVM Native Image Generation](https://medium.com/graalvm/updates-on-class-initialization-in-graalvm-native-image-generation-c61faca461f7)
+ [Introducing the Tracing Agent: Simplifying GraalVM Native Image Configuration](https://medium.com/graalvm/introducing-the-tracing-agent-simplifying-graalvm-native-image-configuration-c3b56c486271)
+ [InfoQ - GraalVM 20.0: Run Tomcat as Native Image on Windows](https://www.infoq.com/news/2020/03/graalvm-20-tomcat-native-windows/)
+ [Apache - Tomacat 9 GraalVM support](https://ci.apache.org/projects/tomcat/tomcat9/docs/graal.html)

### Forums/Issues
+ [Github - Service loader error](https://github.com/cstancu/native-image-service-loader-demo/blob/master/reflection_config.json)
+ [Github Issue - Error building Scala project with native-image](https://github.com/oracle/graal/issues/1505)
+ [Stackoverflow - Can't find bundle for base name /Bundle](https://stackoverflow.com/questions/12986234/cant-find-bundle-for-base-name-bundle-locale-en-us/48726842)

## Technologies used in project
+ [KumuluzEE](https://ee.kumuluz.com/)
+ [GraalVM](https://www.graalvm.org/)

  
