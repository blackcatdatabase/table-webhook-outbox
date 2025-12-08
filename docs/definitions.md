# webhook_outbox

Outbox table for delivering webhooks.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| event_type | VARCHAR(100) | NO |  | Webhook event key. |
| id | BIGINT | NO |  | Surrogate primary key. |
| next_attempt_at | DATETIME(6) | YES |  | Next attempt time (UTC). |
| payload | JSON | YES |  | JSON payload. |
| retries | INT | NO | 0 | Retry counter. |
| status | ENUM('pending','sent','failed') | NO | pending | Delivery status. (enum: pending, sent, failed) |
| updated_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |

## Engine Details

### mysql

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_webhook_created_at | created_at | INDEX idx_webhook_created_at (created_at) |
| idx_webhook_status_scheduled | status,next_attempt_at | INDEX idx_webhook_status_scheduled (status, next_attempt_at) |

### postgres

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_webhook_created_at | created_at | CREATE INDEX IF NOT EXISTS idx_webhook_created_at ON webhook_outbox (created_at) |
| idx_webhook_status_scheduled | status,next_attempt_at | CREATE INDEX IF NOT EXISTS idx_webhook_status_scheduled ON webhook_outbox (status, next_attempt_at) |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_webhook_outbox | mysql | algorithm=MERGE, security=INVOKER | [schema\040_views.mysql.sql](schema\040_views.mysql.sql) |
| vw_webhook_outbox_metrics | mysql | algorithm=TEMPTABLE, security=INVOKER | [schema\040_views_joins.mysql.sql](schema\040_views_joins.mysql.sql) |
| vw_webhook_outbox | postgres |  | [schema\040_views.postgres.sql](schema\040_views.postgres.sql) |
| vw_webhook_outbox_metrics | postgres |  | [schema\040_views_joins.postgres.sql](schema\040_views_joins.postgres.sql) |
