-- Création de la base de données tifosi
CREATE DATABASE  IF NOT EXISTS `tifosi` DEFAULT CHARACTER SET  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Sélection de la base de donnée
USE `tifosi`;

-- Création d'un nouvel utilisateur admin pour client tifosi
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'tifosi123';

-- Attributions des privilèges
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost' WITH GRANT OPTION;
ALTER USER 'tifosi'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

-- Appliquation des privilèges
FLUSH PRIVILEGES;

-- Création des tables 

CREATE TABLE IF NOT EXISTS `tifosi`.`marque` (
    `id_marque` INT NOT NULL AUTO_INCREMENT, 
    `nom_marque` VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_marque)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tifosi`.`boisson` (
    `id_boisson` INT NOT NULL AUTO_INCREMENT,
    `nom_boisson` VARCHAR(50) NOT NULL,
    `id_marque` INT NOT NULL,
    PRIMARY KEY (id_boisson),
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tifosi`.`ingredient` (
    `id_ingredient` INT NOT NULL AUTO_INCREMENT,
    `nom_ingredient` VARCHAR(50) NOT NULL,
    `quantite_ingredient` INT NOT NULL,
    PRIMARY KEY (id_ingredient)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tifosi`.`foccacia` (
    `id_foccacia` INT NOT NULL AUTO_INCREMENT,
    `nom_foccacia` VARCHAR(50) NOT NULL,
    `prix_foccacia` DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id_foccacia)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tifosi`.`client` (
    `id_client` INT NOT NULL AUTO_INCREMENT,
    `nom_client` VARCHAR(50) NOT NULL,
    `email_client` VARCHAR(150) NOT NULL,
    `code_postal_client` INT NOT NULL,
    PRIMARY KEY (id_client)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tifosi`.`menu` (
    `id_menu` INT NOT NULL AUTO_INCREMENT,
    `nom_menu` VARCHAR(50) NOT NULL,
    `prix_menu` DECIMAL(5,2) NOT NULL,
    `id_foccacia` INT NOT NULL,
    `id_boisson` INT,
    PRIMARY KEY (id_menu),
    FOREIGN KEY (id_foccacia) REFERENCES foccacia(id_foccacia),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tifosi`.`achete` (
    `date_achete` DATETIME NOT NULL,
    `id_client` INT NOT NULL,
    `id_menu` INT NOT NULL,
    PRIMARY KEY (date_achete),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tifosi`.`comprend` (
    `id_foccacia` INT NOT NULL,
    `id_ingredient` INT NOT NULL,
    `quantite_special_ingredient` INT,
    PRIMARY KEY (id_foccacia, id_ingredient),
    FOREIGN KEY (id_foccacia) REFERENCES foccacia(id_foccacia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;