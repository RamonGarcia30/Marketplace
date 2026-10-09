# Análise funcional pública — referência de marketplace

**Fonte observada:** `https://forneceup.up.railway.app/` em 2026-10-08.

Este documento registra comportamentos observáveis publicamente para orientar um protótipo próprio. Não contém código, marca, imagens, credenciais, dados pessoais, endereço operacional, catálogo ou textos da referência.

## Fluxo que a referência torna visível

`fornecedor → escolha de produto → avaliação de margem → anúncio no canal → pedido → envio → resultado financeiro`

O protótipo Norte deve tornar esse fluxo operável com dados demonstrativos próprios, sem alegar conexão com serviços externos.

## Padrões funcionais aproveitáveis

### Painel de operação

- Indicadores por período: pedidos, faturamento, ticket médio e itens vendidos.
- Situação dos pedidos por etapa.
- Lista de produtos prioritários com custo, estoque e estimativa de retorno.
- Roteiro inicial: conectar um canal, escolher produtos e preparar a publicação.

### Catálogo

- Busca por produto ou SKU.
- Filtros por fornecedor/canal, categoria e situação.
- Ordenação por relevância, margem, custo e estoque.
- Visões em grade e lista.
- Dados necessários para decidir: custo, preço de venda sugerido, lucro estimado e disponibilidade.
- Ações locais: avaliar, favoritar, cadastrar e preparar publicação.

### Produtos e pedidos

- Tela de produtos publicados, com estado vazio claro.
- Pedidos pesquisáveis e filtráveis por situação, canal, envio e período.
- Indicadores de pedido e ação de cadastro manual para demonstração.

### Financeiro e integrações

- Financeiro deve consolidar receita, custos, taxas, lucro e repasses a partir dos dados do próprio protótipo.
- Integrações devem mostrar estado real: `não configurada`, `aguardando autorização` ou `conectada na demonstração`.
- Uma integração externa verdadeira requer credenciais próprias, autorização do canal e backend; não faz parte deste protótipo estático.

### Financeiro e ferramentas operacionais

- Financeiro: saldo, entradas, pagamentos a fornecedores, reembolsos, evolução no período, busca, recorte de datas, filtro por tipo e exportação.
- Ações financeiras precisam deixar claro se são apenas uma simulação ou se geram movimentação real.
- Uma calculadora de rentabilidade útil considera preço, custo, tarifa do canal, frete, impostos, embalagem e outros custos.
- O resultado deve exibir lucro líquido, margem, ponto de equilíbrio, decomposição dos custos e uma comparação de cenários de anúncio.
- Ferramentas adjacentes observadas: otimização de título/ficha, auditoria de anúncio, respostas pré-venda, guia de fotos e itens salvos. No Norte, cada uma só deve entrar quando tiver função local definida.

### Suporte e preferências

- Central de chamados: criação, busca e filtros de status/prioridade, com estado vazio legível.
- Assistente contextual com sugestões de dúvidas recorrentes e campo de pergunta; não reproduzir conteúdo, modelo ou respostas de terceiros.
- Preferências de aparência e dados de conta são áreas separadas da operação diária.

## Inventário de áreas observadas

| Área | Padrões observados para adaptação própria |
| --- | --- |
| Painel | Período, indicadores, status da operação, próximos passos e produtos prioritários. |
| Catálogo | Busca, fornecedor/canal, status, categoria, ordenação, grade/lista, paginação, favoritos e preparação de anúncio. |
| Produtos | Estado vazio, ordenação e lista de itens já preparados para venda. |
| Pedidos | Indicadores, filtros, intervalo de datas, entrada manual/importação e exportação. |
| Financeiro | Saldo, entradas, saídas, reembolsos, gráfico, busca, filtros e exportação. |
| Integrações | Estado de conexão por canal e orientação de configuração. |
| Ferramentas | Cálculo de rentabilidade, preço-alvo, título/ficha, auditoria, respostas pré-venda, utilitários, guia de fotos e rascunhos salvos. |
| Suporte | Chamados, filtro por prioridade/situação e assistência contextual. |
| Preferências | Tema, dados da conta e opção de aplicativo. |

## Limites da referência

- O catálogo observado é grande e paginado; não copiar sua lista, preços, SKUs, imagens ou dados de estoque.
- Não reproduzir marca, textos, regras comerciais, recomendações de ranking ou respostas da referência.
- Não simular OAuth, conexão de canal, atendimento por IA ou transação financeira como se fossem serviços reais.

## Regras para a implementação Norte

1. Usar apenas dados, textos e imagens demonstrativos próprios ou licenciados.
2. Informar com clareza quando um número, pedido, integração ou resultado é local à demonstração.
3. Em cada etapa, responder: **posso avançar?**, **o que bloqueia?** e **qual é a próxima ação?**
4. Preservar estados vazio, carregando, erro e sucesso onde houver ação local.
5. Persistir apenas o estado da demonstração no navegador, com opção explícita de reiniciar.
