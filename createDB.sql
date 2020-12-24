drop schema if exists gym;
create schema gym;
drop table if exists `gym`.`gymdata`;
CREATE TABLE `gym`.`gymdata` (
  `username` VARCHAR(15) NOT NULL,
  `days` INT NOT NULL,
   `yaxis` int not null,
  `date` DATE NOT NULL,
  `timestamp` TIMESTAMP default current_timestamp NOT NULL,
  PRIMARY KEY (`username`, `date`)
  );
  
 INSERT INTO `gym`.`gymdata` (`username`, `days`, `yaxis`, `date`) VALUES ('Paal', '0', '0', '2020-12-12');
INSERT INTO `gym`.`gymdata` (`username`, `days`, `yaxis`, `date`) VALUES ('Binda', '0', '0', '2020-12-12');
