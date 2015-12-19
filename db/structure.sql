SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `user_role`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `user_role` (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `role_name` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`role_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `user_name` VARCHAR(100) NULL DEFAULT NULL ,
  `user_full_name` VARCHAR(255) NULL DEFAULT NULL ,
  `user_password` VARCHAR(45) NULL DEFAULT NULL ,
  `user_email` VARCHAR(45) NULL DEFAULT NULL ,
  `user_description` TEXT NULL DEFAULT NULL ,
  `user_role_role_id` INT(11) NULL ,
  `user_is_deleted` TINYINT(1) NULL DEFAULT 0 ,
  `user_input_date` TIMESTAMP NULL DEFAULT NULL ,
  `user_last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`user_id`) ,
  INDEX `fk_user_user_role1_idx` (`user_role_role_id` ASC) ,
  CONSTRAINT `fk_user_user_role1`
    FOREIGN KEY (`user_role_role_id` )
    REFERENCES `user_role` (`role_id` )
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `activity_log`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `activity_log` (
  `log_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `log_date` TIMESTAMP NULL DEFAULT NULL ,
  `log_action` VARCHAR(45) NULL DEFAULT NULL ,
  `log_module` VARCHAR(45) NULL DEFAULT NULL ,
  `log_info` TEXT NULL DEFAULT NULL ,
  `user_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`log_id`) ,
  INDEX `fk_g_activity_log_g_user1_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_g_activity_log_g_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `user` (`user_id` )
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `ci_sessions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ci_sessions` (
  `id` VARCHAR(40) NOT NULL ,
  `ip_address` VARCHAR(45) NOT NULL ,
  `timestamp` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `data` BLOB NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `ci_sessions_timestamp` (`timestamp` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mediamanager`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mediamanager` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `type` VARCHAR(45) NULL DEFAULT NULL ,
  `isfile` TINYINT(1) NULL DEFAULT '0' ,
  `label` TEXT NULL DEFAULT NULL ,
  `info` TEXT NULL DEFAULT NULL ,
  `upload_at` DATETIME NULL DEFAULT NULL ,
  `album_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `mediamanager_album`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mediamanager_album` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `label` VARCHAR(255) NULL DEFAULT NULL ,
  `upload_at` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `posts_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `posts_category` (
  `category_id` INT NOT NULL AUTO_INCREMENT ,
  `category_name` VARCHAR(100) NULL ,
  PRIMARY KEY (`category_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `posts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `posts` (
  `posts_id` INT NOT NULL AUTO_INCREMENT ,
  `posts_title` VARCHAR(255) NULL ,
  `posts_description` TEXT NULL ,
  `posts_image` VARCHAR(255) NULL ,
  `posts_published_date` TIMESTAMP NULL ,
  `posts_is_published` TINYINT(1) NULL DEFAULT 0 ,
  `posts_category_category_id` INT NULL ,
  `user_user_id` INT(11) NULL ,
  `posts_input_date` TIMESTAMP NULL ,
  `posts_last_update` TIMESTAMP NULL ,
  PRIMARY KEY (`posts_id`) ,
  INDEX `fk_posts_posts_category1_idx` (`posts_category_category_id` ASC) ,
  INDEX `fk_posts_user1_idx` (`user_user_id` ASC) ,
  CONSTRAINT `fk_posts_posts_category1`
    FOREIGN KEY (`posts_category_category_id` )
    REFERENCES `posts_category` (`category_id` )
    ON DELETE SET NULL
    ON UPDATE SET NULL,
  CONSTRAINT `fk_posts_user1`
    FOREIGN KEY (`user_user_id` )
    REFERENCES `user` (`user_id` )
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employe`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `employe` (
  `employe_id` INT NOT NULL AUTO_INCREMENT ,
  `employe_nik` VARCHAR(100) NULL ,
  `employe_name` VARCHAR(255) NULL ,
  `employe_phone` VARCHAR(45) NULL ,
  `employe_address` TEXT NULL ,
  `employe_divisi` VARCHAR(255) NULL ,
  `employe_position` VARCHAR(100) NULL ,
  `employe_departement` VARCHAR(255) NULL ,
  `employe_is_active` TINYINT(1) NULL DEFAULT 0 ,
  `employe_date_register` DATE NULL ,
  `employe_input_date` TIMESTAMP NULL ,
  `employe_last_update` TIMESTAMP NULL ,
  PRIMARY KEY (`employe_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `memorandum1`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `memorandum1` (
  `memorandum_id` INT NOT NULL AUTO_INCREMENT ,
  `memorandum_number` VARCHAR(45) NULL ,
  `memorandum_email_date` DATE NULL ,
  `memorandum_absent_date` DATE NULL ,
  `memorandum_date_sent` DATE NULL ,
  `memorandum_call_date` DATE NULL ,
  `employe_employe_id` INT NULL ,
  `memorandum_input_date` TIMESTAMP NULL ,
  `memorandum_last_update` TIMESTAMP NULL ,
  PRIMARY KEY (`memorandum_id`) ,
  INDEX `fk_memorandum1_employe1_idx` (`employe_employe_id` ASC) ,
  CONSTRAINT `fk_memorandum1_employe1`
    FOREIGN KEY (`employe_employe_id` )
    REFERENCES `employe` (`employe_id` )
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `memorandum2`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `memorandum2` (
  `memorandum_id` INT NOT NULL AUTO_INCREMENT ,
  `memorandum_number` VARCHAR(45) NULL ,
  `memorandum_date_sent` DATE NULL ,
  `memorandum_call_date` DATE NULL ,
  `memorandum1_memorandum_id` INT NOT NULL ,
  `memorandum_input_date` TIMESTAMP NULL ,
  `memorandum_last_update` TIMESTAMP NULL ,
  PRIMARY KEY (`memorandum_id`) ,
  INDEX `fk_memorandum2_memorandum11_idx` (`memorandum1_memorandum_id` ASC) ,
  CONSTRAINT `fk_memorandum2_memorandum11`
    FOREIGN KEY (`memorandum1_memorandum_id` )
    REFERENCES `memorandum1` (`memorandum_id` )
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `memorandum3`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `memorandum3` (
  `memorandum_id` INT NOT NULL AUTO_INCREMENT ,
  `memorandum_number` VARCHAR(45) NULL ,
  `memorandum_date_sent` DATE NULL ,
  `memorandum_call_date` DATE NULL ,
  `memorandum2_memorandum_id` INT NOT NULL ,
  `memorandum_input_date` TIMESTAMP NULL ,
  `memorandum_last_update` TIMESTAMP NULL ,
  PRIMARY KEY (`memorandum_id`) ,
  INDEX `fk_memorandum2_memorandum21_idx` (`memorandum2_memorandum_id` ASC) ,
  CONSTRAINT `fk_memorandum2_memorandum21`
    FOREIGN KEY (`memorandum2_memorandum_id` )
    REFERENCES `memorandum2` (`memorandum_id` )
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bank` (
  `idbank` INT NOT NULL AUTO_INCREMENT ,
  `bank_name` VARCHAR(100) NULL ,
  PRIMARY KEY (`idbank`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
