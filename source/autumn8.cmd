@echo off
:: This enables extensive batch functions
setlocal enableextensions
call :setESC
goto check_Permissions
title Autumn8
goto check_Permissions

	:check_Permissions
		echo Administrative permissions required. Detecting permissions...
		net session >nul 2>&1
		if %errorLevel% == 0 (
			echo Success: Administrative permissions confirmed.
		) else (
			echo Failure: Current permissions inadequate.
			PAUSE
			goto EOF
		)

pushd %~dp0
SET mypath=%~dp0
echo %mypath:~0,-1%
cd %mypath%
CLS
COLOR 03
TYPE ascii.txt
ECHO.
ECHO.
ECHO.
ECHO.
TIMEOUT 3 >NUL
GOTO MENU

:: This is the said menu 
:MENU
COLOR 0A
CLS

ECHO %ESC%[93m                     =================================================================
ECHO %ESC%[0m && TYPE ascii2.txt && ECHO %ESC%[96m
ECHO. 
ECHO                       1 - Run All%ESC%[0m
ECHO %ESC%[93m                      2 - Disable Account "Administrator"/"Administrateur"
ECHO                       3 - Delete unwanted programs
ECHO                       4 - Rename Computer
ECHO                       5 - Add System Icon to Desktop
ECHO                       6 - Configure Folder View
ECHO                       7 - Configure Power Options
ECHO                       8 - Configure Taskbar
ECHO                       9 - Configure System Restore, BSOD and Auto Driver Install
ECHO                      10 - Install Acrobat Reader
ECHO                      11 - Install 7zip
ECHO                      12 - Install Google Chrome
ECHO                      13 - Install Microsoft Edge
ECHO                      14 - Configure IE Settings
ECHO                      15 - Configure Language and Keyboard
ECHO                      16 - Windows Update
ECHO                      17 - Lenovo System Update
ECHO                      18 - Clean Temporary Files
ECHO                       0 - Exit
ECHO.
ECHO                      =================================================================
ECHO.
ECHO.
:: This section will be where the user inputs their answer
SET choice= 
SET /P choice="				Please select an option listed in the menu above : "
IF '%choice%'=='' ECHO "%choice%" is not valid please try again 
IF '%choice%'=='1' GOTO RUNALL
IF '%choice%'=='2' GOTO ACCT
IF '%choice%'=='3' GOTO DELP
IF '%choice%'=='4' GOTO RENM
IF '%choice%'=='5' GOTO SYSI
IF '%choice%'=='6' GOTO FLVW
IF '%choice%'=='7' GOTO PWRO
IF '%choice%'=='8' GOTO TSKB
IF '%choice%'=='9' GOTO SYSR
IF '%choice%'=='10' GOTO INAR
IF '%choice%'=='11' GOTO IN7Z
IF '%choice%'=='12' GOTO INGC
IF '%choice%'=='13' GOTO INME
IF '%choice%'=='14' GOTO IEST
IF '%choice%'=='15' GOTO LANG
IF '%choice%'=='16' GOTO WUPD
IF '%choice%'=='17' GOTO LSUP
IF '%choice%'=='18' GOTO CTMP
IF '%choice%'='0' GOTO EOF
GOTO MENU

:RUNALL
	CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.
	ECHO.
	SET runall=1
	:RNM
	SET RenameYN=""
	SET /P RenameYN="Would you like to rename the computer? (Y/N)"
		IF /I "%RenameYN%"=="Y" (GOTO RNMY)
		IF /I "%RenameYN%"=="y" (GOTO RNMY)
		IF /I "%RenameYN%"=="N" (GOTO RNMN)
		IF /I "%RenameYN%"=="n" (GOTO RNMN) else (ECHO Please select a valid option && TIMEOUT 3 >NUL && GOTO RNM) 
		:RNMN 
		ECHO No problem, skipping ahead
		set RNMC=0
		GOTO ACCT
		:RNMY
		ECHO Sounds good!
		SET RNMC=1
		GOTO CPNM
	:CPNM
	SET CPNM=""
	SET /P CPNM="What would you like to rename the computer to : "
		IF /I "%CPNM%"=="" (ECHO You can't leave this field empty && GOTO CPNM)
		IF /I "%CPNM%" NEQ "" (GOTO CFRM)
		:CFRM
		ECHO New Computer Name : "%CPNM%"
		SET /P CFRM="OK? (Y/N)"
		IF /I "%RenameYN%"=="Y" (GOTO CFRMY)
		IF /I "%RenameYN%"=="y" (GOTO CFRMY)
		IF /I "%RenameYN%"=="N" (GOTO CFRMN)
		IF /I "%RenameYN%"=="n" (GOTO CFRMN) else (ECHO Please select a valid option && TIMEOUT 3 >NUL && GOTO CPNM)
		:CFRMN
		ECHO Woops that probably was a mistype. Here, go ahead!
		GOTO CPNM
		:CFRMY 
		ECHO Good, moving on.

	:RBT
	SET RebootYN=""
	SET /P RebootYN="Would you like to reboot afterwards? (Y/N) >> "
		IF /I "%RebootYN%"=="Y" (GOTO RBTY)
		IF /I "%RebootYN%"=="y" (GOTO RBTY)
		IF /I "%RebootYN%"=="N" (GOTO RBTN)
		IF /I "%RebootYN%"=="n" (GOTO RBTN) else (ECHO "Please select a valid option" && TIMEOUT 3 >NUL && GOTO RBT) 
		:RBTN
		ECHO Okay, let's get moving!
		set RBT=0
		:RBTY
		ECHO Great! Let's get started!
		set RBT=1
:: Deactivating default administrator accounts
:ACCT
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Disabling Administrator Accounts
	net user Administrator /active:no
	net user Administrateur /active:no
	ECHO OK
	IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: Delete Unwanted Programs
:DELP
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Deleting default bloatware
	Powershell.exe -executionpolicy remotesigned -file uninstallapps.ps1
	ECHO OK
    IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: Rename Computer
:RENM
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO "%RNMC%"
	PAUSE
		IF /I "%RNMC%"=="0" (GOTO SYSI)
		IF /I "%RNMC%"==""  (GOTO RENM1)
		IF /I "%RNMC%"=="1" (GOTO RENM2)
		
	:RENM1
		FOR /F "usebackq" %%i IN (`hostname`) DO SET CompName=%%i
		ECHO The current name of the computer is :  %CompName%
		set /p RenameComp="What is the new name of the computer : "
		ECHO Setting new computer name to %RenameComp% ...
		wmic computersystem where caption='%CompName%' rename %RenameComp%
		ECHO "The computer will be renamed to %RenameComp% upon reboot"
		ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )
	:RENM2
		FOR /F "usebackq" %%i IN (`hostname`) DO SET CompName=%%i
		ECHO "Setting new computer name to %CPNM% ..."
		wmic computersystem where caption='%CompName%' rename %CPNM%
		ECHO "New computer name set to : %CPNM%"
		ECHO "New configuration will be active after upon reboot"
:: Enable Desktop System Icons
:SYSI
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Creating "This PC" and "My Documents" icons on user desktop
	REG IMPORT desktopicons.reg
	IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: Enable Show Hidden Folder View
:FLVW
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Configuring folder view and file extensions
	REG IMPORT fileview.reg
	ECHO Restarting "explorer.exe"
	TASKKILL /F /IM explorer.exe
	explorer.exe
	TIMEOUT 1 >NUL
	ECHO OK
	IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: Import, set and rename Power Plan
:PWRO
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Configuring Power Options
	SET guid=ca56da4d-579a-49f9-b4b9-b3a5ff2de73d
	powercfg /import %mypath%\powerplan.pow %guid%
	powercfg -changename %guid% "High Performance"
	powercfg -setacvalueindex %guid% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 1
	powercfg -setacvalueindex %guid% 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
	powercfg -setdcvalueindex %guid% 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
	powercfg /setactive %guid%
	ECHO OK
	IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: Show all icons on notifications bar
:TSKB
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	REG IMPORT taskbar.reg
	TASKKILL /F /IM explorer.exe 
	explorer.exe
	IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: System Restore, BSOD and Drivers Auto Install
:SYSR
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
    ECHO Configuring Reboot when BSOD, System Protection and Auto-Install Drivers
    wmic RecoverOS set AutoReboot = False
	powershell -Command "& {Enable-ComputerRestore -Drive 'C:\'}"
	REG IMPORT drivers.reg
    IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: Install programs
:INAR
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Installing Default Programs
	Powershell.exe -executionpolicy remotesigned -File download.ps1
	ECHO OK
    IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:IN7Z
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Installing 7-Zip
	Powershell.exe -executionpolicy remotesigned -File 7z.ps1
	ECHO OK
    IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:INGCIF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Installing Default Programs
	Powershell.exe -executionpolicy remotesigned -File download.ps1
	ECHO OK
    IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:INME

:: Set Language settings
:LANG
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Configuring Language Settings
	Powershell.exe -executionpolicy remotesigned -File lang.ps1
	ECHO OK
	ECHO Copying settings to Welcome Screen and New Users
	control.exe intl.cpl,, /f:"fr-CA.xml"
	ECHO OK
    IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: Internet Explorer Settings
:IEST
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Configuring Internet Explorer
	REG IMPORT ie.reg
	ECHO OK
	IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: Configure Windows Updates
:WUPD
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Checking and Installing Windows Updates
	Powershell.exe -executionpolicy remotesigned -File wup.ps1
    IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: Configure Lenovo System Update
:LSUP
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Downloading Lenovo System Update
	Powershell.exe -executionpolicy remotesigned -File sysupd.ps1
    IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: Clean Temporary Files
:CTMP
	IF "%runall%"=="" ( CLS && ECHO %ESC%[0m && TYPE ascii3.txt && ECHO %ESC%[93m && ECHO. && ECHO.)
	ECHO Cleaning temporary files and folders
	Powershell.exe -executionpolicy remotesigned -file cleantemp.ps1
	ECHO OK

    IF "%runall%"=="" ( ECHO. && ECHO PRESS ANY KEY TO RETURN TO MENU && PAUSE >NUL && GOTO MENU )

:: This is the end of file, once there, the program exits
:REBT
IF /I "%RBT%"=="0" (GOTO EOF)
IF /I "%RBT%"=="1" (GOTO REBTY)
IF /I "%RBT%"==""  (GOTO EOF)

:REBTY
ECHO.
ECHO PRESS ANY KEY TO REBOOT
PAUSE >NUL
ECHO.
ECHO 3 && TIMEOUT 1 >NUL
ECHO 2 && TIMEOUT 1 >NUL
ECHO 1 && TIMEOUT 1 >NUL
ECHO TAKE OFF
shutdown /r /f /t 0
PAUSE >NUL

:EOF
	ECHO All done!
	ECHO.
	ECHO PRESS ANY KEY TO EXIT SCRIPT
	PAUSE >NUL
	ECHO Exiting
	TIMEOUT 2
    popd



::This is for applying color to text
:setESC
    for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
    set ESC=%%b
    exit /B 0
    )