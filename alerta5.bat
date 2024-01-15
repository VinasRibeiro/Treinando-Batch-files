@echo off
chcp 65001
setlocal enabledelayedexpansion

set "serviceNome=Dhcp" 

REM Obter o status do serviço usando WMIC
for /f "tokens=2 delims==" %%a in ('wmic service where "name='%serviceNome%'" get state /value') do (
    set "serviceStatus=%%a"
)

REM Exibir o número do status
if defined serviceStatus (
    echo O serviço %serviceNome% está: !serviceStatus!

    echo !serviceStatus! | find /i "Running" > nul
    if not errorlevel 1 (
        echo A palavra "running" está contida no status do serviço.
    ) else (
        echo A palavra "running" não está contida no status do serviço.
    )

) else (
    echo Serviço não encontrado.
)



endlocal
