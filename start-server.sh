#!/bin/bash

# Script para iniciar servidor local do Scanner de Documentos
# Uso: ./start-server.sh [python|node] [porta]

echo "🔧 Scanner de Documentos - Iniciador de Servidor"
echo "=================================================="

# Função para iniciar servidor Python
start_python_server() {
    local port=${1:-8000}
    echo "🐍 Iniciando servidor Python na porta $port..."
    
    if command -v python3 &> /dev/null; then
        python3 server.py $port
    elif command -v python &> /dev/null; then
        python server.py $port
    else
        echo "❌ Python não encontrado! Instale Python 3.x"
        exit 1
    fi
}

# Função para iniciar servidor Node.js
start_node_server() {
    local port=${1:-3000}
    echo "🟢 Iniciando servidor Node.js na porta $port..."
    
    if command -v node &> /dev/null; then
        if [ ! -d "node_modules" ]; then
            echo "📦 Instalando dependências..."
            npm install
        fi
        PORT=$port node server.js
    else
        echo "❌ Node.js não encontrado! Instale Node.js"
        exit 1
    fi
}

# Verificar argumentos
SERVER_TYPE=${1:-python}
PORT=$2

case $SERVER_TYPE in
    "python"|"py")
        start_python_server $PORT
        ;;
    "node"|"nodejs"|"js")
        start_node_server $PORT
        ;;
    *)
        echo "❌ Tipo de servidor inválido!"
        echo "💡 Uso: $0 [python|node] [porta]"
        echo "   Exemplos:"
        echo "   $0 python 8000"
        echo "   $0 node 3000"
        exit 1
        ;;
esac