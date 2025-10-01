# 🔄 Guia Completo: Mudança de Nome do Repositório

## 📋 **Status Atual**
- **Nome atual no GitHub**: `Sacan-DOC`
- **Nome desejado**: `scandoc-castroadv`
- **Projeto local**: Já atualizado ✅

## 🌐 **Passo 1: Mudar Nome no GitHub**

### Via Interface Web (Mais Fácil):
1. **Acesse**: https://github.com/tonynerd/Sacan-DOC/settings
2. **Role até**: "Repository name"
3. **Mude de**: `Sacan-DOC`
4. **Para**: `scandoc-castroadv`
5. **Digite**: `Sacan-DOC` para confirmar
6. **Clique**: "Rename"

## 🔧 **Passo 2: Atualizar Remote Local**

Após mudar no GitHub, execute:

```bash
./update-remote.sh
```

**Ou manualmente**:
```bash
git remote set-url origin https://github.com/tonynerd/scandoc-castroadv.git
git remote -v  # Verificar mudança
```

## 📤 **Passo 3: Enviar Mudanças**

```bash
git push origin main
```

## ✅ **Verificação**

Execute para confirmar tudo funcionando:
```bash
./check-deploy.sh
git remote -v
```

## 🚨 **IMPORTANTE**

### ⚠️ **Ordem Correta**:
1. **Primeiro**: Mudar no GitHub
2. **Depois**: Atualizar local com `./update-remote.sh`
3. **Por último**: Push das mudanças

### 📋 **Links que vão mudar**:
- ❌ `https://github.com/tonynerd/Sacan-DOC`
- ✅ `https://github.com/tonynerd/scandoc-castroadv`

## 🔗 **Próximos Passos após Renomear**

1. **Atualizar Vercel**:
   - Novo deploy com nome `scandoc-castroadv`
   - Domínio: `scandoc.castroadv.com`

2. **Links de acesso**:
   - Repositório: https://github.com/tonynerd/scandoc-castroadv
   - Deploy: https://scandoc.castroadv.com

---

## 🚀 **Tudo Pronto Localmente!**

✅ **Nome do projeto**: `scandoc-castroadv`
✅ **Branding**: `ScanDoc CastroADV`  
✅ **Domínio**: `scandoc.castroadv.com`
✅ **Scripts**: Atualizados
✅ **Documentação**: Corrigida

**Próximo passo**: Mude o nome no GitHub e execute `./update-remote.sh`! 🎉