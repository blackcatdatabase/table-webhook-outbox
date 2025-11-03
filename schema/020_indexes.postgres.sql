-- Auto-generated from schema-map-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  webhook_outbox
CREATE INDEX IF NOT EXISTS idx_webhook_status_scheduled ON webhook_outbox (status, next_attempt_at);

CREATE INDEX IF NOT EXISTS idx_webhook_created_at ON webhook_outbox (created_at);
