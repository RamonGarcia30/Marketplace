-- PostgreSQL: base mínima para uma futura integração somente de leitura.
create table organizations (
  id uuid primary key,
  name text not null,
  created_at timestamptz not null default now()
);

create table external_connections (
  id uuid primary key,
  organization_id uuid not null references organizations(id),
  kind text not null check (kind in ('marketplace','supplier')),
  provider text not null,
  status text not null check (status in ('draft','awaiting_authorization','connected','error','revoked')),
  encrypted_refresh_token bytea,
  token_expires_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table supplier_sources (
  id uuid primary key,
  organization_id uuid not null references organizations(id),
  name text not null,
  integration_method text not null check (integration_method in ('api','feed','manual')),
  official_docs_url text,
  terms_url text,
  status text not null check (status in ('candidate','reviewing','approved','rejected')) default 'candidate',
  created_at timestamptz not null default now()
);

create table sync_runs (
  id uuid primary key,
  connection_id uuid not null references external_connections(id),
  mode text not null check (mode in ('catalog','stock','orders')),
  status text not null check (status in ('queued','running','succeeded','failed')),
  started_at timestamptz,
  finished_at timestamptz,
  error_summary text
);
