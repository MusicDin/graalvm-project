# Cleans maven package
mvn clean

# Creates new maven package
mvn clean package

# Runs tracing-agent
$JAVA_HOME/bin/java -agentlib:native-image-agent=config-output-dir=api/src/main/resources/META-INF/native-image -cp api/target/classes:api/target/dependency/* com.kumuluz.ee.EeApplication
