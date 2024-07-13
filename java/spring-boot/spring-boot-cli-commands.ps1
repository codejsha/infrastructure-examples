######################################################################

### spring initializr commands
### https://start.spring.io/

spring help init

######################################################################

### view supported dependencies, project types, parameters
spring init --list

spring init --dependencies=web,data-jpa my-project
spring init --name=demo --artifactId=demo --dependencies=web,lombok my-app
