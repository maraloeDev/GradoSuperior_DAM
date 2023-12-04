-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `junio2023`
--
CREATE DATABASE IF NOT EXISTS `junio2023` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `junio2023`;

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `existe_cliente` (`CIF` VARCHAR(9)) RETURNS TINYINT(1)  BEGIN
	DECLARE num_clientes integer;

	SELECT COUNT(*)
	INTO num_clientes
	FROM clientes
	WHERE clientes.CIF_cliente=CIF;
    
    IF num_clientes > 0 THEN
    	RETURN 1;
    ELSE
    	RETURN 0;
    END IF;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `CIF_cliente` varchar(9) NOT NULL,
  `nombre_cliente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`CIF_cliente`, `nombre_cliente`) VALUES
('A47000099', 'New Data, S.A.'),
('B28223344', 'The Best, S.L.'),
('B47001122', 'Calidad y Gestión, S.L.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id_movimiento` int(11) NOT NULL,
  `CIF` varchar(9) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `operación` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id_movimiento`, `CIF`, `cliente`, `operación`) VALUES
(1, '71111555X', 'Camino Zarzuela Puertas', 'A'),
(2, 'B47001122', 'Calidad y Gestión, S.L.', 'A'),
(3, 'B34050505', 'La Palentina, S.A.', 'B'),
(4, 'A47777888', 'Pucelano, S.A.', 'A'),
(5, 'A47000099', 'New Data, S.A.', 'B');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CIF_cliente`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id_movimiento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
