@ECHO off
REM Determine the PROJECT_NAME and _ENV configuration based on parent directory
for %%a in ("%~dp0\..\.") do set "PROJECT_NAME_TEMP=%%~nxa"
set PROJECT_NAME=%PROJECT_NAME_TEMP:-configuration=%
for %%a in ("%~dp0\.") do set "PROJECT_ENV=%%~nxa"
ECHO *** Setting PROJECT_NAME to "%PROJECT_NAME%" ***
ECHO *** Setting PROJECT_ENV to "%PROJECT_ENV%" ***
REM BASE_CONFIG_DIR is used later in init.bat to call back to this configdir
set BASE_CONFIG_DIR=%CD%
ECHO *** Setting BASE_CONFIG_DIR : "%CD%" ***
REM Capture current dir to switch back after execution
set ORIG_DIR=%CD%
ECHO *** Setting ORIG_DIR to "%ORIG_DIR%" ***
CD /d %~dp0\..\..\framework\bin\
SET "framework\bin=%CD%"
ECHO *** Move to framework\bin : "%framework\bin%" ***
REM Call framework common script
CALL Spoon.bat %*
cd %ORIG_DIR%
ECHO *** Move to: "%ORIG_DIR%" ***