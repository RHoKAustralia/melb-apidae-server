SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`country`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`country` (
  `country_id` INT(3) NOT NULL ,
  `country_name` VARCHAR(250) NULL ,
  `country_code` VARCHAR(3) NULL ,
  PRIMARY KEY (`country_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`village`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`village` (
  `village_id` INT(11) NOT NULL ,
  `village_name` VARCHAR(45) NULL ,
  `country_id` INT(3) NULL ,
  PRIMARY KEY (`village_id`) ,
  INDEX `country_id_fk` (`country_id` ASC) ,
  CONSTRAINT `country_id_fk`
    FOREIGN KEY (`country_id` )
    REFERENCES `mydb`.`country` (`country_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`project`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`project` (
  `project_id` INT(11) NOT NULL ,
  `project_name` VARCHAR(250) NOT NULL ,
  `facebook_pageid` INT(100) NULL ,
  PRIMARY KEY (`project_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` INT(11) NOT NULL ,
  `username` VARCHAR(45) NOT NULL ,
  `facebook_email` VARCHAR(200) NULL ,
  PRIMARY KEY (`user_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`project_story`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`project_story` (
  `story_id` INT(11) NOT NULL ,
  `story_name` VARCHAR(250) NULL ,
  `project_id` INT(11) NOT NULL ,
  `village_id` INT(11) NOT NULL ,
  `latitude` DECIMAL(10,7) NULL ,
  `longitude` DECIMAL(10,7) NULL ,
  `submitted_by` INT(11) NULL ,
  `project_desc` VARCHAR(2000) NULL ,
  PRIMARY KEY (`story_id`) ,
  INDEX `village_id_fk` (`village_id` ASC) ,
  INDEX `project_id_fk` (`project_id` ASC) ,
  INDEX `submitted_by_fk` (`submitted_by` ASC) ,
  CONSTRAINT `village_id_fk`
    FOREIGN KEY (`village_id` )
    REFERENCES `mydb`.`village` (`village_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `project_id_fk`
    FOREIGN KEY (`project_id` )
    REFERENCES `mydb`.`project` (`project_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `submitted_by_fk`
    FOREIGN KEY (`submitted_by` )
    REFERENCES `mydb`.`user` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tags` (
  `tag_id` INT(11) NOT NULL ,
  `tag_name` VARCHAR(30) NULL ,
  PRIMARY KEY (`tag_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`comments` (
  `comment_id` INT(11) NOT NULL ,
  `comment` VARCHAR(500) NOT NULL ,
  PRIMARY KEY (`comment_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`picture`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`picture` (
  `picture_id` INT NOT NULL ,
  `picture_title` VARCHAR(45) NULL ,
  `picture_desc` VARCHAR(500) NULL ,
  `picture` BLOB NULL ,
  `flickr_id` INT(100) NULL ,
  PRIMARY KEY (`picture_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`audio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`audio` (
  `audio_id` INT NOT NULL ,
  `audio_title` VARCHAR(45) NULL ,
  `audio_desc` VARCHAR(500) NULL ,
  `audio` BLOB NULL ,
  PRIMARY KEY (`audio_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`video`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`video` (
  `video_id` INT(11) NOT NULL ,
  `video_title` VARCHAR(45) NULL ,
  `video_desc` VARCHAR(500) NULL ,
  `youtube_id` VARCHAR(50) NULL ,
  PRIMARY KEY (`video_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`project_story_picture`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`project_story_picture` (
  `picture_id` INT NOT NULL ,
  `story_id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`picture_id`, `story_id`) ,
  INDEX `project_story_pic_picfk` (`picture_id` ASC) ,
  INDEX `project_story_pic_storyfk` () ,
  CONSTRAINT `project_story_pic_picfk`
    FOREIGN KEY (`picture_id` )
    REFERENCES `mydb`.`picture` (`picture_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `project_story_pic_storyfk`
    FOREIGN KEY ()
    REFERENCES `mydb`.`project_story` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`project_story_audio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`project_story_audio` (
  `audio_id` INT NOT NULL ,
  `story_id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`audio_id`, `story_id`) ,
  INDEX `projct_story_story_fk` () ,
  INDEX `projct_story_audio_fk` (`audio_id` ASC) ,
  CONSTRAINT `projct_story_story_fk`
    FOREIGN KEY ()
    REFERENCES `mydb`.`project_story` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `projct_story_audio_fk`
    FOREIGN KEY (`audio_id` )
    REFERENCES `mydb`.`audio` (`audio_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`project_story_video`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`project_story_video` (
  `video_id` INT NOT NULL ,
  `story_id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`video_id`, `story_id`) ,
  INDEX `project_story_pic_picfk` (`video_id` ASC) ,
  INDEX `project_story_pic_storyfk` () ,
  CONSTRAINT `project_story_pic_videofk0`
    FOREIGN KEY (`video_id` )
    REFERENCES `mydb`.`video` (`video_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `project_story_pic_storyfk0`
    FOREIGN KEY ()
    REFERENCES `mydb`.`project_story` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`project_tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`project_tags` (
  `project_tag_id` INT(11) NOT NULL ,
  `tag_id` INT(11) NULL ,
  `picture_id` INT(11) NULL ,
  `story_id` INT(11) NULL ,
  `video_id` INT(11) NULL ,
  `audio_id` INT(11) NULL ,
  `project_id` INT(11) NULL ,
  PRIMARY KEY (`project_tag_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`project_comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`project_comments` (
  `project_comment_id` INT(11) NOT NULL ,
  `tag_id` INT(11) NULL ,
  `picture_id` INT(11) NULL ,
  `story_id` INT(11) NULL ,
  `video_id` INT(11) NULL ,
  `audio_id` INT(11) NULL ,
  `project_id` INT(11) NULL ,
  PRIMARY KEY (`project_comment_id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
