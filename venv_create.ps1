#---------------------------------------------------------------------------
# Python Virtual Environment Tool -- Create Virtual Environment
# Luke Saunders 2021
#---------------------------------------------------------------------------

# Config vars
. .\venv_config.ps1

# Converted from deactivate.bat
if ($env:_OLD_VIRTUAL_PROMPT) {
    $env:PROMPT = $env:_OLD_VIRTUAL_PROMPT
}
$env:_OLD_VIRTUAL_PROMPT=''

if ($env:_OLD_VIRTUAL_PYTHONHOME) {
    $env:PYTHONHOME = $env:_OLD_VIRTUAL_PYTHONHOME
    $env:_OLD_VIRTUAL_PYTHONHOME=''
}

if ($env_OLD_VIRTUAL_PATH) {
    $env:PATH = $env:_OLD_VIRTUAL_PATH
}

$env:_OLD_VIRTUAL_PATH = ''
$env:VIRTUAL_ENV = ''

# New venv path
$venv_path = Join-Path -Path $PSScriptRoot -ChildPath $venv_name

Write-Host "`n`n`n--- Python Virtual Environment Creator ---" -ForegroundColor Green

# Check for an existing venv folder
Get-Item -Path ".\*\*\python.exe" | ForEach-Object {
    $existing_path = Get-Item -Path "$($_.Directory)\.."
    Write-Host "`nRemoving the existing venv folder: $existing_path ... " -NoNewline
    try {        
        Remove-Item -path $existing_path -Recurse -Force
        Write-Host "DONE" -ForegroundColor Green
    } catch {
        Write-Host "FAILED" -ForegroundColor Red
    }
}

Write-Host "`nCreating a new virtual environment ($venv_path) ... " -NoNewline
try {
    & python.exe -m venv $venv_path
    Write-Host "DONE" -ForegroundColor Green
} catch {
    Write-Host "FAILED" -ForegroundColor Red
}

Write-Host "`nActivating the virtual environment ... " -NoNewline
try {
    & .\$venv_name\Scripts\activate.ps1
    Write-Host "DONE" -ForegroundColor Green
} catch {
    Write-Host "FAILED" -ForegroundColor Red
}

Write-Host "`nInstalling Python Packages:"
$python_packages | ForEach-Object { 
    Write-Host "-- $_ --" -ForegroundColor Yellow
    & pip.exe install $_ --disable-pip-version-check
    Write-Host "`n"
}

Write-Host "`nDone!"

Write-Host "`n--- Virtual Environment ---" -ForegroundColor Green
& pip.exe 'freeze'

Write-Host "`n`n"