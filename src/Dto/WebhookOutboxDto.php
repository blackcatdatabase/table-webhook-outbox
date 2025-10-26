<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\WebhookOutbox\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
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
        public readonly \DateTimeImmutable $updatedAt,
        public readonly int $version
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}
