const express = require('express');
const cors = require('cors');
const path = require('path');
const open = require('open');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.static('.'));

// Servir arquivos estáticos
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'scanner.html'));
});

// Rota específica para a aplicação
app.get('/scanner', (req, res) => {
    res.sendFile(path.join(__dirname, 'scanner.html'));
});

// Iniciar servidor
app.listen(PORT, () => {
    console.log('🔧 Scanner de Documentos - Servidor Node.js');
    console.log('='.repeat(50));
    console.log('🚀 Servidor iniciado com sucesso!');
    console.log(`📍 Diretório: ${__dirname}`);
    console.log(`🌐 URL local: http://localhost:${PORT}`);
    console.log(`📱 Aplicação: http://localhost:${PORT}/scanner.html`);
    console.log('\n💡 Dica: Pressione Ctrl+C para parar o servidor');
    console.log('-'.repeat(50));
    
    // Abrir automaticamente no navegador
    open(`http://localhost:${PORT}/scanner.html`)
        .then(() => console.log('🌐 Abrindo aplicação no navegador...'))
        .catch(() => console.log('⚠️  Não foi possível abrir automaticamente. Acesse manualmente a URL acima.'));
});

// Tratamento de erros
process.on('EADDRINUSE', () => {
    console.log(`❌ Erro: Porta ${PORT} já está em uso!`);
    console.log(`💡 Tente definir uma porta diferente: PORT=${PORT + 1} node server.js`);
});

process.on('SIGINT', () => {
    console.log('\n🛑 Servidor parado pelo usuário');
    process.exit(0);
});