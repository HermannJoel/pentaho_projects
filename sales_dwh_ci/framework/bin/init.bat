@echo off

REM Set Environment
REM ~dp0 has \ at end already
REM SET ROOT_DIR=%~dp0..\..
REM IF "%PROJECT_ENV%"=="" (SET PROJECT_ENV=config-pdi-local)
REM ECHO *** Setting ROOT_DIR to "%ROOT_DIR%" ***
REM ECHO *** Running with "%PROJECT_ENV%" environment settings ***

REM Load Environment Configuration
REM FOR /F "usebackq delims=" %%x IN ("%BASE_CONFIG_DIR%\env.windows.conf") DO SET %%x
REM ECHO *** Setting PENTAHO_HOME to %PENTAHO_HOME% ***

REM Set Additional Variables
REM IF "%KETTLE_CLIENT_DIR%"=="" (SET KETTLE_CLIENT_DIR=%USERPROFILE%\%PENTAHO_HOME%\data-integration)
REM SET KETTLE_HOME=%BASE_CONFIG_DIR%
REM SET KETTLE_META_HOME=%BASE_CONFIG_DIR%
REM SET OPT="-DPENTAHO_METASTORE_FOLDER=%KETTLE_META_HOME%" "-DROOT_DIR=%ROOT_DIR%" "-DPROJECT_ENV=%PROJECT_ENV%" "-DPROJECT_NAME=%PROJECT_NAME%"

REM ECHO *** Setting KETTLE_CLIENT_DIR to %KETTLE_CLIENT_DIR% ***
REM ECHO *** Setting KETTLE_HOME to %KETTLE_HOME% ***
REM ECHO *** Setting KETTLE_META_HOME to %KETTLE_META_HOME% ***


REM Set Environment
CD /d %~dp0\..\..
SET ROOT_DIR=%CD%
REM Set config-pdi-... e.g: config-pdi-local
IF "%PENTAHO_ENV%"=="" (SET PENTAHO_ENV=config-pdi-test)
ECHO Running with "%PENTAHO_ENV%" environment settings

ECHO *** Setting ROOT_DIR to "%ROOT_DIR%" ***
ECHO *** Setting PENTAHO_ENV to "%PENTAHO_ENV%" ***
ECHO *** Move to CONF_DIR : "%ROOT_DIR%\sales_dwh_ci-configuration\%PENTAHO_ENV%\env.windows.conf" ***

REM Load Environment Configuration
FOR /F "usebackq delims=" %%x IN ("%ROOT_DIR%\sales_dwh_ci-configuration\%PENTAHO_ENV%\env.windows.conf") DO (SET %%x)
REM Set Additional Variables
SET KETTLE_CLIENT_DIR=%PENTAHO_HOME%
SET KETTLE_HOME=%ROOT_DIR%\sales_dwh_ci-configuration\%PENTAHO_ENV%
REM SET KETTLE_HOME=%BASE_CONFIG_DIR%
SET KETTLE_META_HOME=%ROOT_DIR%\sales_dwh_ci-configuration\%PENTAHO_ENV%
REM SET KETTLE_META_HOME=%BASE_CONFIG_DIR%
SET OPT=%OPT% "-DPENTAHO_METASTORE_FOLDER=%KETTLE_META_HOME%"
REM SET OPT="-DPENTAHO_METASTORE_FOLDER=%KETTLE_META_HOME%" "-DROOT_DIR=%ROOT_DIR%" "-DPROJECT_ENV=%PROJECT_ENV%" "-DPROJECT_NAME=%PROJECT_NAME%"

ECHO *** Setting KETTLE_CLIENT_DIR to : %KETTLE_CLIENT_DIR% ***
ECHO *** Setting KETTLE_HOME to : %KETTLE_HOME% ***
ECHO *** Setting KETTLE_META_HOME to : %KETTLE_META_HOME% ***