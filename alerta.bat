@echo off
>NUL chcp 65001
setlocal enabledelayedexpansion

REM Substitua "NomeDoServico" pelo nome do seu serviço
set "serviceNome=SensorService"

REM Obter o status do serviço usando WMIC
for /f "tokens=2 delims==" %%a in ('wmic service where "name='%serviceNome%'" get state /value ^| find "="') do (
    set "serviceStatus=%%a"
)

REM Verificar o status do serviço
if defined serviceStatus (
    if /i "%serviceStatus%" == "Running" (
        echo O serviço %serviceNome% está rodando.
        echo !serviceStatus!
    ) else (
        echo O serviço %serviceNome% está parado.
        echo !serviceStatus!
    )
) else (
    echo Serviço não encontrado.
)

endlocal
