# webhook_outbox

Outbox table for delivering webhooks.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| event_type | VARCHAR(100) | NO |  | Webhook event key. |
| id | BIGINT | NO |  | Surrogate primary key. |
| next_attempt_at | TIMESTAMPTZ(6) | YES |  | Next attempt time (UTC). |
| payload | JSONB | YES |  | JSON payload. |
| retries | INTEGER | NO | 0 | Retry counter. |
| status | TEXT | NO | pending | Delivery status. (enum: pending, sent, failed) |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |

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
| vw_webhook_outbox | mysql | algorithm=MERGE, security=INVOKER | [packages\webhook-outbox\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/webhook-outbox/schema/040_views.mysql.sql) |
| vw_webhook_outbox_metrics | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\webhook-outbox\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/webhook-outbox/schema/040_views_joins.mysql.sql) |
| vw_webhook_outbox | postgres |  | [packages\webhook-outbox\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/webhook-outbox/schema/040_views.postgres.sql) |
| vw_webhook_outbox_metrics | postgres |  | [packages\webhook-outbox\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/webhook-outbox/schema/040_views_joins.postgres.sql) |
