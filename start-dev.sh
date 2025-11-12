#!/bin/bash
# Script Bash para iniciar Frontend e Backend simultaneamente
# Uso: ./start-dev.sh

echo "🚀 Iniciando PsicoCare - Frontend e Backend"
echo ""

# Verifica se as pastas existem
if [ ! -d "PsicoCare-API" ]; then
    echo "❌ Pasta PsicoCare-API não encontrada!"
    exit 1
fi

if [ ! -d "PsicoCare" ]; then
    echo "❌ Pasta PsicoCare não encontrada!"
    exit 1
fi

# Inicia o backend em background
echo "📦 Iniciando Backend..."
cd PsicoCare-API
npm run dev &
BACKEND_PID=$!
cd ..

# Aguarda um pouco para o backend iniciar
sleep 3

# Inicia o frontend em background
echo "📱 Iniciando Frontend..."
cd PsicoCare
npm start &
FRONTEND_PID=$!
cd ..

echo ""
echo "✅ Frontend e Backend iniciados!"
echo "📝 Backend: http://localhost:3333"
echo "📱 Frontend: Expo DevTools será aberto automaticamente"
echo ""
echo "💡 Para parar os serviços, pressione Ctrl+C"
echo ""

# Aguarda Ctrl+C
trap "kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; exit" INT TERM
wait








