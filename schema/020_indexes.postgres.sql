-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  webhook_outbox

CREATE INDEX IF NOT EXISTS idx_webhook_status_scheduled ON webhook_outbox (status, next_attempt_at);

CREATE INDEX IF NOT EXISTS idx_webhook_created_at ON webhook_outbox (created_at);
