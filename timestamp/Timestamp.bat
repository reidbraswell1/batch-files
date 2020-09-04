@echo off

REM "Break the date down into DAY and DATE"
FOR /F "tokens=1,2" %%a in ('date /t') do (
	set DAY_SPELLED=%%a
	set DATE=%%b
)

REM "Further break the DATE down into MONTH, DAY, YEAR"
FOR /F "tokens=1,2,3 delims=/" %%a in ("%DATE%") do (
	set MONTH=%%a
	set DAY=%%b
	set YEAR=%%c
)

REM "Break the time down into TIME and AM_PM"
FOR /F "tokens=1,2" %%a in ('time /t') do (
	set TIME=%%a
	set AM_PM=%%b
)

set TIMESTAMP=%YEAR%-%MONTH%-%DAY% %DAY_SPELLED% %TIME% %AM_PM%
echo %TIMESTAMP%