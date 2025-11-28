-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-11-21T00:25:46Z)
-- engine: postgres
-- table:  webhook_outbox

CREATE INDEX IF NOT EXISTS idx_webhook_status_scheduled ON webhook_outbox (status, next_attempt_at);

CREATE INDEX IF NOT EXISTS idx_webhook_created_at ON webhook_outbox (created_at);
