-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  webhook_outbox_metrics
-- Metrics for [webhook_outbox]
CREATE OR REPLACE VIEW vw_webhook_outbox_metrics AS
SELECT
  status,
  COUNT(*) AS total,
  COUNT(*) FILTER (WHERE status=''pending'' AND (next_attempt_at IS NULL OR next_attempt_at <= now())) AS due_now
FROM webhook_outbox
GROUP BY status;

-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  webhook_outbox
-- Contract view for [webhook_outbox]
CREATE OR REPLACE VIEW vw_webhook_outbox AS
SELECT
  id,
  event_type,
  payload,
  status,
  retries,
  next_attempt_at,
  created_at,
  updated_at,
  version
FROM webhook_outbox;

