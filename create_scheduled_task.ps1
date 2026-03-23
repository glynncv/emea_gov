# ============================================
# EMEA Governance Cockpit - Task Scheduler Setup
# Creates a Windows Scheduled Task for weekly refresh
# ============================================
#
# PREREQUISITES:
# - Run PowerShell as Administrator
# - Execution policy must allow script execution:
#   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#
# USAGE:
#   .\create_scheduled_task.ps1
#
# ============================================

# Configuration
$TaskName = "EMEA_GOV_Weekly_Refresh"
$TaskDescription = "EMEA Governance Cockpit weekly refresh - queries SNOW and updates cockpit Excel file"
$ScriptPath = Join-Path $PSScriptRoot "run_refresh.bat"

# Verify the batch file exists
if (-not (Test-Path $ScriptPath)) {
    Write-Error "Batch file not found: $ScriptPath"
    Write-Host "Please ensure run_refresh.bat exists in the same directory as this script."
    exit 1
}

Write-Host "Creating scheduled task: $TaskName" -ForegroundColor Cyan
Write-Host "Script path: $ScriptPath" -ForegroundColor Gray

# Prompt for credentials (task will run whether user is logged in or not)
$Username = Read-Host "Enter the Windows username to run the task (e.g., DOMAIN\username or .\localuser)"
Write-Host "You will be prompted for the password to store in Task Scheduler." -ForegroundColor Yellow

# Create the scheduled task trigger (Weekly, Monday at 08:00)
$Trigger = New-ScheduledTaskTrigger `
    -Weekly `
    -DaysOfWeek Monday `
    -At "08:00AM"

# Create the action (run the batch file)
$Action = New-ScheduledTaskAction `
    -Execute $ScriptPath

# Create settings
$Settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries:$false `
    -DontStopIfGoingOnBatteries:$false `
    -StartWhenAvailable:$true `
    -RunOnlyIfNetworkAvailable:$false `
    -MultipleInstances IgnoreNew

# Create the principal (user context)
$Principal = New-ScheduledTaskPrincipal `
    -UserId $Username `
    -LogonType Password `
    -RunLevel Highest

# Register the task
try {
    Register-ScheduledTask `
        -TaskName $TaskName `
        -Description $TaskDescription `
        -Trigger $Trigger `
        -Action $Action `
        -Settings $Settings `
        -Principal $Principal `
        -Force

    Write-Host "`n✓ Scheduled task created successfully!" -ForegroundColor Green
    Write-Host "`nTask details:" -ForegroundColor Cyan
    Write-Host "  Name:     $TaskName"
    Write-Host "  Schedule: Every Monday at 08:00 AM"
    Write-Host "  Action:   Run $ScriptPath"
    Write-Host "  User:     $Username"
    Write-Host "`nNotes:" -ForegroundColor Yellow
    Write-Host "  - Task will run even if you're not logged in"
    Write-Host "  - Task will NOT run on battery power"
    Write-Host "  - If the computer is off at 08:00, task will run when it wakes on Monday"
    Write-Host "  - Logs are written to: $(Join-Path $PSScriptRoot 'logs\scheduler.log')"
    Write-Host "`nYou can view/modify this task in Task Scheduler (taskschd.msc)" -ForegroundColor Cyan

} catch {
    Write-Error "Failed to create scheduled task: $_"
    Write-Host "`nCommon issues:" -ForegroundColor Yellow
    Write-Host "  - PowerShell must be run as Administrator"
    Write-Host "  - Username format should be DOMAIN\username or .\localuser"
    Write-Host "  - Password must be correct for the specified user"
    exit 1
}

# Offer to test the task immediately
Write-Host "`n"
$TestNow = Read-Host "Would you like to test the task now? (Y/N)"
if ($TestNow -eq "Y" -or $TestNow -eq "y") {
    Write-Host "Starting task..." -ForegroundColor Cyan
    Start-ScheduledTask -TaskName $TaskName
    Write-Host "✓ Task started. Check logs\scheduler.log for output." -ForegroundColor Green
}
