@echo off
setlocal
set "hermesEngine=powershell.exe"
where pwsh.exe >nul 2>nul
if not errorlevel 1 set "hermesEngine=pwsh.exe"
"%hermesEngine%" -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0install-hermes.ps1" %*
exit /b %errorlevel%
