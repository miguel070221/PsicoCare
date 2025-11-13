# Script PowerShell para iniciar Frontend e Backend simultaneamente
# Uso: .\start-dev.ps1

Write-Host "🚀 Iniciando PsicoCare - Frontend e Backend" -ForegroundColor Green
Write-Host ""

# Verifica se as pastas existem
if (-not (Test-Path "PsicoCare-API")) {
    Write-Host "❌ Pasta PsicoCare-API não encontrada!" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path "PsicoCare")) {
    Write-Host "❌ Pasta PsicoCare não encontrada!" -ForegroundColor Red
    exit 1
}

# Inicia o backend em uma nova janela
Write-Host "📦 Iniciando Backend..." -ForegroundColor Yellow
Start-Process pwsh -ArgumentList "-NoExit", "-Command", "cd '$PWD\PsicoCare-API'; npm run dev"

# Aguarda um pouco para o backend iniciar
Start-Sleep -Seconds 3

# Inicia o frontend em uma nova janela
Write-Host "📱 Iniciando Frontend..." -ForegroundColor Yellow
Start-Process pwsh -ArgumentList "-NoExit", "-Command", "cd '$PWD\PsicoCare'; npm start"

Write-Host ""
Write-Host "✅ Frontend e Backend iniciados em janelas separadas!" -ForegroundColor Green
Write-Host "📝 Backend: http://localhost:3333" -ForegroundColor Cyan
Write-Host "📱 Frontend: Expo DevTools será aberto automaticamente" -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 Dica: Para parar os serviços, feche as janelas do PowerShell" -ForegroundColor Gray










