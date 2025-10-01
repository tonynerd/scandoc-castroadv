#!/bin/bash

echo "🔄 Script para Atualizar Remote após Mudança de Nome"
echo "=================================================="

# Nome atual e novo
OLD_REPO="Sacan-DOC"
NEW_REPO="scandoc-castroadv"
USERNAME="tonynerd"

echo "📋 Informações:"
echo "- Usuário: $USERNAME"
echo "- Nome atual: $OLD_REPO"  
echo "- Nome novo: $NEW_REPO"
echo ""

# Verificar remote atual
echo "🔍 Remote atual:"
git remote -v
echo ""

# Atualizar URL do remote
echo "🔄 Atualizando remote origin..."
git remote set-url origin https://github.com/$USERNAME/$NEW_REPO.git

# Verificar se mudou
echo "✅ Novo remote:"
git remote -v
echo ""

# Testar conexão
echo "🧪 Testando conexão..."
if git ls-remote origin > /dev/null 2>&1; then
    echo "✅ Conexão com novo repositório: OK"
else
    echo "❌ Erro na conexão - verifique se mudou o nome no GitHub primeiro"
    echo ""
    echo "📋 Para mudar no GitHub:"
    echo "1. Acesse: https://github.com/$USERNAME/$OLD_REPO/settings"
    echo "2. Seção 'Repository name'"
    echo "3. Mude para: $NEW_REPO"
    echo "4. Execute este script novamente"
    exit 1
fi

echo ""
echo "🎉 Remote atualizado com sucesso!"
echo "📤 Próximo push será para: https://github.com/$USERNAME/$NEW_REPO"