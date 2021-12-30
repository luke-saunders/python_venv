#---------------------------------------------------------------------------
# Python Virtual Environment Tool -- Activate Virtual Environment
# Luke Saunders 2021
#---------------------------------------------------------------------------

# Config vars
. .\venv_config.ps1

Write-Host "Activating the virtual environment ... " -NoNewline
try {
    & .\$venv_name\Scripts\activate.ps1
    Write-Host "DONE" -ForegroundColor Green
} catch {
    Write-Host "FAILED" -ForegroundColor Red
}