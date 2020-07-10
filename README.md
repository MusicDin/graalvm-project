# GraalVM Project

## Goal of this project
Goal of this project is to make KumuluzEE framework compatible with GraalVM.

## GraalVM installation
Installation steps are available on [GraalVM official site](https://www.graalvm.org/docs/getting-started/#install-graalvm).

## Project elements
+ Simple service:
  + API which return constants
  + Servlet which returns constants
  + Only one module (no business logic and no DB connectivity)
+ Dockerfile for building a docker image
  + Folder *Dockerfiles* contains backups and different type of docker files

## Usage

*Note: maven-plugin goal has to be set to repackage for uber-jar and to copy-dependencies for exploded.*

### Running with scripts (EXPLODED)

To execute mvn and tracing agent run `trace.sh` script.

After tracing run `build.sh` script in order to build no-fallback image. 

After generating image simply run `graalvm-basic`.

*Note: Edit those scripts to fit your needs*

### Manually - UBER(FAT) JAR

```
mvn clean package 
```

Use native-image-agent to generate configuration files for native-image (application will start):

```
java -agentlib:native-image-agent=config-merge-dir=api/src/main/resources/META-INF/native-image -jar api/target/graalvm-basic.jar 
```

Then generate native-image:
```
sudo native-image --no-fallback \
        --allow-incomplete-classpath \ 
        --enable-https \
        -H:+JNI \
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

### Manually - EXPLODED 

```
mvn clean package 
```

Use native-image-agent to generate configuration files for native-image (application will start):

```
sudo java -agentlib:native-image-agent=config-output-dir=api/src/main/resources/META-INF/native-image -cp api/target/classes:api/target/dependency/* com.kumuluz.ee.EeApplication
```

Then generate native-image:
```
sudo native-image --no-fallback \
        --allow-incomplete-classpath \ 
        --enable-https \
        -H:+JNI \
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

If everything has been done right, you should be able to start native-image:
```
./graalvm-basic 
```

## Known (potential) errors

1. Resource *web.xml* is not included in generated image.
Issue opened on [GraalVM Github](https://github.com/oracle/graal/issues/2470) may help, though it is not solved.

## Boot time comparison

*All tests were executed on virtual machine with 8 vCPU and 64GB RAM.*

*Each time in table represents an avarage time of 100 boots (in milliseconds). Times are saved in [time_tests](./time_tests) folder.*

Project | Time to boot in JVM | Fallback image | No-fallback image
:---: | :---: | :---: | :---:
[this project](https://github.com/MusicDin/graalvm-project) | 1787 ms | 1832 ms | /
[fri-pointer](https://github.com/fri-pointer) | 7832 ms | 8347 ms | /


## Useful links

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

  
