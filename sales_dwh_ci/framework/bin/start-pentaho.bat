REM CALL init.bat
REM call %PENTAHO_HOME%\postgresql\bin\pg_ctl.exe start -D "%PENTAHO_HOME%\postgresql\data"
REM CALL %PENTAHO_HOME%\server\pentaho-server\start-pentaho.bat


ECHO *** CALL init-pdi-server in framework\bin ***
CALL init-pdi-server.bat
ECHO *** CALL start-pentaho.bat in "%KETTLE_CLIENT_DIR%" ***
CALL %KETTLE_CLIENT_DIR%\start-pentaho.bat %OPT% %*