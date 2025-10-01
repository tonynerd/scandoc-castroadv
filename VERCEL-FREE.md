# 🆓 Configuração para Vercel - Plano Gratuito

## 🚨 **Restrições do Plano Gratuito**

O Vercel Free Plan tem algumas limitações que foram contornadas:

### ❌ **Removidas do vercel.json**:
- `regions: ["gru1", "iad1"]` - Múltiplas regiões (Pro/Enterprise apenas)
- `alias` - Domínios personalizados (configurar manualmente)
- `name` - Nome específico (o Vercel usa automático)

### ✅ **Configuração Atual**:
```json
{
  "version": 2
}
```

## 🌐 **Como Configurar Domínio Personalizado no Plano Gratuito**

### 1. **Após Deploy Bem-sucedido**:
1. Acesse o projeto no Vercel Dashboard
2. Vá em **Settings** → **Domains**
3. Adicione manualmente: `scandoc.castroadv.com`

### 2. **Limitações do Plano Gratuito**:
- ✅ Deploy automático funcionará
- ✅ SSL gratuito incluído
- ✅ CDN global (região automática)
- ❌ Não pode especificar região Brasil
- ❌ Limites de bandwidth e builds

## 🚀 **Deploy Simplificado**

### Passo a Passo:
1. **Vercel Dashboard**: https://vercel.com/dashboard
2. **Import**: `tonynerd/scandoc-castroadv` 
3. **Deixar tudo automático** - não configurar nada
4. **Deploy** - aguardar conclusão
5. **Adicionar domínio** depois via Settings

## 🎯 **URLs Esperadas**

### Automáticas (Vercel):
- `https://scandoc-castroadv.vercel.app`
- `https://scandoc-castroadv-tonynerd.vercel.app`
- `https://scandoc-castroadv-git-main-tonynerd.vercel.app`

### Personalizada (após configurar):
- `https://scandoc.castroadv.com`

## 📋 **Configuração DNS**

Quando adicionar domínio personalizado, usar:

### CNAME (Recomendado):
```
Nome: scandoc
Tipo: CNAME
Valor: cname.vercel-dns.com
TTL: Automático
```

### A Record (Alternativo):
```
Nome: scandoc
Tipo: A
Valor: 76.76.19.19
TTL: Automático
```

## 🔍 **Verificação**

Execute após deploy:
```bash
./check-deploy.sh
```

## 💡 **Dicas para Plano Gratuito**

1. **Keep it Simple**: Configuração mínima no `vercel.json`
2. **Deploy First**: Fazer deploy básico primeiro
3. **Configure Later**: Adicionar domínio depois
4. **Monitor Usage**: Ficar atento aos limites

---

## ✅ **Status Atual**

- ✅ `vercel.json` simplificado para plano gratuito
- ✅ Configuração automática do Vercel
- ✅ Sem restrições de região ou alias
- ✅ Deploy deve funcionar sem erros

**Próximo passo**: Deploy direto no Vercel! 🚀