CREATE DATABASE Confesiones;
USE Confesiones;
CREATE TABLE Usuario(
	idUsuario int NOT NULL AUTO_INCREMENT,
    nombre varchar(45) NOT NULL,
    apellidos varchar(45) NOT NULL,
    institucion varchar(45) NOT NULL,
    nombreUsuario varchar(10) NOT NULL UNIQUE,
    contraseña varchar(8) NOT NULL UNIQUE,
    sexo varchar(5) NOT NULL,
	numTelefono int NOT NULL,
	modalidadPago varchar(10) NOT NULL,
	PRIMARY KEY(idUsuario)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE Confesion(
	idConfesion int NOT NULL AUTO_INCREMENT,
    etiqueta varchar(20) NOT NULL,
	confesion varchar(141) NOT NULL,
	idUsConf int NOT NULL,
    ip varchar(22) NOT NULL,
    PRIMARY KEY(idConfesion),
    KEY idUsConf(idUsConf)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

ALTER TABLE Confesion
	ADD CONSTRAINT Confesion_ibfk_1 FOREIGN KEY (idUsConf) REFERENCES Usuario (idUsuario) ON DELETE CASCADE ON UPDATE CASCADE;