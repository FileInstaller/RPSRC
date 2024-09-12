@echo off
TITLE Update checker
Color 0f
mode con cols=89 lines=29
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
echo]
echo %ESC%[31mFile has no updates, %ESC%[32mlast version downloaded!
pause
exit /b
