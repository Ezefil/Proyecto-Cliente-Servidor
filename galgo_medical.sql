-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2024 a las 06:56:25
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nom_137`
--

CREATE TABLE `nom_137` (
  `id_nom137` int(11) NOT NULL,
  `producto_medico` varchar(200) NOT NULL,
  `tipo_material` varchar(200) NOT NULL,
  `lote_identificacion` varchar(20) NOT NULL,
  `condiciones_almacenamiento` varchar(200) NOT NULL,
  `trazabilidad_metodo` varchar(200) NOT NULL,
  `etiquetas_verificadas` varchar(200) NOT NULL,
  `responsable_trazabilidad` varchar(200) NOT NULL,
  `comentarios` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nom_241`
--

CREATE TABLE `nom_241` (
  `id_nom241` int(11) NOT NULL,
  `proceso_fabricacion` varchar(200) NOT NULL,
  `procedimiento` varchar(200) NOT NULL,
  `requisitos_calidad` varchar(200) NOT NULL,
  `responsable_proceso` varchar(200) NOT NULL,
  `control_calidad` varchar(200) NOT NULL,
  `id_nom_17` int(11) NOT NULL,
  `fecha_revision` date NOT NULL,
  `observaciones` varchar(500) NOT NULL
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
  `nom_aplicable` varchar(10) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `incidencias_seguridad`
--
ALTER TABLE `incidencias_seguridad`
  ADD PRIMARY KEY (`id_incidencia`);

--
-- Indices de la tabla `nom_017`
--
ALTER TABLE `nom_017`
  ADD PRIMARY KEY (`id_nom017`);

--
-- Indices de la tabla `nom_137`
--
ALTER TABLE `nom_137`
  ADD PRIMARY KEY (`id_nom137`);

--
-- Indices de la tabla `nom_241`
--
ALTER TABLE `nom_241`
  ADD PRIMARY KEY (`id_nom241`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id_produccion`);

--
-- Indices de la tabla `productos_medicos`
--
ALTER TABLE `productos_medicos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_reporte`);

--
-- Indices de la tabla `scrap`
--
ALTER TABLE `scrap`
  ADD PRIMARY KEY (`id_scrap`);

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
  MODIFY `id_nom017` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
