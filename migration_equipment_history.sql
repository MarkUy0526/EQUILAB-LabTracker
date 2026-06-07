-- ════════════════════════════════════════════════════════════════
-- EQUILAB — Equipment History Log
-- HOW TO RUN:
--   1. Open phpMyAdmin
--   2. Select the "labtracker" database
--   3. Click the SQL tab
--   4. Paste this entire file and click Go
--   5. Run it only once — IF NOT EXISTS makes it safe to re-run
-- ════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS `equipment_history` (
    `id`            INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `equipment_id`  VARCHAR(50)     NOT NULL,
    `action`        ENUM('Added','Edited') NOT NULL,
    `changed_field` VARCHAR(80)     DEFAULT NULL,
    -- For "Added": changed_field is NULL, new_value holds a JSON snapshot
    -- For "Edited": changed_field is the field name, old_value/new_value are the values
    `old_value`     TEXT            DEFAULT NULL,
    `new_value`     TEXT            DEFAULT NULL,
    `performed_at`  DATETIME        NOT NULL,
    -- performed_at is stored in Asia/Manila (UTC+8) — set by PHP before INSERT
    PRIMARY KEY (`id`),
    INDEX `idx_eq_id`   (`equipment_id`),
    INDEX `idx_perf_at` (`performed_at`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
