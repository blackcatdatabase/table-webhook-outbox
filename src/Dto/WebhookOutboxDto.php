<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\WebhookOutbox\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Žádná logika; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class WebhookOutboxDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $eventType,
        public readonly array|null $payload,
        public readonly string $status,
        public readonly int $retries,
        public readonly ?\DateTimeImmutable $nextAttemptAt,
        public readonly \DateTimeImmutable $createdAt,
        public readonly \DateTimeImmutable $updatedAt
    ) {}

    /** Vhodné pro serializaci/logování (bez binárních/velkých blobů). */
    public function toArray(): array {
        // get_object_vars funguje dobře s public readonly vlastnostmi
        return get_object_vars($this);
    }
}
