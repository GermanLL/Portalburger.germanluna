-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-08-2025 a las 16:21:02
-- Versión del servidor: 10.11.10-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u188377931_burger`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritos`
--

CREATE TABLE `carritos` (
  `idcarrito` int(10) UNSIGNED NOT NULL,
  `fk_idproducto` int(11) UNSIGNED NOT NULL,
  `fk_idcliente` int(11) UNSIGNED NOT NULL,
  `cantidad` decimal(11,0) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_productos`
--

CREATE TABLE `carrito_productos` (
  `idcarrito_producto` int(10) UNSIGNED NOT NULL,
  `fk_idproducto` int(11) UNSIGNED NOT NULL,
  `fk_idcarrito` int(11) UNSIGNED NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `nombre`) VALUES
(7, 'Bebidas'),
(8, 'Burger'),
(9, 'Combo'),
(10, 'Complementos'),
(11, 'Papas'),
(13, 'Promocion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT '',
  `direccion` varchar(100) DEFAULT NULL,
  `dni` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `clave` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nombre`, `telefono`, `direccion`, `dni`, `correo`, `clave`) VALUES
(4, 'Juan', '11111111', 'Salta', '1111111', 'correo@correo.com', '$2y$10$oLAZ8eHGY4Enb4PviltPj.xVURQYmzwnDqzZfeWP2A3QTgBOLSyJ.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idestado` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestado`, `nombre`) VALUES
(1, 'En preparacion'),
(2, 'En preparacion'),
(3, 'Entregado'),
(4, 'Cancelado'),
(5, 'Pendiente(pagado por MP)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedido` int(10) UNSIGNED NOT NULL,
  `fk_idcliente` int(11) UNSIGNED NOT NULL,
  `fk_idestado` int(11) UNSIGNED NOT NULL,
  `fk_idsucursal` int(11) UNSIGNED NOT NULL,
  `fecha` date DEFAULT NULL,
  `pago` varchar(50) DEFAULT NULL,
  `total` decimal(11,0) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idpedido`, `fk_idcliente`, `fk_idestado`, `fk_idsucursal`, `fecha`, `pago`, `total`) VALUES
(67, 4, 1, 3, '2025-08-08', 'efectivo', 27500),
(68, 4, 1, 2, '2025-08-09', 'efectivo', 25300),
(69, 4, 1, 4, '2025-08-09', 'efectivo', 35300),
(70, 4, 1, 3, '2025-08-09', 'efectivo', 12000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_productos`
--

CREATE TABLE `pedido_productos` (
  `idpedidoproducto` int(10) UNSIGNED NOT NULL,
  `fk_idproducto` int(11) UNSIGNED NOT NULL,
  `fk_idpedido` int(11) UNSIGNED NOT NULL,
  `total` decimal(20,6) DEFAULT 0.000000,
  `precio_unitario` decimal(20,6) DEFAULT 0.000000,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `pedido_productos`
--

INSERT INTO `pedido_productos` (`idpedidoproducto`, `fk_idproducto`, `fk_idpedido`, `total`, `precio_unitario`, `cantidad`) VALUES
(65, 26, 67, NULL, NULL, 1),
(66, 35, 67, NULL, NULL, 1),
(67, 40, 67, NULL, NULL, 1),
(68, 23, 68, NULL, NULL, 1),
(69, 35, 68, NULL, NULL, 1),
(70, 29, 68, NULL, NULL, 1),
(71, 34, 69, NULL, NULL, 1),
(72, 36, 69, NULL, NULL, 2),
(73, 23, 69, NULL, NULL, 1),
(74, 23, 70, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulaciones`
--

CREATE TABLE `postulaciones` (
  `idpostulacion` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `curriculum` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `postulaciones`
--

INSERT INTO `postulaciones` (`idpostulacion`, `nombre`, `apellido`, `celular`, `correo`, `curriculum`) VALUES
(2, 'carlos', 'monte', '111111', 'carlos@correo.com', NULL),
(3, 'juan', 'carlos', '111111', 'correo@correo.com', '2025080704082757.pdf'),
(4, 'juan', 'lopez', '11111', 'juan@mail.com', '2025080810084003.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `precio` decimal(11,0) UNSIGNED NOT NULL DEFAULT 0,
  `fk_idcategoria` int(10) UNSIGNED NOT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `cantidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `nombre`, `descripcion`, `precio`, `fk_idcategoria`, `imagen`, `cantidad`) VALUES
(20, 'Burger American', '120g carne con salsa, lechuga, tomate, cebolla morada, pepinillo y cheaddar', 14200, 8, '2025080503081334.png', '20'),
(23, 'Burger American Classic', 'Medallon con salsa clasica, lechuga, tomate, cebolla y cheddar.', 12000, 8, '2025080601080229.png', '20'),
(26, 'Burger Chicken', 'Pollo rebozado, lechuga, tomate y salsa magumbo.', 14200, 8, '2025080601082437.png', '20'),
(27, 'Burger Italiana', '120g carne con enmental, tomate, rucula, panceta y alioli.', 14000, 8, '2025080601080638.png', '20'),
(28, 'CAESAR SALAD', 'Lechuga, provolone rallado, pollo, tomate y salsa caesar.', 9000, 10, '2025080601081740.png', '20'),
(29, 'Coca Cola', '500cc', 3300, 7, '2025080601080741.png', '20'),
(30, 'Combo Junior', 'Combo', 13000, 9, '2025080902084633.png', '20'),
(31, 'Combo 1', 'Combo', 12500, 9, '2025080601083148.png', '20'),
(32, 'Combo 2', 'Combo', 12500, 9, '2025080902085729.png', '20'),
(33, 'Combo', 'Combo', 12500, 9, '2025080902084937.jpg', '20'),
(34, 'Fanta', '500cc', 3300, 7, '2025080601080051.png', '20'),
(35, 'Papas Delorean', 'Papas Simplot con carne, cebolla, alioli, pesto y cebolla morada', 10000, 11, '2025080601080252.png', '20'),
(36, 'Papas Magumbo', 'Papas Simplot con salsa Magumbo, cebolla morada, bacon y pesto.', 10000, 11, '2025080601084652.png', '20'),
(37, 'Porcion de papas', 'Porcion de papas Simplot.', 6800, 11, '2025080601084353.png', '20'),
(38, 'Promo', 'Promo Cheeseburger', 10800, 13, '2025080601081557.png', '20'),
(39, 'Quilmes', 'Lata 473 ml', 4500, 7, '2025080601080058.png', '20'),
(40, 'Sprite', '500cc', 3300, 7, '2025080902083747.png', '20'),
(41, 'Villavicencio', 'Agua S/Gas 500cc', 3300, 7, '2025080601080459.png', '20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `cuit` varchar(50) DEFAULT NULL,
  `fk_idrubro` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubros`
--

CREATE TABLE `rubros` (
  `idrubro` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_areas`
--

CREATE TABLE `sistema_areas` (
  `idarea` int(11) UNSIGNED NOT NULL,
  `ncarea` varchar(50) NOT NULL,
  `descarea` varchar(50) NOT NULL,
  `activo` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `sistema_areas`
--

INSERT INTO `sistema_areas` (`idarea`, `ncarea`, `descarea`, `activo`) VALUES
(1, 'SISTEMAS', 'Sistemas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_familias`
--

CREATE TABLE `sistema_familias` (
  `idfamilia` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `descripcion` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `sistema_familias`
--

INSERT INTO `sistema_familias` (`idfamilia`, `nombre`, `descripcion`) VALUES
(1, 'Administrador total', 'Administrador total'),
(2, 'Cliente', 'Cliente'),
(3, 'Administrador de la Empresa', 'Administrador de la Empresa'),
(4, 'Administrativo', 'Administrador Parcial'),
(5, 'Usuario', 'Usuario'),
(9, 'Administrador', 'administrador total'),
(10, 'admin', 'sdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_menues`
--

CREATE TABLE `sistema_menues` (
  `idmenu` int(11) UNSIGNED NOT NULL,
  `url` varchar(250) DEFAULT '',
  `orden` int(11) DEFAULT 0,
  `nombre` varchar(200) NOT NULL DEFAULT '0',
  `id_padre` int(11) DEFAULT 0,
  `fk_idpatente` int(11) DEFAULT NULL,
  `css` varchar(255) DEFAULT '0',
  `activo` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `sistema_menues`
--

INSERT INTO `sistema_menues` (`idmenu`, `url`, `orden`, `nombre`, `id_padre`, `fk_idpatente`, `css`, `activo`) VALUES
(7, '', 100, 'Sistema', 0, NULL, 'fa fa-lock fa-fw', 1),
(8, '/admin/grupos', 3, 'Áreas de trabajo', 7, NULL, '', 1),
(9, '/admin/usuarios', 1, 'Usuarios', 7, NULL, 'fas fa-users', 1),
(10, '/admin/permisos', 2, 'Permisos', 7, NULL, '', 1),
(85, '/admin/sistema/menu', 1, 'Menú', 7, NULL, '', 1),
(137, '/admin/patentes', 2, 'Patentes', 7, NULL, '', 1),
(140, '/admin/cliente/nuevo', 2, 'Nuevo cliente', 168, NULL, '', 1),
(158, '/admin', -1, 'Inicio', 0, NULL, 'fas fa-home', 1),
(168, NULL, 1, 'Clientes', 0, NULL, 'fas fa-user', 1),
(169, '/admin/clientes', 0, 'Listado de clientes', 168, NULL, '', 1),
(198, '/admin/productos', 1, 'Listado de Productos', 200, NULL, 'fas fa-hamburger', 1),
(200, '', 2, 'Productos', 0, NULL, 'fas fa-hamburger', 1),
(201, '/admin/producto/nuevo', 2, 'Nuevo producto', 200, NULL, 'fas fa-hamburger', 1),
(202, NULL, 3, 'Pedidos', 0, NULL, 'fas fa-shopping-cart', 1),
(203, '/admin/pedidos', 1, 'Listado de pedidos', 202, NULL, NULL, 1),
(204, NULL, 4, 'Postulaciones', 0, NULL, 'fas fa-user-plus', 1),
(206, '/admin/postulaciones', 1, 'Listado de postulaciones', 204, NULL, NULL, 1),
(208, NULL, 6, 'Sucursales', NULL, NULL, 'fas fa-store', 1),
(209, '/admin/sucursales', 1, 'Listado de sucursales', 208, NULL, NULL, 1),
(211, NULL, 7, 'Categorias', NULL, NULL, 'fa-solid fa-box-open', 1),
(212, '/admin/categorias', 1, 'Listado de categorias', 211, NULL, '', 1),
(213, '/admin/categoria/nuevo', 2, 'Nueva categoria', 211, NULL, NULL, 1),
(214, NULL, 8, 'Proveedores', NULL, NULL, 'fa-solid fa-truck', 1),
(215, NULL, 9, 'Rubros', NULL, NULL, NULL, 1),
(216, '/admin/proveedores', 1, 'Listado de proveedores', 214, NULL, NULL, 1),
(217, '/admin/proveedores/nuevo', 2, 'Nuevo proveedor', 214, NULL, NULL, 1),
(218, '/admin/rubros', 1, 'Listado de rubros', 215, NULL, NULL, 1),
(219, '/admin/rubro/nuevo', 2, 'Nuevo rubro', 215, NULL, NULL, 1),
(220, '/admin/pedido/nuevo', 2, 'Nuevo pedido', 202, NULL, NULL, 1),
(221, '/admin/postulacion/nuevo', 2, 'Nueva postulacion', 204, NULL, NULL, 1),
(222, '/admin/sucursal/nuevo', 2, 'Nueva sucursal', 208, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_menu_area`
--

CREATE TABLE `sistema_menu_area` (
  `fk_idmenu` int(11) UNSIGNED NOT NULL,
  `fk_idarea` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `sistema_menu_area`
--

INSERT INTO `sistema_menu_area` (`fk_idmenu`, `fk_idarea`) VALUES
(10, 1),
(8, 1),
(17, 1),
(85, 1),
(9, 1),
(137, 1),
(140, 1),
(147, 1),
(157, 1),
(7, 1),
(158, 1),
(168, 1),
(169, 1),
(177, 1),
(200, 1),
(198, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(206, 1),
(208, 1),
(209, 1),
(211, 1),
(210, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_patentes`
--

CREATE TABLE `sistema_patentes` (
  `idpatente` int(11) UNSIGNED NOT NULL,
  `tipo` varchar(50) NOT NULL DEFAULT '',
  `submodulo` varchar(50) NOT NULL DEFAULT '',
  `nombre` varchar(50) DEFAULT '',
  `modulo` varchar(50) DEFAULT '',
  `log_operacion` smallint(6) NOT NULL DEFAULT 0,
  `descripcion` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `sistema_patentes`
--

INSERT INTO `sistema_patentes` (`idpatente`, `tipo`, `submodulo`, `nombre`, `modulo`, `log_operacion`, `descripcion`) VALUES
(1, 'CONSULTA', 'Permisos', 'PERMISOSCONSULTA', 'Sistema', 1, 'Consulta de permisos'),
(2, 'ALTA', 'Permisos', 'PERMISOSALTA', 'Sistema', 1, 'Alta de familia'),
(3, 'EDITAR', 'Permisos', 'PERMISOSMODIFICACION', 'Sistema', 1, 'Modificación de familia de permisos'),
(4, 'BAJA', 'Permisos', 'PERMISOSBAJA', 'Sistema', 1, 'Baja de familia de permisos'),
(5, 'BAJA', 'Grupo de usuarios', 'GRUPOBAJA', 'Sistema', 1, 'Baja de grupo de usuarios'),
(6, 'CONSULTA', 'Grupo de usuarios', 'GRUPOCONSULTA', 'Sistema', 1, 'Consulta de grupo de usuarios'),
(7, 'EDITAR', 'Grupo de usuarios', 'GRUPOMODIFICACION', 'Sistema', 1, 'Modificación de grupos de usuarios'),
(8, 'ALTA', 'Grupo de usuarios', 'GRUPOALTA', 'Sistema', 1, 'Alta de grupos de usuarios'),
(9, 'EDITAR', 'Usuario', 'USUARIOASIGNARGRUPO', 'Sistema', 1, 'Agrega grupos a un usuario'),
(10, 'ALTA', 'Usuario', 'USUARIOALTA', 'Sistema', 1, 'Nuevo usuario'),
(11, 'BAJA', 'Usuario', 'USUARIOELIMINAR', 'Sistema', 1, 'Eliminar usuario'),
(12, 'EDITAR', 'Usuario', 'USUARIOMODIFICAR', 'Sistema', 1, 'Modificar usuario'),
(13, 'EDITAR', 'Usuario', 'USUARIOAGREGARPERMISO', 'Sistema', 1, 'Agrega permisos dentro de la pantalla del usuario'),
(14, 'BAJA', 'Usuario', 'USUARIOELIMINARPERMISO', 'Sistema', 1, 'Eliminar un permiso del usuario'),
(15, 'CONSULTA', 'Usuario', 'USUARIOGRUPOGRILLA', 'Sistema', 1, 'Muestra la grilla de grupos de un usuario'),
(16, 'EDITAR', 'Usuario', 'USUARIOGRUPOAGREGAR', 'Sistema', 1, 'Agrega un grupo para el usuario'),
(17, 'BAJA', 'Usuario', 'USUARIOGRUPOELIMINAR', 'Sistema', 1, 'Elimina un grupo del usuario'),
(18, 'EDITAR', 'Permisos', 'PERMISOSAGREGARPATENTE', 'Sistema', 1, 'Agrega patente a un permiso'),
(19, 'BAJA', 'Permisos', 'PERMISOSELIMINARPATENTE', 'Sistema', 1, 'Elimina patente a un permiso'),
(20, 'CONSULTA', 'Usuaurio', 'USUARIOCONSULTA', 'Sistema', 1, 'Consulta la lista de usuarios'),
(30, 'EDITAR', 'Persona', 'PERSONAMODIFICACION', 'Panel de control ', 1, 'Modificar  una persona'),
(31, 'ALTA', 'Persona', 'PERSONAALTA', 'Panel de control', 1, 'Agrega una nueva persona'),
(32, 'CONSULTA', 'Persona', 'PERSONACONSULTA', 'Panel de control', 1, 'Listado de Personas'),
(70, 'CONSULTA', 'Menu', 'MENUCONSULTA', 'Sistema', 1, 'Listado del menu del sistema'),
(71, 'ALTA', 'Menu', 'MENUALTA', 'Sistema', 1, 'Agrega un nuevo elemento de menu'),
(72, 'EDITAR', 'Menu', 'MENUMODIFICACION', 'Sistema', 1, 'Modifica un elemento de menu'),
(73, 'BAJA', 'Menu', 'MENUELIMINAR', 'SIstema', 1, 'Elimina un elemento de menu'),
(74, 'CONSULTA', 'Sistema', 'SIMULARALUMNO', 'Sistema', 1, 'Permite al administrador simular el login como alu'),
(77, 'EDITAR', 'Tipo de cliente', 'TIPOCLIENTEMODIFICACIONES', 'Cliente', 1, 'Modificaciones tipo cliente'),
(78, 'CONSULTA', 'Tipo de cliente', 'TIPOCLIENTECONSULTA', 'Cliente', 1, 'Consulta tipo de cliente'),
(79, 'ALTA', 'Tipo de cliente', 'TIPOCLIENTEALTA', 'Cliente', 1, 'Altas de tipos de clientes'),
(82, 'BAJA', 'Tipo de cliente', 'BAJATIPODECLIENTE', 'Cliente', 1, 'Bajas de tipos de clientes'),
(91, 'ALTA', 'Nuevo cliente', 'CLIENTEALTA', 'Clientes', 0, 'Alta de nuevos clientes'),
(92, 'EDITAR', 'Nuevo cliente', 'CLIENTEEDITAR', 'Clientes', 0, 'Editar clientes'),
(93, 'BAJA', 'Nuevo cliente', 'CLIENTEELIMINAR', 'Clientes', 0, 'Eliminar clientes'),
(94, 'CONSULTA', 'Listado de Clientes', 'CLIENTECONSULTA', 'Clientes', 0, 'Consulta de listado de clientes'),
(99, 'ALTA', 'Productos', 'PRODUCTOSALTA', 'Productos', 1, 'Alta de productos'),
(100, 'BAJA', 'Productos', 'PRODUCTOELIMINAR', 'Productos', 1, 'Baja de productos'),
(101, 'EDITAR', 'Productos', 'PRODUCTOEDITAR', 'Productos', 1, 'Editar productos'),
(102, 'CONSULTA', 'Productos', 'PRODUCTOCONSULTA', 'Productos', 1, 'Consulta de productos'),
(143, 'CONSULTA', 'sucursales', 'SUCURSALCONSULTA', 'sucursales', 0, 'Consulta de sucursales'),
(144, 'ALTA', 'sucursales', 'SUCURSALALTA', 'sucursales', 0, 'Alta de sucursales'),
(145, 'BAJA', 'sucursales ', 'SUCURSALBAJA', 'sucursales', 0, 'baja de sucursales'),
(148, 'EDITAR', 'sucursales', 'SUCURSALEDITAR', 'sucursales', 1, 'Modificacion de sucursal'),
(153, 'CONSULTA', 'Inscripcion', 'INSCRIPCIONCONSULTA', 'Inscripcion', 1, 'Consulta de inscripciones'),
(154, 'ALTA', 'Inscripcion', 'INSCRIPCIONALTA', 'Inscripcion', 1, 'Alta de inscripciones'),
(155, 'EDITAR', 'Inscripcion', 'INSCRIPCIONMODIFICACION', 'Inscripcion', 1, 'Modificacion de inscripciones'),
(158, 'BAJA', 'Permisos', 'INSCRIPCIONBAJA', 'Sistema', 1, 'Baja de inscripciones'),
(176, 'ALTA', 'Patentes', 'PATENTESALTA', 'Patentes', 0, 'Registra nuevas patentes'),
(177, 'BAJA', 'Patentes', 'PATENTESBAJA', 'Patentes', 0, 'Da de baja patentes'),
(178, 'EDITAR', 'Patentes', 'PATENTESMODIFICACION', 'Patentes', 0, 'Modifica patentes existentes'),
(179, 'CONSULTA', 'Patentes', 'PATENTESCONSULTA', 'Patentes', 0, 'Consulta patentes'),
(181, 'CONSULTA', 'Pedido', 'PEDIDOCONSULTA', 'Pedido', 1, 'Permite listar los pedidos'),
(184, 'Eliminar', 'Listar categorias', 'CATEGORIAELIMINAR', 'Categorias', 0, 'Elimina una categoria'),
(185, 'CONSULTA', 'Listar consultas', 'CONSULTACONSULTA', 'Consultas', 1, 'Consultar las consultas'),
(186, 'ALTA', 'Nueva consulta', 'CONSULTAALTA', 'Consultas', 1, 'Alta de categorias'),
(187, 'BAJA', 'Listar consultas', 'CONSULTAELIMINAR', 'Consultas', 1, 'Elimina una consulta'),
(188, 'EDITAR', 'Listar consultas', 'CONSULTAMODIFICACION', 'Consultas', 1, 'Modifica una consulta'),
(209, 'ALTA', 'Patentes', 'PATENTEALTA', 'Patentes', 0, 'Permite ingresar una nueva patente'),
(214, 'ALTA', 'Pedido', 'PEDIDOALTA', 'Pedido', 1, 'permite ingresar un nuevo pedido'),
(215, 'EDITAR', 'Pedido', 'PEDIDOEDITAR', 'Pedido', 1, 'permite editar un pedido existente'),
(216, 'BAJA', 'Pedido', 'PEDIDOBAJA', 'Pedido', 1, 'permite eliminar un pedido'),
(221, 'ALTA', 'Postulacion', 'POSTULANTEALTA', 'Postulacion', 1, 'permite agregar un nuevo postulante'),
(222, 'CONSULTA', 'Postulacion', 'POSTULANTECONSULTA', 'Postulacion', 1, 'permite modificar un nuevo postulante'),
(223, 'EDITAR', 'Postulacion', 'POSTULANTEEDITAR', 'Postulacion', 1, 'permite modificar un nuevo postulante'),
(224, 'BAJA', 'Postulacion', 'POSTULANTEBAJA', 'Postulacion', 1, 'permite dar de baja un postulante'),
(225, 'CONSULTA', 'Pedido', 'PEDIDOVER', 'Pedido', 1, 'Permite ver por pedido'),
(227, 'ALTA', 'Categorias', 'CATEGORIAALTA', 'Categorias', 0, 'Dar de alta nueva categoría'),
(228, 'CONSULTA', 'Categorias', 'CATEGORIACONSULTA', 'Categorias', 0, 'Dar consulta de categoría'),
(229, 'CONSULTA', 'Proveedores', 'PROVEEDORCONSULTA', 'Proveedores', 0, 'Ver consulta de proveedor'),
(230, 'EDITAR', 'Proveedores', 'PROVEEDOREDITAR', 'Proveedores', 0, 'Ver consulta de proveedor'),
(231, 'CONSULTA', 'Rubros', 'RUBROCONSULTA', 'Rubros', 0, 'Ver consulta de rubro'),
(232, 'ALTA', 'Rubros', 'RUBROALTA', 'Rubros', 0, 'Ver alta de rubro'),
(233, 'ALTA', 'Rubros', 'RUBROALTA', 'Rubros', 0, 'Ver alta de rubro'),
(234, 'EDITAR', 'Categorias', 'CATEGORIAEDITAR', 'Categorias', 0, 'se puede editar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_patente_familia`
--

CREATE TABLE `sistema_patente_familia` (
  `fk_idpatente` int(11) UNSIGNED NOT NULL,
  `fk_idfamilia` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `sistema_patente_familia`
--

INSERT INTO `sistema_patente_familia` (`fk_idpatente`, `fk_idfamilia`) VALUES
(10, 5),
(12, 5),
(10, 3),
(12, 3),
(128, 7),
(129, 7),
(130, 7),
(131, 7),
(10, 4),
(11, 4),
(12, 4),
(20, 4),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9),
(6, 9),
(7, 9),
(8, 9),
(9, 9),
(10, 9),
(11, 9),
(12, 9),
(13, 9),
(14, 9),
(15, 9),
(16, 9),
(17, 9),
(18, 9),
(19, 9),
(20, 9),
(176, 9),
(177, 9),
(178, 9),
(179, 9),
(209, 9),
(18, 10),
(19, 10),
(176, 10),
(177, 10),
(178, 10),
(179, 10),
(209, 10),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(143, 1),
(144, 1),
(145, 1),
(148, 1),
(153, 1),
(154, 1),
(155, 1),
(158, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(181, 1),
(184, 1),
(185, 1),
(186, 1),
(209, 1),
(214, 1),
(215, 1),
(216, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_usuarios`
--

CREATE TABLE `sistema_usuarios` (
  `idusuario` int(11) UNSIGNED NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `clave` varchar(250) NOT NULL,
  `ultimo_ingreso` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token` varchar(50) NOT NULL DEFAULT 'current_timestamp()',
  `root` smallint(6) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `cantidad_bloqueo` int(11) DEFAULT NULL,
  `areapredeterminada` smallint(6) DEFAULT NULL,
  `activo` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `sistema_usuarios`
--

INSERT INTO `sistema_usuarios` (`idusuario`, `usuario`, `nombre`, `apellido`, `mail`, `clave`, `ultimo_ingreso`, `token`, `root`, `created_at`, `cantidad_bloqueo`, `areapredeterminada`, `activo`) VALUES
(1, 'admin', 'Administrador', '', 'admin@correo.com', '$2y$10$FeFXjlupKImULPF.aVRNueCALrpj55n.fotONLQ1QY3YvlYTelRP2', '2025-08-09 14:47:57', 'current_timestamp()', 1, '2021-09-17 16:05:57', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_usuario_familia`
--

CREATE TABLE `sistema_usuario_familia` (
  `fk_idusuario` int(11) UNSIGNED NOT NULL,
  `fk_idfamilia` int(11) UNSIGNED NOT NULL,
  `fk_idarea` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `sistema_usuario_familia`
--

INSERT INTO `sistema_usuario_familia` (`fk_idusuario`, `fk_idfamilia`, `fk_idarea`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `idsucursal` int(10) UNSIGNED NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `mapa` varchar(50) DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`idsucursal`, `telefono`, `nombre`, `mapa`, `horario`, `direccion`) VALUES
(1, '+34659632514', 'Sevilla', 'https://maps.app.goo.gl/Ai3xNs2YU8jrBpCy8', '01:00:00', 'Calle de la Zorra.'),
(2, '+34659242533', 'Madrid', 'https://maps.app.goo.gl/LTpRbbEaEJpitoJT7', '01:00:00', 'Calle Velázquez, 39.'),
(3, '+34659632529', 'Cordoba', 'https://maps.app.goo.gl/aSkzypMux6AqGJ3U8', '01:00:00', '14007, C. Sagunto, 27.'),
(4, '+34659242537', 'Alicante', 'https://maps.app.goo.gl/thWfTkw6RhAcAiXq5', '01:00:00', 'C. Pinoso, 17.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD PRIMARY KEY (`idcarrito`) USING BTREE,
  ADD KEY `FK_carritos_productos` (`fk_idproducto`) USING BTREE,
  ADD KEY `FK_carritos_clientes` (`fk_idcliente`) USING BTREE;

--
-- Indices de la tabla `carrito_productos`
--
ALTER TABLE `carrito_productos`
  ADD PRIMARY KEY (`idcarrito_producto`) USING BTREE,
  ADD KEY `FK_carrito_produtos_carritos` (`fk_idcarrito`),
  ADD KEY `FK_carrito_produtos_productos` (`fk_idproducto`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`) USING BTREE;

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`) USING BTREE,
  ADD UNIQUE KEY `correo` (`correo`) USING BTREE;

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idestado`) USING BTREE;

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedido`) USING BTREE,
  ADD KEY `FK_pedidos_clientes` (`fk_idcliente`),
  ADD KEY `FK_pedidos_estados` (`fk_idestado`),
  ADD KEY `FK_pedidos_sucursales` (`fk_idsucursal`);

--
-- Indices de la tabla `pedido_productos`
--
ALTER TABLE `pedido_productos`
  ADD PRIMARY KEY (`idpedidoproducto`) USING BTREE,
  ADD KEY `FK_pedido_productos_productos` (`fk_idproducto`),
  ADD KEY `FK_pedido_productos_pedidos` (`fk_idpedido`);

--
-- Indices de la tabla `postulaciones`
--
ALTER TABLE `postulaciones`
  ADD PRIMARY KEY (`idpostulacion`) USING BTREE,
  ADD UNIQUE KEY `correo` (`correo`) USING BTREE;

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`) USING BTREE,
  ADD KEY `FK_productos_categorias` (`fk_idcategoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`) USING BTREE,
  ADD KEY `FK_proveedores_rubros` (`fk_idrubro`);

--
-- Indices de la tabla `rubros`
--
ALTER TABLE `rubros`
  ADD PRIMARY KEY (`idrubro`) USING BTREE;

--
-- Indices de la tabla `sistema_areas`
--
ALTER TABLE `sistema_areas`
  ADD PRIMARY KEY (`idarea`) USING BTREE;

--
-- Indices de la tabla `sistema_familias`
--
ALTER TABLE `sistema_familias`
  ADD PRIMARY KEY (`idfamilia`) USING BTREE;

--
-- Indices de la tabla `sistema_menues`
--
ALTER TABLE `sistema_menues`
  ADD PRIMARY KEY (`idmenu`) USING BTREE;

--
-- Indices de la tabla `sistema_menu_area`
--
ALTER TABLE `sistema_menu_area`
  ADD KEY `fk_idmenu` (`fk_idmenu`) USING BTREE,
  ADD KEY `fk_idarea` (`fk_idarea`) USING BTREE;

--
-- Indices de la tabla `sistema_patentes`
--
ALTER TABLE `sistema_patentes`
  ADD PRIMARY KEY (`idpatente`) USING BTREE;

--
-- Indices de la tabla `sistema_patente_familia`
--
ALTER TABLE `sistema_patente_familia`
  ADD KEY `fk_idpatente` (`fk_idpatente`) USING BTREE,
  ADD KEY `fk_idfamilia` (`fk_idfamilia`) USING BTREE;

--
-- Indices de la tabla `sistema_usuarios`
--
ALTER TABLE `sistema_usuarios`
  ADD PRIMARY KEY (`idusuario`) USING BTREE,
  ADD UNIQUE KEY `usuario` (`usuario`) USING BTREE,
  ADD UNIQUE KEY `email` (`mail`) USING BTREE;

--
-- Indices de la tabla `sistema_usuario_familia`
--
ALTER TABLE `sistema_usuario_familia`
  ADD KEY `fk_idusuario` (`fk_idusuario`) USING BTREE,
  ADD KEY `fk_idfamilia` (`fk_idfamilia`) USING BTREE,
  ADD KEY `fk_idarea` (`fk_idarea`) USING BTREE;

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`idsucursal`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carritos`
--
ALTER TABLE `carritos`
  MODIFY `idcarrito` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `carrito_productos`
--
ALTER TABLE `carrito_productos`
  MODIFY `idcarrito_producto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idestado` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idpedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `pedido_productos`
--
ALTER TABLE `pedido_productos`
  MODIFY `idpedidoproducto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `postulaciones`
--
ALTER TABLE `postulaciones`
  MODIFY `idpostulacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rubros`
--
ALTER TABLE `rubros`
  MODIFY `idrubro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sistema_areas`
--
ALTER TABLE `sistema_areas`
  MODIFY `idarea` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sistema_familias`
--
ALTER TABLE `sistema_familias`
  MODIFY `idfamilia` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sistema_menues`
--
ALTER TABLE `sistema_menues`
  MODIFY `idmenu` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT de la tabla `sistema_patentes`
--
ALTER TABLE `sistema_patentes`
  MODIFY `idpatente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT de la tabla `sistema_usuarios`
--
ALTER TABLE `sistema_usuarios`
  MODIFY `idusuario` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `idsucursal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD CONSTRAINT `FK_carritos_clientes` FOREIGN KEY (`fk_idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `FK_carritos_productos` FOREIGN KEY (`fk_idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `carrito_productos`
--
ALTER TABLE `carrito_productos`
  ADD CONSTRAINT `FK_carrito_produtos_carritos` FOREIGN KEY (`fk_idcarrito`) REFERENCES `carritos` (`idcarrito`),
  ADD CONSTRAINT `FK_carrito_produtos_productos` FOREIGN KEY (`fk_idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK_pedidos_clientes` FOREIGN KEY (`fk_idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `FK_pedidos_estados` FOREIGN KEY (`fk_idestado`) REFERENCES `estados` (`idestado`),
  ADD CONSTRAINT `FK_pedidos_sucursales` FOREIGN KEY (`fk_idsucursal`) REFERENCES `sucursales` (`idsucursal`);

--
-- Filtros para la tabla `pedido_productos`
--
ALTER TABLE `pedido_productos`
  ADD CONSTRAINT `FK_pedido_productos_pedidos` FOREIGN KEY (`fk_idpedido`) REFERENCES `pedidos` (`idpedido`),
  ADD CONSTRAINT `FK_pedido_productos_productos` FOREIGN KEY (`fk_idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_productos_categorias` FOREIGN KEY (`fk_idcategoria`) REFERENCES `categorias` (`idcategoria`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `FK_proveedores_rubros` FOREIGN KEY (`fk_idrubro`) REFERENCES `rubros` (`idrubro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
