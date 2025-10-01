# 🚀 Deploy no Vercel - Scanner de Documentos

## 📋 Pré-requisitos

- Conta no [Vercel](https://vercel.com)
- Repositório no GitHub

## 🔧 Configuração para Deploy

### 1. Preparar o projeto
```bash
# Build do projeto
npm run build

# Verificar estrutura
ls public/
```

### 2. Deploy via Vercel CLI
```bash
# Instalar Vercel CLI (se não tiver)
npm i -g vercel

# Login no Vercel
vercel login

# Deploy
vercel

# Deploy para produção
vercel --prod
```

### 3. Deploy via GitHub (Recomendado)

1. **Push para GitHub**:
   ```bash
   git add .
   git commit -m "feat: configuração para deploy Vercel"
   git push origin main
   ```

2. **Conectar no Vercel**:
   - Acesse [vercel.com](https://vercel.com)
   - Clique em "Import Project"
   - Conecte seu repositório GitHub
   - Configure o projeto

3. **Configurações do Vercel**:
   - **Framework Preset**: Other
   - **Build Command**: `npm run build`
   - **Output Directory**: `public`
   - **Install Command**: `npm install`

## 🌐 URLs

- **Desenvolvimento**: http://localhost:3000
- **Produção**: https://seu-projeto.vercel.app

## 📁 Estrutura para Deploy

```
Sacan-DOC-1/
├── public/              # Arquivos para deploy estático
│   ├── index.html       # Aplicação principal
│   ├── scanner-app.js   # JavaScript modular
│   ├── README.md        # Documentação
│   └── DESENVOLVIMENTO.md
├── vercel.json          # Configuração Vercel
├── package.json         # Dependências e scripts
├── .gitignore          # Arquivos ignorados
└── server.js           # Servidor local (não usado no deploy)
```

## ⚙️ Configurações Importantes

### vercel.json
```json
{
  "version": 2,
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/static-build",
      "config": {
        "distDir": "public"
      }
    }
  ]
}
```

### package.json - Scripts
```json
{
  "scripts": {
    "build": "mkdir -p public && cp scanner.html public/index.html && cp scanner-app.js public/ && cp *.md public/",
    "vercel-build": "npm run build"
  }
}
```

## 🔒 Variáveis de Ambiente

Para produção, configure a chave da API Google Gemini como variável de ambiente:

1. No painel Vercel, vá em Settings > Environment Variables
2. Adicione: `GOOGLE_GEMINI_API_KEY=sua_chave_aqui`
3. Atualize o código para usar `process.env.GOOGLE_GEMINI_API_KEY`

## 🐛 Troubleshooting

### Erro de Build
- Verifique se `npm run build` funciona localmente
- Confirme que o diretório `public` foi criado

### Arquivos não encontrados
- Verifique se os arquivos estão em `public/`
- Confirme o `vercel.json` está correto

### API não funciona
- Configure variáveis de ambiente
- Verifique CORS settings