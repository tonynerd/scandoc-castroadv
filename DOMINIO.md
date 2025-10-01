# 🌐 Configuração de Domínio Personalizado - ScanDoc### vercel.json (Plano Gratuito)
```json
{
  "version": 2
}
```

**Nota**: Configurações de região e alias foram removidas devido às limitações do plano gratuito. O domínio personalizado deve ser configurado manualmente via Dashboard.V

## 🎯 **Domínio Desejado**
- **Principal**: `scandoc.castroadv.com`
- **Alternativo**: `www.scandoc.castroadv.com`
- **Projeto**: `scandoc-castroadv`

## 📋 **Passo a Passo para Configurar Domínio**

### 1. **Deploy no Vercel Primeiro**
1. Acesse: https://vercel.com/dashboard
2. Import projeto: `tonynerd/scandoc-castroadv`
3. Nome do projeto: `scandoc-castroadv`
4. Faça o deploy normal

### 2. **Adicionar Domínio Personalizado**
1. No dashboard do projeto deployado
2. Vá em **Settings** → **Domains**
3. Adicione os domínios:
   - `scandoc.castroadv.com`
   - `www.scandoc.castroadv.com`

### 3. **Configurar DNS (No seu provedor de domínio)**

#### Se usar Cloudflare, Namecheap, GoDaddy, etc:
```
Tipo: CNAME
Nome: scandoc
Valor: cname.vercel-dns.com

Tipo: CNAME  
Nome: www.scandoc
Valor: cname.vercel-dns.com
```

#### Ou configuração A Record:
```
Tipo: A
Nome: scandoc
Valor: 76.76.19.19

Tipo: A
Nome: www.scandoc  
Valor: 76.76.19.19
```

### 4. **Aguardar Propagação**
- ⏱️ Tempo: 5 minutos a 24 horas
- 🔍 Verificar: `dig scandoc.castroadc.com`

## ✅ **Configurações Já Aplicadas no Projeto**

### vercel.json
```json
{
  "version": 2,
  "name": "scandoc.castroadc",
  "alias": ["scandoc.castroadc.com", "www.scandoc.castroadc.com"],
  "regions": ["gru1", "iad1"]
}
```

### package.json
```json
{
  "name": "scandoc.castroadc",
  "homepage": "https://scandoc.castroadc.com"
}
```

## 🔍 **Como Verificar se Funcionou**

### Script Automático:
```bash
./check-deploy.sh
```

### Manualmente:
- ✅ `https://scandoc.castroadc.com` carrega a aplicação
- ✅ `https://www.scandoc.castroadc.com` redireciona corretamente
- ✅ Certificado SSL ativo (🔒)

## 🚨 **Troubleshooting**

### Domínio não funciona:
1. Verifique DNS: `nslookup scandoc.castroadc.com`
2. Teste sem www: `https://scandoc.castroadc.com`
3. Aguarde mais tempo (até 24h)

### SSL não ativo:
- Vercel ativa automaticamente
- Pode levar até 1 hora

### Redirect não funciona:
- Configure ambos no Vercel: com e sem www
- Vercel gerencia redirects automaticamente

## 📞 **Suporte**

- **Vercel Docs**: https://vercel.com/docs/concepts/projects/domains
- **DNS Checker**: https://dnschecker.org
- **SSL Check**: https://www.ssllabs.com/ssltest/

---

## 🎉 **Resultado Final Esperado**

- ✅ `https://scandoc.castroadc.com` → Aplicação funcionando
- ✅ `https://www.scandoc.castroadc.com` → Redirect automático  
- ✅ SSL ativo e seguro
- ✅ Performance otimizada pela CDN global do Vercel