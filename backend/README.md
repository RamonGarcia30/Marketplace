# Base de integrações — Marketplace Norte

Esta pasta prepara o projeto para integrações futuras, mas **não se conecta a nenhum serviço externo**.

## Princípios

- O navegador nunca recebe `client_secret`, tokens ou chaves de fornecedor.
- Toda conexão real passa pelo backend, com OAuth no servidor e tokens cifrados em repouso.
- A primeira versão real deve ser apenas de leitura: catálogo, estoque e pedidos.
- Publicar anúncio, alterar preço/estoque, responder cliente, comprar de fornecedor ou movimentar dinheiro exigem confirmação humana e uma autorização separada.

## Estrutura proposta

```text
browser → API Norte → PostgreSQL
                  ├─ cofre de segredos
                  ├─ fila de sincronização
                  └─ adaptadores: marketplace e fornecedor
```

## Próxima fase autorizável

1. Escolher um canal e um fornecedor com API/feed oficial.
2. Criar contas de teste e OAuth sandbox.
3. Provisionar banco, cofre de segredos e hospedagem.
4. Implementar o adaptador de leitura e a reconciliação.

Até essas autorizações, use somente os endpoints locais de prontidão descritos em `src/server.js`.
