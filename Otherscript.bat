@echo off
TITLE Update checker
Color 0f
mode con cols=89 lines=29
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
echo]
echo %ESC%[31mUpdate Received!
:updatechecker
set "url=https://github.com/FileInstaller/RPSRC/blob/main/Multi-Python%20Installer.bat"
set "outputbat=Multi-Python Installer.bat"
goto downloadbat
:download
if exist %output% (
echo %ESC%[32mFile %output% updated alredy!
start python %output%
) else (
echo Downloading %url%...
powershell -Command "Invoke-WebRequest -Uri !url! -OutFile !output!"
if exist !output! (
echo %ESC%[32mUpdated successfully! Starting new update
start python !output!
) else (
echo %ESC%[31mFailed to update. wait for fixing...
)
)
pause
exit /b
