-- Auto-generated from core/joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
-- engine: mysql
-- view:   webhook_outbox_metrics

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_webhook_outbox_metrics AS
SELECT
  status,
  COUNT(*) AS total,
  SUM(CASE WHEN status = 'pending' AND (next_attempt_at IS NULL OR next_attempt_at <= NOW()) THEN 1 ELSE 0 END) AS due_now
FROM webhook_outbox
GROUP BY status;
