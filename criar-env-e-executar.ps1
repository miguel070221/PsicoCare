# Script para criar .env e executar o projeto
# Execute na pasta raiz: .\criar-env-e-executar.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Configurando e Executando PsicoCare" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se está na pasta raiz
if (-not (Test-Path "PsicoCare-API") -or -not (Test-Path "PsicoCare")) {
    Write-Host "[ERRO] Execute este script na pasta raiz do projeto!" -ForegroundColor Red
    exit 1
}

# Criar arquivo .env se não existir
$envPath = "PsicoCare-API\.env"
if (-not (Test-Path $envPath)) {
    Write-Host "[INFO] Criando arquivo .env..." -ForegroundColor Yellow
    @"
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=psicocare
JWT_SECRET=supersecret
JWT_EXPIRES_IN=1d
PORT=3333
"@ | Out-File -FilePath $envPath -Encoding UTF8
    Write-Host "[OK] Arquivo .env criado!" -ForegroundColor Green
} else {
    Write-Host "[OK] Arquivo .env já existe" -ForegroundColor Green
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Iniciando Backend e Frontend" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se MySQL está rodando
Write-Host "[INFO] Verifique se o MySQL está rodando no XAMPP!" -ForegroundColor Yellow
Write-Host ""

# Iniciar backend
Write-Host "📦 Iniciando Backend..." -ForegroundColor Yellow
Start-Process pwsh -ArgumentList "-NoExit", "-Command", "cd '$PWD\PsicoCare-API'; Write-Host 'Backend - PsicoCare API' -ForegroundColor Green; npm run dev"

# Aguardar backend iniciar
Start-Sleep -Seconds 3

# Iniciar frontend
Write-Host "📱 Iniciando Frontend..." -ForegroundColor Yellow
Start-Process pwsh -ArgumentList "-NoExit", "-Command", "cd '$PWD\PsicoCare'; Write-Host 'Frontend - PsicoCare' -ForegroundColor Green; npm start"

Write-Host ""
Write-Host "✅ Backend e Frontend iniciados!" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Backend: http://localhost:3333" -ForegroundColor Cyan
Write-Host "📱 Frontend: Expo DevTools será aberto automaticamente" -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 Para parar: Feche as janelas do PowerShell" -ForegroundColor Gray
Write-Host ""




