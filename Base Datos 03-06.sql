CREATE DATABASE `psg_team`;
CREATE TABLE `equipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ult_rival` varchar(30) NOT NULL,
  `prox_rival` varchar(30) DEFAULT NULL,
  `director_tecnico` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `equipo_partidos` FOREIGN KEY (`id`) REFERENCES `partidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `estadistica_equipos` (
  `goles_favor` int(11) NOT NULL,
  `goles_contra` int(11) NOT NULL,
  `partidos_ganados` int(11) DEFAULT NULL,
  `partidos_perdidos` int(11) DEFAULT NULL,
  `partidos_empatados` int(11) DEFAULT NULL,
  `id_equipo` int(11) NOT NULL,
  PRIMARY KEY (`id_equipo`),
  CONSTRAINT `estadisticas_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `estadistica_partido` (
  `remates` int(11) DEFAULT NULL,
  `posesion` int(11) NOT NULL,
  `pases` int(11) NOT NULL,
  `presicion_pases` int(11) NOT NULL,
  `faltas` int(11) DEFAULT NULL,
  `corners` int(11) DEFAULT NULL,
  `offsides` int(11) DEFAULT NULL,
  `id_partido` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  PRIMARY KEY (`id_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `jugador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `pierna_habil` varchar(15) DEFAULT 'Ambidiestro',
  `altura` int(11) NOT NULL,
  `posicion` varchar(25) NOT NULL,
  `goles_hechos` int(11) DEFAULT '0',
  `dorsal` int(11) NOT NULL,
  `goles_recibidos` int(11) NOT NULL,
  `penales_atajados` int(11) NOT NULL,
  `promedio_gol_arq` float NOT NULL,
  `promedio_gol_del` float NOT NULL,
  `penales_convertidos` float NOT NULL,
  `penales_errados` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uno_equip` (`id_equipo`,`dorsal`),
  CONSTRAINT `juguador_equipo` FOREIGN KEY (`id`) REFERENCES `jugador` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `partidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local` varchar(20) NOT NULL,
  `visitante` varchar(45) NOT NULL,
  `result_final` varchar(45) NOT NULL,
  `faltas_realizadas` varchar(45) NOT NULL,
  `arbitro` varchar(45) NOT NULL,
  `goles_convertidos` int(11) DEFAULT NULL,
  `tarjetas_amarillas` int(11) DEFAULT NULL,
  `tarjetas_rojas` int(11) DEFAULT NULL,
  `fecha` datetime(6) NOT NULL,
  `horarios` datetime(4) NOT NULL,
  `vot_local` varchar(20) DEFAULT NULL,
  `vot_visitante` varchar(20) DEFAULT NULL,
  `ganador` varchar(25) DEFAULT NULL,
  `posicion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `partido_estadistica_partido` FOREIGN KEY (`id`) REFERENCES `estadistica_partido` (`id_partido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
  `nombre_usuario` varchar(20) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `administrador` tinyint(1) NOT NULL,
  `rango` smallint(10) NOT NULL,
  PRIMARY KEY (`nombre_usuario`),
  KEY `equipos_partidos_idx` (`id_equipo`),
  CONSTRAINT `equipos_usuarios` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;