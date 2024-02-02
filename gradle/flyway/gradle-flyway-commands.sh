######################################################################

gradle flywayInfo -Dspring.profiles.active=test

gradle flywayValidate -i -Dspring.profiles.active=test
gradle flywayValidate -i -Dspring.profiles.active=test --stacktrace

gradle flywayMigrate -i -Dspring.profiles.active=test
gradle flywayMigrate -i -Dspring.profiles.active=test --stacktrace

gradle flywayRepair -i -Dspring.profiles.active=test

gradle flywayClean -i -Dspring.profiles.active=test
