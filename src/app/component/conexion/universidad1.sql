-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-12-2023 a las 18:46:58
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `universidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `rut` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `alumno_carrera` varchar(60) DEFAULT NULL,
  `docente_alumno` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` int(11) NOT NULL,
  `evaluaciones` varchar(60) DEFAULT NULL,
  `semestre` varchar(60) DEFAULT NULL,
  `carrera_jornada` varchar(60) DEFAULT NULL,
  `alumno_carrera` varchar(60) DEFAULT NULL,
  `jefedecarreara_carrera` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id` int(11) NOT NULL,
  `duracion` varchar(60) DEFAULT NULL,
  `asignatura` varchar(60) DEFAULT NULL,
  `docente_clase` varchar(60) DEFAULT NULL,
  `modulo_clases` varchar(60) DEFAULT NULL,
  `jefecarrera_clases` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `rut` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `asignatura` varchar(60) DEFAULT NULL,
  `docente_alumno` varchar(60) DEFAULT NULL,
  `docente_clase` varchar(60) DEFAULT NULL,
  `jefecarrera_docente` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `ID` int(11) NOT NULL,
  `ramo` varchar(60) DEFAULT NULL,
  `hora` int(11) NOT NULL,
  `recreo` varchar(60) DEFAULT NULL,
  `bloque` varchar(70) DEFAULT NULL,
  `horarios_jornada` varchar(60) DEFAULT NULL,
  `laboratorio_horarios` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jefecarrera`
--

CREATE TABLE `jefecarrera` (
  `rut` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `jefecarrera_carrera` tinyint(1) DEFAULT NULL,
  `jefecarrera_clases` varchar(60) DEFAULT NULL,
  `jefecarrera_docente` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `id` int(11) NOT NULL,
  `horarios_jornada` varchar(60) NOT NULL,
  `fecha` int(11) DEFAULT NULL,
  `carrera_jornada` varchar(60) DEFAULT NULL,
  `jornada_modulo` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id` int(60) NOT NULL,
  `hora` varchar(60) DEFAULT NULL,
  `implementos` varchar(60) DEFAULT NULL,
  `laboratorio_sala` varchar(60) DEFAULT NULL,
  `laboratorio_horarios` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id` int(11) NOT NULL,
  `hora` varchar(60) DEFAULT NULL,
  `asignatura` varchar(60) DEFAULT NULL,
  `jornada_modulo` varchar(60) DEFAULT NULL,
  `modulo_clases` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `n_sala` int(11) NOT NULL,
  `pizarra` varchar(60) DEFAULT NULL,
  `profesor` varchar(60) DEFAULT NULL,
  `laboratorio_sala` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`rut`),
  ADD UNIQUE KEY `alumno_carrera` (`alumno_carrera`),
  ADD UNIQUE KEY `docente_alumnos` (`docente_alumno`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jornada_carrera` (`carrera_jornada`),
  ADD UNIQUE KEY `alumno_carrera` (`alumno_carrera`),
  ADD UNIQUE KEY `jefedecarreara_carrera` (`jefedecarreara_carrera`),
  ADD UNIQUE KEY `carrera_jornada` (`carrera_jornada`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `docente_clase` (`docente_clase`),
  ADD UNIQUE KEY `modulo_clases` (`modulo_clases`),
  ADD UNIQUE KEY `jefecarrera_clases` (`jefecarrera_clases`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`rut`),
  ADD UNIQUE KEY `docente_alumno` (`docente_alumno`),
  ADD UNIQUE KEY `docente_clase` (`docente_clase`),
  ADD UNIQUE KEY `jefecarrera_docente` (`jefecarrera_docente`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `jornada_horarios` (`horarios_jornada`),
  ADD UNIQUE KEY `laboratorio_horarios` (`laboratorio_horarios`);

--
-- Indices de la tabla `jefecarrera`
--
ALTER TABLE `jefecarrera`
  ADD PRIMARY KEY (`rut`),
  ADD UNIQUE KEY `jefecarrera_clases` (`jefecarrera_clases`),
  ADD UNIQUE KEY `jefecarrera_carrera` (`jefecarrera_carrera`),
  ADD UNIQUE KEY `jefecarrera_docente` (`jefecarrera_docente`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `horarios_jornada` (`horarios_jornada`),
  ADD UNIQUE KEY `jornada_modulo` (`jornada_modulo`),
  ADD UNIQUE KEY `carrera_jornada` (`carrera_jornada`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `laboratorio_sala` (`laboratorio_sala`),
  ADD UNIQUE KEY `laboratorio_horarios` (`laboratorio_horarios`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jornada_horarios` (`jornada_modulo`),
  ADD UNIQUE KEY `modulo_clases` (`modulo_clases`),
  ADD UNIQUE KEY `jornada_modulo` (`jornada_modulo`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`n_sala`),
  ADD UNIQUE KEY `laboratorio_sala` (`laboratorio_sala`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`docente_alumno`) REFERENCES `docente` (`docente_alumno`);

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `carreras_ibfk_2` FOREIGN KEY (`alumno_carrera`) REFERENCES `alumno` (`alumno_carrera`),
  ADD CONSTRAINT `carreras_ibfk_3` FOREIGN KEY (`jefedecarreara_carrera`) REFERENCES `jefecarrera` (`jefecarrera_carrera`);

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`modulo_clases`) REFERENCES `modulo` (`modulo_clases`),
  ADD CONSTRAINT `clases_ibfk_2` FOREIGN KEY (`jefecarrera_clases`) REFERENCES `jefecarrera` (`jefecarrera_clases`),
  ADD CONSTRAINT `clases_ibfk_3` FOREIGN KEY (`docente_clase`) REFERENCES `docente` (`docente_clase`);

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`jefecarrera_docente`) REFERENCES `jefecarrera` (`jefecarrera_docente`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`laboratorio_horarios`) REFERENCES `laboratorios` (`laboratorio_horarios`);

--
-- Filtros para la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD CONSTRAINT `jornada_ibfk_1` FOREIGN KEY (`horarios_jornada`) REFERENCES `horarios` (`horarios_jornada`),
  ADD CONSTRAINT `jornada_ibfk_2` FOREIGN KEY (`carrera_jornada`) REFERENCES `carreras` (`carrera_jornada`);

--
-- Filtros para la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `modulo_ibfk_1` FOREIGN KEY (`jornada_modulo`) REFERENCES `jornada` (`jornada_modulo`);

--
-- Filtros para la tabla `salas`
--
ALTER TABLE `salas`
  ADD CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`laboratorio_sala`) REFERENCES `laboratorios` (`laboratorio_sala`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
