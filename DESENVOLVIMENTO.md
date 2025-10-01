# Scanner de Documentos - Configuração de Desenvolvimento

Este projeto é uma aplicação JavaScript que utiliza inteligência artificial para extrair dados de documentos.

## 🚀 Como executar

### Opção 1: Servidor Node.js (Recomendado para JavaScript)
```bash
# Instalar dependências
npm install

# Iniciar servidor
npm start
# ou
node server.js
```

### Opção 2: Usando o script automático
```bash
# Tornar executável (primeira vez)
chmod +x start-server.sh

# Iniciar servidor Node.js
./start-server.sh node

# Ou iniciar servidor Python
./start-server.sh python
```

## 🌐 Acesso

- **URL Principal**: http://localhost:3000
- **Aplicação**: http://localhost:3000/scanner.html

## 📁 Estrutura do Projeto

```
Sacan-DOC-1/
├── scanner.html          # Aplicação completa (HTML + JS)
├── scanner-app.js         # Código JavaScript separado
├── server.js             # Servidor Node.js
├── server.py             # Servidor Python (alternativo)
├── package.json          # Configuração Node.js
├── start-server.sh       # Script de inicialização
└── README.md             # Documentação
```

## 🔧 Tecnologias

- **Frontend**: HTML5, CSS3 (Tailwind), JavaScript ES6+
- **Backend**: Node.js com Express
- **Dependências**: 
  - Express (servidor web)
  - CORS (Cross-Origin Resource Sharing)
  - Open (abrir navegador automaticamente)
- **APIs**: 
  - Google Gemini AI (extração de dados)
  - PDF.js (processamento de PDFs)

## ⚡ Funcionalidades

- Upload de imagens e PDFs
- Extração inteligente de dados usando IA
- Preenchimento automático de formulários
- Interface responsiva e moderna
- Processamento client-side seguro

## 🔑 Configuração da API

A aplicação usa a API do Google Gemini AI. A chave está hardcoded no código para demonstração, mas em produção deve ser configurada via variáveis de ambiente.