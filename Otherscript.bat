@echo off
TITLE Update checker
Color 0f
mode con cols=89 lines=29
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
echo]
echo %ESC%[32mUpdate Received!
:updatechecker
set "url=https://github.com/FileInstaller/RPSRC/blob/main/Multi-Python%20Installer.bat"
set "outputbat=MPI.bat"
goto downloadbat
:downloadbat
if exist %outputbat% (
echo %ESC%[32mFile %outputbat% already exists. Updating file.....
del C:\Windows\System32\Multi-Python Installer.bat
del %outputbat%
echo Downloading %url%...
powershell -Command "Invoke-WebRequest -Uri !url! -OutFile !outputbat!"
if exist !outputbat! (
echo File downloaded successfully. Running file...
start !outputbat!
) else (
echo %ESC%[31mFailed to receive update, its may not released
)
)
pause
exit /b
