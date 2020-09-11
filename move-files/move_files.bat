@echo off

REM --------------------
REM "Constants"
REM --------------------
set X=0
set "source=%~1%
set "log=%~3%
set "destination=%~2%
set "mp3=*.mp3"
set "mp4=*.mp4"
set "mp3Type=MP3"
set "mp4Type=MP4"

REM --------------------
REM "Get the Timestamp
REM --------------------
FOR /F "tokens=*" %%g IN ('Timestamp.bat') do (SET TIMESTAMP=%%g)

REM echo %TIMESTAMP%

rem robocopy "%source%\*.mp4" "%destination%" /mov /minage:%X% >> "%log%" 

if EXIST "%source%\%mp4%" ( 
	echo "%TIMESTAMP% Found a %mp4Type% file" >> %log%
	move "%source%\%mp4%" "%destination%" >> "%log%"
) ELSE (
	echo "%TIMESTAMP% Did not Find a %mp4Type% file" >> %log%
)

if EXIST "%source%\%mp3%" ( 
	echo "%TIMESTAMP% Found a %mp3Type% file" >> %log%
	move "%source%\%mp3%" "%destination%" >> "%log%"
) ELSE (
	echo "%TIMESTAMP% Did not Find a %mp3Type% file" >> %log%
)
exit /b