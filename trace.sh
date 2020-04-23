# Cleans maven package
mvn clean

# Creates new maven package
mvn clean package

# Runs tracing-agent
java -agentlib:native-image-agent=config-output-dir=api/src/main/resources/META-INF/native-image -cp api/target/classes:api/target/dependency/* com.kumuluz.ee.EeApplication

# Enables editing those files (uncomment if needed)
#chmod 777 api/src/main/resources/META-INF/native-image/*