require('dotenv').config();
const express = require('express');
const cors = require('cors');
const path = require('path');
const open = require('open');
const fetch = require('node-fetch');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.static('.'));
app.use(express.json({ limit: '50mb' })); // Aumentar limite para aceitar imagens grandes
app.use(express.urlencoded({ limit: '50mb', extended: true }));

// Servir arquivos estáticos
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'scanner.html'));
});

// Rota específica para a aplicação
app.get('/scanner', (req, res) => {
    res.sendFile(path.join(__dirname, 'scanner.html'));
});

// Rota para processar documentos (mantém a chave segura no servidor)
app.post('/api/extract', async (req, res) => {
    try {
        console.log('📥 Recebendo requisição de extração de dados...');
        const { imageData } = req.body;
        
        if (!imageData) {
            console.log('❌ Dados da imagem não fornecidos');
            return res.status(400).json({ 
                error: 'Dados da imagem não fornecidos' 
            });
        }

        console.log('📊 Tamanho da imagem base64:', Math.round(imageData.length / 1024), 'KB');

        const apiKey = process.env.GOOGLE_API_KEY;
        
        if (!apiKey) {
            return res.status(500).json({ 
                error: 'Chave da API não configurada. Verifique o arquivo .env' 
            });
        }

        const apiUrl = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-preview-05-20:generateContent?key=${apiKey}`;
        const systemPrompt = `Você é um assistente de extração de dados altamente preciso. Analise a imagem do documento fornecida. Extraia as seguintes informações: 1. O nome completo da pessoa. 2. A data de nascimento no formato DD/MM/AAAA. 3. O número do documento (como RG, CNH, etc.). Responda APENAS com um objeto JSON contendo as chaves "nome", "dataNascimento" e "numeroDocumento". Se uma informação não puder ser encontrada, retorne null para o valor correspondente.`;
        
        const payload = {
            contents: [{ 
                parts: [
                    { text: systemPrompt }, 
                    { inlineData: { mimeType: "image/jpeg", data: imageData } }
                ] 
            }],
            generationConfig: { responseMimeType: "application/json" }
        };

        const response = await fetch(apiUrl, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload)
        });

        if (!response.ok) {
            const errorText = await response.text();
            console.error('Erro da API Google Gemini:', response.status, errorText);
            throw new Error(`Erro na API Google Gemini: ${response.status} - ${response.statusText}`);
        }

        const result = await response.json();
        
        if (result.candidates && result.candidates[0].content && result.candidates[0].content.parts[0].text) {
            const extractedData = JSON.parse(result.candidates[0].content.parts[0].text);
            console.log('✅ Dados extraídos com sucesso:', extractedData);
            res.json(extractedData);
        } else {
            console.log('❌ Resposta inesperada da API:', result);
            res.status(500).json({ error: 'Não foi possível processar a resposta da IA' });
        }

    } catch (error) {
        console.error('Erro ao processar documento:', error);
        res.status(500).json({ error: 'Erro interno do servidor' });
    }
});

// Iniciar servidor
app.listen(PORT, () => {
    console.log('🔧 ScanDoc CastroADV - Servidor Node.js');
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