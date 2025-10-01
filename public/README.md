# 📄 Scanner de Documentos Inteligente

Extrator de dados capturado a partir de um documento escaneado com auto preenchimento de formulário usando Inteligência Artificial.

## 🎯 Funcionalidades

- **📤 Upload de Documentos**: Suporte para imagens (JPG, PNG) e PDFs
- **🤖 Extração Inteligente**: Utiliza Google Gemini AI para extrair dados automaticamente
- **📝 Auto-preenchimento**: Preenche formulários automaticamente com os dados extraídos  
- **🎨 Interface Moderna**: Design responsivo com Tailwind CSS
- **⚡ Processamento Rápido**: Processamento client-side para maior segurança

## 🚀 Como usar

### 1. Iniciar o servidor
```bash
# Usando Node.js (recomendado)
npm install
npm start

# Ou usando o script
./start-server.sh node
```

### 2. Acessar a aplicação
Abra o navegador e acesse: **http://localhost:3000/scanner.html**

### 3. Usar a aplicação
1. Faça upload de uma imagem ou PDF do documento
2. Clique em "Extrair Dados" 
3. Veja os dados extraídos preenchendo automaticamente o formulário

## 🛠️ Tecnologias

- **JavaScript ES6+** - Linguagem principal
- **Node.js + Express** - Servidor web
- **Google Gemini AI** - Extração inteligente de dados
- **PDF.js** - Processamento de arquivos PDF
- **Tailwind CSS** - Interface moderna e responsiva

## 📦 Instalação

```bash
git clone [seu-repositorio]
cd Sacan-DOC-1
npm install
npm start
```

## 🔧 Desenvolvimento

Para mais detalhes sobre desenvolvimento, consulte [DESENVOLVIMENTO.md](DESENVOLVIMENTO.md)
