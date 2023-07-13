ECHO *** CALL init.bat in framework\bin ***
CALL init.bat
ECHO *** CALL start-pentaho.bat in "%KETTLE_CLIENT_DIR%" ***
CALL %KETTLE_CLIENT_DIR%\start-pentaho.bat %OPT% %*