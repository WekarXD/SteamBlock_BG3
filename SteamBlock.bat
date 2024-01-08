@Echo Off
Setlocal
:: First check if we are running As Admin/Elevated
FSUTIL dirty query %SystemDrive% >nul
if %errorlevel% EQU 0 goto START

::Create and run a temporary VBScript to elevate this batch file
   Set _batchFile=%~f0
   Set _Args=%*
   :: double up any quotes
   Set _batchFile=""%_batchFile:"=%""
   Set _Args=%_Args:"=""%

   rem Echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\~ElevateMe.vbs"
   rem Echo UAC.ShellExecute "cmd", "/c ""%_batchFile% %_Args%""", "", "runas", 1 >> "%temp%\~ElevateMe.vbs"

   ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\~ElevateMe.vbs"
   ECHO UAC.ShellExecute "%_batchFile%", args, "", "runas", 0 >> "%temp%\~ElevateMe.vbs"

   rem cscript "%temp%\~ElevateMe.vbs" 
   cscript "%temp%\~ElevateMe.vbs"
   Exit /B

:START
:: set the current directory to the batch file location
cd /d %~dp0
:: Place the code which requires Admin/elevation below


set exe_name=bg3_dx11.exe



netsh advfirewall firewall add rule name= "SteamBlock" dir=in program= "C:\Program Files (x86)\Steam\Steam.exe" action=block
netsh advfirewall firewall add rule name= "SteamBlock" dir=out program= "C:\Program Files (x86)\Steam\Steam.exe" action=block
timeout 1
:: Open BG3 as dx11
start D:\SteamLibrary\steamapps\common\Baldurs" "Gate" "3\bin\bg3_dx11.exe
:: Open BG3 as Vulkan
::start D:\SteamLibrary\steamapps\common\Baldurs" "Gate" "3\bin\bg3.exe



:wait_0
tasklist /fi "ImageName eq %exe_name%" /fo csv 2>NUL | find /I "%exe_name%">NUL
if "%ERRORLEVEL%"=="0" (
    echo %exe_name% is started
    timeout 30
    goto :wait_0
) else (
    echo %exe_name% is closed
    rem Elimina la regla de firewall
    netsh advfirewall firewall delete rule name= "SteamBlock" program= "C:\Program Files (x86)\Steam\Steam.exe"
    timeout 1
)
