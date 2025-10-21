-- Auto-generated from schema-map.psd1 on 2025-10-21T02:32:05
-- table: webhook_outbox
CREATE TABLE IF NOT EXISTS webhook_outbox (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  event_type VARCHAR(100) NOT NULL,
  payload JSON NULL,
  status ENUM(''pending'',''sent'',''failed'') NOT NULL DEFAULT ''pending'',
  retries INT NOT NULL DEFAULT 0,
  next_attempt_at DATETIME(6) NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  updated_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  INDEX idx_webhook_status_scheduled (status, next_attempt_at),
  INDEX idx_webhook_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
