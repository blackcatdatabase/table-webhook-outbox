<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->
# Definition – webhook_outbox

Outbox table for delivering webhooks.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| event_type | VARCHAR(100) | NO | — | Webhook event key. |  |
| payload | JSON | YES | — | JSON payload. |  |
| status | ENUM('pending','sent','failed') | NO | ''pending'' | Delivery status. | enum: pending, sent, failed |
| retries | INT | NO | 0 | Retry counter. |  |
| next_attempt_at | DATETIME(6) | YES | — | Next attempt time (UTC). |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |
