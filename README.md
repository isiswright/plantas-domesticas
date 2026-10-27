# Raiz & Lar — Sistema de Informação e Orientação para Cultivo de Plantas Domésticas

Projeto acadêmico demonstrativo para o curso de Análise e Desenvolvimento de Sistemas da UNINTER.

## Executar
1. Extraia o arquivo ZIP.
2. Abra `index.html` em um navegador moderno (Chrome, Safari, Firefox ou Edge).
3. Opcional: abra a pasta no VS Code e utilize a extensão Live Server.

Não é necessário instalar bibliotecas nem iniciar servidor. A fonte do Google Fonts depende de internet; sem conexão, o site utiliza fontes alternativas.

## Arquivos
- `index.html`: estrutura semântica e elementos da interface.
- `css/style.css`: identidade visual e responsividade.
- `js/plants.js`: dados demonstrativos de oito espécies.
- `js/app.js`: pesquisa, filtros combinados, favoritos persistidos localmente e detalhes em janela modal.

## Funcionalidades
- Busca por nome popular ou científico.
- Filtro por ambiente, luminosidade e toxicidade para pets.
- Favoritos salvos no navegador (`localStorage`).
- Fichas detalhadas de cuidados.
- Layout responsivo para celulares e computadores.
- Mensagem quando nenhum resultado corresponde aos filtros.

## Limitações e próximos passos
- Os dados são exemplos educativos e precisam de checagem bibliográfica, incluindo toxicidade em fonte veterinária confiável (como ASPCA).
- Os ícones de plantas são emojis ilustrativos, não fotografias botânicas para identificação de espécies.
- O catálogo usa JavaScript em memória; para a etapa acadêmica de modelagem de banco de dados, criar um esquema relacional e, posteriormente, uma API e banco de dados real.
- Planejar levantamento de requisitos com usuários, testes de usabilidade, documentação e evidências de validação.
- A frequência de rega varia conforme clima, vaso, solo e luminosidade; evitar recomendações rígidas.

## Publicação no GitHub Pages
Crie um repositório, envie `index.html`, `css/` e `js/` na raiz e ative **Settings → Pages → Deploy from a branch → main / (root)**. Aguarde o endereço público ser gerado.
