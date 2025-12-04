-- Auto-generated from joins-mysql.yaml (map@85230ed)
-- engine: mysql
-- view:   webhook_outbox_metrics

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_webhook_outbox_metrics AS
SELECT
  status,
  COUNT(*) AS total,
  SUM(CASE WHEN status = 'pending' AND (next_attempt_at IS NULL OR next_attempt_at <= NOW()) THEN 1 ELSE 0 END) AS due_now
FROM webhook_outbox
GROUP BY status;
