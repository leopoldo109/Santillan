-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-01-2024 a las 18:41:58
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
-- Base de datos: `santillan`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adelantos`
--

CREATE TABLE `adelantos` (
  `id_adelanto` int(11) NOT NULL,
  `id_personal` int(11) DEFAULT NULL,
  `monto_adelanto` decimal(10,2) DEFAULT NULL,
  `fecha` date NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `adelantos`
--

INSERT INTO `adelantos` (`id_adelanto`, `id_personal`, `monto_adelanto`, `fecha`, `createdAt`, `updatedAt`) VALUES
(3, 5, 5000.00, '2024-01-08', '2024-01-10 17:35:42', '2024-01-10 17:35:42'),
(4, 12, 10000.00, '2024-01-10', '2024-01-10 17:40:48', '2024-01-10 17:40:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `id_asistencia` int(11) NOT NULL,
  `id_personal` int(11) DEFAULT NULL,
  `estado_asistencia` enum('presente','ausente') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepersonalobras`
--

CREATE TABLE `detallepersonalobras` (
  `id_detalle_personal_obra` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  `id_obra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleproductosobras`
--

CREATE TABLE `detalleproductosobras` (
  `id_detalle` int(11) NOT NULL,
  `id_obra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obrasencurso`
--

CREATE TABLE `obrasencurso` (
  `id_obra` int(11) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `presupuesto` decimal(10,2) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` enum('En proceso','Finalizada','En espera','Cancelada') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `nombre`, `createdAt`, `updatedAt`) VALUES
(1, 'Jorge', '2024-01-10 14:40:06', '2024-01-10 14:40:06'),
(2, 'Gordo', '2024-01-10 14:40:31', '2024-01-10 14:40:31'),
(3, 'Peluca', '2024-01-10 14:40:31', '2024-01-10 14:40:31'),
(4, 'Turco', '2024-01-10 14:41:18', '2024-01-10 14:41:18'),
(5, 'Sandro', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(6, 'Sebastián', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(7, 'Roman', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(8, 'Javier', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(9, 'Guille', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(10, 'Yoni', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(11, 'Walter', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(12, 'Sirena', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(13, 'Facundo', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(14, 'Santiago', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(15, 'Kevin', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(16, 'Otto', '2024-01-10 14:42:02', '2024-01-10 14:42:02'),
(17, 'Pancho', '2024-01-10 14:45:44', '2024-01-10 14:45:44'),
(18, 'Misio', '2024-01-10 14:45:44', '2024-01-10 14:45:44'),
(19, 'Tomas', '2024-01-10 14:45:44', '2024-01-10 14:45:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `sector` enum('A','B','C','D') NOT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `cantidad`, `estado`, `sector`, `marca`, `createdAt`, `updatedAt`) VALUES
(1, 'llaves fija', 12, 'Funcionan', 'A', '', '2024-01-08 17:28:20', '2024-01-10 11:13:07'),
(2, 'circular ', 1, 'Funciona', 'A', 'skilsaw', '2024-01-08 17:15:29', '2024-01-10 11:08:41'),
(3, 'llave Alen', 7, 'n', 'B', NULL, '2024-01-08 17:18:04', '2024-01-08 17:18:04'),
(4, 'Destornillador Philips', 6, '', 'D', '', '2024-01-08 17:18:38', '2024-01-10 11:30:42'),
(5, 'Llana dentada', 10, 'Usadas', 'B', '', '2024-01-08 17:23:34', '2024-01-10 14:33:39'),
(6, 'pistola de silicona', 5, '.', 'B', NULL, '2024-01-08 17:24:21', '2024-01-08 17:24:21'),
(8, 'Atornillador electrico', 1, 'Funciona?', 'B', 'Dewalt', '2024-01-08 17:35:49', '2024-01-10 12:39:50'),
(9, 'barreta', 3, '-', 'B', NULL, '2024-01-08 17:36:40', '2024-01-08 17:36:40'),
(10, 'barretin', 1, '.', 'B', NULL, '2024-01-08 17:36:59', '2024-01-08 17:36:59'),
(11, 'Escuadra', 2, '.', 'B', NULL, '2024-01-08 17:58:27', '2024-01-08 17:58:27'),
(12, 'Compresor', 1, '.', 'C', NULL, '2024-01-08 18:06:14', '2024-01-08 18:06:14'),
(13, 'Martillo grande demoledor', 1, 'Funciona', 'C', 'Omaha', '2024-01-08 18:06:40', '2024-01-10 12:35:42'),
(14, 'Atornillador bateria', 1, 'No funciona', 'C', 'Lusqtoff', '2024-01-08 18:08:20', '2024-01-10 12:25:52'),
(15, 'Escalera madera', 2, '.', 'A', NULL, '2024-01-08 18:09:53', '2024-01-09 18:19:39'),
(16, 'Pala', 7, '.', 'C', NULL, '2024-01-08 18:11:04', '2024-01-08 18:11:04'),
(17, 'masas', 2, '.', 'B', NULL, '2024-01-08 18:11:44', '2024-01-08 18:11:44'),
(18, 'Picotas', 3, '.', 'C', NULL, '2024-01-08 18:12:33', '2024-01-08 18:12:33'),
(19, 'martillo demoledor', 1, '.', 'D', NULL, '2024-01-08 18:13:36', '2024-01-08 18:13:36'),
(20, 'Rastrillos plastico', 3, '.', 'A', NULL, '2024-01-08 18:14:05', '2024-01-08 18:14:05'),
(21, 'Trompos', 1, '.', 'A', NULL, '2024-01-08 18:14:37', '2024-01-08 18:14:37'),
(22, 'Rodillos', 0, '.', 'D', NULL, '2024-01-08 18:15:09', '2024-01-08 18:15:09'),
(23, 'Alicates grandes', 1, '.', 'B', NULL, '2024-01-08 18:15:54', '2024-01-08 18:15:54'),
(24, 'Llave para caño bremen', 2, '.', 'B', NULL, '2024-01-08 18:16:22', '2024-01-08 18:16:22'),
(25, 'Alicates', 1, '0', 'B', NULL, '2024-01-08 18:17:04', '2024-01-08 18:17:04'),
(26, 'agujereadora ', 1, '.', 'B', NULL, '2024-01-08 18:18:57', '2024-01-08 18:18:57'),
(27, 'Fumigador', 1, '.', 'A', NULL, '2024-01-08 18:19:35', '2024-01-08 18:19:35'),
(28, 'Cocina', 1, 'D', 'D', NULL, '2024-01-08 18:20:00', '2024-01-08 18:20:00'),
(29, 'Aspiradora industrial', 1, '.', 'B', NULL, '2024-01-08 18:20:13', '2024-01-08 18:20:13'),
(30, 'Cepilladora/lustradora', 1, ',', 'A', NULL, '2024-01-08 18:20:38', '2024-01-08 18:20:38'),
(31, 'cencitila de madera', 1, '.', 'A', NULL, '2024-01-08 18:21:49', '2024-01-08 18:21:49'),
(32, 'Roto percutor', 1, '.', 'B', NULL, '2024-01-08 18:22:15', '2024-01-08 18:22:15'),
(33, 'Moladora angular', 2, ',', 'B', NULL, '2024-01-08 18:22:59', '2024-01-08 18:22:59'),
(34, 'Traje de agua', 2, '.Nuevos', 'D', '', '2024-01-08 18:23:42', '2024-01-10 11:15:40'),
(35, 'Puntas percutar', 1, 'A contar', 'B', NULL, '2024-01-08 18:24:18', '2024-01-08 18:24:18'),
(36, 'Horquilla', 2, 'contar', 'A', NULL, '2024-01-08 18:26:51', '2024-01-08 18:26:51'),
(37, 'Nivel grande', 1, '.', 'D', NULL, '2024-01-08 18:27:09', '2024-01-08 18:27:09'),
(38, 'Motores', 2, '.', 'B', NULL, '2024-01-08 18:27:21', '2024-01-08 18:27:21'),
(39, 'Piedra de banco', 1, '.', 'B', NULL, '2024-01-08 18:27:42', '2024-01-08 18:27:42'),
(40, 'Agujereadora de banco', 1, '.', 'B', NULL, '2024-01-08 18:28:10', '2024-01-08 18:28:10'),
(41, 'Fusora', 1, '.', 'B', NULL, '2024-01-08 18:28:46', '2024-01-08 18:28:46'),
(42, 'Aparejo', 1, '.', 'A', NULL, '2024-01-08 18:30:13', '2024-01-08 18:30:13'),
(43, 'Aparejo electrico', 1, 'b', 'B', NULL, '2024-01-08 18:30:59', '2024-01-08 18:30:59'),
(44, 'Regla vibradora', 1, '.', 'B', NULL, '2024-01-08 18:31:18', '2024-01-08 18:31:18'),
(45, 'Remachadora', 1, '.', 'B', NULL, '2024-01-08 18:31:40', '2024-01-08 18:31:40'),
(46, 'llave cricket', 1, '.', 'B', NULL, '2024-01-08 18:32:29', '2024-01-08 18:32:29'),
(47, 'Sierra de caladora', 2, '.', 'B', NULL, '2024-01-08 18:32:53', '2024-01-08 18:32:53'),
(48, 'Caladora', 1, '.', 'B', NULL, '2024-01-08 18:33:08', '2024-01-08 18:33:08'),
(49, 'Destornillador punta', 2, '.', 'B', NULL, '2024-01-08 18:34:20', '2024-01-08 18:34:20'),
(50, 'Teflon', 2, '.', 'B', NULL, '2024-01-08 18:35:55', '2024-01-08 18:35:55'),
(51, 'Espatula', 2, '.', 'B', NULL, '2024-01-08 18:37:38', '2024-01-08 18:37:38'),
(52, 'Cepillo de metal', 1, '.', 'B', NULL, '2024-01-08 18:38:34', '2024-01-08 18:38:34'),
(53, 'Formol', 1, '.', 'B', NULL, '2024-01-08 18:38:50', '2024-01-08 18:38:50'),
(54, 'Desmalesadora', 2, '.', 'A', NULL, '2024-01-08 18:39:23', '2024-01-08 18:39:23'),
(56, 'Tubo 45', 1, '.', 'A', NULL, '2024-01-08 18:39:35', '2024-01-08 18:39:35'),
(57, 'Francesa grande', 1, '..', 'B', NULL, '2024-01-08 18:46:40', '2024-01-08 18:46:40'),
(58, 'Francesa chica', 1, '.', 'B', NULL, '2024-01-08 18:46:53', '2024-01-08 18:46:53'),
(59, 'Rollo de membrana ', 1, '.', 'A', NULL, '2024-01-08 18:47:07', '2024-01-08 18:47:07'),
(60, 'Mangeras nivel', 2, '.', 'A', NULL, '2024-01-08 18:47:33', '2024-01-08 18:47:33'),
(61, 'Calibre', 1, '.', 'D', NULL, '2024-01-08 18:47:49', '2024-01-08 18:47:49'),
(62, 'Tijera para chapa', 1, '.', 'D', NULL, '2024-01-08 18:50:01', '2024-01-08 18:50:01'),
(63, 'Llave 11 con cricket', 1, ',', 'B', NULL, '2024-01-08 19:00:17', '2024-01-08 19:00:17'),
(64, 'Llave tubo', 1, '.', 'B', NULL, '2024-01-08 19:00:34', '2024-01-08 19:00:34'),
(65, 'Llave T', 1, '.', 'B', NULL, '2024-01-08 19:00:50', '2024-01-08 19:00:50'),
(66, 'Llave T prima', 1, '.', 'B', NULL, '2024-01-08 19:01:17', '2024-01-08 19:01:17'),
(67, 'Pincel', 1, '.', 'D', NULL, '2024-01-08 19:01:36', '2024-01-08 19:01:36'),
(68, 'Kit destornillador a bateria', 1, 'B', 'B', NULL, '2024-01-08 19:10:44', '2024-01-08 19:10:44'),
(69, 'Fratachos', 30, '', 'A', NULL, '2024-01-08 19:11:35', '2024-01-09 18:23:17'),
(71, 'Arrancador/Cargador', 1, '.', 'B', NULL, '2024-01-08 19:13:52', '2024-01-08 19:13:52'),
(72, 'Kit desmalesadora', 1, '.', 'B', NULL, '2024-01-08 19:14:27', '2024-01-08 19:14:27'),
(73, 'Serruchos', 2, '.', 'B', NULL, '2024-01-08 19:14:38', '2024-01-08 19:14:38'),
(74, 'Cucharas de albañil', 3, '.', 'B', NULL, '2024-01-08 19:15:49', '2024-01-08 19:15:49'),
(75, 'Llana lisa', 8, '.', 'B', NULL, '2024-01-08 19:16:13', '2024-01-08 19:16:13'),
(76, 'Llana de plastico', 2, '.', 'B', NULL, '2024-01-08 19:16:29', '2024-01-08 19:16:29'),
(77, 'Machetes', 2, '.', 'B', NULL, '2024-01-08 19:16:44', '2024-01-08 19:16:44'),
(78, 'Sellador de poliuretano', 6, '.', 'B', NULL, '2024-01-08 19:18:00', '2024-01-08 19:18:00'),
(79, 'Salamandra a leña', 1, '.', 'B', NULL, '2024-01-08 19:18:19', '2024-01-08 19:18:19'),
(80, 'Guarda ganado-canaleta', 1, '.', 'B', NULL, '2024-01-08 19:18:42', '2024-01-08 19:18:42'),
(81, 'Puntas de metal', 15, '.', 'B', NULL, '2024-01-08 19:19:07', '2024-01-08 19:19:07'),
(82, 'Puntas para acero', 4, 'balde', 'B', NULL, '2024-01-08 19:19:30', '2024-01-08 19:19:30'),
(83, 'Tijeras de podar', 1, 'Baldes', 'B', NULL, '2024-01-08 19:19:54', '2024-01-08 19:19:54'),
(84, 'Picos', 3, 'Baldes', 'A', NULL, '2024-01-08 19:20:12', '2024-01-09 19:04:32'),
(85, 'Grinfa', 2, 'Baldes', 'B', NULL, '2024-01-08 19:20:27', '2024-01-08 19:20:27'),
(86, 'Llave de tubo', 1, 'baldes', 'B', NULL, '2024-01-08 19:20:50', '2024-01-08 19:20:50'),
(87, 'Batidora de metal', 1, 'baldes', 'B', NULL, '2024-01-08 19:21:03', '2024-01-08 19:21:03'),
(88, 'Palita', 1, '.', 'B', NULL, '2024-01-08 19:21:16', '2024-01-08 19:21:16'),
(89, 'Garrafas', 2, 'Usadas', 'D', '', '2024-01-09 11:08:35', '2024-01-10 12:44:52'),
(90, 'sopletes', 2, '-', 'B', NULL, '2024-01-09 11:08:47', '2024-01-09 11:08:47'),
(91, 'cajas de tiza', 2, '-', 'D', NULL, '2024-01-09 11:09:23', '2024-01-09 11:09:23'),
(94, 'Escalera extensible', 3, '.', 'A', NULL, '2024-01-09 18:21:40', '2024-01-09 18:21:40'),
(95, 'salchichas', 5, '.', 'D', NULL, '2024-01-09 18:22:00', '2024-01-09 18:22:01'),
(96, 'Baldes', 120, '.', 'A', NULL, '2024-01-09 18:22:25', '2024-01-09 18:22:25'),
(97, 'Esmalte sintetico negro', 1, '4 Litros', 'D', NULL, '2024-01-09 18:24:34', '2024-01-09 18:24:34'),
(98, 'Herrería colorado', 1, '4 Litros', 'D', NULL, '2024-01-09 18:25:06', '2024-01-09 18:25:06'),
(99, 'Esmalte sintético beige', 1, '1 litro', 'D', NULL, '2024-01-09 18:25:34', '2024-01-09 18:25:34'),
(100, 'Lata danska ', 2, '3 litro y otra con 2 litro', 'D', NULL, '2024-01-09 18:26:11', '2024-01-09 18:59:11'),
(101, 'Revestimiento protector para madera', 1, '4 litros', 'D', NULL, '2024-01-09 18:26:37', '2024-01-09 18:26:37'),
(102, 'Esmalte sintético brillo blanco', 1, '4 litro', 'D', NULL, '2024-01-09 18:27:08', '2024-01-09 18:27:08'),
(103, 'Brikol ladrillos color natural', 1, '1 litro', 'D', NULL, '2024-01-09 18:27:25', '2024-01-09 18:27:25'),
(104, 'Blanco mate', 1, '1/2 litro', 'D', NULL, '2024-01-09 18:27:40', '2024-01-09 18:27:40'),
(105, 'Glasurite transparente-sealer', 1, '2 litros', 'D', NULL, '2024-01-09 18:28:11', '2024-01-09 18:28:11'),
(106, 'cetol clasico satinado', 1, '4 litros', 'D', NULL, '2024-01-09 18:29:30', '2024-01-09 18:29:30'),
(107, 'antióxido negro', 1, '4 litros', 'D', NULL, '2024-01-09 18:29:49', '2024-01-09 18:29:49'),
(108, 'antióxido blanco', 1, '1 litro', 'D', NULL, '2024-01-09 18:30:10', '2024-01-09 18:30:10'),
(109, 'Caja de cuña plastica', 1, '.', 'D', NULL, '2024-01-09 18:30:51', '2024-01-09 18:30:51'),
(110, 'pintura impermeabilizante frente con poliuretano', 1, '1 litro', 'D', NULL, '2024-01-09 18:33:06', '2024-01-09 18:33:06'),
(111, 'Revestimiento satinado beige', 1, '4 litros', 'D', NULL, '2024-01-09 18:35:25', '2024-01-09 18:35:25'),
(112, 'Antioxido rojo sintético ', 1, '1/2 litro', 'D', NULL, '2024-01-09 18:35:59', '2024-01-09 18:35:59'),
(113, 'Esmalte sintético blanco', 1, '1/2 litro', 'D', NULL, '2024-01-09 18:36:29', '2024-01-09 18:36:29'),
(114, 'Aceite 2T', 2, '1/2 litro por separado', 'D', NULL, '2024-01-09 18:37:02', '2024-01-09 18:37:02'),
(115, 'Cinta de papel durlock', 2, '.', 'D', NULL, '2024-01-09 18:37:49', '2024-01-09 18:58:01'),
(116, 'Adhesivo de contacto sin tolueno', 1, '3 litro', 'D', NULL, '2024-01-09 18:38:36', '2024-01-09 18:38:36'),
(117, 'Lampara led 50W-4000Lm', 3, '-', 'D', NULL, '2024-01-09 18:39:06', '2024-01-09 18:39:06'),
(118, 'Rodillo pelo corto', 14, '.', 'D', NULL, '2024-01-09 18:39:58', '2024-01-09 18:39:58'),
(119, 'Rodillo pelo largo', 14, '.', 'D', NULL, '2024-01-09 18:40:34', '2024-01-09 18:40:34'),
(120, 'Removedor gel', 2, '3 litro - 1 litro', 'A', NULL, '2024-01-09 18:41:07', '2024-01-10 10:43:46'),
(121, 'Esmalte sintético martillado para interiores Martilux', 1, '4 litros', 'D', NULL, '2024-01-09 18:45:05', '2024-01-09 18:45:05'),
(122, 'Masilla ', 2, '1 kg y otro de 4 kg', 'D', NULL, '2024-01-09 18:46:07', '2024-01-09 18:46:07'),
(123, 'netColor pintura piscinas al agua', 2, '4 litros', 'D', NULL, '2024-01-09 18:47:00', '2024-01-09 18:47:00'),
(124, 'Martilux verde esmeralda', 1, '4 litros', 'D', NULL, '2024-01-09 18:47:25', '2024-01-09 18:47:25'),
(125, 'Laca poliuretanica', 1, '4 Litros', 'D', NULL, '2024-01-09 18:48:18', '2024-01-09 18:48:18'),
(126, 'Revestimiento corrosivo ', 1, '1/2 litro', 'D', NULL, '2024-01-09 18:48:46', '2024-01-09 18:48:46'),
(127, 'Esmalte sintetico satinado blanco ', 1, '4 litro', 'D', NULL, '2024-01-09 18:50:34', '2024-01-09 18:50:34'),
(128, 'Pintura asfaltica', 1, '1 litro', 'D', NULL, '2024-01-09 18:50:52', '2024-01-09 18:50:52'),
(129, 'Recubrimiento de alto transito color natural', 1, '3,6 litros', 'D', NULL, '2024-01-09 18:56:27', '2024-01-09 18:56:27'),
(130, 'Masilla plastica', 1, '1 kg', 'D', NULL, '2024-01-09 18:56:54', '2024-01-09 18:56:54'),
(131, 'anticorrosivo epoxi marca: Continente ', 1, '4 litros', 'D', NULL, '2024-01-09 18:57:37', '2024-01-09 18:57:37'),
(132, 'Cemento de contacto', 1, '1/2 litro', 'D', NULL, '2024-01-09 18:58:40', '2024-01-09 18:58:40'),
(133, 'cetol clasico color cristal', 1, '2 litro', 'D', NULL, '2024-01-09 18:59:39', '2024-01-09 18:59:39'),
(134, 'cetol clasico color madera', 1, '4 litros', 'D', NULL, '2024-01-09 19:00:04', '2024-01-09 19:00:04'),
(135, 'recubrimiento de fibra de vidrio', 1, '1 litro', 'D', NULL, '2024-01-09 19:00:37', '2024-01-09 19:00:37'),
(136, 'bolsa de ramita plastica ', 1, '.', 'D', NULL, '2024-01-09 19:00:55', '2024-01-09 19:00:55'),
(137, 'bolsa de separador para tope', 1, '.', 'D', NULL, '2024-01-09 19:01:17', '2024-01-09 19:01:17'),
(138, 'Bolsa de arquitos para porselanato', 1, '.', 'D', NULL, '2024-01-09 19:02:09', '2024-01-09 19:02:09'),
(139, 'Circular lusatoff', 1, 'Funciona', 'B', NULL, '2024-01-09 19:22:01', '2024-01-09 19:22:01'),
(140, 'Circular dewalt', 1, 'Funciona', 'B', NULL, '2024-01-09 19:23:15', '2024-01-09 19:23:15'),
(141, 'Sierra circular 2200w', 1, 'Funciona', 'B', NULL, '2024-01-09 19:25:23', '2024-01-09 19:25:23'),
(142, 'Moladora grande ', 1, 'Funciona', 'B', 'Bosch', '2024-01-09 19:27:17', '2024-01-10 11:17:02'),
(143, 'Moladora chica ', 2, 'una tiene cristian', 'B', 'Bosch ', '2024-01-09 19:28:59', '2024-01-10 11:18:17'),
(144, 'Moladora chica ', 1, 'Funciona', 'B', 'Einhell', '2024-01-09 19:33:26', '2024-01-10 11:18:42'),
(145, 'Moladora chica', 1, 'Funciona', 'B', ' Omaha', '2024-01-09 19:40:49', '2024-01-10 11:25:14'),
(146, 'Cuter', 1, '.', 'D', NULL, '2024-01-09 19:43:02', '2024-01-09 19:43:02'),
(147, 'masilla ', 1, '4 litros', 'D', NULL, '2024-01-09 19:43:55', '2024-01-09 19:43:55'),
(148, 'pinza', 1, '.', 'D', NULL, '2024-01-09 19:46:17', '2024-01-09 19:46:17'),
(149, 'Cuerpo andamio', 14, '.', 'A', NULL, '2024-01-09 19:46:35', '2024-01-09 19:46:35'),
(150, 'Tablones chapa', 3, '.', 'A', NULL, '2024-01-09 19:46:56', '2024-01-09 19:46:56'),
(151, 'Removedor en gel', 1, '1 litro', 'D', NULL, '2024-01-09 19:47:45', '2024-01-09 19:47:45'),
(152, 'Pintura micropiso cementicio', 2, '12 kg entre los dos', 'D', 'Anclafloor', '2024-01-09 19:48:48', '2024-01-10 11:20:40'),
(153, 'Ablalatex interior mate', 1, '7 litros', 'D', NULL, '2024-01-09 19:50:06', '2024-01-09 19:50:06'),
(154, 'Sierra circular sensitiva ', 1, 'skill', 'B', NULL, '2024-01-09 19:50:36', '2024-01-09 19:50:36'),
(155, 'Anclafloor', 2, '12 kg entre los dos', 'D', NULL, '2024-01-10 10:45:22', '2024-01-10 10:45:22'),
(156, 'Pintura albalatex interior mate', 1, '7 litro', 'D', NULL, '2024-01-10 10:46:04', '2024-01-10 10:46:04'),
(157, 'Brikol protector de superficies ladrillos color decorativo', 1, '12 litros', 'D', NULL, '2024-01-10 10:46:49', '2024-01-10 10:46:49'),
(158, 'Tersuave revestimiento satinado', 1, '4 litros', 'D', NULL, '2024-01-10 10:47:16', '2024-01-10 10:47:16'),
(159, 'Lata de ligantex', 1, '10 kg', 'D', NULL, '2024-01-10 10:50:05', '2024-01-10 10:50:05'),
(160, 'Recubrimiento base para acrilicos texturizados', 1, '1/2 litros', 'D', NULL, '2024-01-10 10:50:51', '2024-01-10 10:50:51'),
(161, 'Insecticida para madera', 1, '9 litros', 'D', NULL, '2024-01-10 10:54:40', '2024-01-10 10:54:40'),
(162, 'Policemento liquido', 1, '30 kg', 'D', NULL, '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(163, 'Revestimiento plastico continuo', 1, '5,4kg', 'D', NULL, '2024-01-10 10:55:41', '2024-01-10 10:55:41'),
(164, 'Tersuave impermeabilizante ', 1, '.', 'D', NULL, '2024-01-10 10:56:16', '2024-01-10 10:56:16'),
(165, 'Tersuave pintura revestimiento para interiores', 1, '.', 'D', NULL, '2024-01-10 10:57:31', '2024-01-10 10:57:31'),
(166, 'Barniz', 1, 'Lata', 'D', '.', '2024-01-10 11:35:18', '2024-01-10 11:43:48'),
(167, 'Atornillador electrico', 1, 'Cuestionable', 'B', 'No se', '2024-01-10 12:43:36', '2024-01-10 12:43:36'),
(168, 'Rotomartillo con maletin', 1, 'Funciona', 'B', 'Lusqtoff', '2024-01-10 12:54:45', '2024-01-10 12:54:45'),
(169, 'Amoladora angular 180mm', 1, 'No funciona', 'C', 'Dewalt', '2024-01-10 13:00:11', '2024-01-10 13:00:11'),
(170, 'Taladro inalambrico 18v', 1, 'No funciona', 'C', 'Einhell', '2024-01-10 13:03:09', '2024-01-10 13:03:09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adelantos`
--
ALTER TABLE `adelantos`
  ADD PRIMARY KEY (`id_adelanto`),
  ADD KEY `id_personal` (`id_personal`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD KEY `id_personal` (`id_personal`);

--
-- Indices de la tabla `detallepersonalobras`
--
ALTER TABLE `detallepersonalobras`
  ADD PRIMARY KEY (`id_detalle_personal_obra`),
  ADD KEY `id_personal` (`id_personal`),
  ADD KEY `fk_obra` (`id_obra`);

--
-- Indices de la tabla `detalleproductosobras`
--
ALTER TABLE `detalleproductosobras`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_obra` (`id_obra`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `obrasencurso`
--
ALTER TABLE `obrasencurso`
  ADD PRIMARY KEY (`id_obra`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adelantos`
--
ALTER TABLE `adelantos`
  MODIFY `id_adelanto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id_asistencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallepersonalobras`
--
ALTER TABLE `detallepersonalobras`
  MODIFY `id_detalle_personal_obra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalleproductosobras`
--
ALTER TABLE `detalleproductosobras`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `obrasencurso`
--
ALTER TABLE `obrasencurso`
  MODIFY `id_obra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adelantos`
--
ALTER TABLE `adelantos`
  ADD CONSTRAINT `adelantos_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`);

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`);

--
-- Filtros para la tabla `detallepersonalobras`
--
ALTER TABLE `detallepersonalobras`
  ADD CONSTRAINT `fk_obra` FOREIGN KEY (`id_obra`) REFERENCES `obrasencurso` (`id_obra`),
  ADD CONSTRAINT `id_personal` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`);

--
-- Filtros para la tabla `detalleproductosobras`
--
ALTER TABLE `detalleproductosobras`
  ADD CONSTRAINT `id_obra` FOREIGN KEY (`id_obra`) REFERENCES `obrasencurso` (`id_obra`),
  ADD CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
