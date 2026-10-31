@echo off
setlocal

set "INSTALL_DIR=%LOCALAPPDATA%\Programs\search"

powershell -NoProfile -ExecutionPolicy Bypass -Command "$d=$env:LOCALAPPDATA+'\Programs\search'; $p=[Environment]::GetEnvironmentVariable('Path','User'); if ($p) { $parts=@($p -split ';' | Where-Object { $_ -and $_.TrimEnd('\') -ine $d.TrimEnd('\') }); [Environment]::SetEnvironmentVariable('Path',($parts -join ';'),'User') }"
if errorlevel 1 (
    echo Warning: Could not remove the install directory from your user PATH.
)

if exist "%INSTALL_DIR%" rmdir /S /Q "%INSTALL_DIR%"

echo Uninstallation completed.
echo Open a new terminal window for the PATH change to take effect.
pause
