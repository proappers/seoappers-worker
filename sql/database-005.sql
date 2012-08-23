SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `website`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `website` ;

CREATE  TABLE IF NOT EXISTS `website` (
  `website_id` INT NOT NULL AUTO_INCREMENT ,
  `url` VARCHAR(255) NULL ,
  `name` VARCHAR(45) NULL ,
  `state` ENUM('active','deleted') NULL ,
  `seo_score` INT NULL ,
  `created` DATETIME NULL ,
  `max_sites` INT NULL ,
  PRIMARY KEY (`website_id`) ,
  UNIQUE INDEX `url_UNIQUE` (`url` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `crawl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `crawl` ;

CREATE  TABLE IF NOT EXISTS `crawl` (
  `crawl_id` INT NOT NULL AUTO_INCREMENT ,
  `date_started` DATETIME NULL ,
  `date_created` DATETIME NULL ,
  `date_finished` DATETIME NULL ,
  `priority` INT NULL ,
  `website_id` INT NOT NULL ,
  PRIMARY KEY (`crawl_id`, `website_id`) ,
  INDEX `fk_crawl_website1` (`website_id` ASC) ,
  CONSTRAINT `fk_crawl_website1`
    FOREIGN KEY (`website_id` )
    REFERENCES `website` (`website_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `page` ;

CREATE  TABLE IF NOT EXISTS `page` (
  `page_id` INT NOT NULL AUTO_INCREMENT ,
  `seo_score` INT NULL ,
  `path` VARCHAR(255) NULL ,
  `crawl_id` INT NOT NULL ,
  `website_id` INT NOT NULL ,
  PRIMARY KEY (`page_id`, `crawl_id`, `website_id`) ,
  INDEX `fk_page_crawl1` (`crawl_id` ASC, `website_id` ASC) ,
  CONSTRAINT `fk_page_crawl1`
    FOREIGN KEY (`crawl_id` , `website_id` )
    REFERENCES `crawl` (`crawl_id` , `website_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `page_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `page_item` ;

CREATE  TABLE IF NOT EXISTS `page_item` (
  `page_item_id` INT NOT NULL AUTO_INCREMENT ,
  `page_item_key` VARCHAR(45) NULL ,
  `page_value` VARCHAR(45) NULL ,
  `page_id` INT NOT NULL ,
  `crawl_id` INT NOT NULL ,
  `website_id` INT NOT NULL ,
  PRIMARY KEY (`page_item_id`, `page_id`, `crawl_id`, `website_id`) ,
  INDEX `fk_page_item_page1` (`page_id` ASC, `crawl_id` ASC, `website_id` ASC) ,
  CONSTRAINT `fk_page_item_page1`
    FOREIGN KEY (`page_id` , `crawl_id` , `website_id` )
    REFERENCES `page` (`page_id` , `crawl_id` , `website_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
