-- Auto-generated from joins-mysql.psd1 (map@mtime:2025-11-27T17:49:37Z)
-- engine: mysql
-- view:   webhook_outbox_metrics
-- Metrics for [webhook_outbox]
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_webhook_outbox_metrics AS
SELECT
  status,
  COUNT(*) AS total,
  SUM(CASE WHEN status = 'pending' AND (next_attempt_at IS NULL OR next_attempt_at <= NOW()) THEN 1 ELSE 0 END) AS due_now
FROM webhook_outbox
GROUP BY status;
