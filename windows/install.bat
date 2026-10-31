@echo off
setlocal

rem Windows installer for the "search" command.
set "SCRIPT_DIR=%~dp0"
set "INSTALL_DIR=%LOCALAPPDATA%\Programs\search"

where g++ >nul 2>nul
if errorlevel 1 (
    echo Error: g++ was not found.
    echo Install a C++ toolchain such as MSYS2 MinGW-w64 and ensure g++ is on PATH.
    pause
    exit /b 1
)

if not exist "%SCRIPT_DIR%search.cpp" (
    echo Error: search.cpp must be in the same directory as this installer.
    pause
    exit /b 1
)

echo Compiling search.cpp...
g++ "%SCRIPT_DIR%search.cpp" -o "%SCRIPT_DIR%search.exe"
if errorlevel 1 (
    echo Compilation failed.
    pause
    exit /b 1
)

if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"
copy /Y "%SCRIPT_DIR%search.exe" "%INSTALL_DIR%\search.exe" >nul
if errorlevel 1 (
    echo Failed to copy search.exe.
    pause
    exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "$d=$env:LOCALAPPDATA+'\Programs\search'; $p=[Environment]::GetEnvironmentVariable('Path','User'); if ([string]::IsNullOrWhiteSpace($p)) {$p=''}; if (($p -split ';') -notcontains $d) { $new=if ($p) {$p.TrimEnd(';')+';'+$d} else {$d}; [Environment]::SetEnvironmentVariable('Path',$new,'User') }"
if errorlevel 1 (
    echo Warning: Could not update your user PATH automatically.
    echo Add this directory to PATH manually: %INSTALL_DIR%
)

echo.
echo Installation completed.
echo Open a NEW Command Prompt or PowerShell window, then run: search -h
echo Installed to: %INSTALL_DIR%\search.exe
pause
