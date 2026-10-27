@echo off
setlocal
cd /d "%~dp0"
set PORT=8000
where py >nul 2>nul
if %errorlevel%==0 (
  start "Neon Runner Server" /min cmd /c "py -m http.server %PORT% --bind 127.0.0.1"
) else (
  where python >nul 2>nul
  if %errorlevel%==0 (
    start "Neon Runner Server" /min cmd /c "python -m http.server %PORT% --bind 127.0.0.1"
  ) else (
    echo Python was not found. Install Python 3 or open index.html for mouse/keyboard mode.
    pause
    exit /b 1
  )
)
timeout /t 2 /nobreak >nul
start "" "http://127.0.0.1:%PORT%/index.html"
echo Neon Runner is running at http://127.0.0.1:%PORT%/index.html
echo Keep the server window open while playing. Close its window to stop the server.
pause
