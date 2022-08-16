-- MySQL Script generated by MySQL Workbench
-- Thu May 12 17:48:01 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Clinics
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Clinics` ;

-- -----------------------------------------------------
-- Schema Clinics
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Clinics` DEFAULT CHARACTER SET utf8 ;
USE `Clinics` ;

-- -----------------------------------------------------
-- Table `Clinics`.`EventCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinics`.`EventCategory` (
  `eventCategoryId` INT NOT NULL AUTO_INCREMENT,
  `eventCategoryName` VARCHAR(100) NOT NULL,
  `eventCategoryDescription` VARCHAR(500) NULL,
  `eventDuration` INT NOT NULL,
  PRIMARY KEY (`eventCategoryId`),
  UNIQUE INDEX `eventCategoryName_UNIQUE` (`eventCategoryId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinics`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinics`.`Event` (
  `bookingId` INT NOT NULL AUTO_INCREMENT,
  `bookingName` VARCHAR(100) NOT NULL,
  `bookingEmail` VARCHAR(50) NULL,
  `eventStartTime` DATETIME NOT NULL,
  `eventNote` VARCHAR(500) NULL,
  `eventDuration` INT NOT NULL,
  `eventCategoryId` INT NOT NULL,
  PRIMARY KEY (`bookingId`),
  UNIQUE INDEX `bookingId_UNIQUE` (`bookingId` ASC) VISIBLE,
  INDEX `fk_event_EventCategory_idx` (`eventCategoryId` ASC) VISIBLE,
  CONSTRAINT `fk_event_EventCategory`
    FOREIGN KEY (`eventCategoryId`)
    REFERENCES `Clinics`.`EventCategory` (`eventCategoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


CREATE TABLE IF NOT EXISTS `Clinics`.`user` (
	`userID` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email`  VARCHAR(50) NOT NULL,
    `role` enum('Admin','Lecturer','Student') NOT NULL,
    `createdOn` datetime not null default current_timestamp ,
    `updatedOn` datetime not null default current_timestamp on update current_timestamp ,
    primary key(`userID`),
    unique index `username_UNIQUE` (`name` ASC) VISIBLE,
     unique index `email_UNIQUE` (`email` ASC) VISIBLE
);


insert into EventCategory (eventCategoryId ,eventCategoryName , eventCategoryDescription ,eventDuration)
values (1,'Project Management Clinic','ตารางนัดหมายนี้ใช้สำหรับนัดหมาย project management clinic ในวิชา INT221 integrated project | ให้นักศึกษาเตรียมเอกสารที่เกี่ยวขงเพื่อแสดงระหว่างขอคำปรึกษา',30);
insert into EventCategory (eventCategoryId ,eventCategoryName , eventCategoryDescription ,eventDuration)
values (2,'DevOps/Infra Clinic','Use this event category for DevOps/Infra clinic',20);
insert into EventCategory (eventCategoryId ,eventCategoryName , eventCategoryDescription ,eventDuration)
values (3,'Database Clinic','ตารางนัดหมายนี้ใช้สำหรับนัดหมาย  database clinic ในวิชา INT221 integrated project |',15);
insert into EventCategory (eventCategoryId ,eventCategoryName , eventCategoryDescription ,eventDuration)
values (4,'Client-side Clinic','ตารางนัดหมายนี้ใช้สำหรับนัดหมาย  client-side clinic ในวิชา INT221 integrated project |',30);
insert into EventCategory (eventCategoryId ,eventCategoryName , eventCategoryDescription ,eventDuration)
values (5,'Server-side Clinic',null,30);

insert into Event (bookingId , bookingName , bookingEmail, eventStartTime, eventNote, eventDuration, eventCategoryId )
values (1,'Somchai Jaidee (OR-7)','somchai.jai@mail.kmutt.ac.th','2022-05-22 13:30:00',null,30,2);
insert into Event (bookingId , bookingName , bookingEmail, eventStartTime, eventNote, eventDuration, eventCategoryId )
values (2,'Somsri Rakdee (SJ-3)','somsri.rak@mail.kmutt.ac.th','2022-04-27 09:30:00','ขอปรึกษาปัญหาเพื่อนไม่ช่วยงาน',30,1);
insert into Event (bookingId , bookingName , bookingEmail, eventStartTime, eventNote, eventDuration, eventCategoryId )
values (3,'สมเกียรติ ขยันเรียน กลุ่ม TT-4','somkiat.kay@kmutt.ac.th','2022-05-23 16:30:00',null,15,3);