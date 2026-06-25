#!/bin/bash
# ── Dê DOIS CLIQUES neste arquivo no Finder (macOS) para abrir a apresentação ──
# (Na primeira vez o macOS pode pedir permissão: clique com o botão direito →
#  "Abrir" → "Abrir" para autorizar.)

cd "$(dirname "$0")" || exit 1

if ! command -v node >/dev/null 2>&1; then
  echo "❌ Node.js não encontrado."
  echo "   Instale a versão LTS em https://nodejs.org e dê dois cliques aqui de novo."
  echo ""
  read -r -p "Pressione Enter para fechar..."
  exit 1
fi

if [ ! -d node_modules ]; then
  echo "📦 Primeira execução — instalando dependências (leva 1–2 min)..."
  if ! npm install; then
    echo "❌ npm install falhou. Verifique sua conexão e tente de novo."
    read -r -p "Pressione Enter para fechar..."
    exit 1
  fi
fi

echo "🚀 Abrindo a apresentação no navegador (http://localhost:3030)..."
echo "   Para encerrar, feche esta janela do Terminal ou pressione Ctrl+C."
echo ""
npm run dev
