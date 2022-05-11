DROP DATABASE IF EXISTS `cipa` ;
CREATE DATABASE IF NOT EXISTS `cipa` DEFAULT CHARACTER SET latin1 ;

CREATE table `cipa`.`instituicao`(
id INT NOT NULL AUTO_INCREMENT,
nome_da_empresa varchar (255),
vinculo varchar (150),
PRIMARY KEY(id) 
);

INSERT INTO `cipa`.`instituicao`(`nome_da_empresa`,`vinculo`)
VALUES ('IFPE','Cordenador');

CREATE TABLE `cipa`.`pessoas`(
nome varchar(150),
email varchar(255),
senha varchar(255),
tipo_usuario varchar(50),
foto varchar(255),
id_inst INT,
PRIMARY KEY(email),
FOREIGN KEY (`id_inst`)	REFERENCES `cipa`.`instituicao`(`id`)
);

INSERT INTO `cipa`.`pessoas`(nome, email, senha, tipo_usuario,id_inst)
VALUES ('Jadeilson','jadeilsom.m@gmail.com','123456','Aluno', NULL),
	('Joas','joas@gmail.com','123456','Aluno', NULL),
    ('Andriely','andriely@gmail.com','123456','Aluno', NULL),
    ('ricson','ricson@gmail.com','123456','professor',1),
    ('Lavinia','lavinia@gmail.com','123456','Aluno', NULL);

CREATE TABLE `cipa`.`concurso`(
id INT AUTO_INCREMENT PRIMARY KEY,
data_submissao date,
data_e_hora_apuracao DATETIME,
data_criacao date
);

INSERT INTO `cipa`.`concurso`(data_submissao, data_e_hora_apuracao, data_criacao)
VALUES ('2022-05-01','2022-05-01 14:15:15.000','2022-05-01');

CREATE TABLE `cipa`.`ideias`(
id_ideias INT NOT NULL auto_increment,
nome_do_lider varchar(150),
nomes_da_equipe varchar(255),
temas_impactados varchar(50),
resumo_do_projeto varchar(700),
video_demostrativo varchar(255),
nota decimal(2),
id_concurso INT,
PRIMARY KEY (id_ideias),
FOREIGN KEY (`id_concurso`) REFERENCES `cipa`.`concurso`(`id`)
);

INSERT INTO `cipa`.`ideias`(nome_do_lider,temas_impactados,nota, id_concurso)
VALUES ('JOAS','Inovação',10, 1);

CREATE TABLE `cipa`.`banca`(
id_pessoas VARCHAR(255),
id_concurso INT,
PRIMARY KEY (id_pessoas, id_concurso),
FOREIGN KEY (`id_pessoas`) REFERENCES `cipa`.`pessoas` (`email`),
FOREIGN KEY (`id_concurso`) REFERENCES `cipa`.`concurso` (`id`)
);

INSERT INTO `cipa`.`banca`(id_pessoas, id_concurso)
VALUES ('ricson@gmail.com',1);
