-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2024 a las 16:55:11
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
-- Base de datos: `galgo_medical`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias_seguridad`
--

CREATE TABLE `incidencias_seguridad` (
  `id_incidencia` int(11) NOT NULL,
  `fecha_incidencia` date NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_produccion` int(11) NOT NULL,
  `medidas_correctivas` varchar(200) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nom_017`
--

CREATE TABLE `nom_017` (
  `id_nom017` int(11) NOT NULL,
  `equipo_proteccion` varchar(200) NOT NULL,
  `uso_proteccion` varchar(200) NOT NULL,
  `mantenimiento_requerido` varchar(200) NOT NULL,
  `frecuencia_mantenimiento` varchar(200) NOT NULL,
  `condiciones_almacenamiento` varchar(200) NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  `comentarios` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nom_017`
--

INSERT INTO `nom_017` (`id_nom017`, `equipo_proteccion`, `uso_proteccion`, `mantenimiento_requerido`, `frecuencia_mantenimiento`, `condiciones_almacenamiento`, `fecha_actualizacion`, `comentarios`) VALUES
(1, 'Googles', 'Uso ocular', 'Limpieza con un paño suave y liquido para lentes.', 'Diario', 'Protegerlas de rayaduras o manchas.', '2024-11-25', ''),
(2, 'Careta', 'Protección de rostro', 'Limpieza con un paño suave y una solución de agua y jabón suave.', 'Mantenimiento diario', 'Almacenar en un lugar limpio y seco, protegiéndolo de la radiación solar directa, suciedad, humedad y agua.', '2024-11-26', ''),
(3, 'Cubreboca', 'Proteccion de nariz y boca', 'Solo es de un solo uso.', 'No lo requiere', 'Evitar el contacto con el polvo, luz y humedad.', '2024-11-26', ''),
(4, 'Guantes', 'Protege las manos', 'Limpieza con agua diluida con cloro.', 'Diariamente, después de cada uso.', 'Almacenar en un lugar limpio y seco, evitando el contacto con productos químicos corrosivos.', '2024-11-26', ''),
(5, 'Cofia', 'Protege la cabeza', 'Limpieza con agua y jabon.', 'Diario, despues de cada uso.', 'Almacenar en un cuarto limpio y seco, evitando el contacto con quimicos corrosivos.', '2024-11-26', ''),
(6, 'Overol', 'Protege todo el cuerpo de la persona.', 'Diario', 'Limpieza con agua diluida con cloro', 'Almacenar en un logar limpio y seco, evitando su exposición a objeto punzantes que puedan dañarlo.', '2024-11-26', ''),
(7, 'Bata', 'Protege el cuerpo', 'Limpieza con agua y con jabón.', 'Diariamente, después de su uso.', 'Almacenar en un cuarto limpio y seco.', '2024-11-26', ''),
(8, 'Cubrecalzado', 'Protege el calzado y los pies de la persona.', 'Limpieza con agua diluida con cloro.', 'Diariamente, después de su uso en cada jornada', 'Almacenar en un cuarto limpio y  seco.', '2024-11-26', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nom_137`
--

CREATE TABLE `nom_137` (
  `id_nom137` int(11) NOT NULL,
  `id_productomedico` int(11) NOT NULL,
  `tipo_material` varchar(200) NOT NULL,
  `lote_identificacion` varchar(20) NOT NULL,
  `condiciones_almacenamiento` varchar(200) NOT NULL,
  `trazabilidad_metodo` varchar(200) NOT NULL,
  `etiquetado_verificado` varchar(200) NOT NULL,
  `responsable_trazabilidad` varchar(200) NOT NULL,
  `comentarios` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nom_241`
--

CREATE TABLE `nom_241` (
  `id_nom241` int(11) NOT NULL,
  `id_productomedico` int(11) NOT NULL,
  `proceso_fabricacion` varchar(200) NOT NULL,
  `requisitos_Calidad` varchar(200) NOT NULL,
  `responsable_proceso` varchar(200) NOT NULL,
  `responsable_controlcalidad` varchar(200) NOT NULL,
  `fecha_revision` date NOT NULL,
  `observaciones` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `id_produccion` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_produccion` date NOT NULL,
  `cantidad_producida` int(100) NOT NULL,
  `cantidad_scrap` int(100) NOT NULL,
  `observaciones` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_medicos`
--

CREATE TABLE `productos_medicos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `clasificacion` varchar(10) NOT NULL,
  `fecha_creacion` varchar(10) NOT NULL,
  `observaciones` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_medicos`
--

INSERT INTO `productos_medicos` (`id_producto`, `nombre`, `descripcion`, `clasificacion`, `fecha_creacion`, `observaciones`) VALUES
(1, 'Lineas de transfusión', 'Este producto permite proporcionar fluidos al cuerpo humano, tanto para la transfiguran de sangre como también para la suministración de suero al paci', 'Cuarto lim', '2024-11-27', ''),
(2, 'Regulador mecánico para fluidos', 'Este producto se compone de cinco piezas; las cuales permiten regular el fluido tanto de la transfusión de sangre como la administración de suero por ', 'Cuarto lim', '2024-11-27', ''),
(3, 'Bolsas esterilizadas ', 'Estas bolsas esterilizadas contendrán el fluido, tanto de glóbulos rojos, medicamento en solución administrada junto con el suero. ', 'Cuarto lim', '2024-11-28', ''),
(4, 'Chip dispensador de medicamento', 'Este producto electrónico se ensambla mediante una tarjeta electrónica la cual va protegida por un case que a su vez va etiquetado para su identificac', 'Cuarto ant', '2024-11-28', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id_reporte` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `id_produccion` int(11) NOT NULL,
  `id_incidencia` int(11) NOT NULL,
  `contenido` varchar(200) NOT NULL,
  `conclusiones` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scrap`
--

CREATE TABLE `scrap` (
  `id_scrap` int(11) NOT NULL,
  `id_produccion` int(11) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `causa` varchar(200) NOT NULL,
  `fecha_registro` date NOT NULL,
  `acciones_correctivas` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `fecha_registro` date NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `rol`, `correo_electronico`, `fecha_registro`, `estado`) VALUES
(1, 'andres santiago', 'operador', 'andressantiago@gmail.com', '2024-11-26', 'Activo'),
(2, 'ezequiel', 'ingeniero', 'ezequiel@gmail.com', '2024-11-25', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `incidencias_seguridad`
--
ALTER TABLE `incidencias_seguridad`
  ADD PRIMARY KEY (`id_incidencia`),
  ADD KEY `id_produccion` (`id_produccion`);

--
-- Indices de la tabla `nom_017`
--
ALTER TABLE `nom_017`
  ADD PRIMARY KEY (`id_nom017`);

--
-- Indices de la tabla `nom_137`
--
ALTER TABLE `nom_137`
  ADD PRIMARY KEY (`id_nom137`),
  ADD KEY `id_productomedico` (`id_productomedico`);

--
-- Indices de la tabla `nom_241`
--
ALTER TABLE `nom_241`
  ADD PRIMARY KEY (`id_nom241`),
  ADD UNIQUE KEY `id_productomedico` (`id_productomedico`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id_produccion`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos_medicos`
--
ALTER TABLE `productos_medicos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `id_produccion` (`id_produccion`),
  ADD KEY `id_incidencia` (`id_incidencia`);

--
-- Indices de la tabla `scrap`
--
ALTER TABLE `scrap`
  ADD PRIMARY KEY (`id_scrap`),
  ADD KEY `id_produccion` (`id_produccion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `incidencias_seguridad`
--
ALTER TABLE `incidencias_seguridad`
  MODIFY `id_incidencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nom_017`
--
ALTER TABLE `nom_017`
  MODIFY `id_nom017` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `nom_137`
--
ALTER TABLE `nom_137`
  MODIFY `id_nom137` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nom_241`
--
ALTER TABLE `nom_241`
  MODIFY `id_nom241` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id_produccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_medicos`
--
ALTER TABLE `productos_medicos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `scrap`
--
ALTER TABLE `scrap`
  MODIFY `id_scrap` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidencias_seguridad`
--
ALTER TABLE `incidencias_seguridad`
  ADD CONSTRAINT `incidencias_seguridad_ibfk_1` FOREIGN KEY (`id_produccion`) REFERENCES `produccion` (`id_produccion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nom_137`
--
ALTER TABLE `nom_137`
  ADD CONSTRAINT `nom_137_ibfk_1` FOREIGN KEY (`id_productomedico`) REFERENCES `productos_medicos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nom_241`
--
ALTER TABLE `nom_241`
  ADD CONSTRAINT `nom_241_ibfk_1` FOREIGN KEY (`id_productomedico`) REFERENCES `productos_medicos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos_medicos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`id_produccion`) REFERENCES `produccion` (`id_produccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`id_incidencia`) REFERENCES `incidencias_seguridad` (`id_incidencia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `scrap`
--
ALTER TABLE `scrap`
  ADD CONSTRAINT `scrap_ibfk_1` FOREIGN KEY (`id_produccion`) REFERENCES `produccion` (`id_produccion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
