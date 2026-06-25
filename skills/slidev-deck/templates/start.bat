@echo off
REM  -- De DOIS CLIQUES neste arquivo no Windows para abrir a apresentacao --
setlocal
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js nao encontrado.
  echo Instale a versao LTS em https://nodejs.org e de dois cliques aqui de novo.
  echo.
  pause
  exit /b 1
)

if not exist node_modules (
  echo Primeira execucao - instalando dependencias ^(leva 1-2 min^)...
  call npm install
  if errorlevel 1 (
    echo npm install falhou. Verifique sua conexao e tente de novo.
    pause
    exit /b 1
  )
)

echo Abrindo a apresentacao no navegador ^(http://localhost:3030^)...
echo Para encerrar, feche esta janela ou pressione Ctrl+C.
echo.
call npm run dev
pause
