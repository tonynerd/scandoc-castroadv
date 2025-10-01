#!/bin/bash

# Guia Interativo para Deploy no Vercel
echo "🚀 ScanDoc CastroADV - GUIA DE DEPLOY NO VERCEL"
echo "=================================="
echo ""

# Verificar se os arquivos principais existem
echo "🔧 Verificando projeto..."
if [[ -f "index.html" && -f "scanner.html" ]]; then
    echo "✅ Projeto: OK"
else
    echo "❌ Projeto: Arquivos principais não encontrados"
    exit 1
fi

# Verificar arquivos necessários
echo "📁 Verificando arquivos..."
if [[ -f "index.html" && -f "scanner-app.js" && -f "vercel.json" ]]; then
    echo "✅ Arquivos necessários: OK"
else
    echo "❌ Arquivos necessários: AUSENTES"
    echo "Verifique se index.html e scanner-app.js existem"
    exit 1
fi

echo ""
echo "🎯 SEU PROJETO ESTÁ PRONTO PARA DEPLOY!"
echo ""
echo "📋 PASSOS PARA DEPLOY NO VERCEL:"
echo ""
echo "1️⃣  ACESSE: https://vercel.com"
echo "2️⃣  FAÇA LOGIN com GitHub"
echo "3️⃣  CLIQUE EM: 'Add New...' → 'Project'"
echo "4️⃣  ENCONTRE: 'tonynerd/scandoc-castroadv'
    💡 Nome do projeto: 'scandoc-castroadv'"
echo "5️⃣  CLIQUE EM: 'Import'"
echo ""
echo "✅ CONFIGURAÇÃO AUTOMÁTICA:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 Não precisa configurar nada!"
echo "🎯 O Vercel detecta automaticamente"
echo "🎯 Só clicar em 'Deploy' e pronto!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "6️⃣  CLIQUE EM: 'Deploy'"
echo "7️⃣  AGUARDE: 2-5 minutos"
echo ""

# Função para abrir URLs
open_url() {
    if command -v open &> /dev/null; then
        echo "🌐 Abrindo $1..."
        open "$1"
    else
        echo "🌐 Acesse manualmente: $1"
    fi
}

# Perguntar se quer abrir o Vercel
read -p "🚀 Abrir Vercel Dashboard agora? (y/n): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    open_url "https://vercel.com/dashboard"
fi

echo ""
echo "📊 APÓS O DEPLOY, VERIFIQUE:"
echo "./check-deploy.sh"
echo ""
echo "🎉 Deploy simplificado - só clicar e aguardar!"