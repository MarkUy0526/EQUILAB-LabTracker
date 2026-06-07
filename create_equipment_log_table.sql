-- Run this SQL once in your database (labtracker)
-- Creates the equipment_log table for tracking added equipment

CREATE TABLE IF NOT EXISTS `equipment_log` (
  `id`             INT(11)      NOT NULL AUTO_INCREMENT,
  `equipment_id`   VARCHAR(50)  NOT NULL,
  `equipment_name` VARCHAR(255) NOT NULL,
  `total_qty`      INT(11)      NOT NULL DEFAULT 0,
  `working_qty`    INT(11)      NOT NULL DEFAULT 0,
  `not_working_qty`INT(11)      NOT NULL DEFAULT 0,
  `account_person` VARCHAR(255) NOT NULL DEFAULT '',
  `action`         VARCHAR(50)  NOT NULL DEFAULT 'Added',
  `added_by`       VARCHAR(255) NOT NULL DEFAULT 'Admin',
  `added_at_ph`    DATETIME     NOT NULL COMMENT 'PH time (Asia/Manila)',
  PRIMARY KEY (`id`),
  KEY `idx_equipment_id` (`equipment_id`),
  KEY `idx_added_at`     (`added_at_ph`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
