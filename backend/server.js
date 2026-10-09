#!/usr/bin/env node
// Servidor de prontidão local. Não chama APIs externas e não aceita credenciais.
const http = require('node:http');

const connections = [
  { provider: 'marketplace', status: 'not_configured', mode: 'read_only' },
  { provider: 'supplier', status: 'not_configured', mode: 'read_only' },
];

const json = (res, status, body) => {
  res.writeHead(status, { 'content-type': 'application/json; charset=utf-8' });
  res.end(JSON.stringify(body));
};

http.createServer((req, res) => {
  if (req.method !== 'GET') return json(res, 405, { error: 'read_only_server' });
  if (req.url === '/health') return json(res, 200, { status: 'ready', external_connections: false });
  if (req.url === '/api/integration-readiness') {
    return json(res, 200, {
      mode: 'planning_only',
      connections,
      safeguards: ['no_credentials', 'no_oauth', 'no_external_requests', 'no_write_actions'],
    });
  }
  return json(res, 404, { error: 'not_found' });
}).listen(process.env.PORT || 8787, () => {
  console.log('Norte integration readiness server: http://127.0.0.1:' + (process.env.PORT || 8787));
});
