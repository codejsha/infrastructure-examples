######################################################################

curl https://start.spring.io/starter.zip \
    -d dependencies=web \
    -d name=demo \
    -d artifactId=demo \
    -d groupId=com.example \
    -d packageName=com.example.demo \
    -d javaVersion=21 \
    -o demo.zip

curl https://start.spring.io/starter.zip \
    -d type=maven-project \
    -d language=java \
    -d platformVersion=3.5.7 \
    -d packaging=jar \
    -d configurationFileFormat=properties \
    -d jvmVersion=21 \
    -d groupId=com.example \
    -d artifactId=demo \
    -d name=demo \
    -d description="Demo project for Spring Boot" \
    -d packageName=com.example.demo \
    -d dependencies=web \
    -o demo.zip
