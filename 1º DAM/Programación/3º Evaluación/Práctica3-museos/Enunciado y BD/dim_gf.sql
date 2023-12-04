-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-06-2023 a las 18:36:10
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dim_gf`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

DROP TABLE IF EXISTS `autores`;
CREATE TABLE IF NOT EXISTS `autores` (
  `id_autor` int NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `nombre_autor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_pais` int NOT NULL COMMENT 'FK -> paises',
  PRIMARY KEY (`id_autor`),
  KEY `id_pais` (`id_pais`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id_autor`, `nombre_autor`, `id_pais`) VALUES
(1, 'Botticelli', 1),
(2, 'Jan Matejko', 2),
(3, 'Katsushika Hokusai', 3),
(4, 'Velázquez', 4),
(5, 'Vermeer', 5),
(6, 'Rembrandt', 5),
(7, 'Gian Lorenzo Bernini', 1),
(8, 'Henri Matisse', 6),
(9, 'Hanna Pauli', 7),
(10, 'Rafael Sanzio', 1),
(11, 'Caravaggio', 1),
(12, 'Jan Matejko', 2),
(13, 'Fernando Botero', 9),
(14, 'Henri Matisse', 6),
(15, 'Tiziano', 1),
(16, 'René Magritte', 10),
(17, 'Théodore Géricault', 6),
(18, 'El Greco', 18),
(19, 'Van Gogh', 5),
(20, 'Edvard Munch', 12),
(21, 'Gregorio Fernandez', 4),
(22, 'Francisco Goya', 4),
(23, 'Juan de mesa', 4),
(24, 'Jose Risueño', 4),
(25, 'Rogier van der Weyden', 10),
(26, 'Juan de juni', 6),
(27, 'Jaume Padró i Cots', 4),
(28,  'Gian Lorenzo Bernini', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `museos`
--

DROP TABLE IF EXISTS `museos`;
CREATE TABLE IF NOT EXISTS `museos` (
  `id_museo` int NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `nombre_museo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_pais` int NOT NULL COMMENT 'FK -> paises',
  `existe_museo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_museo`),
  KEY `id_pais` (`id_pais`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `museos`
--

INSERT INTO `museos` (`id_museo`, `nombre_museo`, `id_pais`, `existe_museo`) VALUES
(1, 'Galería de los Uffizi', 1, true),
(2, 'Museo Nacional de Polonia', 2, true),
(3, 'The Metropolitan Museum of Art. Nueva York, EE.UU.', 3, true),
(4, 'Museo del Hermitage', 4, true),
(5, 'Rijksmuseum, Amsterdam, Países Bajos', 5, true),
(6, 'Rijksmuseum, Amsterdam, Países Bajos', 5, true),
(7, 'Museo de Victoria y Alberto', 1, true),
(8, 'Museo de arte moderno Pompidou', 6, true),
(9, 'Museo nacional de Estocolmo', 7, true),
(10, 'Museo Borghese', 1, true),
(11, 'Galería Nacional de Arte Antiguo', 1, true),
(12, 'Museo Nacional de Polonia', 2, true),
(13, 'Museo Botero', 9,true),
(14, 'Museo del Hermitage', 6, true),
(15, 'Museo del Hermitage', 1, true),
(16, 'Museo de Magritte', 10, true),
(17, 'Museo del Louvre', 6, true),
(18, 'Museo del Prado', 18, true),
(19, 'Musée d Orsay', 5,true),
(20, 'Nacional de Noruega', 11, true),
(21, 'Museo de las Maravillas Extraterrestres', 12,false),
(22, 'Museo de las Profecías Antiguas', 12, false),
(23, 'Museo de Arte Holográfico', 12,false),
(24, 'Museo de los Sueños Perdidos', 12, false),
(25, 'Museo de los Secretos Ocultos', 12, false),
(26, 'Museo de la Imaginación Desbordante', 12,false),
(27, 'Museo de los Viajes en el Tiempo', 12, false),
(28, 'Museo de Arte Interdimensional', 12, false),
(29, 'Museo de las Criaturas Mitológicas', 12, false),
(30, 'Museo de la Tecnología Futurista', 12, false),
(31, 'Museo de los Enigmas de la Historia', 12, false),
(32, 'Museo de Arte Fantástico', 12, false),
(33, 'Museo de las Leyendas Urbanas', 12, false),
(34, 'Museo de los Tesoros Perdidos', 12, false),
(35, 'Museo de los Inventos Imposibles', 12,false),
(36, 'Museo de Arte Surrealista Cósmico', 12, false),
(37, 'Museo de las Reliquias Mágicas', 12, false),
(38, 'Museo de las Especies Extintas Fantásticas', 12,false),
(39, 'Museo de los Enigmas Extraterrestres', 12, false),
(40, 'Museo de Arte Psicodélico del Futuro', 12, false),
(41,  'Museo Fabre',1,true);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras`
--

DROP TABLE IF EXISTS `obras`;
CREATE TABLE IF NOT EXISTS `obras` (
  `id_obra` int NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `nombre_obra` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripción_obra` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `disciplina` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_museo` int NOT NULL COMMENT 'FK -> museos',
  `id_autor` int NOT NULL COMMENT 'FK -> autores',
  PRIMARY KEY (`id_obra`),
  KEY `id_museo` (`id_museo`),
  KEY `id_autor` (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `obras`
--

INSERT INTO `obras` (`id_obra`, `nombre_obra`, `descripción_obra`, `disciplina`, `id_museo`, `id_autor`) VALUES
(1, 'El nacimiento de Venus', 'https://supercurioso.com/wp-content/uploads/2022/01/datos-curiosos-de-el-nacimiento-de-venus.jpg', 'Pintura', 1, 1),
(2, 'Copérnico', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Jan_Matejko-Astronomer_Copernicus-Conversa', 'Pintura', 2, 2),
(3, 'La gran ola de Kanagawa', 'https://ichef.bbci.co.uk/news/640/cpsprodpb/11D93/production/_121270137_gettyimages-584047706.jpg', 'Estampa', 3, 3),
(4, 'El Almuerzo', 'https://upload.wikimedia.org/wikipedia/commons/1/1e/El_almuerzo%2C_by_Diego_Vel%C3%A1zquez.jpg', 'Cuadro', 4, 4),
(5, 'La lechera', 'https://m.media-amazon.com/images/I/51GRQXopStL._AC_SY450_.jpg', 'Cuadro', 5, 5),
(6, 'La ronda nocturna', 'https://media.posterlounge.com/img/products/130000/128666/128666_poster_l.jpg', 'Pintura', 6, 6),
(7, 'Neptuno y Tritón', 'https://i.pinimg.com/originals/0f/30/bc/0f30bced4f0db41ca22aa9906cba30fb.jpg', 'Escultura', 7, 7),
(8, 'Lujo, calma y voluptuosidad', 'https://m1.paperblog.com/i/181/1817078/lujo-calma-voluptuosidad-T-A_IrGo.jpeg', 'Pintura', 8, 8),
(9, 'Friends', 'https://www.reprodart.com/kunst/hanna_pauli/friends_1900_07_oil_on_canvas.jpg', 'Pintura', 9, 9),
(10, 'La dama con Liocorna', 'https://upload.wikimedia.org/wikipedia/commons/8/87/Lady_with_unicorn_by_Rafael_Santi.jpg', 'Pintura', 10, 10),
(11, 'Jugadores de cartas', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Caravaggio_%28Michelangelo_Merisi%29_fffffffffffffffff-_The_Cardsharps_-_Google_Art_Project.jpg/1200px-Caravaggio_%28Michelangelo_Merisi%29_-_The_Cardsharps_-_Google_Art_Project.jpg', 'Cuadro', 11, 11),
(12, 'La batalla de Grünwald', 'https://mihistoriauniversal.com/wp-content/uploads/batalla-grunwald.jpg', 'Pintura', 12, 12),
(13, 'La Mona Lisa a los 12 años', 'https://1.bp.blogspot.com/-67RYJ8YZEeI/TViomK5r8xI/AAAAAAAAABo/DQLjJ4I9Yqc/s1600/MONA_L%257E1.JPG', 'Pintura', 13, 13),
(14, 'La habitación roja', 'https://3minutosdearte.com/wp-content/uploads/2018/09/Matisse-La-habitaci%C3%B3n-roja-1908-e15370439', 'Pintura', 14, 14),
(15, 'Magdalena penitente', 'https://lafabricadehielo.com/wp-content/uploads/2021/03/22165402_master.jpg', 'Pintura', 15, 15),
(16, 'El hijo del hombre', 'https://arthouse-online.nl/wp-content/uploads/2017/02/1668-De-Mensenzoon-MAG01-Rene-Magritte.jpg', 'Cuadro', 16, 16),
(17, 'La balsa de la Medusa', 'https://fotos.perfil.com/2020/01/09/trim/900/900/le-radeau-de-la-meduse-857503.jpg', 'Pintura', 17, 17),
(18, 'Retrato de un médico', 'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2014/03/14/13947863185507.jpg', 'Pintura', 18, 18),
(19, 'La noche estrellada sobre el Ródano', 'https://mymodernmet.com/wp/wp-content/uploads/2019/05/starry-night-over-the-rhone-5.jpg', 'Pintura', 19, 19),
(20, 'El grito', 'https://media.revistaad.es/photos/60c2233859688c5048166299/master/w_1600%2Cc_limit/278579.jpg', 'Cuadro', 20, 20),
(21, 'La Piedad', 'https://i.pinimg.com/736x/df/18/2b/df182b105765b32d98d88a0baab87034--lamentations-pieta.jpg', 'Escultura', 21, 21),
(22, 'La Piedad', 'https://arsmagazine.com/wp-content/uploads/2022/11/piedad-goya-e1669036911501.jpg', 'Escultura', 22, 22),
(23, 'El Cristo Yacente', 'https://s2.abcstatics.com/media/espana/2016/11/08/cristo-gregorio-fernandez-kzh--620x349@abc.jpg', 'Escultura', 21, 21),
(24, 'El Cristo Yacente', 'https://i0.wp.com/farm6.staticflickr.com/5312/7057557911_7cc436e567_z.jpg', 'Escultura', 23, 23),
(25, 'El Descendimiento de la Cruz', 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Valladolid_iglesia_Vera_Cruz_Descendimiento_Greg', 'Escultura', 21, 21),
(26, 'El Descendimiento de la Cruz', 'https://www.semanasantavinaros.es/ss/wp-content/uploads/MG_9883-458x458.jpg ', 'Escultura', 24, 24),
(27, 'Santa Teresa', 'https://upload.wikimedia.org/wikipedia/commons/6/61/Gregorio_Fern%C3%A1ndez%2C_Santa_Teresa_de_Jes%C', 'Escultura', 21, 21),
(28, 'Santa Teresa', 'https://i0.wp.com/farm6.staticflickr.com/5312/7057557911_7cc436e567_z.jpg', 'Escultura', 25, 25),
(29, 'La Dolorosa', 'https://media-cdn.tripadvisor.com/media/photo-s/0f/30/0d/46/dolorosa-con-cristo-yacente.jpg', 'Escultura', 21, 21),
(30, 'La Dolorosa', 'https://i0.wp.com/farm5.static.flickr.com/4094/4883021256_c37a865bd6_z.jpg', 'Escultura', 26, 26),
(31, 'San Pablo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/San_Pablo_Gregorio_Fernandez_ni.jpg/1280px', 'Escultura', 21, 21),
(32, 'San Pablo', 'https://visitmuseum.gencat.cat/media/cache/1140x684/uploads/objects/photos/54e0782c79d70_escultura-d', 'Escultura', 27, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE IF NOT EXISTS `paises` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id_pais`, `nombre_pais`) VALUES
(1, 'Italia'),
(2, 'Polonia'),
(3, 'Japón'),
(4, 'Español'),
(5, 'Países Bajos'),
(6, 'Francia'),
(7, 'Estocolmo'),
(8, 'Colombia'),
(9, 'Belgica'),
(10, 'Grecia'),
(11, 'Noruega'),
(12, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking`
--

DROP TABLE IF EXISTS `ranking`;
CREATE TABLE IF NOT EXISTS `ranking` (
  `id_ranking` int NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `nombre_jugador` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `puntos_jugador` int NOT NULL,
  PRIMARY KEY (`id_ranking`),
  UNIQUE KEY `id_ranking` (`id_ranking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
