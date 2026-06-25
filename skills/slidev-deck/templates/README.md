# {{TITLE}}

Apresentação feita com [Slidev](https://sli.dev) — roda 100% no seu computador, sem precisar de site nem internet (depois da instalação inicial).

## ▶️ Como abrir (o jeito fácil)

**Pré-requisito (uma vez só):** instale o [Node.js LTS](https://nodejs.org). É grátis e leva 1 minuto.

- **macOS:** dê **dois cliques** em `start.command`.
  *(Na primeira vez, se o macOS bloquear, clique com o botão direito → "Abrir" → "Abrir".)*
- **Windows:** dê **dois cliques** em `start.bat`.

A primeira execução instala as dependências (1–2 min). Depois abre sozinho no navegador em `http://localhost:3030`.

## ⌨️ Pelo terminal (alternativa, qualquer sistema)

```bash
npm install   # só na primeira vez
npm run dev    # abre em http://localhost:3030
```

## 🎤 Apresentando

- **Setas / Espaço / clique** — avança e revela animações.
- **`f`** — tela cheia.
- **`o`** — visão geral de todos os slides.
- **`p`** — modo apresentador (notas + cronômetro), em `http://localhost:3030/presenter`.

## 📤 Exportar (PDF, imagens, PowerPoint)

```bash
npm run export        # PDF (vetorial)
npm run export-png    # uma imagem PNG por slide → ./exports/
npm run export-pptx   # PowerPoint (.pptx)
```

> Na primeira exportação o Slidev pede para instalar o navegador headless (`playwright-chromium`) — é só aceitar.

## ✏️ Editando o conteúdo

Todo o conteúdo está em **`slides.md`** (Markdown). Cada `---` separa um slide. Salve o arquivo e o navegador atualiza sozinho enquanto o `dev` está rodando.

Aprenda a sintaxe em [sli.dev/guide](https://sli.dev/guide/).
