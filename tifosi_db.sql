-- Création de la base de données tifosi
CREATE DATABASE  IF NOT EXISTS `tifosi` DEFAULT CHARACTER SET  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Sélection de la base de donnée
USE `tifosi`;

-- Création d'un nouvel utilisateur admin pour client tifosi
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'tifosi123';

-- Attributions des privilèges
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost' WITH GRANT OPTION;
ALTER USER 'tifosi'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

-- Appliquation des privilèges
FLUSH PRIVILEGES;