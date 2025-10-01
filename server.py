#!/usr/bin/env python3
"""
Servidor HTTP local para testar a aplicação Scanner de Documentos
Uso: python server.py [porta]
Porta padrão: 8000
"""

import http.server
import socketserver
import os
import sys
import webbrowser
from pathlib import Path

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        # Adiciona headers CORS para permitir requisições de qualquer origem
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

    def do_OPTIONS(self):
        # Responde a requisições OPTIONS (preflight CORS)
        self.send_response(200)
        self.end_headers()

    def guess_type(self, path):
        # Força o tipo MIME correto para arquivos JavaScript
        result = super().guess_type(path)
        if result is None:
            return None
        if len(result) == 2:
            mimetype, encoding = result
        else:
            mimetype = result
            encoding = None
        if path.endswith('.js'):
            return 'application/javascript', encoding
        return mimetype, encoding

def start_server(port=8000):
    """Inicia o servidor HTTP local"""
    try:
        # Muda para o diretório do script
        script_dir = Path(__file__).parent
        os.chdir(script_dir)
        
        with socketserver.TCPServer(("", port), CustomHTTPRequestHandler) as httpd:
            print(f"🚀 Servidor iniciado com sucesso!")
            print(f"📍 Diretório: {script_dir}")
            print(f"🌐 URL local: http://localhost:{port}")
            print(f"📱 Aplicação: http://localhost:{port}/scanner.html")
            print(f"\n💡 Dica: Pressione Ctrl+C para parar o servidor")
            print("-" * 50)
            
            # Tenta abrir automaticamente no navegador
            try:
                webbrowser.open(f'http://localhost:{port}/scanner.html')
                print("🌐 Abrindo aplicação no navegador...")
            except:
                print("⚠️  Não foi possível abrir automaticamente. Acesse manualmente a URL acima.")
            
            httpd.serve_forever()
            
    except OSError as e:
        if e.errno == 48:  # Address already in use
            print(f"❌ Erro: Porta {port} já está em uso!")
            print(f"💡 Tente usar uma porta diferente: python server.py {port + 1}")
        else:
            print(f"❌ Erro ao iniciar servidor: {e}")
    except KeyboardInterrupt:
        print(f"\n🛑 Servidor parado pelo usuário")
    except Exception as e:
        print(f"❌ Erro inesperado: {e}")

if __name__ == "__main__":
    # Verifica se uma porta foi especificada
    port = 8000
    if len(sys.argv) > 1:
        try:
            port = int(sys.argv[1])
        except ValueError:
            print("❌ Porta inválida! Use um número inteiro.")
            sys.exit(1)
    
    print("🔧 Scanner de Documentos - Servidor Local")
    print("=" * 50)
    start_server(port)