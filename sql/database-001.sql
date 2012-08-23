SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `website`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `website` ;

CREATE  TABLE IF NOT EXISTS `website` (
  `website_id` INT NOT NULL ,
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
-- Table `page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `page` ;

CREATE  TABLE IF NOT EXISTS `page` (
  `page_id` INT NOT NULL ,
  `website_id` INT NOT NULL ,
  `seo_score` INT NULL ,
  `path` VARCHAR(255) NULL ,
  `response_code` INT NULL ,
  PRIMARY KEY (`page_id`, `website_id`) ,
  INDEX `fk_site_website` (`website_id` ASC) ,
  CONSTRAINT `fk_site_website`
    FOREIGN KEY (`website_id` )
    REFERENCES `website` (`website_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `crawl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `crawl` ;

CREATE  TABLE IF NOT EXISTS `crawl` (
  `crawl_id` INT NOT NULL ,
  `page_id` INT NOT NULL ,
  `website_id` INT NOT NULL ,
  `date_started` DATETIME NULL ,
  `date_created` DATETIME NULL ,
  `date_finished` DATETIME NULL ,
  `priority` INT NULL ,
  PRIMARY KEY (`crawl_id`, `page_id`, `website_id`) ,
  INDEX `fk_crawl_page1` (`page_id` ASC, `website_id` ASC) ,
  CONSTRAINT `fk_crawl_page1`
    FOREIGN KEY (`page_id` , `website_id` )
    REFERENCES `page` (`page_id` , `website_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `result`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `result` ;

CREATE  TABLE IF NOT EXISTS `result` (
  `result_id` INT NOT NULL ,
  `crawl_id` INT NOT NULL ,
  `page_id` INT NOT NULL ,
  `website_id` INT NOT NULL ,
  `seo_score` INT NULL ,
  `response_code` INT NULL ,
  `site_title` VARCHAR(255) NULL ,
  PRIMARY KEY (`result_id`, `crawl_id`, `page_id`, `website_id`) ,
  INDEX `fk_result_crawl1` (`crawl_id` ASC, `page_id` ASC, `website_id` ASC) ,
  CONSTRAINT `fk_result_crawl1`
    FOREIGN KEY (`crawl_id` , `page_id` , `website_id` )
    REFERENCES `crawl` (`crawl_id` , `page_id` , `website_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `result_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `result_item` ;

CREATE  TABLE IF NOT EXISTS `result_item` (
  `result_item_id` INT NOT NULL ,
  `result_id` INT NOT NULL ,
  `crawl_id` INT NOT NULL ,
  `page_id` INT NOT NULL ,
  `website_id` INT NOT NULL ,
  `result_item_key` VARCHAR(45) NULL ,
  `result_value` VARCHAR(45) NULL ,
  PRIMARY KEY (`result_item_id`, `result_id`, `crawl_id`, `page_id`, `website_id`) ,
  INDEX `fk_result_item_result1` (`result_id` ASC, `crawl_id` ASC, `page_id` ASC, `website_id` ASC) ,
  CONSTRAINT `fk_result_item_result1`
    FOREIGN KEY (`result_id` , `crawl_id` , `page_id` , `website_id` )
    REFERENCES `result` (`result_id` , `crawl_id` , `page_id` , `website_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
