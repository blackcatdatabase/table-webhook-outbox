-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  webhook_outbox

CREATE INDEX IF NOT EXISTS idx_webhook_status_scheduled ON webhook_outbox (status, next_attempt_at);

CREATE INDEX IF NOT EXISTS idx_webhook_created_at ON webhook_outbox (created_at);
