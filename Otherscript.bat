@echo off
setlocal enabledelayedexpansion
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
REM              SETUP
TITLE Roblox Account Changer
Color 0f
mode con cols=89 lines=29
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
chcp 65001 > nul
cls

REM               LOADLOGO
:LOADLOGO
echo]
echo]
echo %ESC%[95m    ██████╗  ██████╗     ██████╗ ██████╗
echo     ██╔══██╗██╔════╝    ██╔════╝██╔════╝
echo     ██║  ██║██║  ███╗   ██║     ██║     
echo     ██║  ██║██║   ██║   ██║     ██║     
echo     ██████╔╝╚██████╔╝██╗╚██████╗╚██████╗
echo     ╚═════╝  ╚═════╝ ╚═╝ ╚═════╝ ╚═════╝
echo                     Python installer
ping 192.0.2.2 -n 1 -w 1000 > nul
echo]
echo %ESC%[31mFile has no updates, %ESC%[32mlast version downloaded!
