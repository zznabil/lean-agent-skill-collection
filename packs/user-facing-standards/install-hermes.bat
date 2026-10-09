@echo off
setlocal
where pwsh.exe >nul 2>nul
if errorlevel 1 (
  powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0install-hermes.ps1" %*
) else (
  pwsh.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0install-hermes.ps1" %*
)
exit /b %errorlevel%
