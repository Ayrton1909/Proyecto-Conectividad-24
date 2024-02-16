-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-02-2024 a las 04:45:42
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
-- Base de datos: `conectividad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`Codigo`, `Nombre`) VALUES
(1, 'Piura'),
(2, 'Lambayeque'),
(3, 'La Libertad'),
(4, 'Ancash'),
(5, 'Lima'),
(6, 'Callao'),
(7, 'Ica'),
(8, 'Arequipa'),
(9, 'Moquegua'),
(10, 'Tacna'),
(11, 'Cajamarca'),
(12, 'Amazonas'),
(13, 'San Martin'),
(14, 'Junin'),
(15, 'Ayacucho'),
(16, 'Apurimac'),
(17, 'Huanuco'),
(18, 'Huancavelica'),
(19, 'Cerro de Pasco'),
(20, 'Cusco'),
(21, 'Puno'),
(22, 'Loreto'),
(23, 'Ucayali'),
(24, 'MadreDeDios'),
(26, 'Tumbes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `CodigoDetalle` int(11) NOT NULL,
  `CodigoVenta` int(11) DEFAULT NULL,
  `CodigoMaquinaria` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioUnitario` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`CodigoDetalle`, `CodigoVenta`, `CodigoMaquinaria`, `Cantidad`, `PrecioUnitario`) VALUES
(1, 1, 1, 1, 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinaria`
--

CREATE TABLE `maquinaria` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Peso` decimal(10,0) DEFAULT NULL,
  `Altura` decimal(10,0) DEFAULT NULL,
  `Precio` decimal(10,0) DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `CodigoDepartamento` int(11) DEFAULT NULL,
  `Foto` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `maquinaria`
--

INSERT INTO `maquinaria` (`Codigo`, `Nombre`, `Peso`, `Altura`, `Precio`, `Estado`, `Descripcion`, `CodigoDepartamento`, `Foto`) VALUES
(1, 'Tractor', 1001, 4, 200, 1, 'Tractor para construcciones en zonas deserticas', 2, ''),
(2, 'Grua', 2800, 5, 300, 0, 'Grua habilitada para el uso continuo', 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaTermino` date DEFAULT NULL,
  `CodigoMaquinaria` int(11) DEFAULT NULL,
  `CodigoDepartamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`Codigo`, `Nombre`, `Email`, `FechaInicio`, `FechaTermino`, `CodigoMaquinaria`, `CodigoDepartamento`) VALUES
(1, 'Fabricio Ruiz Muro', 'fmuro@unprg.edu.pe', '2024-02-01', '2024-06-01', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `CodigoVenta` int(11) NOT NULL,
  `FechaVenta` date DEFAULT NULL,
  `MontoTotal` decimal(10,0) DEFAULT NULL,
  `CodigoReserva` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`CodigoVenta`, `FechaVenta`, `MontoTotal`, `CodigoReserva`) VALUES
(1, '2024-01-30', 200, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`CodigoDetalle`),
  ADD KEY `fk_CodigoVenta` (`CodigoVenta`),
  ADD KEY `fk_CodigoMaquinaria` (`CodigoMaquinaria`);

--
-- Indices de la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `fk_CodigoDepartamento_Maquinaria` (`CodigoDepartamento`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `fk_CodigoMaquinaria_Reserva` (`CodigoMaquinaria`),
  ADD KEY `fk_CodigoDepartamento_Reserva` (`CodigoDepartamento`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`CodigoVenta`),
  ADD KEY `fk_CodigoReserva` (`CodigoReserva`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `CodigoDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `CodigoVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `fk_CodigoMaquinaria` FOREIGN KEY (`CodigoMaquinaria`) REFERENCES `maquinaria` (`Codigo`),
  ADD CONSTRAINT `fk_CodigoVenta` FOREIGN KEY (`CodigoVenta`) REFERENCES `venta` (`CodigoVenta`);

--
-- Filtros para la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  ADD CONSTRAINT `fk_CodigoDepartamento_Maquinaria` FOREIGN KEY (`CodigoDepartamento`) REFERENCES `departamento` (`Codigo`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_CodigoDepartamento_Reserva` FOREIGN KEY (`CodigoDepartamento`) REFERENCES `departamento` (`Codigo`),
  ADD CONSTRAINT `fk_CodigoMaquinaria_Reserva` FOREIGN KEY (`CodigoMaquinaria`) REFERENCES `maquinaria` (`Codigo`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_CodigoReserva` FOREIGN KEY (`CodigoReserva`) REFERENCES `reserva` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
