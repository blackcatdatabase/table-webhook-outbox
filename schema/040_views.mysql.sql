-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  webhook_outbox_metrics
-- Metrics for [webhook_outbox]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_webhook_outbox_metrics AS
SELECT
  status,
  COUNT(*) AS total,
  SUM(CASE WHEN status = 'pending' AND (next_attempt_at IS NULL OR next_attempt_at <= NOW()) THEN 1 ELSE 0 END) AS due_now
FROM webhook_outbox
GROUP BY status;

-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  webhook_outbox
-- Contract view for [webhook_outbox]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_webhook_outbox AS
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

