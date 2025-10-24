-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  webhook_outbox
CREATE INDEX idx_webhook_status_scheduled ON webhook_outbox (status, next_attempt_at);

CREATE INDEX idx_webhook_created_at ON webhook_outbox (created_at);
