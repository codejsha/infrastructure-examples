@REM @ECHO OFF

SET JAVA_HOME=C:\Progra~1\Java\jdk1.8.0_301
SET WL_HOME=C:\Oracle\Middleware\Oracle_Home\wlserver
SET DOMAIN_NAME=%1
SET DOMAIN_HOME=C:\Oracle\Middleware\Oracle_Home\user_projects\domains\%DOMAIN_NAME%
SET NEW_USERNAME=%2
SET NEW_PASSWORD=%3

SET DATETIME=%DATE:~0%_%TIME:~0%
SET DATETIME=%DATETIME::=%
SET DATETIME=%DATETIME:-=%
SET DATETIME=%DATETIME:.=_%
SET DATETIME=%DATETIME: =_%
SET DATETIME=%DATETIME:/=_%

MOVE %DOMAIN_HOME%\servers\AdminServer\data %DOMAIN_HOME%\servers\AdminServer\data.%DATETIME%
MOVE %DOMAIN_HOME%\servers\AdminServer\cache %DOMAIN_HOME%\servers\AdminServer\cache.%DATETIME%
MOVE %DOMAIN_HOME%\servers\AdminServer\tmp %DOMAIN_HOME%\servers\AdminServer\tmp.%DATETIME%
MOVE %DOMAIN_HOME%\servers\AdminServer\logs %DOMAIN_HOME%\servers\AdminServer\logs.%DATETIME%
MOVE %DOMAIN_HOME%\security\DefaultAuthenticatorInit.ldift %DOMAIN_HOME%\security\DefaultAuthenticatorInit.ldift.%DATETIME%
MOVE %DOMAIN_HOME%\boot.properties %DOMAIN_HOME%\boot.properties.%DATETIME%

%JAVA_HOME%\bin\java -classpath %WL_HOME%\server\lib\weblogic.jar weblogic.security.utils.AdminAccount %NEW_USERNAME% %NEW_PASSWORD% %DOMAIN_HOME%\security

ECHO username=%NEW_USERNAME%> %DOMAIN_HOME%\boot.properties
ECHO password=%NEW_PASSWORD%>> %DOMAIN_HOME%\boot.properties
