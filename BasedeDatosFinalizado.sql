CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `director_tecnico` varchar(30) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `estadistica_equipos` (
  `id_estadistica_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `goles_favor` int(11) NOT NULL,
  `goles_contra` int(11) NOT NULL,
  `partidos_ganados` int(11) DEFAULT NULL,
  `partidos_perdidos` int(11) DEFAULT NULL,
  `partidos_empatados` int(11) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_estadistica_equipo`),
  KEY `estadisticas_equipo` (`id_equipo`),
  CONSTRAINT `estadisticas_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_partido`),
  CONSTRAINT `estadistica_partido` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uno_equip` (`id_equipo`,`dorsal`),
  CONSTRAINT `juguador_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `partidos` (
  `id_partido` int(11) NOT NULL AUTO_INCREMENT,
  `local` int(11) NOT NULL,
  `visitante` int(11) NOT NULL,
  `goles_local` int(11) DEFAULT '0',
  `goles_visitante` int(11) DEFAULT '0',
  `faltas_realizadas` varchar(45) NOT NULL,
  `arbitro` varchar(45) NOT NULL,
  `tarjetas_amarillas` int(11) DEFAULT NULL,
  `tarjetas_rojas` int(11) DEFAULT NULL,
  `fecha` datetime(6) NOT NULL,
  `horarios` datetime(4) NOT NULL,
  `vot_local` varchar(20) DEFAULT NULL,
  `vot_visitante` varchar(20) DEFAULT NULL,
  `ganador` int(11) DEFAULT NULL,
  `posicion` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_partido`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `administrador` tinyint(1) NOT NULL,
  `rango` smallint(10) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `equipos_partidos_idx` (`id_equipo`),
  CONSTRAINT `equipos_usuarios` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
