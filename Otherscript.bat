@echo off
setlocal enabledelayedexpansion
TITLE Update checker
Color 0f
mode con cols=89 lines=29
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
echo]
echo %ESC%[32mUpdate Received!

set "url=https://raw.githubusercontent.com/FileInstaller/RPSRC/main/MPInstaller.bat"
set "outputbat=%temp%\MPInstaller.bat"
set "shortcut=%userprofile%\Desktop\MPInstaller.lnk"
set "ps_script=%temp%\create_shortcut.ps1"

:downloadbat
echo Downloading %url%...
powershell -Command "Invoke-WebRequest -Uri !url! -OutFile !outputbat!"
if exist "!outputbat!" (
echo File downloaded successfully.
echo Creating shortcut on Desktop...
echo $ws = New-Object -ComObject WScript.Shell; > "!ps_script!"
echo $s = $ws.CreateShortcut('"!shortcut!"'); >> "!ps_script!"
echo $s.TargetPath = '"!outputbat!"'; >> "!ps_script!"
echo $s.Description = 'MP Installer Update Script'; >> "!ps_script!"
echo $s.IconLocation = '%SystemRoot%\system32\SHELL32.dll,0'; >> "!ps_script!"
echo $s.Save(); >> "!ps_script!"
powershell -ExecutionPolicy Bypass -File "!ps_script!"
del "!ps_script!"
echo Running file...
start "" "!outputbat!"
) else (
echo %ESC%[31mFailed to download the update. It may not have been released.
)

ping 192.0.2.2 -n 1 -w 5000 > nul
exit /b
