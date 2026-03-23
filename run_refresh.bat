@echo off
REM ============================================
REM EMEA Governance Cockpit - Weekly Refresh
REM Batch file for Windows Task Scheduler
REM ============================================

REM Set working directory to script location
cd /d "%~dp0"

REM Create logs directory if it doesn't exist
if not exist "logs" mkdir "logs"

REM Log start timestamp
echo. >> logs\scheduler.log
echo ============================================ >> logs\scheduler.log
echo Run started: %date% %time% >> logs\scheduler.log
echo ============================================ >> logs\scheduler.log

REM Run the Python script (uses system Python - adjust if using a virtual environment)
REM If using a virtual environment, uncomment and adjust the next line:
REM call venv\Scripts\activate.bat

python emea_gov_refresh.py >> logs\scheduler.log 2>&1

REM Log completion
echo Run completed: %date% %time% >> logs\scheduler.log
echo Exit code: %ERRORLEVEL% >> logs\scheduler.log
echo. >> logs\scheduler.log

exit /b %ERRORLEVEL%
