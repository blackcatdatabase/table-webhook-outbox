<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – webhook_outbox

Outbox table for delivering webhooks.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| event_type | VARCHAR(100) | NO | — | Webhook event key. |  |
| payload | JSONB | YES | — | JSON payload. |  |
| status | TEXT | NO | 'pending' | Delivery status. | enum: pending, sent, failed |
| retries | INTEGER | NO | 0 | Retry counter. |  |
| next_attempt_at | TIMESTAMPTZ(6) | YES | — | Next attempt time (UTC). |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |
| version | INTEGER | NO | 0 |  |  |