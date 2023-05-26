@echo off
:start
echo press 1 to set the context menu to the windows 10 Style
echo.
echo press 2 to set the context menu to the windows 11 Style
set /p op=type:
if %op% == 1 goto 10
if %op% == 2 goto 11
echo unknown option
timeout 2 > nul
cls
goto start
:11
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
goto end
:10
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
goto end
:end
taskkill /f /im explorer.exe
start explorer.exe
exit