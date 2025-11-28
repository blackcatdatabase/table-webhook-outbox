-- Auto-generated from joins-postgres.psd1 (map@mtime:2025-11-27T17:17:38Z)
-- engine: postgres
-- view:   webhook_outbox_metrics

-- Metrics for [webhook_outbox]
CREATE OR REPLACE VIEW vw_webhook_outbox_metrics AS
SELECT
  status,
  COUNT(*) AS total,
  COUNT(*) FILTER (WHERE status=''pending'' AND (next_attempt_at IS NULL OR next_attempt_at <= now())) AS due_now
FROM webhook_outbox
GROUP BY status;
