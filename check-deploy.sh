#!/bin/bash

# Script para verificar status do deploy Vercel
echo "🔍 ScanDoc CastroADV - Verificador de Deploy"
echo "================================"

# Função para verificar se uma URL está online
check_url() {
    local url=$1
    local name=$2
    
    echo "🌐 Testando $name: $url"
    
    if curl -s --head "$url" | head -n 1 | grep -q "200 OK"; then
        echo "✅ $name está ONLINE!"
        return 0
    else
        echo "❌ $name não está acessível ainda"
        return 1
    fi
}

# URLs possíveis do projeto
GITHUB_REPO="https://github.com/tonynerd/Sacan-DOC"
POSSIBLE_URLS=(
    "https://scandoc.castroadv.com"
    "https://www.scandoc.castroadv.com"
    "https://scandoc-castroadv.vercel.app"
    "https://scandoc-castroadv-tonynerd.vercel.app"
    "https://scandoc-castroadv-git-main-tonynerd.vercel.app"
)

echo ""
echo "📋 Informações do Projeto:"
echo "- Repositório: $GITHUB_REPO"
echo "- Último commit: $(git log --oneline -1)"
echo "- Branch atual: $(git branch --show-current)"
echo ""

echo "🔄 Verificando possíveis URLs do deploy..."
echo ""

# Verificar URLs possíveis
online_count=0
for url in "${POSSIBLE_URLS[@]}"; do
    if check_url "$url" "Deploy"; then
        ((online_count++))
        echo "🎉 ENCONTRADO! Acesse: $url"
        
        # Tentar abrir no navegador
        if command -v open &> /dev/null; then
            read -p "🚀 Abrir no navegador? (y/n): " -n 1 -r
            echo
            if [[ $REPO =~ ^[Yy]$ ]]; then
                open "$url"
            fi
        fi
    fi
    echo ""
done

if [ $online_count -eq 0 ]; then
    echo "❗ Nenhum deploy encontrado online ainda."
    echo ""
    echo "📋 Próximos passos:"
    echo "1. Acesse: https://vercel.com/dashboard"
    echo "2. Faça login com GitHub"
    echo "3. Import project: tonynerd/Sacan-DOC"
    echo "4. Configure:"
    echo "   - Build Command: npm run build"
    echo "   - Output Directory: public"
    echo "5. Deploy!"
    echo ""
    echo "⏱️  O deploy leva cerca de 2-5 minutos após a configuração"
else
    echo "🎯 $online_count deploy(s) encontrado(s) online!"
fi

echo ""
echo "🔗 Links úteis:"
echo "- Dashboard Vercel: https://vercel.com/dashboard"
echo "- Repositório: $GITHUB_REPO"
echo "- Documentação: https://vercel.com/docs"