@echo 			 ****************************************************
@echo 			 *************	Install program...*******************
@echo 			 ****************************************************

where /q winget

IF %ERRORLEVEL% EQU 1 (
echo WinGet will be installed...

powershell "Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.3.2091/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "%USERPROFILE%\Downloads\WinGet.msixbundle""
powershell "Add-AppxPackage "%USERPROFILE%\Downloads\WinGet.msixbundle""
del "%USERPROFILE%\Downloads\WinGet.msixbundle"

echo WinGet installed
) ELSE echo WinGet already installed

@echo off
set list=^
RARLab.WinRAR;^
Adobe.Acrobat.Reader.64-bit;^
Google.Chrome;^
Transmission.Transmission;^
VideoLAN.VLC


for %%i in (%list%) do (winget install --id %%i -e --source winget )