-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `símbolos`
--
CREATE DATABASE IF NOT EXISTS `símbolos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `símbolos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `simbolos`
--

CREATE TABLE `simbolos` (
  `idSimbolo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `caracter` varchar(1) NOT NULL,
  `ascii` int(11) NOT NULL,
  `tamanio` int(11) NOT NULL,
  `color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `simbolos`
--

INSERT INTO `simbolos` (`idSimbolo`, `nombre`, `caracter`, `ascii`, `tamanio`, `color`) VALUES
(1, 'arroba', '@', 64, 1, 'java.awt.Color[r=0,g=0,b=0]'),
(2, 'arroba', '@', 64, 1, 'java.awt.Color[r=0,g=0,b=0]'),
(3, 'almohadilla', '#', 35, 3, 'java.awt.Color[r=255,g=51,b=102]'),
(4, 'arroba', '@', 64, 3, 'java.awt.Color[r=0,g=0,b=0]'),
(5, 'dólar', '$', 36, 3, 'java.awt.Color[r=0,g=0,b=0]');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `simbolos`
--
ALTER TABLE `simbolos`
  ADD PRIMARY KEY (`idSimbolo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `simbolos`
--
ALTER TABLE `simbolos`
  MODIFY `idSimbolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
