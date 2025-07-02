/*
Navicat MySQL Data Transfer

Source Server         : conex 3306
Source Server Version : 80300
Source Host           : 127.0.0.1:3306
Source Database       : trabajo_sistema_apafav3

Target Server Type    : MYSQL
Target Server Version : 80300
File Encoding         : 65001

Date: 2025-06-26 10:24:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aporte
-- ----------------------------
DROP TABLE IF EXISTS `aporte`;
CREATE TABLE `aporte` (
  `id_aporte` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `monto` decimal(10,0) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `multiplicar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_aporte`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aporte
-- ----------------------------
INSERT INTO `aporte` VALUES ('10', 'PENSION ENERO', '***', '100', '2025-06-27 00:00:00', 'on');
INSERT INTO `aporte` VALUES ('11', 'PENSION FEBRERO', '****', '150', '2025-06-28 00:00:00', 'on');
INSERT INTO `aporte` VALUES ('12', 'PENSION MARZO', '****', '200', '2025-06-29 00:00:00', 'on');
INSERT INTO `aporte` VALUES ('13', 'PENSION MAYO', '*********', '250', '2025-06-28 00:00:00', 'on');

-- ----------------------------
-- Table structure for aporte_padres
-- ----------------------------
DROP TABLE IF EXISTS `aporte_padres`;
CREATE TABLE `aporte_padres` (
  `id_aporte_padres` int NOT NULL AUTO_INCREMENT,
  `id_aporte` int DEFAULT NULL,
  `id_padre_familia` int DEFAULT NULL,
  `monto_aporte` decimal(10,0) DEFAULT NULL,
  `monto_aportado` decimal(10,0) DEFAULT NULL,
  `debe` decimal(10,0) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_aporte_padres`),
  KEY `aporte_id_aporte` (`id_aporte`),
  KEY `aporte_id_padre_familia` (`id_padre_familia`),
  CONSTRAINT `aporte_id_aporte` FOREIGN KEY (`id_aporte`) REFERENCES `aporte` (`id_aporte`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aporte_id_padre_familia` FOREIGN KEY (`id_padre_familia`) REFERENCES `padre_familia` (`id_padre_familia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aporte_padres
-- ----------------------------
INSERT INTO `aporte_padres` VALUES ('138', '10', '2608', '100', '0', '100', null);
INSERT INTO `aporte_padres` VALUES ('139', '10', '2609', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('140', '10', '2610', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('141', '10', '2611', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('142', '10', '2612', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('143', '10', '2613', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('144', '10', '2614', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('145', '10', '2615', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('146', '10', '2616', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('147', '10', '2617', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('148', '10', '2618', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('149', '10', '2619', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('150', '10', '2620', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('151', '10', '2621', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('152', '10', '2622', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('153', '10', '2623', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('154', '10', '2624', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('155', '10', '2625', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('156', '10', '2626', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('157', '10', '2627', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('158', '10', '2628', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('159', '10', '2629', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('160', '10', '2630', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('161', '10', '2631', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('162', '10', '2632', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('163', '10', '2633', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('164', '10', '2634', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('165', '10', '2635', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('166', '10', '2636', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('167', '10', '2637', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('168', '10', '2638', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('169', '10', '2639', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('170', '10', '2640', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('171', '10', '2641', '100', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('172', '11', '2608', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('173', '11', '2609', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('174', '11', '2610', '300', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('175', '11', '2611', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('176', '11', '2612', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('177', '11', '2613', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('178', '11', '2614', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('179', '11', '2615', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('180', '11', '2616', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('181', '11', '2617', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('182', '11', '2618', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('183', '11', '2619', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('184', '11', '2620', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('185', '11', '2621', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('186', '11', '2622', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('187', '11', '2623', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('188', '11', '2624', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('189', '11', '2625', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('190', '11', '2626', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('191', '11', '2627', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('192', '11', '2628', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('193', '11', '2629', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('194', '11', '2630', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('195', '11', '2631', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('196', '11', '2632', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('197', '11', '2633', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('198', '11', '2634', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('199', '11', '2635', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('200', '11', '2636', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('201', '11', '2637', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('202', '11', '2638', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('203', '11', '2639', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('204', '11', '2640', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('205', '11', '2641', '150', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('206', '12', '2608', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('207', '12', '2609', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('208', '12', '2610', '400', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('209', '12', '2611', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('210', '12', '2612', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('211', '12', '2613', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('212', '12', '2614', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('213', '12', '2615', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('214', '12', '2616', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('215', '12', '2617', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('216', '12', '2618', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('217', '12', '2619', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('218', '12', '2620', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('219', '12', '2621', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('220', '12', '2622', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('221', '12', '2623', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('222', '12', '2624', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('223', '12', '2625', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('224', '12', '2626', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('225', '12', '2627', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('226', '12', '2628', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('227', '12', '2629', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('228', '12', '2630', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('229', '12', '2631', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('230', '12', '2632', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('231', '12', '2633', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('232', '12', '2634', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('233', '12', '2635', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('234', '12', '2636', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('235', '12', '2637', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('236', '12', '2638', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('237', '12', '2639', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('238', '12', '2640', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('239', '12', '2641', '200', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('240', '13', '2608', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('241', '13', '2609', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('242', '13', '2610', '500', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('243', '13', '2611', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('244', '13', '2612', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('245', '13', '2613', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('246', '13', '2614', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('247', '13', '2615', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('248', '13', '2616', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('249', '13', '2617', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('250', '13', '2618', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('251', '13', '2619', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('252', '13', '2620', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('253', '13', '2621', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('254', '13', '2622', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('255', '13', '2623', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('256', '13', '2624', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('257', '13', '2625', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('258', '13', '2626', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('259', '13', '2627', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('260', '13', '2628', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('261', '13', '2629', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('262', '13', '2630', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('263', '13', '2631', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('264', '13', '2632', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('265', '13', '2633', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('266', '13', '2634', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('267', '13', '2635', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('268', '13', '2636', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('269', '13', '2637', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('270', '13', '2638', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('271', '13', '2639', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('272', '13', '2640', '250', '0', null, null);
INSERT INTO `aporte_padres` VALUES ('273', '13', '2641', '250', '0', null, null);

-- ----------------------------
-- Table structure for cargo
-- ----------------------------
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cargo
-- ----------------------------
INSERT INTO `cargo` VALUES ('1', 'PADRE DE FAMILIA');
INSERT INTO `cargo` VALUES ('2', 'PRESIDENTE DE APAFA');
INSERT INTO `cargo` VALUES ('3', 'TESORERO(A)');
INSERT INTO `cargo` VALUES ('4', 'SECRETARIO(A)');

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `cod_modular` varchar(20) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `foto_institucion` varchar(100) DEFAULT NULL,
  `foto_ugel` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES ('1', 'I.E. NERY GARCIA ZARATE', '0574319', 'ANCHIHUAY - LA MAR', '987456321', 'NERYGARCIAZARATE@GMAIL.COM', 'logo-sfco.png', 'logougel-logo ugel.jpg');

-- ----------------------------
-- Table structure for estado_reunion
-- ----------------------------
DROP TABLE IF EXISTS `estado_reunion`;
CREATE TABLE `estado_reunion` (
  `id_estado_reunion` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estado_reunion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estado_reunion
-- ----------------------------
INSERT INTO `estado_reunion` VALUES ('1', 'ACTIVO');
INSERT INTO `estado_reunion` VALUES ('2', 'CULMINADO');

-- ----------------------------
-- Table structure for estudiante
-- ----------------------------
DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE `estudiante` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `id_padre_familia` int DEFAULT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `ape_pat` varchar(255) DEFAULT NULL,
  `ape_mat` varchar(255) DEFAULT NULL,
  `nivel` varchar(255) DEFAULT NULL,
  `grado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `fk_estudiante_padreFamilia` (`id_padre_familia`),
  CONSTRAINT `fk_estudiante_padreFamilia` FOREIGN KEY (`id_padre_familia`) REFERENCES `padre_familia` (`id_padre_familia`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estudiante
-- ----------------------------
INSERT INTO `estudiante` VALUES ('1', '2608', '78945612', 'luis', 'perez', 'perez', 'Primaria', '5° B');
INSERT INTO `estudiante` VALUES ('3', '2610', '78945618', 'ISMAEL', 'PEREZ', 'COSACANI', 'Primaria', '1° U');
INSERT INTO `estudiante` VALUES ('4', '2609', '49500221', 'YUDY TERESA', 'COSTA', 'ILASACA', null, null);
INSERT INTO `estudiante` VALUES ('5', '2610', '49500225', 'FRANCISCO BRAULIO', 'RIVERA', 'CALCINA', 'Secundaria', '1° U');
INSERT INTO `estudiante` VALUES ('6', '2611', '49500229', 'JUAN', 'ACROTA', 'MANGO', null, null);
INSERT INTO `estudiante` VALUES ('7', '2612', '49500233', 'PATRICIA MARIA', 'RIVERA', 'CONDORI', null, null);
INSERT INTO `estudiante` VALUES ('8', '2613', '49500237', 'ESPERANZA LEVI', 'FLORES', 'MACHACA', null, null);
INSERT INTO `estudiante` VALUES ('9', '2614', '49500241', 'JESUS', 'CALCINA', 'SERPA', null, null);
INSERT INTO `estudiante` VALUES ('10', '2615', '49500245', 'ALEJANDRO CIRILO', 'CCALA', 'MAMANI', null, null);
INSERT INTO `estudiante` VALUES ('11', '2616', '49500249', 'MARCELO ROMAN', 'MAMANI', 'MAMANI', null, null);
INSERT INTO `estudiante` VALUES ('12', '2617', '49500253', 'FRANCISCA', 'SULLO', 'APAZA', null, null);
INSERT INTO `estudiante` VALUES ('13', '2618', '49500257', 'Cristina', 'CHIPANA', 'IQUISE', null, null);
INSERT INTO `estudiante` VALUES ('14', '2619', '49500261', 'Avelina', 'DE BARRETO', 'CALLA', null, null);
INSERT INTO `estudiante` VALUES ('15', '2620', '49500265', 'Carla', 'JANCO', 'CABANA', null, null);
INSERT INTO `estudiante` VALUES ('16', '2621', '49500269', 'Juana', 'QUECARA', 'VALERIANO', null, null);
INSERT INTO `estudiante` VALUES ('17', '2622', '49500273', 'Ricardo', 'GUTIERREZ', 'APAZA', null, null);
INSERT INTO `estudiante` VALUES ('18', '2623', '49500277', 'ELIZABETH', 'CONDORI DE MAMANI', 'MACHACCA', null, null);
INSERT INTO `estudiante` VALUES ('19', '2624', '49500281', 'ANTONIA', 'QUISPE', 'SONCCO', null, null);
INSERT INTO `estudiante` VALUES ('20', '2625', '49500285', 'BEATRIZ', 'HUAHUASONCCO', 'MARIN', null, null);
INSERT INTO `estudiante` VALUES ('21', '2626', '49500289', 'CECILIA', 'QUISPE', 'MAMANI', null, null);
INSERT INTO `estudiante` VALUES ('22', '2627', '49500293', 'LEOCADIA', 'AGUILAR', 'COAQUIRA', null, null);
INSERT INTO `estudiante` VALUES ('23', '2628', '49500297', 'SANTUSA', 'CCORI', 'MAMANI', null, null);
INSERT INTO `estudiante` VALUES ('24', '2629', '49500301', 'FLORA', 'TAPIA', 'RIMACHI', null, null);
INSERT INTO `estudiante` VALUES ('25', '2630', '49500305', 'EVANGELINA', 'QUISPE', 'CHURA', null, null);
INSERT INTO `estudiante` VALUES ('26', '2631', '49500309', 'YANET', 'PACORI', 'OCHOCHOQUE', null, null);
INSERT INTO `estudiante` VALUES ('27', '2632', '49500313', 'EUSTAQUIO AGAPITO', 'LINARES', 'YARLEQUE', null, null);
INSERT INTO `estudiante` VALUES ('28', '2633', '49500317', 'EXALTACION', 'JIMENEZ', 'JANAMPA', null, null);
INSERT INTO `estudiante` VALUES ('29', '2634', '49500321', 'WALTER GUIDO', 'APAZA', 'MALAGA', null, null);
INSERT INTO `estudiante` VALUES ('30', '2635', '49500325', 'NICOLASA', 'QUISPE', 'JIMENEZ', null, null);
INSERT INTO `estudiante` VALUES ('31', '2636', '49500329', 'EUSEBIA', 'DE NIZAMA', 'TEJADA', null, null);
INSERT INTO `estudiante` VALUES ('32', '2637', '49500333', 'PABLO', 'ESPINOZA DE BARRETO', 'CONTRERAS', null, null);
INSERT INTO `estudiante` VALUES ('33', '2638', '49500337', 'VALENTIN', 'LLAPA', 'ANCO', null, null);
INSERT INTO `estudiante` VALUES ('34', '2639', '49500341', 'ALIDA INES', 'MOSCOSO', 'SALAZAR', null, null);
INSERT INTO `estudiante` VALUES ('35', '2640', '49500345', 'MIGUEL ANGEL', 'ROJAS DE BARAHONA', 'CORNEJO', null, null);
INSERT INTO `estudiante` VALUES ('36', '2641', '49500349', 'ROXANA', 'MENDOZA', 'BEJARANO', null, null);

-- ----------------------------
-- Table structure for historial_pagos
-- ----------------------------
DROP TABLE IF EXISTS `historial_pagos`;
CREATE TABLE `historial_pagos` (
  `id_historial_pago` int NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `registrado_por` varchar(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_historial_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of historial_pagos
-- ----------------------------
INSERT INTO `historial_pagos` VALUES ('38', 'El usuario \'Isai Ismael Sandoval Ccaccro\' ha eliminado todo el historial de pagos (3 registros).', 'Isai Ismael Sandoval Ccaccro', '2025-06-26 09:56:14');

-- ----------------------------
-- Table structure for padre_familia
-- ----------------------------
DROP TABLE IF EXISTS `padre_familia`;
CREATE TABLE `padre_familia` (
  `id_padre_familia` int NOT NULL AUTO_INCREMENT,
  `id_cargo` int DEFAULT NULL,
  `tipo_consanguinidad` int DEFAULT NULL,
  `padre_dni` varchar(255) DEFAULT NULL,
  `padre_nombres` varchar(255) DEFAULT NULL,
  `padre_ape_pat` varchar(255) DEFAULT NULL,
  `padre_ape_mat` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_padre_familia`),
  KEY `fk_padreFamilia_consanguinidad` (`tipo_consanguinidad`),
  KEY `fk_padreFamilia_cargo` (`id_cargo`),
  CONSTRAINT `fk_padreFamilia_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_padreFamilia_consanguinidad` FOREIGN KEY (`tipo_consanguinidad`) REFERENCES `tipo_consanguinidad` (`id_tipo_consanguinidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3230 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of padre_familia
-- ----------------------------
INSERT INTO `padre_familia` VALUES ('2608', '1', '2', '00494248', 'ANTONIO LUCAS', 'COSACANI', 'RIVERA', '959495800', 'P.JOVEN 13 DE MAYO MZ.I LT.1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2609', '1', '2', '01311834', 'EDGAR', 'ILASACA', 'FLORES', '959495800', 'JOSE CARLOS MARIATEGUI MZ.H LT.8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2610', '1', '2', '01531769', 'MODESTO AURELIO', 'CALCINA', 'CALCINA', '959495800', 'BELLA AREQUIPA 134', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2611', '1', '2', '01536550', 'AUXILLIADORA', 'MANGO', 'CCALA', '959495800', 'P.J. 13 DE AGOSTO N-3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2612', '1', '2', '01546558', 'FLAVIA ELENA', 'CONDORI', 'MAMANI', '959495800', 'LOMA VERDE MZ.E LT.4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2613', '1', '2', '01553511', 'CLAUDIA AUGUSTA', 'MACHACA', 'SULLO', '959495800', 'ASC. VI. VILLA SANTA ROSA DE CHIGUATA mz. H lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2614', '1', '2', '01553689', 'HUMBERTO', 'SERPA', 'CHIPANA', '959495800', 'COM.TRAPICHE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2615', '1', '2', '01830163', 'JULIA', 'MAMANI', 'DE BARRETO', '959495800', 'COM. PARCO SECTOR ISCO CHACA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2616', '1', '2', '02037071', 'HILDA', 'MAMANI', 'JANCO', '959495800', 'PARCIALIDAD OCCOPAMPA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2617', '1', '2', '02040196', 'BLAIR DIONISIO', 'APAZA', 'QUECARA', '959495800', 'LEON DEL SUR M-13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2618', '1', '2', '02044097', 'LOLA ORTENCIA', 'IQUISE', 'GUTIERREZ', '959495800', 'AMPLIC. MERCED MZ.C LT.9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2619', '1', '2', '02045110', 'YOLANDA', 'CALLA', 'CONDORI DE MAMANI', '959495800', 'PPJJ. 13 DE AGOSTO MZ B` LT 9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2620', '1', '2', '02165292', 'REYNA', 'CABANA', 'QUISPE', '959495800', 'FEDERICO POLLAN S/N BARRIO CENTRAL', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2621', '1', '2', '02294342', 'ESTRELLA ZENAIDA', 'VALERIANO', 'HUAHUASONCCO', '959495800', 'ASC. EL MISTIANO mz. C lt. 5-B', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2622', '1', '2', '02296401', 'EDDY WILLIAM', 'APAZA', 'QUISPE', '959495800', 'COOP. ANDRES AVELINO CACERES B-18', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2623', '1', '2', '02299278', 'TRINIDAD', 'MACHACCA', 'AGUILAR', '959495800', 'JR. CONTISUYO 1201 URB. TAHUANTINSUYO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2624', '1', '2', '02302973', 'SATURNINA', 'SONCCO', 'CCORI', '959495800', 'CALLE AYACUCHO 117', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2625', '1', '2', '02306996', 'GLADYS ANA', 'MARIN', 'TAPIA', '959495800', 'JR.ORIZABA 490 URB.SEÑOR DE HUANCA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2626', '1', '2', '02419901', 'EUSEBIO', 'MAMANI', 'QUISPE', '959495800', 'EL SOL 110 EZEQUIEL URVIOLA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2627', '1', '2', '02422496', 'JESUS', 'COAQUIRA', 'PACORI', '959495800', 'LA MANSION II MZ. B LT. 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2628', '1', '2', '02433222', 'JULIA', 'MAMANI', 'LINARES', '959495800', 'PPJJ ALTO ALIANZA CALLE CIRO ALEGRIA MZ J LT 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2629', '1', '2', '02440797', 'SONIA RUTH', 'RIMACHI', 'JIMENEZ', '959495800', 'URB. SOL DE LA RINCONADA A-18', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2630', '1', '2', '02448511', 'ELIZABETH JUDITH', 'CHURA', 'APAZA', '959495800', 'COOP.A.A.CACERES H-9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2631', '1', '2', '02554551', 'BENITA', 'OCHOCHOQUE', 'QUISPE', '959495800', 'JR. PUTINA 148', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2632', '1', '2', '02704207', 'MARIA ASUNCION', 'YARLEQUE', 'DE NIZAMA', '959495800', 'JR. TRUJILLO 780', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2633', '1', '2', '04052519', 'EPIFANIA', 'JANAMPA', 'ESPINOZA DE BARRETO', '959495800', 'ANEXO COCHAMARCA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2634', '1', '2', '04432912', 'GEORGINA ESTHER', 'MALAGA', 'LLAPA', '959495800', 'CALLE SAN MARTIN E 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2635', '1', '2', '04647372', 'PERCY WILBER', 'JIMENEZ', 'MOSCOSO', '959495800', 'AV. OLIMPICA 205', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2636', '1', '2', '06438797', 'NORA DOMINGA', 'TEJADA', 'ROJAS DE BARAHONA', '959495800', 'ANDRES A. CACERES mz. C lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2637', '1', '2', '07033794', 'JAIME JULIO', 'CONTRERAS', 'MENDOZA', '959495800', 'DEFENSORES DEL MORRO 1737 202 EDIF 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2638', '1', '2', '09630574', 'FERNANDO MANUEL', 'ANCO', 'PAZ', '959495800', 'COSTA RICA 511 J SEÑOR DE LOS MILAGROS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2639', '1', '2', '09693282', 'CRISTIAN GUSTAVO', 'SALAZAR', 'MORENO', '959495800', 'SECTOR 3 GRUPO 16 MZ.J LT.10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2640', '1', '2', '10004243', 'ROSA HAYDEE', 'CORNEJO', 'PEREZ', '959495800', 'BOLOGNESI 131 TINGO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2641', '1', '2', '10042031', 'DELIA CIRILA', 'BEJARANO', 'CASANI', '959495800', 'LA MENDOZA mz. B lt. 18', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2642', '1', '2', '10156652', 'NESTOR TOMAS', 'POMA', 'RONDAN', '959495800', 'PROVIV LA PLANICIE DE CARABAYLLO mz. D lt. 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2643', '1', '2', '10388909', 'MARIA NURMIS', 'UTANI', 'CAMPOS', '959495800', 'URB. LA LIBERTAD CALLE RAMON CASTILLA 401 PISO 4 mz. I lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2644', '1', '2', '10459685', 'MERCEDES', 'SOTO', 'DE CORONADO', '959495800', 'JARDINES DE NARANJAL I MZ.E LT.17', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2645', '1', '2', '10642416', 'DARIO', 'VILLANUEVA', 'CANCHO', '959495800', 'AMPL. 1 DE MAYO MZ R-7 LT 13 PAMPLONA ALTA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2646', '1', '2', '10760701', 'HERMINIA', 'PACCO', 'CCORAHUA', '959495800', 'ASOC. DE VIVIENDA LOS PEREGRINOS DE CHAPI SECTOR 02 mz. F lt. 18', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2647', '1', '2', '20578529', 'RUDY TOMAS', 'MAYTA', 'ORELLANA', '959495800', 'SANTA ROSA 1 PICHANAKI', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2648', '1', '2', '20708365', 'ELIZABETH', 'CASTILLO', 'HUAMAN', '959495800', 'ANEXO LOS ANGELES DEL RIO ENE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2649', '1', '2', '20710762', 'ANTONIA', 'HUAMAN', 'ZUASNABAR', '959495800', 'JR. LOS SAUSAS 191', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2650', '1', '2', '23968644', 'BEATRIZ', 'VIVANCO', 'ESPINOZA', '959495800', 'AH. LA MERCED mz. D lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2651', '1', '2', '23979444', 'CECILIA', 'CHINO', 'FIGUEROA', '959495800', 'CALLE LIBERTAD MZ-B LT-6 ASENT. H. SANTA MARTHA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2652', '1', '2', '24809588', 'LEOCADIA', 'ALVIS', 'CCORPUNA', '959495800', 'COM. SAN SEBASTIAN', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2653', '1', '2', '24885908', 'SANTUSA', 'CUTIRE', 'CCAMA', '959495800', 'PPJJ. 13 DE AGOSTO mz. LL lt. 6-A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2654', '1', '2', '24887807', 'FLORA', 'QUISPE', 'CANALES', '959495800', 'ASOC. DE VIV.EL BUEN PANORAMA DE HUNTER mz. F lt. 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2655', '1', '2', '24888737', 'EVANGELINA', 'HACHIRE', 'CARLOS', '959495800', 'COMUNIDAD PAMPAHUARCA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2656', '1', '2', '25328791', 'YANET', 'HUAMAN', 'LOAIZA DE LAZO', '959495800', 'VENEZUELA 107', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2657', '1', '2', '29384523', 'EUSTAQUIO AGAPITO', 'QUISPE', 'CHILE', '959495800', 'ASENT.H.SEÑOR DE HUANCA MZ.B LT.1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2658', '1', '2', '29416612', 'EXALTACION', 'QUISPE', 'USCAMAYTA', '959495800', 'ANEXO MAGHUANCCA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2659', '1', '2', '29422305', 'WALTER GUIDO', 'QUISPE', 'CCAPA', '959495800', 'AV. VIÑA DEL MAR 906 SEÑOR DE LOS MILAGROS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2660', '1', '2', '29425747', 'NICOLASA', 'RAMOS', 'GAMERO', '959495800', 'UPIS AMPLIACION LA MERCED mz. H lt. 7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2661', '1', '2', '29427716', 'EUSEBIA', 'TTITO', 'HURTADO', '959495800', 'TUPAC AMARU 100 J. DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2662', '1', '2', '29429713', 'PABLO', 'PARICAHUA', 'TICONA', '959495800', 'AV.LOS ANGELES MZ M LT.1 P.JOVEN LA MERCED', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2663', '1', '2', '29468881', 'VALENTIN', 'CHIPA', 'LOAYZA', '959495800', 'ALTO ALIANZA NRO.8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2664', '1', '2', '29469073', 'ALIDA INES', 'AYAMAMANI', 'CHAVEZ', '959495800', 'AV. SAN MIGUEL DE PIURA 104 SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2665', '1', '2', '29469190', 'MIGUEL ANGEL', 'MAMANI', 'BENAVENTE', '959495800', 'HUASCAR E-5 AMP.PAMPAS DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2666', '1', '2', '29469204', 'ROXANA', 'AQUISE', 'CANAZA', '959495800', 'CALLE BOGOTA 207', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2667', '1', '2', '29469529', 'VICTOR', 'HUILLCA', 'GARCIA', '959495800', 'PJ.FRAY MARTIN DE PORRES I-3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2668', '1', '2', '29469538', 'YUDY TERESA', 'MACHACA', 'CHOQUE', '959495800', 'ITALIA 912', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2669', '1', '2', '29472088', 'FRANCISCO BRAULIO', 'MAMANI', 'OJEDA', '959495800', 'J.13 DE AGOSTO COMITE 4 mz. I lt. 9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2670', '1', '2', '29484701', 'JUAN', 'GALINDO', 'PAUCAR', '959495800', 'LA MANSION J 16', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2671', '1', '2', '29486357', 'PATRICIA MARIA', 'JACHA', 'GOMEZ', '959495800', 'ASC. LA MENDOZA MZ F LT 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2672', '1', '2', '29499850', 'ESPERANZA LEVI', 'FLOREZ', 'CHAVEZ', '959495800', 'CALLE AREQUIPA 110 URB.SEÑOR DE LOS MILAGROS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2673', '1', '2', '29524118', 'JESUS', 'OVIEDO', 'DE SALINAS', '959495800', null, '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2674', '1', '2', '29539841', 'ALEJANDRO CIRILO', 'SANTANDER', 'AGUILAR', '959495800', 'P.JOVEN AMPLC.PAMPAS DEL CUSCO PSJE.CAHUIDE S/N LT.2 MZ.3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2675', '1', '2', '29542844', 'MARCELO ROMAN', 'QUISPE', 'ALEJO', '959495800', 'CALLE PEDRO P.DIAZ 426', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2676', '1', '2', '29554353', 'FRANCISCA', 'MAMANI', 'QUISPE', '959495800', 'SAN SALVADOR 204 P.T.HUNTER', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2677', '1', '2', '29554656', 'ROSA MARIA', 'COMPANOCA', 'CACERES', '959495800', 'LOS ANGELES G -4 LA TOMILLA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2678', '1', '2', '29557176', 'MIGUEL ANGEL', 'PALACO', 'CHALLAPA', '959495800', 'V.A.BELAUNDE COMITE 20 LT.25 MZ.D ZONA 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2679', '1', '2', '29561678', 'ROSA ELVIRA', 'BALLESTEROS', 'VELASQUEZ', '959495800', 'ARICA T. MORRO DE ARICA mz. D lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2680', '1', '2', '29573383', 'ASUNCION CELESTINA', 'GUTIERREZ', 'DE MOLLO', '959495800', 'MANCO CAPAC J. AMPLIC.PAMPAS DEL CUSCO mz. B lt. 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2681', '1', '2', '29581005', 'RUPERTO', 'CAIRA', 'HUANCA', '959495800', 'CALLE FRANCISCO BOLOGNESI B-20 P. JOVEN AUGUSTO FREYRE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2682', '1', '2', '29581020', 'ANA ANGELICA', 'VALERIANO', 'CHAVEZ', '959495800', '28 DE JUNIO 220-A D.A.CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2683', '1', '2', '29582227', 'NORMA LUZMILA', 'TEVES', 'MAMANI', '959495800', 'J. 28 DE JULIO mz. G lt. 5-A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2684', '1', '2', '29582562', 'ROSA', 'CCANSAYA', 'HUAMANI', '959495800', 'CHICURUNI CAMPAMENTO LT 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2685', '1', '2', '29582622', 'YONNY FELIPE', 'ARCCO', 'CHAVEZ', '959495800', 'ASENT.H.LEON DEL SUR N-8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2686', '1', '2', '29582719', 'AGUSTINA EULOGIA', 'SULLA', 'TTITO', '959495800', 'AV. TUPAC AMARU 106 DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2687', '1', '2', '29584031', 'DARIO RAUL', 'QUISPE', 'HUAMANI', '959495800', 'VILLA CAYLLOMA MAJES mz. W lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2688', '1', '2', '29584288', 'EDELMIRA NARCIZA', 'NUÑEZ', 'BALDARRAGO', '959495800', 'AH. PAMPAS VIEJAS DE SOCABAYA PARCELA 1159 mz. A lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2689', '1', '2', '29584333', 'FRANCISCO', 'CHOQUETICO', 'CHOQUETICO', '959495800', 'AV.FRANCISCO BOLOGNESI J 4 13 DE AGOSTO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2690', '1', '2', '29584395', 'SANDRA ROSELI', 'PREVATE', 'LAZO', '959495800', 'JOSE C. MARIATEGUI 107 ALTOS FERROVIARIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2691', '1', '2', '29584503', 'LAUREANO', 'PUMA', 'LIMAHUAYA', '959495800', 'BELLAVISTA S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2692', '1', '2', '29584558', 'ANA PELUCIA', 'CERVANTES', 'DE BUSTAMANTE', '959495800', 'LEON DEL SUR MZ.B LT.26', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2693', '1', '2', '29588513', 'JESUS EDUARDO', 'LIMA', 'MORALES', '959495800', 'AH. LA MANSION 2 DE SOCABAYA mz. D lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2694', '1', '2', '29593988', 'SANDRA MONICA', 'INQUILLA', 'PILCO', '959495800', 'LA MANSION DE SOCABAYA MZ.K LT.19', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2695', '1', '2', '29596554', 'LUZMARINA CECILIA', 'QUISPE', 'MARTINEZ', '959495800', 'CALLE CARTAGENA 417', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2696', '1', '2', '29597032', 'CRISTINA', 'ROJO', 'DE BELIZARIO', '959495800', 'ASENT.H.LEON DEL SUR D-14', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2697', '1', '2', '29598010', 'RUBEN ALVARO', 'CHANCAYAURI', 'OJEDA', '959495800', 'BELEN U-4 HUENTER', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2698', '1', '2', '29598152', 'VIRGINIA', 'HUARZAYA', 'CANAZA', '959495800', 'BRASILIA NRO 920', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2699', '1', '2', '29598159', 'MARILUZ', 'ANCALLE', 'TICONA', '959495800', 'LOS ROSALES 115 D.A.CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2700', '1', '2', '29598327', 'ELIZABETH RUTH', 'ESPINOZA', 'HUISACAYNA', '959495800', 'QUIÑONES LAS MALVINAS mz. R3 lt. 12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2701', '1', '2', '29598578', 'NANCY MARISOL', 'HUANQUI', 'VELASQUEZ DE TOTOCAYO', '959495800', 'ASOC.PARQUE INDUSTRIAL PORVENIR AREQUIPA (APIPA) SECT.XI mz. S lt. 04', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2702', '1', '2', '29598680', 'MIGUEL ALCIDES', 'FERNANDEZ', 'MAMANI', '959495800', 'INDEPENDENCIA 437-D', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2703', '1', '2', '29598967', 'ELENA', 'ARCCATA', 'LIMACHE', '959495800', 'CALLE BENIGNO BALLON FARFAN 318', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2704', '1', '2', '29599280', 'HERNAN', 'CASTILLO', 'PINO', '959495800', 'CALLE COSTA RICA 613 URB.SEÑOR DE LOS MILAGROS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2705', '1', '2', '29599513', 'JORGE TOMAS', 'JUSTO', 'LIPA', '959495800', 'JR. PRIMAVERA 103 - DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2706', '1', '2', '29602878', 'MARTIN IGNACIO', 'INOFUENTE', 'AJRA', '959495800', 'ASOC.EL NAZARENO G 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2707', '1', '2', '29614883', 'JUAN PABLO', 'MAMANI', 'CANAZA', '959495800', 'CALLE CAMINITO VERDE B-9 LOMA VERDE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2708', '1', '2', '29614932', 'ELSA', 'LUQUE', 'CUTIPA', '959495800', 'AMPLC.PAMPA DEL CUSCO J 11 CMTE.2 ZONA A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2709', '1', '2', '29614949', 'RINA', 'GOMEZ', 'GUILLERMO', '959495800', 'ASENT.H.LA MERCED L-6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2710', '1', '2', '29614993', 'GLADIS ROSARIO', 'FERNANDEZ', 'SOTO', '959495800', 'BENIGNO BALLON FARFAN 304', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2711', '1', '2', '29615176', 'LOURDES MATILDE', 'YUCRA', 'RAMOS', '959495800', 'PJ. AUGUSTO FREYRE AV. ANDRES AVELINO CACERES mz. L lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2712', '1', '2', '29615251', 'MARIA LUZ', 'PINTO', 'LIVISI', '959495800', 'P.JOVEN A.FREYRE GARCIA MZ.F LT.26 ZONA A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2713', '1', '2', '29615717', 'CARMEN ROSA', 'VILCA', 'CARPIO', '959495800', 'CALLE SAN SALVADOR 431', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2714', '1', '2', '29615858', 'WILBER EFRAIN', 'MAMANI', 'ARIAS', '959495800', 'CALLE SAN JOSE 204', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2715', '1', '2', '29617594', 'JUAN ALBERTO', 'RONCALLA', 'TICLIAHUANCA', '959495800', 'AV.ARGENTINA 126', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2716', '1', '2', '29619948', 'TOMASA SOFIA', 'SOTOMAYOR', 'DE SUCA', '959495800', 'AV.BOLOGNESI 307 FCO.BOLOGNESI', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2717', '1', '2', '29622011', 'LUISA', 'SUMI', 'HUANCOLLO', '959495800', 'AMPLIACION PAMPAS DEL CUZCO MZ. J` LT. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2718', '1', '2', '29622079', 'FIDEL CLAUDIO', 'MAMANI', 'MAMANI', '959495800', 'P.JOVEN LA MERCED L 2 CMTE.4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2719', '1', '2', '29622296', 'ROBERTO OSCAR', 'ZELA', 'MARAZA', '959495800', 'JR.BELEN 424 SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2720', '1', '2', '29622374', 'JHONY LISANTRES', 'MAMANI', 'GREGORIO', '959495800', 'ARICA 118', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2721', '1', '2', '29622401', 'CLAUDIA', 'HUMPIRI', 'NINA', '959495800', 'ACAYALI 209 SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2722', '1', '2', '29622733', 'HERMINIA JOSEFINA', 'JARA', 'QUISPE', '959495800', 'JR.9 DE OCTUBRE 121 A.CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2723', '1', '2', '29622743', 'RONALD PIO', 'CARDENAS', 'TAPIA', '959495800', 'ANEXO DE SECOCHA S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2724', '1', '2', '29623034', 'PERCY', 'YAURI', 'HILARIO', '959495800', 'UNION VISTA ALEGRE mz. J lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2725', '1', '2', '29623486', 'SANDRO IVAN', 'LEZAMA', 'GUZMAN', '959495800', 'UPIS PAISAJISTA MZ P LT 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2726', '1', '2', '29623590', 'ISABEL CARMEN', 'NUÑEZ', 'ROQUE', '959495800', 'BUENOS AIRES 113', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2727', '1', '2', '29639073', 'ERIKA ELIZABETH', 'SALAS', 'SANGUINETTI', '959495800', 'MIGUEL GRAU 307 J. VILLA SAN ISIDRO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2728', '1', '2', '29639226', 'VICTORIA', 'CCACYAVILCA', 'LOPINTA', '959495800', 'BARRIO SANTA ROSA CALLE GARCILASO S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2729', '1', '2', '29643724', 'LETICIA', 'TINTAYA', 'ANCASI', '959495800', 'UPIS PAISAJISTA mz. R lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2730', '1', '2', '29643967', 'GREGORIA FRANCISCA', 'SONCCO', 'CALAPUJA', '959495800', 'CALLE HUASCAR E 9 CMTE.6 P.JOVEN AMPLIACION PAMPAS DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2731', '1', '2', '29644045', 'ZENON', 'ANCCORI', 'GUTIERREZ', '959495800', 'UPIS AMPL. LA MERCED MZ G LT 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2732', '1', '2', '29644064', 'IVONNE ROSARIO', 'HILASACA', 'SABANAYA DE VALDEZ', '959495800', 'CALLE BALLON FARFAN 204 CHILPINILLA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2733', '1', '2', '29644095', 'HILDA', 'CHOQUETICO', 'HUANCA', '959495800', 'ASOC. DE VIV. LOS PEREGRINOS DE CHAPI SECT. 1 mz. E lt. 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2734', '1', '2', '29644217', 'BEATRIZ CARMEN', 'OCHOA', 'DE MAMANI', '959495800', 'FRANCISCO BOLOGNESI J 13 DE AGOSTO mz. B lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2735', '1', '2', '29644221', 'ROSE MARY NORBERTA', 'CANALES', 'HUACARPUMA', '959495800', 'JR.TUPAC AMARU 100 URB.DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2736', '1', '2', '29644671', 'JOVANNA', 'CONDORI', 'ZAPANA', '959495800', 'JOSE SANTOS CHOCANO 204-A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2737', '1', '2', '29644766', 'LERIDA ILUSION', 'QUIROZ', 'CARRASCO', '959495800', 'CALLE JOSE LUIS BUSTAMANTE Y RIVERO 109', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2738', '1', '2', '29644809', 'ROSARIO YNES', 'YAURI', 'ALVAREZ DE BARRIOS', '959495800', 'AV. EL SOL 231 D. A. CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2739', '1', '2', '29644957', 'CESAR GUSTAVO', 'VALENCIA', 'VALDIVIA', '959495800', 'CALLE JOSE CARLOS MARIATEGUI C-5 VILLA SAN ISIDRO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2740', '1', '2', '29646954', 'VICTOR ANTONIO', 'CALCINA', 'PEREZ', '959495800', 'GOLGOTA 112 ALTO SAN MARTIN', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2741', '1', '2', '29651139', 'RODRIGO', 'SENCARA', 'MAMANI', '959495800', 'UPIS AMPLIACION LA MERCED mz. G lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2742', '1', '2', '29654914', 'DORIS', 'HUILLCACURI', 'LEON', '959495800', 'BLOQUE 5 ZONA B mz. C lt. 22', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2743', '1', '2', '29660104', 'SONIA', 'HUILLCA', 'HUAMANI', '959495800', 'P.JOVEN AUGUSTO FREYRE E 19 PSJ.HUASCAR', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2744', '1', '2', '29660841', 'JUAN GILBERTO', 'HUAMANI', 'CRUZ', '959495800', 'TUPAC YUPANQUI S/N N-16', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2745', '1', '2', '29660904', 'DANIEL ALFREDO', 'QUISPE', 'FLORES', '959495800', 'LA MANSION DE SOCABAYA II FTE. mz. R lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2746', '1', '2', '29660939', 'YENY YOBANA', 'COSI', 'SANABRIA', '959495800', 'CALLE MARISCAL NIETO 406 P.JOVEN SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2747', '1', '2', '29661222', 'MARCELINA GABINA', 'QUISPE', 'QUISPE', '959495800', 'AH. LA MERCED mz. H lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2748', '1', '2', '29664416', 'IGNACIA', 'QUISPE', 'FLORES', '959495800', 'RICARDO PALMA J. ALTO LA ALIANZA mz. J lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2749', '1', '2', '29668650', 'JACKELINE', 'TRUJILLO', 'CHUQUITICO', '959495800', 'CALLE ALFONSO UGARTE L-28 P. JOVEN AUGUSTO FREYRE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2750', '1', '2', '29668663', 'MARIA ELIZABETH', 'QUISPE', 'HAÑARI', '959495800', 'SECC. A PARCELA 85 LA COLINA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2751', '1', '2', '29668941', 'ELBA PATRICIA', 'FLORES', 'RUIZ', '959495800', 'MARIANO BUSTAMANTE F 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2752', '1', '2', '29679707', 'SARA', 'CABOAPAZA', 'BERRIOS', '959495800', 'AV.SAN MIGUEL DE PIURA 219 URB.MILAGROS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2753', '1', '2', '29679865', 'ADELA', 'CHIPANA', 'QUISPE', '959495800', 'PSJ. LIBERTAD B-2 SANTA MARTHA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2754', '1', '2', '29679939', 'OLGA LIBIA', 'NARVAEZ', 'TICONA', '959495800', 'P.JOVEN ANDRES AVELINO CACERES K 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2755', '1', '2', '29679978', 'ANA', 'HUAYNASI', 'GARCIA', '959495800', '28 DE JUNIO 302 P.J. DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2756', '1', '2', '29684867', 'MARITZA', 'LEON', 'KACASACA', '959495800', 'URB.LA MANSION MZ.B LT.7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2757', '1', '2', '29686158', 'JUANA ANTONIA', 'MACHACA', 'HUARAYA', '959495800', 'ARIAS ARAGUEZ mz. I lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2758', '1', '2', '29691650', 'DORIS', 'SANTACRUZ', 'MIRANDA', '959495800', 'OLIVARES 305 PPJJ CERRO JULI', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2759', '1', '2', '29692658', 'TEOFILA', 'CANAZA', 'VILCA', '959495800', 'CALLE MANCO CAPAC A 2 AMP PAMAPAS DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2760', '1', '2', '29703700', 'ROGELIA AMPARO', 'GASPAR', 'HURACAHUA', '959495800', 'AV.UNION 118 P.JOVEN DANIEL A.CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2761', '1', '2', '29703925', 'GIOVANNA ELIZABETH', 'SAIRITUPA', 'ASQUI', '959495800', 'UPIS PAISAJISTA W 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2762', '1', '2', '29710456', 'BEATRIZ SOLEDAD', 'ARAPA', 'CONDORI', '959495800', 'CALLE PRIMAVERA C-2 P.JOVEN VILLA SAN ISIDRO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2763', '1', '2', '29710678', 'LUIS', 'TIPO', 'PACUMPIA', '959495800', 'P.JOVEN AUGUSTO FREYRE MZ.Ñ LT.13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2764', '1', '2', '29710785', 'FREDDY RAUL', 'YAPU', 'ESPINOZA', '959495800', 'AAHH SANTA MARIA mz. B lt. 12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2765', '1', '2', '29710786', 'ANDRES JUSTO', 'SULLA', 'TTITO', '959495800', 'CALLE TUPAC AMARU NRO.106 URB.DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2766', '1', '2', '29711095', 'CARLOS JUAN', 'MOLINA', 'MAMANI', '959495800', 'URB.MIGUEL GRAU COMITE 45 MZ.30-A LT.19', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2767', '1', '2', '29724015', 'FLOR DE MARIA', 'APAZA', 'HUILLCAHUAMAN', '959495800', 'AV.MIGUEL GRAU N-20 AUGUSTO FREYRE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2768', '1', '2', '29724039', 'NOELIA NILA', 'TANCO', 'CALCINA', '959495800', 'UPIS PAISAJISTA MZ.J LT.19', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2769', '1', '2', '29726003', 'MAGDALENA', 'MAMANI', 'MAMANI', '959495800', 'ASENT.H. LA MANSION DE SOCABAYA MZ.B LT.26', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2770', '1', '2', '29731807', 'CORINA ELBA', 'PINTO', 'QUIROZ', '959495800', 'AV.G.DE LA VEGA B-1 COMITE 5 AMPLC.P.DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2771', '1', '2', '29731907', 'ALEXANDER', 'GOMEZ', 'FLORES', '959495800', 'PJ. SAN JUAN DE DIOS JR. SAN ROMAN 303', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2772', '1', '2', '29732232', 'ANA VICTORIA', 'NARVAEZ', 'TICONA', '959495800', 'ANDRES AVELINIO CACERES 355 J.AUGUSTO FREYRE mz. K lt. 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2773', '1', '2', '29736134', 'CLEOTILDE CECILIA', 'MAMANI', 'VILCA', '959495800', 'P.JOVEN ALTO ALIANZA C-31 CMTE.1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2774', '1', '2', '30418271', 'URSULA MISKAM', 'POSTIGO', 'PALOMINO', '959495800', 'AV. MARISCAL ANDRES AVELNO CACERES PPJJ ALTO ALIANZA MZ. A LT. 16', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2775', '1', '2', '30579621', 'BERNABE FELIX', 'CONDORI', 'VILLALTA', '959495800', 'CALLE AUSTRIA PP JJ HUNTER ZON. A MZ. 18 LT. 05A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2776', '1', '2', '30677631', 'JORGE', 'ESCOBEDO', 'LAYME', '959495800', 'PJ. AMPL. LA MERCED MZ G LT 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2777', '1', '2', '30677650', 'ANA MARIA', 'PADILLA', 'ALVAREZ DE CUAQUIRA', '959495800', 'LOS ROSALES 301-A VILLA SAN ISIDRO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2778', '1', '2', '30677787', 'MARISOL VERONICA', 'NUÑEZ', 'SALAZAR', '959495800', 'CALLE PEDRO P.DIAZ ZONA E 416', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2779', '1', '2', '30845905', 'MANUEL DONATO', 'LINARES', 'PALACIOS', '959495800', 'AV. FRANCISCO BOLOGNESI PUEBLO J. 13 DE AGOSTO MZ. P LT. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2780', '1', '2', '30860205', 'LUCIO', 'CAPIA', 'CONDORI', '959495800', 'ASOC. DE VIVIENDA EL BUEN PANORAMA DE HUNTER MZ. G LT. 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2781', '1', '2', '30954900', 'IRIS PAULINA', 'BRAVO', null, '959495800', 'ASOC. EL MISTIANO MZ C LT 10-D', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2782', '1', '2', '30962468', 'PAOLA YASMINA', 'CAMATA', 'BRAVO', '959495800', 'CALLE BUENOS AIRES 109', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2783', '1', '2', '30962472', 'SONIA CELIA', 'BERNAL', 'HUAMANI', '959495800', 'AV. T. AMARU K-5 AMPLC. P. CUZCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2784', '1', '2', '30962531', 'MELANIA', 'PINTO', 'NIEBLES', '959495800', 'PPJJ SAN JUAN DE DIOS CALLE SAN ROMAN MZ. J LT. 13-B', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2785', '1', '2', '40017271', 'PATRICIA', 'CONDORI', 'HUAMANI', '959495800', 'PJ ALTO ALIANZA U 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2786', '1', '2', '40028514', 'MILAGROS', 'DIAZ', 'VILLALOBOS', '959495800', 'PJ AMPLIACION PAMPAS DEL CUSCO MZ D 15 COMITE 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2787', '1', '2', '40037083', 'HILDA NORMA', 'AZOCAR', 'NINAHUAMAN DE DELGADO', '959495800', 'MARISCAL URETA 105 P.J. SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2788', '1', '2', '40087492', 'CARLOS JESUS', 'MONCCA', 'ALMANZA', '959495800', 'CAL UGARTE 131 SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2789', '1', '2', '40105181', 'MERY', 'HUISA', 'PARICAHUA', '959495800', 'UPIS PAISAJISTA H-1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2790', '1', '2', '40105344', 'SUGEY', 'RODRIGUEZ', 'ACHIRE', '959495800', 'AV LA PAZ NRO 608-A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2791', '1', '2', '40106791', 'HAYDEE MATILDE', 'LAURA', 'JOSEC', '959495800', 'PSJ. 20 DE ENERO 240', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2792', '1', '2', '40116010', 'JESSICA ISABEL', 'ABARCA', 'QUISPE DE CHURA', '959495800', 'PJ ALTO ALIANZA S 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2793', '1', '2', '40120565', 'JIMMY FRANCISCO', 'CRUZ', 'ZUTA', '959495800', 'MZ T LT 14 BALCON DEL RIMAC', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2794', '1', '2', '40124176', 'DEYSI HAYDEE', 'MOGROVEJO', 'MOGROVEJO', '959495800', 'CALLE CORDOVA 120', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2795', '1', '2', '40126129', 'ABAD', 'HUILLCA', 'AYMA', '959495800', 'P. JOVEN 13 DE AGOSTO Ñ-1- CMTE 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2796', '1', '2', '40136746', 'LIDIA NELY', 'NINA', 'VILCA', '959495800', 'MZ.A LT.05 FUNDO BARBADILLO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2797', '1', '2', '40139516', 'URSULA MARIA', 'MIRANDA', 'SARAYASI', '959495800', 'UPIS AMPLIACION LA MERCED MZ H LT 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2798', '1', '2', '40168434', 'ALFREDO EDISON', 'BENAVIDES', 'JACOBO', '959495800', 'TUPAC YUPANQUI J. AMPLIACION PAMPAS DEL CUZCO mz. N lt. 20', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2799', '1', '2', '40191671', 'ROBERTO DANY', 'CHAMA', 'CARDENAS', '959495800', 'PROLETARIO 112 URB.JOSE CARLOS MARIATEGUI', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2800', '1', '2', '40213914', 'CARMEN ROSA', 'AROSQUIPA', 'LLANQUI', '959495800', 'URB VILLA SEVILLA MZA-H LOTE-3 CA MARISCAL NIETO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2801', '1', '2', '40223376', 'DARWIN HUBERT', 'BEJARANO', 'ZEVALLOS', '959495800', 'AAHH LA MANSION DE SOCABAYA mz. Q lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2802', '1', '2', '40232107', 'NORMA OLGA', 'VARGAS', 'YUCRA', '959495800', 'AMPLC.PAMPAS DEL CUSCO N 11 CMTE.1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2803', '1', '2', '40242067', 'CARMEN ROSA', 'ITO', 'CARDENAS', '959495800', 'JOSE CARLOS MARIATEGUI mz. G lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2804', '1', '2', '40251470', 'ERMELINDA', 'VENTURA', 'QUINTO', '959495800', 'URB.ARIAS ARAGUEZ G 7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2805', '1', '2', '40259291', 'FERRER SAMUEL', 'LLACHO', 'CONDORI', '959495800', 'P.JOVEN 28 DE JULIO MZ.B LT.3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2806', '1', '2', '40266274', 'SUSY GUILLERMINA', 'CABANA', 'DEMANUEL', '959495800', 'FAM.DE VIV.PERU POSIBLE mz. D lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2807', '1', '2', '40276414', 'GERMAN ENRIQUE', 'ACUÑA', 'RAMOS', '959495800', 'PJ. LA MERCED - M - 17', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2808', '1', '2', '40280832', 'NERY', 'MAMANI', 'QUISPELUZA', '959495800', 'P.JOVEN LEON DEL SUR J 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2809', '1', '2', '40280854', 'ELIZABETH DORIS', 'CARI', 'MAYTA', '959495800', 'CALLE URUGUAY 307', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2810', '1', '2', '40293313', 'NELLY JUSTINA', 'PALACIOS', 'GASPAR', '959495800', 'UPIS PAISAJISTA mz. C lt. 18', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2811', '1', '2', '40293909', 'EMERSON FLAVIO', 'CONDORI', 'CARDENAS', '959495800', 'ANEXO PINCHOLLO CALLE GAMARRA MZ A37 LT 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2812', '1', '2', '40299070', 'FRANCISCA', 'BUSTINCIO', 'MAMANI', '959495800', 'LA MERCED mz. A lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2813', '1', '2', '40308420', 'JOSE LUIS', 'HUAMANI', 'TURPO', '959495800', 'P.JOVEN CAMPO MARTE MZ.O LT.7 CMTE.11 ZONA B', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2814', '1', '2', '40323318', 'NILY', 'ALVIS', 'CRUZ', '959495800', 'SANTA ROSA-LA EUGENIA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2815', '1', '2', '40345881', 'ROSA ALEJANDRA', 'PORTILLA', 'ZEBALLOS', '959495800', 'LA MANSION II mz. M lt. 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2816', '1', '2', '40388068', 'SANTOS', 'CONDORI', 'MAMANI', '959495800', 'SANTA MARTHA mz. D lt. 12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2817', '1', '2', '40394832', 'JORGE JENSY', 'VERA', 'NEYRA', '959495800', 'SANTA ROSA MZ. I1-24', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2818', '1', '2', '40399739', 'VALERIANA FABIANA', 'LARICO', 'ALARCON', '959495800', 'LA MANSION DE SOCABAYA MZ.K LT.27', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2819', '1', '2', '40417768', 'AMERICO GUSTAVO', 'MAMANI', 'MAMANI', '959495800', 'ASOC. DE VIV. HERMOSA CAMPIÑA ECOLOGICA mz. G lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2820', '1', '2', '40447121', 'JENI DEL ROSARIO', 'CHIRINOS', 'CAHUERA', '959495800', 'AAHH LA MERCED COM. 4 mz. M lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2821', '1', '2', '40477985', 'PATRICIO', 'DIAZ', 'HUILLCA', '959495800', 'MARISCAL CASTILLA 845', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2822', '1', '2', '40481968', 'CARMEN ROSA', 'ROJAS', 'DE GOMEZ', '959495800', 'CALLE SANTA ROSA 112 URB.ORRANTIA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2823', '1', '2', '40555311', 'VILMA', 'LIPA', 'LIPA', '959495800', 'SANTA MARTHA mz. B lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2824', '1', '2', '40570085', 'CARMEN', 'CALLA', 'CONDORI', '959495800', '13 DE AGOSTO mz. B lt. 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2825', '1', '2', '40582274', 'MONICA ARACELI', 'QUISPE', 'CORDOVA', '959495800', 'AMPLC.PAMPAS DEL CUZCO MZ.H LT.7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2826', '1', '2', '40582278', 'OLGA MARIA', 'FLORES', 'FERNANDEZ', '959495800', 'P.JOVEN LEONES DEL SUR E 2 CMTE.2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2827', '1', '2', '40618600', 'AGRIPINA JUSTINA', 'HUALLA', 'QUISPE', '959495800', 'LA MANSION DE SOCABAYA mz. J lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2828', '1', '2', '40624971', 'ANA MARIA', 'ARMENDARIZ', 'PUMA', '959495800', 'P.JOVEN LEON DEL SUR MZ.E LT.9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2829', '1', '2', '40641923', 'DARLY MERCEDES', 'MENDOZA', 'HILACHOQUE', '959495800', 'CALLE JOSE LUIS BUSTAMANTE Y RIVERO 104', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2830', '1', '2', '40675405', 'DANITZA LELIA', 'HUANCA', 'POMA', '959495800', 'AMP.PAMPAS DEL CUSCO AV.TAHUANTINSUYO COMITE 2 LT.2 MZ.H', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2831', '1', '2', '40678350', 'LUCIA ANGELICA', 'ROQUE', 'CAHUINA', '959495800', 'LEONES DEL SUR MZ.N LT.13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2832', '1', '2', '40691700', 'JAMES DEAN', 'ZAVALETA', 'VIZCARRA', '959495800', 'CH IGNACIO ALVAREZ THOMAS SECTOR 1 mz. K lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2833', '1', '2', '40734327', 'WILLIAN ERNESTO', 'RIOS', 'ORIHUELA', '959495800', 'LEON DEL SUR D 12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2834', '1', '2', '40743991', 'JUSTINA', 'VERA', 'GIRALDO', '959495800', 'LOS CIPRECES 208 PAMPAS DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2835', '1', '2', '40782309', 'REYNA', 'MARAZA', 'SUCAPUCA', '959495800', 'ASENT.H.LA MERCED C 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2836', '1', '2', '40797867', 'GISELA MARIANELA', 'CURO', 'COLQUEHUANCA', '959495800', 'MARCAVALLE J. ALTO LA ALIANZA mz. I lt. 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2837', '1', '2', '40800690', 'EDITH AMPARO', 'MAMANI', 'QUISPE', '959495800', 'CALLE 9 DE OCTUBRE 112', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2838', '1', '2', '40808506', 'ALICIA MARIBEL', 'SUAÑA', 'HUMPIRE', '959495800', 'CALLE NESTOR BATANEROS 126 SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2839', '1', '2', '40814035', 'DORA', 'TRIVEÑO', 'ALFERES', '959495800', 'JOSE SANTOS CHOCANO 203', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2840', '1', '2', '40826229', 'SONIA', 'ESPERILLA', 'TORRES', '959495800', 'EL BUEN PANORAMA mz. U lt. 03', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2841', '1', '2', '40827716', 'MERYLUZ', 'QUISPE', 'HILARIO', '959495800', 'P.JOVEN SAN JUAN DE DIOS O-22 PSJ.SAN ROMAN', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2842', '1', '2', '40836958', 'EUDOCIA', 'PUCHO', 'MAMANI', '959495800', 'BUENA VISTA 107', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2843', '1', '2', '40839199', 'MARILUZ', 'CONDORI', 'CALSINA', '959495800', 'PP.JJ. AMPLIACION PAMPA DEL CUSCO SECTOR I SUB.LT. 15A ZN.A mz. A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2844', '1', '2', '40853362', 'INES', 'CABANA', 'QUISPE', '959495800', 'SAN JUAN 169', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2845', '1', '2', '40875068', 'SERAFINA VIRGINIA', 'COA', 'CABANA', '959495800', 'URB.QUINTA TRISTAN V-2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2846', '1', '2', '40888352', 'ELIA', 'MAMANI', 'MAMANI', '959495800', 'NUEVO JERUSALEN mz. D lt. 09', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2847', '1', '2', '40889282', 'CARMEN ADELA', 'QUISPE', 'ESPETIA', '959495800', 'CALLE PEDRO DIEZ CANSECO 306 SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2848', '1', '2', '40893761', 'GABINA', 'ARIAS', 'PFURA', '959495800', 'FRAY MARTIN DE PORRES mz. M lt. 7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2849', '1', '2', '40893946', 'KARINA MARILYN', 'VASQUEZ', 'SOTO', '959495800', 'URB.SANTA MONICA F-2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2850', '1', '2', '40911265', 'MONICA', 'CALCINA', 'VARGAS', '959495800', 'PP.JJ TIOBAMBA J-5-A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2851', '1', '2', '40916990', 'ALEX GERARDO', 'MAMANI', 'FLORES', '959495800', 'BATANEROS 225 DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2852', '1', '2', '40917015', 'MARTIN PEDRO', 'JARA', 'BRICEÑO', '959495800', 'JR.HORACIO URTEAGA 666', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2853', '1', '2', '40918370', 'SILVIA JENNY', 'FLORES', 'CHURA', '959495800', 'SIGLO XX 227', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2854', '1', '2', '40918664', 'YVAN JESUS', 'VALVERDE', 'MARTINEZ', '959495800', 'MARISCAL NIETO 203A P.J.SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2855', '1', '2', '40939443', 'JULIA', 'MULLISACA', 'LUQUE', '959495800', 'LA MANSION DE SOCABAYA mz. C lt. 20', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2856', '1', '2', '41014481', 'VICENTINA YSABEL', 'VILCA', 'CALLA', '959495800', 'JR.LAMPA 802 ALTO LIBERTAD', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2857', '1', '2', '41027206', 'DOMINGA', 'MAMANI', 'PARI', '959495800', 'ASOC. DE VIV. HERMOSA CAMPIÑA ECOLOGICA mz. C lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2858', '1', '2', '41063881', 'VIRGINIA', 'HANCCO', 'CCAIRA', '959495800', 'CALLE FRANCISCO BOLOGNESIN 203', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2859', '1', '2', '41071387', 'SAYDA', 'ALVAREZ', 'VELASQUE', '959495800', 'FRANCISCO BOLOGNESI COM 6 J. 13 DE AGOSTO mz. O lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2860', '1', '2', '41083810', 'YOHANA ROSALI', 'VASQUEZ', 'MAMANI', '959495800', 'PEDRO DIEZ CANSECO 302 J. SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2861', '1', '2', '41092842', 'LUCILA', 'QUISPE', 'CALDERON', '959495800', 'P.JOVEN 7 DE JUNIO U` 1 ZONA A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2862', '1', '2', '41108177', 'ARTURO EUGENIO', 'GARCIA', 'BARRIOS', '959495800', 'SAN MARTIN 208', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2863', '1', '2', '41120912', 'YENY', 'TOMAYA', 'CHUCTAYA', '959495800', 'TAHUANTINSUYO AMPLIAC. PAMPAS DEL CUZCO mz. M lt. 14', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2864', '1', '2', '41137369', 'JORGE ISAAC', 'CARDENAS', 'VELASQUEZ', '959495800', 'AV.SAN MIGUEL DE PIURA 122 URB.SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2865', '1', '2', '41143073', 'SABINA', 'CUTALUQUE', 'PACHECCA', '959495800', 'CESAR VALLEJO P.J. ALTO ALIANZA mz. M lt. 11', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2866', '1', '2', '41155747', 'JESSICA SANDRA', 'ANCCO', 'HUISA', '959495800', 'AV.UNION 401 P.JOVEN AUGUSTO IREYRE GARCIA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2867', '1', '2', '41156636', 'ALICIA', 'PILCO', 'ESTAÑA', '959495800', 'VIV. EL MIRADOR LAS PEÑAS mz. C lt. 12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2868', '1', '2', '41157224', 'MARUJA', 'QUISPE', 'PALACIOS', '959495800', 'ASOC. DE VIV. EL BUEN PANORAMA MZ E LT 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2869', '1', '2', '41178356', 'REYNA LUZ', 'ACEITUNO', 'JUAREZ', '959495800', 'JR.VILCAPAZA 565', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2870', '1', '2', '41208604', 'ADRIAN', 'ESPERILLA', 'TORRES', '959495800', 'JR.AGROPECUARIA S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2871', '1', '2', '41232756', 'PETTER', 'MOZOMBITE', 'FLORES', '959495800', 'EL TRIUNFO mz. 63 lt. 06', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2872', '1', '2', '41235709', 'MILAGROS', 'HUAMANI', 'ALEJO', '959495800', 'AV.TUPAC AMARU S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2873', '1', '2', '41254295', 'MARIBEL QUINTINA', 'PULCHA', 'SARMIENTO', '959495800', 'AV.LIMA C-25 COOP.EL CARMEN', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2874', '1', '2', '41263329', 'TEODORA', 'IDME', 'IDME', '959495800', 'TAHUANTINSUYO MZ. M LT. 3 AMPL.P. DEL CUZCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2875', '1', '2', '41273499', 'JUANA', 'LLANOS', 'COAQUIRA', '959495800', 'PPJJ. SAN JUAN DE DIOS JR. ZARUMILLA ZN.A MZ.S LT.3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2876', '1', '2', '41291122', 'SONIA MERCEDES', 'MAZA', 'HUANCA', '959495800', 'SANTA MONICA mz. D lt. 7A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2877', '1', '2', '41293444', 'ELIZABETH CARMEN', 'APAZA', 'ACROTA', '959495800', 'P.JOVEN VICTOR ANDRES BELAUNDE J-2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2878', '1', '2', '41293474', 'ELEONORA', 'HUANCA', 'RIVEROS', '959495800', 'FRANCISCO BOLOGNESI 13 AGOSTO mz. C lt. 21', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2879', '1', '2', '41310908', 'MARITZA INES', 'CAIRA', 'AGUIRRE', '959495800', 'AV. TUPAC AMARU MZ E LT 12 ZN. A AMP. PAMPAS DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2880', '1', '2', '41334488', 'KELLY', 'RIOS', 'GUILLEN', '959495800', 'CALLAO mz. W lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2881', '1', '2', '41404827', 'JULIO AURELIO', 'HITO', 'PARI', '959495800', 'P.JOVEN A.FREYRE N-3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2882', '1', '2', '41417191', 'GLORIA ANA', 'ÑAUPA', 'CONDORI', '959495800', 'P.JOVEN CAMPO MARTE Q 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2883', '1', '2', '41424077', 'ROSA EDELMIRA', 'CHAHUARA', 'PARARI', '959495800', '28 DE JUNIO 304 URB.DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2884', '1', '2', '41448617', 'JUAN HECTOR', 'CRUZ', 'QUISPE', '959495800', 'AV.TAHUANTINSUYO A-20 AMP.PAMPA DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2885', '1', '2', '41472626', 'IRMA', 'HUALLPA', 'CONDORI', '959495800', 'MARISCAL NIETO 406 SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2886', '1', '2', '41493292', 'BARTOLOME WILFREDO', 'VILCA', 'ORDOÑEZ', '959495800', 'AV.TAHUANTINSUYO K-5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2887', '1', '2', '41519142', 'SOFIA', 'APAZA', 'AMANQUI', '959495800', 'P. JOVEN LEONES DEL SUR O-3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2888', '1', '2', '41519376', 'MARIA ELENA', 'SANCHEZ', 'ESCOBEDO', '959495800', 'UPIS AMPLIACION LA MERCED etapa II mz. J lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2889', '1', '2', '41547789', 'LOURDES GLADYS', 'AVALOS', 'VILCA', '959495800', 'GUATEMALA S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2890', '1', '2', '41549750', 'DANNY AGUSTIN', 'GONZALES', 'CUNO', '959495800', 'CALLE 28 DE JUNIO 104', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2891', '1', '2', '41583032', 'YOLANDA', 'CASTILLO', 'ALIAGA', '959495800', 'CALLE ARICA 116 P. JOVEN DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2892', '1', '2', '41592436', 'NARBAY JAVIER', 'MAMANI', 'GUTIERREZ', '959495800', 'AMPLC.PAMPAS DEL CUZCO MZ.B LT.5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2893', '1', '2', '41627563', 'HILDA LIZBETH', 'AVALOS', 'CONDORI', '959495800', 'MOQUEGUA 108 C. P. M. TASSA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2894', '1', '2', '41646037', 'YOVANA CLARIBEL', 'HERNANDEZ', 'GUERRA', '959495800', 'BARRIO LOS MENDOZA F-2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2895', '1', '2', '41647156', 'CONSUELO ROSA', 'CARREON', 'MAMANI', '959495800', 'OLLANTAYTAMBO D-5 AMP P. DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2896', '1', '2', '41654607', 'ALBERTO', 'QUISPE', 'VILCA', '959495800', 'AV. UNION 304 P. JOVEN AUGUSTO FREYRE GARCIA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2897', '1', '2', '41684766', 'VANESSA ROSA', 'ORTIZ', 'CONDORI', '959495800', 'PT. PAMPA DEL CUSCO ZONA A mz. A4 lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2898', '1', '2', '41695796', 'LIDIA', 'LLAVILLA', 'CCARI', '959495800', 'PUCARA mz. X1 lt. 7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2899', '1', '2', '41705694', 'GLADIS NOELIA', 'ONOFRE', 'PANIHUARA', '959495800', 'ASC. AA.HH. LA MANSION 2 DE SOCABAYA MZ. D LT. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2900', '1', '2', '41711067', 'LUZ MARINA', 'PAJA', 'TICONA', '959495800', 'COM.CUCHO YANAOCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2901', '1', '2', '41738556', 'PERCY NAZARIO', 'VILCA', 'AGUILAR', '959495800', 'LA MANSION 2 DE SOCABAYA mz. J lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2902', '1', '2', '41745688', 'JULIA', 'CCAPA', 'HUANCCO', '959495800', 'SANTA MONICA mz. C lt. 7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2903', '1', '2', '41776766', 'CARLOS ALBERTO', 'SUERO', 'LAIME', '959495800', 'CALLE MAYTACAPAC MZ.L LT.3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2904', '1', '2', '41787694', 'MARIA ELENA', 'CONDORI', 'QUILCA', '959495800', 'COOP. LOS BALCONES A-5 CALLE PEDRO P. DIAZ', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2905', '1', '2', '41838806', 'HERMELINDA MARUJA', 'PAYE', null, '959495800', 'PJ. AMPL. PAMPAS DEL CUZCO CALLE CORICANCHA mz. N lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2906', '1', '2', '41849179', 'SILVIA ANA MARIA', 'HUAMALI', 'QUISPE', '959495800', 'CALLE MANCO CAPAC D-14', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2907', '1', '2', '41885544', 'ROXANA HERMELINDA', 'CALSINA', 'YUCRA', '959495800', 'CHUCAHUACAS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2908', '1', '2', '41903409', 'RAUL', 'PARILLO', 'CALATAYUD', '959495800', 'M. MELGAR 105', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2909', '1', '2', '41908883', 'ELIZABETH', 'VALENZUELA', 'PEREYRA', '959495800', 'C.P.UNGARA MZ.A LT.10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2910', '1', '2', '41953484', 'MARYORI YESSICA', 'CHAUCA', 'PONCE', '959495800', 'C.H. NICOLAS DE PIEROLA BLOCK A3 DPTO. 16 ETAPA II', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2911', '1', '2', '41960618', 'JESUS MARCOS', 'CORNEJO', 'VILLANUEVA', '959495800', 'LEON DEL SUR D-25', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2912', '1', '2', '41972469', 'ELISEO', 'RAMOS', 'UNZUETA', '959495800', 'MARISCAL ANDRES AVELINO CACERES PPJJ ALTO ALIANZA mz. D lt. 17', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2913', '1', '2', '42005639', 'YOLANDA', 'CHARA', 'CASTRO', '959495800', 'AV. SAN MARTIN 807', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2914', '1', '2', '42008696', 'KARINA SANDRA', 'UMPIRI', 'NEYRA', '959495800', 'CALLE RAUL PORRAS BARRENECHEA 317', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2915', '1', '2', '42011527', 'MARISOL', 'LLANCHIPA', 'PAREDES', '959495800', 'LA MANSION DE SOCABAYA II mz. I lt. 9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2916', '1', '2', '42031311', 'MARTIN WILFREDO', 'FLORES', 'QUEQUE', '959495800', 'AYACUCHO 850', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2917', '1', '2', '42045420', 'ANA CECILIA', 'CARRILLO', 'MAMANI', '959495800', 'BUENOS AIRES 603', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2918', '1', '2', '42083296', 'GIORGINA', 'HUARILLOCLLA', 'CHOQUE', '959495800', 'ZARUMILLA S-3 SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2919', '1', '2', '42103731', 'ANALIZ MARY', 'MAMANI', 'PARICANAZA', '959495800', 'P. JOVEN LEON DEL SUR MZ.B-7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2920', '1', '2', '42114734', 'MARIA ISABEL', 'SONCCO', 'JARA', '959495800', 'ASOCIACION DE VIVIENDA VILLA FLORIDA PRO-UNIFICACION mz. E lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2921', '1', '2', '42141715', 'JHON PAUL', 'CALLUCHI', 'AROCUTIPA', '959495800', 'AV. TUPAC AMARU 507-B ZONA C C. MARTE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2922', '1', '2', '42157690', 'MIRIAN LULY', 'OLGADO', 'LLAVILLA', '959495800', 'MIGUEL GRAU M-6 AUGUSTO FREYRE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2923', '1', '2', '42169176', 'BASILIA', 'PARI', 'MENDOZA', '959495800', 'AMP. P. CUZCO URUBAMBA 19', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2924', '1', '2', '42198964', 'YANETH ELIANA', 'QUISCA', 'CHARCA', '959495800', 'CALLE LOS ROSALES 113 DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2925', '1', '2', '42202297', 'ELMER MILTON', 'PUMA', 'CARDENAS', '959495800', 'CALLE OLLANTAY - LL - 10- AMPL. PAMPAS DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2926', '1', '2', '42225744', 'JAEL RAQUEL', 'SALAS', 'CHIPA', '959495800', 'LOS CIPRECES D-7 SAN ISIDRO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2927', '1', '2', '42226180', 'YOVANA EDITH', 'CHARCA', 'FLORES', '959495800', 'ASH JUAN PARRA DEL RIEGO mz. F lt. 15', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2928', '1', '2', '42259853', 'EDITH', 'HANCCO', 'DEZA', '959495800', 'JR. 9 DE OCTUBRE 232', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2929', '1', '2', '42267159', 'JAKELINE YONELDA', 'VILCARANI', 'ARIAS', '959495800', 'COOP. ANDRES AVELINO CACERES A-2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2930', '1', '2', '42313214', 'ROSA', 'QUISPE', 'HUACASI', '959495800', 'SAN VALENTIN SANTA MARTHA mz. C lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2931', '1', '2', '42327328', 'MIRIAM JUDITH', 'CALDERON', 'HUAYTA', '959495800', 'LAS PEÑAS B-8 A SAN JUAN BAUTISTA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2932', '1', '2', '42334562', 'MARIA NANCY', 'TURPO', 'MAMANI', '959495800', 'AV. SAN MIGUEL DE PIURA P-4 P. JOVEN SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2933', '1', '2', '42373306', 'ANGELA', 'CHIPANA', 'CORIMAYA', '959495800', 'UPIS PAISAJISTA mz. B lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2934', '1', '2', '42392728', 'ANGELICA MARIA', 'ZEGARRA', 'ZUÑIGA', '959495800', 'AV. JUSTICIA 403', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2935', '1', '2', '42464591', 'ANTONIO', 'GUZMAN', 'CONDORI', '959495800', 'AH. LA MANSION DE SOCABAYA mz. D lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2936', '1', '2', '42479158', 'JUAN', 'MAMANI', 'CAHUINA', '959495800', 'VILLA SAN ISIDRO C-2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2937', '1', '2', '42505946', 'INOSENCIA', 'QUISPE', 'BURGOS', '959495800', 'COOP. A.A. CACERES J-1B', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2938', '1', '2', '42512216', 'PEDRO PABLO', 'TORRES', 'CHAMBI', '959495800', 'PRO.VIV. CIUDAD NUEVA mz. J lt. 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2939', '1', '2', '42530020', 'CARMEN LISBETH', 'BALLON', 'ROZAS', '959495800', 'PJ. LEON DEL SUR B - 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2940', '1', '2', '42548336', 'HELAR', 'CCALLASACA', 'DE LA CRUZ', '959495800', 'AH SANTA MARTHA PSJE LAS PEÑAS mz. G lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2941', '1', '2', '42554019', 'BENILDA', 'VIVEROS', 'HUAMAN', '959495800', 'P.J. 13 DE MAYO mz. A lt. 11', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2942', '1', '2', '42562716', 'ENRIQUE', 'GUTIERREZ', 'RAMOS', '959495800', 'COMUNIDAD COLQUEMARCA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2943', '1', '2', '42627076', 'MARIA VANESSA', 'LAZO', 'CORASI', '959495800', 'CALLE CORDOVA 120', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2944', '1', '2', '42631556', 'AMANDA', 'QUISPE', 'CONDORI', '959495800', 'AVIS EL MISTIANO A-4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2945', '1', '2', '42631564', 'NELIDA YADINI', 'QUISPE', 'CAHUANA', '959495800', 'CALLE BUENA VISTA 221', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2946', '1', '2', '42663301', 'YESSICA', 'ESCALANTE', 'HUARACA', '959495800', 'COOP. ANDRES A. CACERES - D - 11', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2947', '1', '2', '42664650', 'WILMER', 'NINA', 'CONDORI', '959495800', 'COM. 4 LA MERCED mz. M lt. 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2948', '1', '2', '42681398', 'RUTH MAGALY', 'CAIRA', 'MAMANI', '959495800', 'AV TAHUANTINSUYO I-1 AMPLIACION P DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2949', '1', '2', '42686218', 'JOISY ROSALYN AMALIA', 'CUSACANI', 'VILCA', '959495800', 'REVOLUCION MZ. S LT. 3 ANDRES A. CACERES', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2950', '1', '2', '42690768', 'RAUL', 'CCASA', 'CONDORI', '959495800', 'LEON DEL SUR B-28', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2951', '1', '2', '42704682', 'BELEN', 'PHOCCO', 'SUPHO', '959495800', 'COMUNIDAD CCOLLANA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2952', '1', '2', '42720669', 'CELIA MARCELA', 'APAZA', 'RAMOS', '959495800', 'CALLE AYAVIRI A-11 P.JOVEN SAN JUAN BAUTISTA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2953', '1', '2', '42749103', 'LAYSA DENIA', 'HUAMAN', 'PACOMPIA', '959495800', 'URB. LOS BOSQUES MZ-A LT-23', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2954', '1', '2', '42805916', 'ALAN ALVARO', 'FLORES', 'HUAMANI', '959495800', 'CALLE JUAN PABLO II I-7 CTE.A PJ.13 DE AGOSTO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2955', '1', '2', '42822494', 'MARIBEL LOURDES', 'ARIAS', 'PARI', '959495800', 'PJ AUGUSTO FREYRE MZ D LT 6 CALLE LOS ROSALES', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2956', '1', '2', '42835286', 'LIZ KAROL', 'TRUJILLO', 'COAQUIRA', '959495800', 'CALLE COLINADANTES 5 A EL MISTIANO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2957', '1', '2', '42851758', 'NATALIA', 'BENAVENTE', 'APAZA', '959495800', 'DESVIO SAMAN', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2958', '1', '2', '42866145', 'MARIZOL MAGALI', 'QUISPE', 'COLCA', '959495800', 'ASENT. H. LEON DEL SUR F-11', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2959', '1', '2', '42876876', 'EDITH GABRIELA', 'GARCIA', 'CUSI', '959495800', 'URUGUAY 400', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2960', '1', '2', '42950368', 'JUSTINA', 'VILCA', 'MUÑOZ', '959495800', 'PJ.ALTO LA ALIANZA U1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2961', '1', '2', '42976191', 'YURGUEN', 'HILARIO', 'GAMARRA', '959495800', 'PUEBLO CHAMACA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2962', '1', '2', '42997016', 'CARLA GIOVANNA', 'HUAMANI', 'QUISPE', '959495800', 'PJ. ALTO ALIANZA S-13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2963', '1', '2', '43002060', 'LUZ MARINA', 'MAMANI', 'MAMANI', '959495800', 'PJ. SAN JUAN DE DIOS JR. UCAYALI 130', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2964', '1', '2', '43050786', 'JHANET', 'VALENCIA', 'PAMPA', '959495800', 'URB.LOS INCAS G-19', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2965', '1', '2', '43074110', 'MARTHA AMELIA', 'VARGAS', 'CORIMANYA', '959495800', 'URB. BARRIOS ALTOS MZ-K LT-3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2966', '1', '2', '43132225', 'ALICIA', 'BUSTINCIO', 'MAMANI', '959495800', 'URB FRAY MARTIN DE PORRES H-4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2967', '1', '2', '43132614', 'SANTIAGO', 'CECINARIO', 'VALERIANO', '959495800', 'P JOVEN LA MERCED MZ N LT 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2968', '1', '2', '43156904', 'ROCIO SANDRA', 'QUISPE', 'ALFEREZ', '959495800', 'ARIAS ARAGUEZ C-9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2969', '1', '2', '43179710', 'ROSA SOLEDAD', 'ZAPATA', 'APAZA', '959495800', 'UPIS PAISAJISTA mz. I lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2970', '1', '2', '43216550', 'NELIDA AISA', 'DELGADO', 'CHAVEZ', '959495800', 'EL NAZARENO mz. E lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2971', '1', '2', '43263907', 'ROXANA', 'GASPAR', 'RODRIGUEZ', '959495800', 'JR. GONZALES PRADA S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2972', '1', '2', '43265054', 'SUSANA ALBINA', 'YAURI', 'ALVAREZ', '959495800', 'AV. EL SOL 231 DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2973', '1', '2', '43268099', 'JULIA CLOTILDE', 'HUAMANI', 'BALTAZAR', '959495800', 'LA MANSION DE SOCABAYA K-9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2974', '1', '2', '43283960', 'ROCIO MARLENE', 'QUINCHO', 'CHUCTAYA', '959495800', 'ANDRES AVELINO CACERES T-6 COOP.ANDRES AVELINO CACERES', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2975', '1', '2', '43290497', 'FRANCISCA', 'CALAPUJA', 'CONDORI', '959495800', 'SANTA MONICA D-4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2976', '1', '2', '43357327', 'FREDY', 'MAMANI', 'ALEJO', '959495800', 'AV FRANCISCO BOLOGNESI O-1 URB 13 DE AGOSTO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2977', '1', '2', '43360861', 'SIRENIA YESENIA', 'ARANCIBIA', 'PINEDA', '959495800', 'AV PAISAJISTA A2-2 PAMPAS DEL CUSCO ZONA A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2978', '1', '2', '43373878', 'FLORA', 'SUCLLE', 'ALCCA', '959495800', 'JOSE CARLOS MARIATEGUI 211 J. SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2979', '1', '2', '43380056', 'FELICITAS', 'CALLATA', 'IÑO', '959495800', 'MARIA PARADO DE BELLIDO C-2 13 DE AGOSTO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2980', '1', '2', '43494179', 'LEYDI ROXANA', 'LIZARVE', 'FLORES', '959495800', 'CALLE MADRE DE DIOS 109 SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2981', '1', '2', '43502528', 'YANET MARILU', 'QUINTANILLA', 'BUSTAMANTE', '959495800', 'AV. ANDRES AVELINO CACERES E-13 ALTO LA ALIANZA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2982', '1', '2', '43518909', 'ANA MARIA', 'QUISPE', 'TACO', '959495800', 'PSJ. SAN ROMAN O - 22 PJ. SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2983', '1', '2', '43546575', 'RAMIRO RAUL', 'ROJAS', 'PILLACA', '959495800', 'AV. TAHUANTINSUYO MZ-F LT-8 CMTE-5 AMPLIAC. PAMPAS DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2984', '1', '2', '43592053', 'DINA', 'BARACO', 'MAMANI', '959495800', 'UNION 111 P.J. DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2985', '1', '2', '43612501', 'JANINA', 'QUISPE', 'ANCO', '959495800', 'VILL.PAISAJISTA mz. C lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2986', '1', '2', '43615997', 'GRACIELA NOEMI', 'MAMANI', 'COLCA', '959495800', 'MODULO C SECTOR 2 MAJES mz. A-2 lt. 01', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2987', '1', '2', '43617033', 'ELSA SOFIA', 'SURCO', 'FLORES', '959495800', 'BARRIO SANTA ROSA CALLE NUEVA BAJA 403', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2988', '1', '2', '43631727', 'DOMITILA', 'ROQUE', 'RAMOS', '959495800', 'VILLA LA POSADA mz. A lt. 11', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2989', '1', '2', '43640890', 'CARMEN MARITZA', 'PATRICIO', 'HANCCO', '959495800', 'PEDRO DIEZ CANSECO 317 SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2990', '1', '2', '43645364', 'MARIELA', 'COLCA', 'MIRANDA', '959495800', 'CESAR VALLEJO MZ-P LOT-1P.J.ALTO ALIANZA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2991', '1', '2', '43648168', 'LUZ MARIA', 'CACERES', 'HUANCA', '959495800', 'CALLE UNION MZ I LT 5 URB VISTA ALEGRE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2992', '1', '2', '43755936', 'ANGELO RAFAEL', 'UTURUNCO', 'MUÑOZ', '959495800', 'P.JOVEN 13 DE MAYO C-6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2993', '1', '2', '43851238', 'DILCIA', 'BURGOS', 'TARRILLO', '959495800', 'JR.LERCHER S/N URB.OXAPAMPA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2994', '1', '2', '43930843', 'CELIA', 'TORRES', 'PONGO', '959495800', 'COM. PAHAMAYA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2995', '1', '2', '43936578', 'CLACILDA', 'VERA', 'MENDOZA', '959495800', 'COM LLUTO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2996', '1', '2', '44000405', 'JULIA MARINA', 'GIRON', 'COYURE', '959495800', 'ANDAMARCA 185 TAHUANTINSUYO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2997', '1', '2', '44077341', 'EMPERATRIZ', 'CHINO', 'CHILLPA', '959495800', 'UPIS AMPLIACION LA MERCED mz. K lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2998', '1', '2', '44095122', 'DIANA ANALI', 'CASTILLO', 'SUCARI', '959495800', '13 DE MAYO I-7 ZONA A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('2999', '1', '2', '44111809', 'PIO WILBER', 'COYLA', 'QUISPE', '959495800', 'PJ AUGUSTO FREYRE D-11 PASAJE CARBAJAL', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3000', '1', '2', '44143190', 'CRISTIAN ROLO', 'NIEBLES', null, '959495800', 'GAMANIEL CHURATA C1 - 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3001', '1', '2', '44176546', 'BLANCA GEORGINA', 'QUISPE', 'CCAPA', '959495800', 'VIÑA DEL MAR 906 AH SEÑOR DE LOS MILAGROS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3002', '1', '2', '44232074', 'PASTORA', 'SIERRA', 'GONZALES', '959495800', 'PT. CHILPINILLA CALLE BENIGNO BALLON FARFAN 103', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3003', '1', '2', '44233702', 'MARIA PAMELA', 'HUAMANI', 'CHOQUE', '959495800', 'MODULO A SECTOR 3 CIUDAD MAJES mz. C-01 lt. 4A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3004', '1', '2', '44287636', 'ELGA LILIANA', 'QUISPE', 'COSI', '959495800', 'ESPINAR MZ. B LT. 17 AMPL. P DEL CUZCO SEC. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3005', '1', '2', '44321592', 'ROSALIA SOLEDAD', 'CALSIN', 'CARI', '959495800', 'SACSAYHUAMAN MZ R LT 5 ZONA A AMPLIACION PAMPAS DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3006', '1', '2', '44343926', 'RAMON', 'QUISPE', 'GONZALO', '959495800', 'ATICO 215 J.SEÑOR DE LOS MILAGROS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3007', '1', '2', '44370907', 'JOSE MIGUEL', 'FERNANDEZ', 'PEREZ', '959495800', 'CASERIO LA RAYA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3008', '1', '2', '44375761', 'ROSARIO GEOVANNA', 'CHURA', 'MAMANI', '959495800', 'AMPLC CIUDAD NUEVA MZ 181 LT 2 COMITE 46', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3009', '1', '2', '44392677', 'ALICIA FLORENTINA', 'QUISCA', 'TITO', '959495800', 'VINATEA REYNOSO LEON DEL SUR mz. K lt. 26', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3010', '1', '2', '44421685', 'RUBEN', 'ROJAS', 'QUISPE', '959495800', 'VALLE YALAQUE LA CAPILLA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3011', '1', '2', '44423813', 'ANA MARIA', 'CABRERA', 'BERNAL', '959495800', 'CALLE BUENA VISTA 104', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3012', '1', '2', '44491411', 'VERONICA', 'CASTRO', 'PINTO', '959495800', 'ALFONSO UGARTE S/N EST.3 CRUCES', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3013', '1', '2', '44496292', 'YAMILI LISBETH', 'BUSTINZA', 'GALLEGOS', '959495800', 'P. JOVEN AUGUSTO FREYRE N-11 PSJ. HUASCAR', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3014', '1', '2', '44507816', 'BRIGITTE DELIZ', 'MONTEAGUDO', 'PINEDA', '959495800', 'P.JOVEN 13 DE AGOSTO B-16 AV.FRANCISCO BOLOGNESI', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3015', '1', '2', '44537319', 'MARIA', 'PACOMPIA', 'MAMANI', '959495800', 'P. JOVEN AMPLIC. PAMPAS DEL CUSCO ZN.A P-9 AV. TAHUANTINSUYO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3016', '1', '2', '44550020', 'MARCELA', 'VILCA', 'HUANCA', '959495800', 'CALLE TUPAC YUPANQUI LL-2 AMP. PAMPAS DEL CUSCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3017', '1', '2', '44550059', 'CARLOS ALBERTO', 'MAMANI', 'QUISPE', '959495800', 'EL MIRADOR DE JESUS A-15', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3018', '1', '2', '44557975', 'LUZ MARINA IRMA', 'MOLLO', 'CONDO', '959495800', 'LA MERCED B-5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3019', '1', '2', '44634293', 'HILDA LUZMILA', 'ARAPA', 'QUISPE', '959495800', 'ASOC. VILLA PARAISO HUASACACHE MZ. E LT. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3020', '1', '2', '44655420', 'DIANA CINTHYA', 'TACO', 'CHIPANA', '959495800', 'UPIS SAN JUAN BAUTISTA F-7 CALLE ALFONSO UGARTE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3021', '1', '2', '44658329', 'LEYLA MARLUBE', 'LOPEZ', 'QUISPE', '959495800', 'CONCEPCION ARIAS ARAGUEZ mz. E lt. 9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3022', '1', '2', '44674295', 'NOEMI ROSARIO', 'GABRIEL', 'HUANCA', '959495800', 'PALM JR ICA C-12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3023', '1', '2', '44702132', 'MARIA SOLEDAD', 'HUAMANI', 'CONDORI', '959495800', 'EVARISTO GOMEZ SANCHEZ LAS MALVINAS mz. J3 lt. 19', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3024', '1', '2', '44746171', 'RUTH YENI', 'APAZA', 'GOYZUETA', '959495800', 'JR. MARAÑON D2-20 URB. SANTA CELEDONIA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3025', '1', '2', '44809354', 'ELIZABETH VANESA', 'CONTRERAS', 'MAITA', '959495800', 'CALLE UNION 300 AUGUSTO FREYRE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3026', '1', '2', '44809905', 'ELIZABETH DANIA', 'BUTRON', 'YANA', '959495800', 'ANEXO MAMAS S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3027', '1', '2', '44812997', 'JUDITH TANIA', 'MAMANI', 'LAURA', '959495800', 'JOSE OLAYA BLOCK C TDA.3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3028', '1', '2', '44826541', 'FRANCISCA', 'PAXI', 'AVENDAÑO', '959495800', 'LA AMISTAD S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3029', '1', '2', '44835360', 'MARIA JESSENIA', 'ZEA', 'RANILLA', '959495800', 'AA.HH.LEON DEL SUR CALLE ALBERTO HIDALGO MZ.E LT.1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3030', '1', '2', '44845561', 'MAYDIEVI HONEIDA', 'SILVA', 'QUISPE', '959495800', 'CALLE TUPAC AMARU MZ.D LT.9 13 DE AGOSTO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3031', '1', '2', '44847244', 'ERIKA MARTHA', 'CAHUASCANO', 'QUISPE', '959495800', 'P. JOVEN AMPLIC PAMPAS DEL CUSCO ZONA A MZ-S LT-6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3032', '1', '2', '44853647', 'MARINA', 'PUMACCAJIA', 'AGUILAR', '959495800', 'UPIS.PAISAJISTA MZ.B LT.3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3033', '1', '2', '44909774', 'RUTH CRISTINA', 'MONTALVO', 'CASTRO', '959495800', 'CALLE COMERCIO S/N SECOCHA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3034', '1', '2', '44913609', 'YESSICA ROSARIO', 'CORAHUA', 'LARICO', '959495800', 'ANEXO EL CASTILLO mz. B lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3035', '1', '2', '44949281', 'GINA DEYLITH', 'AQUITUARI', 'PACAYA', '959495800', 'CASERIO MANACAMIRI RIO NANAY', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3036', '1', '2', '44962153', 'EULALIA', 'JUÑO', 'HUAYHUA', '959495800', 'COMUNID.CAMPESINA PACHUCANI S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3037', '1', '2', '44965405', 'FRANCISCO', 'PIZANGO', 'NAPO', '959495800', 'BETANIA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3038', '1', '2', '44966383', 'ELSA LUISA', 'VILCA', 'VERA', '959495800', 'UPIS AMPLIACION LA MERCED mz. F lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3039', '1', '2', '45024246', 'LUZ MARINA', 'ÑAUPA', 'MAMANI', '959495800', 'LIBERTAD S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3040', '1', '2', '45076879', 'MARIBEL', 'GALLEGOS', 'PUMA', '959495800', 'UPIS PAISAJISTA MZ.Ñ LT.16', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3041', '1', '2', '45086670', 'RUTH MARIBEL', 'CHOQUETICO', 'YAPU', '959495800', 'PPJJ.ALTO ALIANZA AV.ANDRES AVELINO CACERES E-16', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3042', '1', '2', '45099864', 'NANCY IRENE', 'IBIAS', 'LOPEZ', '959495800', 'CC.NN. SANTA ROSA DE KITERIARO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3043', '1', '2', '45114106', 'JACKELINE EUGENIA', 'VERA', 'HUAMANI', '959495800', 'VILLA UNION W-12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3044', '1', '2', '45115086', 'ISABEL RUTH', 'SUCAPUCA', 'MAMANI', '959495800', 'P.J. 13 DE AGOSTO MZ.K LT.6 PSJE.SANTA ROSA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3045', '1', '2', '45126923', 'MARCO ANTONIO', 'CANAZA', 'FLORES', '959495800', 'MARISCAL NIETO 302 P.JOVEN SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3046', '1', '2', '45227660', 'NURY', 'COAQUIRA', 'PINTO', '959495800', 'SANTA MONICA mz. B lt. 7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3047', '1', '2', '45295105', 'DIANA NATALIA', 'TOHALINO', 'RIOS', '959495800', 'APVIS. LA FLORIDA CALLE LA FLORIDA 202 mz. F lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3048', '1', '2', '45332455', 'LUISA', 'CASTILLO', 'PATIÑO', '959495800', 'ASOCIACION VIRGEN DEL ROSARIO MZ 156 LT 5 UCHUMAYO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3049', '1', '2', '45344212', 'CLAUDIANA', 'PACUALA', 'JAVIER', '959495800', 'AH HELBERT SAMALVIDES CA LAS PARRAS D-', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3050', '1', '2', '45346099', 'YENY YUDY', 'YANA', 'PARICELA', '959495800', 'UPIS FRAY MARTIN DE PORRAS F-6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3051', '1', '2', '45370360', 'YESENIA', 'RAMOS', 'PORTUGAL', '959495800', 'AA.HH.LA MERCED I-10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3052', '1', '2', '45398071', 'JANIA', 'MAMANI', 'HUARANCA', '959495800', 'URB. ARIAS ARAGUEZ CALLE MARCAVALLE MZ-D LT-5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3053', '1', '2', '45399000', 'LUZ CATHERINE', 'RAMOS', 'SANCHEZ', '959495800', 'CALLE BUENOS AIRES D-14 UPIS VILLA SEVILLA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3054', '1', '2', '45425081', 'ANTONIA', 'HUARANCCA', 'VERGARA', '959495800', 'J. CORREDORES EL GOLF mz. A lt. 17', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3055', '1', '2', '45529830', 'LOURDES', 'TICONA', 'FERNANDEZ', '959495800', 'ASENT.H. AMPLIACION CAMINOS DEL INCA MZ-A LT-2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3056', '1', '2', '45532825', 'RUTH JEANETH', 'HUAYNAPATA', 'MACHACA', '959495800', 'PPJJ. ALTO SAN JOSE ZON A mz. K lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3057', '1', '2', '45549373', 'LIDIA', 'CHIPA', 'LLALLERCO', '959495800', 'URB. LA LAGUNA CAL. CUZCO S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3058', '1', '2', '45549437', 'LIZBETH ESTEFANY', 'VILLASANTE', 'TICONA', '959495800', 'AUGUSTO FREYRE GARCIA MZ.K LT.10 ZONA A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3059', '1', '2', '45589833', 'MARLENI YUDI', 'VARGAS', 'HUARCAYA', '959495800', 'P.JOVEN AUGUSTO FREIRE GARCIA CAL. EL SOL ZN.A MZ. B LT.12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3060', '1', '2', '45594825', 'MARIA JULIA', 'TOLA', 'RAMOS', '959495800', 'AAHH LA MANSION 2 DE SOCABAYA mz. C lt. 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3061', '1', '2', '45606664', 'EDWIN ARNALDO', 'MONZON', 'SAMILLAN', '959495800', 'JR. VICTOR VELASQUEZ 160', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3062', '1', '2', '45625211', 'JOHAN JOSE', 'ANCCO', 'NINA', '959495800', 'UPIS PAISAJISTA Q-7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3063', '1', '2', '45625229', 'ROSA MARINA', 'MAMANI', 'MAMANI', '959495800', 'LEON DEL SUR CALLE ALBERTO HIDALGO H-6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3064', '1', '2', '45654168', 'HECTOR ORLANDO', 'LARICO', 'MAMANI', '959495800', 'ANDRES AVELINO CACERES mz. C lt. 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3065', '1', '2', '45659848', 'MELIXA', 'RODRIGUEZ', 'MAMANI', '959495800', 'PJ DANIEL ALCIDES CARRION AV. UNION 112', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3066', '1', '2', '45670062', 'LUCY', 'CARLO', 'ANCCORI', '959495800', 'JUAN VELASCO ALVARADO LEON DEL SUR mz. E lt. 17', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3067', '1', '2', '45672729', 'LIZBETH CLAUDIA', 'NEYRA', 'CARHUAS', '959495800', 'VIRGEN DE CHAPI 13 DE AGOSTO mz. P lt. 7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3068', '1', '2', '45716391', 'SONIA MILAGROS', 'HUAMANI', 'ZAMATA', '959495800', 'PP.JJ. SAN JUAN DE DIOS CALLE BELEN 317', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3069', '1', '2', '45782911', 'ELIZABETH CLEMENCIA', 'MAYTA', 'PEREZ', '959495800', 'ASC. PROVIVIENDA PROG. MUNICIPAL FLORA TRISTAN mz. M lt. 09', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3070', '1', '2', '45792668', 'SONIA YANETH', 'VILLARROEL', 'NIEBLES', '959495800', 'P.J. ALTO ALIANZA CA. RICARDO PALMA mz. J lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3071', '1', '2', '45834988', 'MARISOL NELLY', 'MAMANI', 'CARBAJAL', '959495800', 'TAHUANTINSUYO J`-4 AMPLIACION P. DEL CUZCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3072', '1', '2', '45844426', 'ANA CECILIA', 'MAMANI', 'SUCAPOCO', '959495800', 'CALLE SAN JOSE 121', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3073', '1', '2', '45894274', 'ELENA LUCY', 'ITUSACA', 'HUARACHA', '959495800', 'DEAN VALDIVIA J. ALTO LA ALIANZA mz. Q lt. 19', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3074', '1', '2', '45912924', 'GENOVEVA YOLANDA', 'COILA', 'UMIÑA', '959495800', 'JR. CHALANES E-1 URB. SOL DE ORO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3075', '1', '2', '45952004', 'AYDEE', 'SAICO', 'CCOTO', '959495800', 'UCAYALI 207 P.J. SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3076', '1', '2', '45955603', 'ROXANA ERICA', 'HUARACHA', 'NOA', '959495800', 'UPIS PAISAJISTA mz. L lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3077', '1', '2', '45970762', 'ERIKA SOLEDAD', 'PEÑA', 'APAZA', '959495800', 'AV. ANDRES A. CACERES T-7 COOP. A.A.CACERES', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3078', '1', '2', '46001055', 'TIBURCIA', 'VILLAVICENCIO', 'MAMANI', '959495800', 'P.T. PAMPA DEL CUSCO S/N mz. J lt. 14', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3079', '1', '2', '46037973', 'CARI MEDALID', 'CALLO', 'CHEJE', '959495800', 'CP.JACHA PARU', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3080', '1', '2', '46092630', 'JACQUELINE MARGOT', 'BURGOS', 'BAUTISTA', '959495800', 'PP.JJ. SAN JUAN DE DIOS CALLE SANCHEZ CERRO 206', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3081', '1', '2', '46108229', 'FLOR IBET', 'TINTAYA', 'CORDOVA', '959495800', 'SAN GABRIEL mz. A lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3082', '1', '2', '46112954', 'MARITZA', 'QUISPE', 'QUISPE', '959495800', 'CAMINITO VERDE P.J. LOMA VERDE mz. B lt. 9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3083', '1', '2', '46136723', 'JUAN JOSE', 'RUPA', 'NUÑEZ', '959495800', 'URB. ARIAS ARAGUEZ MZ.E LT.12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3084', '1', '2', '46176886', 'VERONICA', 'CONDORCALLO', 'CAPIA', '959495800', 'PARC. CARONI', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3085', '1', '2', '46188665', 'YOBANA JELEN', 'COYLA', 'QUISPE', '959495800', 'PSJ.CARBAJAL ZONA A MZ.D LT.11 P.JOVEN AUGUSTO FREYRE GARCIA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3086', '1', '2', '46222089', 'MARIBEL', 'HUMPIRE', 'PACOMBIA', '959495800', 'UPIS PAISAJISTA MZ-D LT-1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3087', '1', '2', '46230806', 'YAQUELINE PRISELA', 'PACOMPIA', 'MAMANI', '959495800', 'JR. SAN MARTIN 1001 BARRIO TUPAC AMARU', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3088', '1', '2', '46267307', 'SHANNON SUZUI', 'LUNA', 'MENDOZA', '959495800', 'ANDRES AVELINO CACERES mz. Q lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3089', '1', '2', '46269910', 'ISABEL AMERICA', 'PILCO', 'ALTAMIRANO', '959495800', 'MARISCAL ANDRES AVELINO CACERES PJ. ALTO DE LA ALIANZA mz. B lt. 16', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3090', '1', '2', '46286742', 'VICENTINA', 'PELINCO', 'MAMANI', '959495800', 'TAMBO S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3091', '1', '2', '46299218', 'ABEL', 'PUMA', 'VILCA', '959495800', '28 DE JULIO 891 LA TOMILLA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3092', '1', '2', '46310254', 'SANTUSA CLARITA', 'CUTIPA', 'VELASQUEZ', '959495800', 'AAHH LA MANSION DE SOCABAYA mz. A lt. 21', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3093', '1', '2', '46328595', 'FREDY', 'HUALLA', 'MUÑOZ', '959495800', 'COM.CARABAYA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3094', '1', '2', '46342490', 'CARLA PATRICIA', 'YEPEZ', 'VILCA', '959495800', 'JUNIN 12L-13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3095', '1', '2', '46351224', 'ANA', 'CHUCHULLO', 'HUILLCA', '959495800', 'PRINCIPAL 209', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3096', '1', '2', '46397225', 'PETRONILA', 'CHOQUETICO', 'HUANCA', '959495800', 'COMUNIDAD CAMPESINA DE CUCHO AMARU', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3097', '1', '2', '46433529', 'KELLYN FABIOLA', 'CHAMBI', 'APAZA', '959495800', 'LA MANSION DE SOCABAYA mz. L lt. 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3098', '1', '2', '46513612', 'ELIZABETH', 'MOLLO', 'FLORES', '959495800', 'AAHH SEÑOR DE HUANCA mz. C lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3099', '1', '2', '46573799', 'MILAGROS', 'BANDA', 'MEJIA', '959495800', 'ASOCIACION DE VIVIENDA PEREGRINOS DE CHAPI SECTOR 10 mz. M lt. 30', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3100', '1', '2', '46582560', 'ABEL', 'REATEGUI', 'SABOYA', '959495800', 'CARRETERA MARGINAL KM 40', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3101', '1', '2', '46591179', 'ROSA MARIA', 'QUIÑONES', 'CHALLCO', '959495800', 'ATAHUALPA SANTA MARTHA mz. E lt. 12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3102', '1', '2', '46605567', 'YULINDA', 'HUANCA', 'CAIRA', '959495800', 'UNION 111 P.J. DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3103', '1', '2', '46661675', 'KAREN ANDREA', 'CALLOAPAZA', 'LIMA', '959495800', 'ARIAS ARAGUEZ mz. F lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3104', '1', '2', '46662987', 'BENILDA SEGUNDINA', 'PUMA', 'HUANCA', '959495800', 'EL SOL 101 P.J. DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3105', '1', '2', '46673897', 'CANDY JACQUELINE', 'TICONA', 'BEDOYA', '959495800', 'DON JOSE DE SAN MARTIN PJ.13 DE AGOSTO mz. N lt. 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3106', '1', '2', '46703995', 'ALISON KATERIN', 'KANA', 'ALMERON', '959495800', 'MATEO PUMACAHUA JOVEN 13 DE AGOSTO CMT-1 mz. Ñ lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3107', '1', '2', '46719143', 'MARILUZ ANGELICA', 'HILASACA', 'CRUZ', '959495800', 'PJ. AMPL. PAMPA DEL CUSCO ZONA A CALLE CUSCO mz. J lt. 7-A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3108', '1', '2', '46742577', 'MARIA LIZETH', 'TTITO', 'VILCA', '959495800', 'CUZCO PP.JJ. AMPLIACION PAMPAS DEL CUZCO A mz. L lt. 15', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3109', '1', '2', '46756490', 'LUCERO VERONICA', 'BEDOYA', 'CUTIPA', '959495800', 'IRRIGACION SAN CAMILO PJ. SOR ANA DE LOS ANGELES mz. F lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3110', '1', '2', '46790972', 'MELIDA LISET', 'COAQUIRA', 'CARITA', '959495800', 'DE VIVIENDA BUEN PANORAMA mz. C lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3111', '1', '2', '46830210', 'JESSICA HELLEN', 'APAZA', 'GONZALES', '959495800', '28 DE JUNIO 217 P.J. DANIEL ALCIDES CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3112', '1', '2', '46883465', 'MARITZA VIRGINIA', 'APAZA', 'MAMANI', '959495800', 'EL PEDREGAL Z-01', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3113', '1', '2', '46936252', 'ELMER JHERSON', 'POMA', 'MELENDEZ', '959495800', 'CIRCUNVALACION 792', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3114', '1', '2', '46979362', 'NELY', 'ACOSHUANCA', 'PINO', '959495800', 'COOP. EL CARMEN CALLE MIGUEL GRAU mz. A lt. 20', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3115', '1', '2', '46991220', 'DAVID HUGO', 'CHAVEZ', 'QUISPE', '959495800', 'MATEO PUMACAHUA 109 TUPAC AMARU COM 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3116', '1', '2', '47006079', 'JUDY MARY', 'CHURA', 'MAMANI', '959495800', 'UPIS. AMPLIACION LA MERCED mz. F lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3117', '1', '2', '47013930', 'LESLIE ROMINA', 'CANAZAS', 'MONTALVO', '959495800', 'MARCAVALLE ARIAS ARAGUEZ mz. A lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3118', '1', '2', '47093690', 'NELY LIZBET', 'HUALLPA', 'QUISPE', '959495800', 'UPIS PAISAJISTA mz. U lt. 15', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3119', '1', '2', '47104386', 'SONIA LISSET', 'PACSI', 'CHOQUEHUANCA', '959495800', 'PUEBLO LIBRE mz. A lt. 7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3120', '1', '2', '47134355', 'RAQUEL CHARO', 'CONDORI', 'MOROCHARA', '959495800', 'LOS ROSALES S/N J.AUGUSTO FREYRE PAMPAS VIEJAS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3121', '1', '2', '47153173', 'OMAR ADRIAN', 'CASTILLO', 'VALLEJOS', '959495800', 'MZ.28 LT.5 VALLECITO R.P.B.F.CARABAYLLO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3122', '1', '2', '47159182', 'ISABEL', 'CHURA', 'GAMARRA', '959495800', 'P.JOVEN ALTO INCLAN MZ B LT 14-A ETPA. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3123', '1', '2', '47165293', 'MARITSA LUZMILA', 'SARAYASI', 'ALVARO', '959495800', 'MARCAVALLE ARIAS ARAGUEZ mz. A lt. 7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3124', '1', '2', '47196247', 'NELLY GISELA', 'TTITO', 'CONDORI', '959495800', 'PSJ. LAS PALMERAS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3125', '1', '2', '47268292', 'GABRIELA SHIRLEY', 'FLORES', 'SURCO', '959495800', 'ALVAREZ THOMAS 458', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3126', '1', '2', '47335649', 'ANA ROSA', 'TICONA', 'BEDOYA', '959495800', 'HUASCAR J. AUGUSTO FREIRE mz. D lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3127', '1', '2', '47351830', 'ALICIA', 'CORTEZ', 'MEZA', '959495800', 'TUPAC AMARU ZN A COM 7 J.AMPLIACION PAMPAS DEL CUZCO mz. L lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3128', '1', '2', '47402126', 'SONIA LUZMILA', 'TICONA', 'CHOQUELUQUE', '959495800', 'CALLE CARTAGENA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3129', '1', '2', '47409605', 'ELIZABETH', 'PAREDES', 'CHIPANA', '959495800', 'JESUS ZONA C COMITE 22 J. CIUDAD BLANCA mz. R lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3130', '1', '2', '47503862', 'SILVIA', 'ZAPATA', 'HUAYNATES', '959495800', 'CIRO ALEGRIA ANDRES AVELINO CACERES mz. T lt. 15', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3131', '1', '2', '47511442', 'YENE', 'CONDORI', 'MAMANI', '959495800', 'NESTOR BATANERO 114 J. SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3132', '1', '2', '47512168', 'BEATRIZ MAXIMILIANA', 'CUTIPA', 'VELASQUEZ', '959495800', 'VILLA PARAISO HUASACACHE mz. C lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3133', '1', '2', '47575346', 'MAGDALENA', 'GUZMAN', 'GARCIA', '959495800', 'ASOC.SANTA MONICA mz. K lt. 5-A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3134', '1', '2', '47577657', 'DIANA CAROLINA', 'ZAVALA', 'CORNEJO', '959495800', 'VIA PAISAJISTA 177 mz. K lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3135', '1', '2', '47646025', 'PEDRO', 'OCHAVANO', 'NUNTA', '959495800', 'COMUNID. NATVIA CONSHAMAY', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3136', '1', '2', '47647286', 'SOLEDAD CARMEN', 'QUISPE', 'MAMANI', '959495800', 'PPJJ AMPLIACION PAMPAS DEL CUZCO CALLE SACSAYHUAMAN COM 2 MZ. G LT. 2 ZO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3137', '1', '2', '47694546', 'MARYCRUZ YERALIN', 'PARANCO', 'SANCHEZ', '959495800', 'P.J. 13 DE AGOSTO mz. P lt. 12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3138', '1', '2', '47696868', 'GLORIA', 'MOLINA', 'UGARTE', '959495800', 'CENTRO POBLADO D4 JUAN VELASCO MAJES mz. R5 lt. 13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3139', '1', '2', '47766684', 'VIKI', 'SONCCO', 'CALAPUJA', '959495800', 'HUASCAR COM.6 J. AMPLIACION PAMPAS DEL CUZCO mz. E lt. 9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3140', '1', '2', '47806322', 'LUZ MERY', 'HUALLPA', 'ACHAHUE', '959495800', 'MICAELA BASTIDAS COM.3 J. 13 DE AGOSTO mz. G lt. 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3141', '1', '2', '47827083', 'ROSMERY', 'VEGA', 'COAQUIRA', '959495800', 'LA MERCED mz. K lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3142', '1', '2', '47955529', 'ISABEL', 'MAMANI', 'CHUA', '959495800', 'EL BUEN PANORAMA mz. W lt. 05', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3143', '1', '2', '47966524', 'GREY MARIANA', 'SUAREZ', 'PINEDA', '959495800', 'LA HABANA 139', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3144', '1', '2', '48036814', 'JHONATAN', 'MAMANI', 'TIPULA', '959495800', 'AH. SANTA MARTHA PSJ. LOS INCAS mz. E lt. 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3145', '1', '2', '48087464', 'KAREN STHEFFANY', 'CHAMBILLA', 'PAUCAR', '959495800', 'VICTOR ANDRES BELAUNDE 305 CMTE-6 mz. I lt. 11', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3146', '1', '2', '48118785', 'MILDER LUZ', 'QUISPE', 'MENDOZA', '959495800', 'PAISAJISTA 28 DE JULIO mz. F lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3147', '1', '2', '48222543', 'YOLANDA', 'CUCHAMA', 'HUAMAN', '959495800', 'VENEZUELA 221', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3148', '1', '2', '48302836', 'ROXANA', 'FUTURI', 'QUISINI', '959495800', 'LA MANSION 2 DE SOCABAYA mz. O lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3149', '1', '2', '48303778', 'MILAGROS', 'YEPEZ', 'VILCA', '959495800', 'LEONCIO PRADO S/N JOVEN AUGUSTO FREYRE ZN-A mz. M lt. 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3150', '1', '2', '48622379', 'NELIA OFELIA', 'QUISPE', 'CONDORI', '959495800', 'SAN ROMAN J. SAN JUAN DE DIOS SUBLT. B mz. I lt. 12', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3151', '1', '2', '48763511', 'INES MARLENI', 'PUMA', 'HUANCA', '959495800', 'ASENTAMIENTO POBLACION ASOSIACION DE INTERES SOCIAL DEAN VALDIVIA mz. A lt. 9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3152', '1', '2', '48764890', 'NORCA WILFRIDA', 'APAZA', 'COAQUIRA', '959495800', 'PARC. VILLA PAJCHA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3153', '1', '2', '48899252', 'MIRIAM DANI', 'TURPO', 'HUANCA', '959495800', 'PERU LA PAMPILLA S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3154', '1', '2', '48981323', 'EDWIN CHARLES', 'PALOMINO', 'AGUILAR', '959495800', 'PUEBLO TRAD. MORRO DE ARICA mz. D lt. 08', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3155', '1', '2', '60416752', 'MARIA ROSA', 'CHECYA', 'SUPA', '959495800', 'ANEXO DE HUACTAPA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3156', '1', '2', '61460808', 'LUIS ENRIQUE', 'SALAZAR', 'CACERES', '959495800', 'UPIS PAISAJISTA mz. F lt. 11-A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3157', '1', '2', '70172152', 'YOVANITA', 'VELASQUE', 'MITMA', '959495800', 'ATAHUALPA S/N PERIFERIE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3158', '1', '2', '70215106', 'MICHAEL JAZMANI', 'QUISPE', 'NAYRA', '959495800', 'JR. VISTA ALEGRE 154 BR. JAE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3159', '1', '2', '70274270', 'EDITH', 'ESPERILLA', 'TORRES', '959495800', 'ASOC. DE VIV. EL BUEN PANORAMA mz. L lt. 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3160', '1', '2', '70398253', 'LUZ MARINA', 'QUISCA', 'TITO', '959495800', 'JOVEN SOR ANA DE LOS ANGELES mz. G lt. 4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3161', '1', '2', '70483987', 'DELIA JUANA', 'CHURATA', 'CALLA', '959495800', 'LA MANSION 2 DE SOCABAYA mz. M lt. 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3162', '1', '2', '70798474', 'ROSA VILMA', 'QUISPE', 'CALSI', '959495800', 'COMUNIDAD SAYTOCOCHA FLORIDA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3163', '1', '2', '71632070', 'JOSE ESIDIO', 'CANALES', 'ROJAS', '959495800', 'ARICA ESQ. AMARU 100 3ER D.A. CARRION', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3164', '1', '2', '71651795', 'MIRNA KASSANDRA', 'PAREDES', 'FLORES', '959495800', 'LA HABANA 219', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3165', '1', '2', '71665003', 'DIADEMA MELANIA', 'JOVE', 'VILCAPAZA', '959495800', 'CC.ARCOPUNCO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3166', '1', '2', '71966106', 'RAQUEL NOEMI', 'PAREJA', 'CHUQUIMANGO', '959495800', 'MZ.A LOTE S/N SECTOR ROSAMAYO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3167', '1', '2', '72117588', 'EDILUZ RAQUEL', 'YANA', 'HUAMANI', '959495800', 'MANTO S/N VISTA ALEGRE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3168', '1', '2', '72217728', 'JHON ALBERT', 'MAMANI', 'CONDORI', '959495800', 'UPIS PAISAJISTA mz. J lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3169', '1', '2', '72396199', 'IVANA FIORELLA', 'QUISPE', 'OSCCO', '959495800', 'LOPEZ 420 LOPEZ', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3170', '1', '2', '72510338', 'EDITH MARILU', 'QUISPE', 'ARI', '959495800', 'LOMA VERDE mz. A lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3171', '1', '2', '72606899', 'GERMAN ALONSO', 'CASTRO', 'VARGAS', '959495800', 'PEDRO DIEZ CANSECO mz. M lt. 11', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3172', '1', '2', '72755102', 'ROSA ANDREA', 'SALAS', 'MONTESINOS', '959495800', 'CA. CASTROVIRREYNA 532', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3173', '1', '2', '72935047', 'LIDU JESUSA', 'VILCAPAZA', 'LIZARRAGA', '959495800', 'JOVEN SAN JUAN DE DIOS mz. P lt. 3A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3174', '1', '2', '73044145', 'MARICIELO LIZETH', 'MAMANI', 'RAMOS', '959495800', 'CALLEJON RIPACHA 140 P.T. SAN LAZARO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3175', '1', '2', '73108251', 'OSCAR RENZO', 'CHECCA', 'ANDALUZ', '959495800', 'JOVEN 13 DE MAYO mz. E lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3176', '1', '2', '73388789', 'KAREN GIULIANA', 'ESCALANTE', 'AEDO', '959495800', 'FRAY MARTIN DE PORRAS UPIS mz. I lt. 7', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3177', '1', '2', '73424070', 'JOSEFINA', 'HUACASI', 'CRUZ', '959495800', 'COM. MATARO GRANDE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3178', '1', '2', '73440361', 'MAGALY', 'CJUNO', 'ARCOS', '959495800', 'FRANCISCO BOLOGNESI P.J. 13 DE AGOSTO mz. Q lt. 8', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3179', '1', '2', '73481019', 'LIZ', 'PERALES', 'CHUQUITARQUI', '959495800', 'TUPAC AMARU S/N', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3180', '1', '2', '73510241', 'YAQUILIN', 'HUAMAN', 'HUAMAN', '959495800', 'ASC. DE VIV.VILLA PARAISO HUASACACHE mz. E lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3181', '1', '2', '74153704', 'YENIFER JUANA', 'ZANCA', 'PUMA', '959495800', 'LA MERCED mz. N lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3182', '1', '2', '74934735', 'ANNIE GUILIANNA', 'MAMANI', 'DIAZ', '959495800', 'PROLONG.F.MOSTAJO 202 SALAVERRY', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3183', '1', '2', '75236112', 'MARCO ANTONIO', 'CUTIPA', 'VALENCIA', '959495800', 'ANDRES AVELINO CACERES P.J. AUGUSTO FREYRE mz. O lt. 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3184', '1', '2', '75239424', 'SHIERIL GABRIELA', 'HUACOTO', 'RIVERA', '959495800', 'NICOLAS DE PIEROLA HUARANGUILLO mz. W lt. 9', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3185', '1', '2', '75383415', 'ESTEFANY MARIBEL', 'CASTILLO', 'TIPO', '959495800', 'LA NUEVA GENERACION mz. 9 lt. 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3186', '1', '2', '75779675', 'GABY PRISCILA', 'MAMANI', 'SEJJE', '959495800', 'LIBERTAD SANTA MARTHA mz. A lt. 11', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3187', '1', '2', '75879052', 'ELVIS EMILIO', 'GARCIA', 'PAMPAMALLCO', '959495800', 'P.J. AMPLIACION PAMPA DEL CUSCO ZONA A mz. J lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3188', '1', '2', '76046348', 'EDY RAUL', 'ORTIZ', 'QUISPE', '959495800', 'AYLLO CINCUENTENARIO CANCOL mz. 31 lt. A', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3189', '1', '2', '76698211', 'NURY TERESA', 'QUISPE', 'AVILA', '959495800', 'PJ CHIRIGUANA PSJE LA MERCED mz. L lt. 3', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3190', '1', '2', '77802301', 'RODOLFO', 'HUAMAN', 'CAÑARI', '959495800', 'COMUNIDAD HILATUNGA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3191', '1', '2', '80031965', 'TEODORA', 'CCAHUANA', 'CONTRERAS', '959495800', 'COM CALLANCHA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3192', '1', '2', '80056207', 'ARMANDO', 'VARGAS', 'MAMANI', '959495800', 'PJ. LA MERCED MZ.L LT.4', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3193', '1', '2', '80073192', 'ISIDORA', 'TTITO', 'HUAMANI', '959495800', 'PAISAJISTA S/N HUASACACHE', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3194', '1', '2', '80160910', 'GLADYS', 'PORTUGAL', 'PASTOR', '959495800', 'ASOC.DE VIV.LA MERCED I 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3195', '1', '2', '80191424', 'LUZ ISABEL', 'AMANQUI', 'SANCHO', '959495800', 'OLLANTAY P.J. AMPLIACION PAMPA DEL CUZCO A mz. D lt. 1', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3196', '1', '2', '80216154', 'SANDRA', 'SOTO', 'HUAMANI', '959495800', 'MARIA PARADO DE BELLIDO J. 13 DE AGOSTO mz. B lt. 5', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3197', '1', '2', '80216220', 'DELIA OLGA', 'APAZA', 'CALSIN', '959495800', 'AH. LA MERCED mz. M lt. 10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3198', '1', '2', '80217551', 'FREDY', 'LIMAHUAYA', 'COLQUE', '959495800', 'URB.VILLA EL GOLF MZ.1 LT.13', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3199', '1', '2', '80219244', 'ELIAS', 'TICONA', 'YUCRA', '959495800', 'P.JOVEN CIUDAD DE DIOS CMTE.3 MZ.A LT.10', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3200', '1', '2', '80417043', 'RENE', 'SELLERICO', 'MAYTA', '959495800', 'PSJ. LAS PEÑAS MZ.C LT.4 ASENT.H. SANTA MARTHA', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3201', '1', '2', '80419245', 'LUCIA NELLY', 'ROJAS', 'LOAYZA', '959495800', 'VIA PAISAJISTA PUEBLO TRAD. PAMPAS DEL CUSCO mz. N lt. 2', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3202', '1', '2', '80443445', 'MAYELA IDA', 'IBEROS', 'ACERO', '959495800', 'JR. PROGRESO 225 BR.PORTEÑO', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3203', '1', '2', '80467439', 'MARINA', 'VIZA', 'FLORES', '959495800', 'AV.SAN MIGUEL DE PIURA 427 URB.SAN JUAN DE DIOS', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3204', '1', '2', '80507631', 'YEOVANA', 'AYAMAMANI', 'APAZA', '959495800', 'P.JOVEN 13 DE AGOSTO MZ.O LT.10 COMITE 6', '2024-04-23 19:58:10');
INSERT INTO `padre_familia` VALUES ('3205', '1', '2', '80624328', 'CARLOS ENRIQUE', 'MAMANI', 'ARRATIA', '959495800', 'AMPLIACION UPIS LA MERCED mz. H lt. 2', '2024-04-23 19:58:10');

-- ----------------------------
-- Table structure for pago
-- ----------------------------
DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_padre_familia` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_aporte_padres` int DEFAULT NULL,
  `id_reunion_padres` int DEFAULT NULL,
  `pago_concepto` varchar(255) DEFAULT NULL,
  `monto_pago` decimal(10,0) DEFAULT NULL,
  `debe` decimal(10,0) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `boucher` varchar(255) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `fk_pago_aporte` (`pago_concepto`),
  KEY `fk_pago_padreFamilia` (`id_padre_familia`),
  KEY `fk_pago_usuario` (`id_usuario`),
  KEY `fk_pago_iap` (`id_aporte_padres`),
  KEY `fk_pago_irp` (`id_reunion_padres`),
  CONSTRAINT `fk_pago_iap` FOREIGN KEY (`id_aporte_padres`) REFERENCES `aporte_padres` (`id_aporte_padres`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pago_irp` FOREIGN KEY (`id_reunion_padres`) REFERENCES `reunion_padres` (`id_reunion_padres`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pago_padreFamilia` FOREIGN KEY (`id_padre_familia`) REFERENCES `padre_familia` (`id_padre_familia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pago_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pago
-- ----------------------------
INSERT INTO `pago` VALUES ('22', '2608', '2', '138', null, 'APORTE: PENSION ENERO', '50', '0', '2025-06-26 09:54:55', null, ' [ANULADO: 2025-06-26 09:55:35 por Isai Ismael Sandoval Ccaccro]', 'ANULADO');

-- ----------------------------
-- Table structure for reunion
-- ----------------------------
DROP TABLE IF EXISTS `reunion`;
CREATE TABLE `reunion` (
  `id_reunion` int NOT NULL AUTO_INCREMENT,
  `id_estado_reunion` int DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `multa_precio` decimal(10,0) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id_reunion`),
  KEY `fk_actividad_estadoActividad` (`id_estado_reunion`),
  CONSTRAINT `fk_actividad_estadoActividad` FOREIGN KEY (`id_estado_reunion`) REFERENCES `estado_reunion` (`id_estado_reunion`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reunion
-- ----------------------------
INSERT INTO `reunion` VALUES ('18', '1', 'ENTREGA DE LIBRETAS MAYO', '********', '100', '2025-06-27', '13:51:00');
INSERT INTO `reunion` VALUES ('19', '1', 'CLAUSURA', '*******', '150', '2025-12-29', '14:52:00');

-- ----------------------------
-- Table structure for reunion_padres
-- ----------------------------
DROP TABLE IF EXISTS `reunion_padres`;
CREATE TABLE `reunion_padres` (
  `id_reunion_padres` int NOT NULL AUTO_INCREMENT,
  `id_reunion` int DEFAULT NULL,
  `id_padre_familia` int DEFAULT NULL,
  `asistencia` datetime DEFAULT NULL,
  `asistencia_salida` datetime DEFAULT NULL,
  `detalles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_reunion_padres`),
  KEY `fk_reunion_padres_padre_familia` (`id_padre_familia`),
  KEY `fk_reunion_padres_reunion` (`id_reunion`),
  CONSTRAINT `fk_reunion_padres_padre_familia` FOREIGN KEY (`id_padre_familia`) REFERENCES `padre_familia` (`id_padre_familia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reunion_padres_reunion` FOREIGN KEY (`id_reunion`) REFERENCES `reunion` (`id_reunion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reunion_padres
-- ----------------------------
INSERT INTO `reunion_padres` VALUES ('36', '18', '2608', '2025-06-26 10:22:52', null, null);
INSERT INTO `reunion_padres` VALUES ('37', '18', '2609', null, null, null);
INSERT INTO `reunion_padres` VALUES ('38', '18', '2610', null, null, null);
INSERT INTO `reunion_padres` VALUES ('39', '18', '2611', null, null, null);
INSERT INTO `reunion_padres` VALUES ('40', '18', '2612', null, null, null);
INSERT INTO `reunion_padres` VALUES ('41', '18', '2613', null, null, null);
INSERT INTO `reunion_padres` VALUES ('42', '18', '2614', null, null, null);
INSERT INTO `reunion_padres` VALUES ('43', '18', '2615', null, null, null);
INSERT INTO `reunion_padres` VALUES ('44', '18', '2616', null, null, null);
INSERT INTO `reunion_padres` VALUES ('45', '18', '2617', null, null, null);
INSERT INTO `reunion_padres` VALUES ('46', '18', '2618', null, null, null);
INSERT INTO `reunion_padres` VALUES ('47', '18', '2619', null, null, null);
INSERT INTO `reunion_padres` VALUES ('48', '18', '2620', null, null, null);
INSERT INTO `reunion_padres` VALUES ('49', '18', '2621', null, null, null);
INSERT INTO `reunion_padres` VALUES ('50', '18', '2622', null, null, null);
INSERT INTO `reunion_padres` VALUES ('51', '18', '2623', null, null, null);
INSERT INTO `reunion_padres` VALUES ('52', '18', '2624', null, null, null);
INSERT INTO `reunion_padres` VALUES ('53', '18', '2625', null, null, null);
INSERT INTO `reunion_padres` VALUES ('54', '18', '2626', null, null, null);
INSERT INTO `reunion_padres` VALUES ('55', '18', '2627', null, null, null);
INSERT INTO `reunion_padres` VALUES ('56', '18', '2628', null, null, null);
INSERT INTO `reunion_padres` VALUES ('57', '18', '2629', null, null, null);
INSERT INTO `reunion_padres` VALUES ('58', '18', '2630', null, null, null);
INSERT INTO `reunion_padres` VALUES ('59', '18', '2631', null, null, null);
INSERT INTO `reunion_padres` VALUES ('60', '18', '2632', null, null, null);
INSERT INTO `reunion_padres` VALUES ('61', '18', '2633', null, null, null);
INSERT INTO `reunion_padres` VALUES ('62', '18', '2634', null, null, null);
INSERT INTO `reunion_padres` VALUES ('63', '18', '2635', null, null, null);
INSERT INTO `reunion_padres` VALUES ('64', '18', '2636', null, null, null);
INSERT INTO `reunion_padres` VALUES ('65', '18', '2637', null, null, null);
INSERT INTO `reunion_padres` VALUES ('66', '18', '2638', null, null, null);
INSERT INTO `reunion_padres` VALUES ('67', '18', '2639', null, null, null);
INSERT INTO `reunion_padres` VALUES ('68', '18', '2640', null, null, null);
INSERT INTO `reunion_padres` VALUES ('69', '18', '2641', null, null, null);
INSERT INTO `reunion_padres` VALUES ('70', '19', '2608', null, null, null);
INSERT INTO `reunion_padres` VALUES ('71', '19', '2609', null, null, null);
INSERT INTO `reunion_padres` VALUES ('72', '19', '2610', null, null, null);
INSERT INTO `reunion_padres` VALUES ('73', '19', '2611', null, null, null);
INSERT INTO `reunion_padres` VALUES ('74', '19', '2612', null, null, null);
INSERT INTO `reunion_padres` VALUES ('75', '19', '2613', null, null, null);
INSERT INTO `reunion_padres` VALUES ('76', '19', '2614', null, null, null);
INSERT INTO `reunion_padres` VALUES ('77', '19', '2615', null, null, null);
INSERT INTO `reunion_padres` VALUES ('78', '19', '2616', null, null, null);
INSERT INTO `reunion_padres` VALUES ('79', '19', '2617', null, null, null);
INSERT INTO `reunion_padres` VALUES ('80', '19', '2618', null, null, null);
INSERT INTO `reunion_padres` VALUES ('81', '19', '2619', null, null, null);
INSERT INTO `reunion_padres` VALUES ('82', '19', '2620', null, null, null);
INSERT INTO `reunion_padres` VALUES ('83', '19', '2621', null, null, null);
INSERT INTO `reunion_padres` VALUES ('84', '19', '2622', null, null, null);
INSERT INTO `reunion_padres` VALUES ('85', '19', '2623', null, null, null);
INSERT INTO `reunion_padres` VALUES ('86', '19', '2624', null, null, null);
INSERT INTO `reunion_padres` VALUES ('87', '19', '2625', null, null, null);
INSERT INTO `reunion_padres` VALUES ('88', '19', '2626', null, null, null);
INSERT INTO `reunion_padres` VALUES ('89', '19', '2627', null, null, null);
INSERT INTO `reunion_padres` VALUES ('90', '19', '2628', null, null, null);
INSERT INTO `reunion_padres` VALUES ('91', '19', '2629', null, null, null);
INSERT INTO `reunion_padres` VALUES ('92', '19', '2630', null, null, null);
INSERT INTO `reunion_padres` VALUES ('93', '19', '2631', null, null, null);
INSERT INTO `reunion_padres` VALUES ('94', '19', '2632', null, null, null);
INSERT INTO `reunion_padres` VALUES ('95', '19', '2633', null, null, null);
INSERT INTO `reunion_padres` VALUES ('96', '19', '2634', null, null, null);
INSERT INTO `reunion_padres` VALUES ('97', '19', '2635', null, null, null);
INSERT INTO `reunion_padres` VALUES ('98', '19', '2636', null, null, null);
INSERT INTO `reunion_padres` VALUES ('99', '19', '2637', null, null, null);
INSERT INTO `reunion_padres` VALUES ('100', '19', '2638', null, null, null);
INSERT INTO `reunion_padres` VALUES ('101', '19', '2639', null, null, null);
INSERT INTO `reunion_padres` VALUES ('102', '19', '2640', null, null, null);
INSERT INTO `reunion_padres` VALUES ('103', '19', '2641', null, null, null);

-- ----------------------------
-- Table structure for tipo_consanguinidad
-- ----------------------------
DROP TABLE IF EXISTS `tipo_consanguinidad`;
CREATE TABLE `tipo_consanguinidad` (
  `id_tipo_consanguinidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_consanguinidad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_consanguinidad
-- ----------------------------
INSERT INTO `tipo_consanguinidad` VALUES ('1', 'PADRE');
INSERT INTO `tipo_consanguinidad` VALUES ('2', 'MADRE');
INSERT INTO `tipo_consanguinidad` VALUES ('3', 'TÍO');
INSERT INTO `tipo_consanguinidad` VALUES ('4', 'TÍA');
INSERT INTO `tipo_consanguinidad` VALUES ('5', 'HERMANO');
INSERT INTO `tipo_consanguinidad` VALUES ('6', 'HERMANA');
INSERT INTO `tipo_consanguinidad` VALUES ('7', 'CUÑADO');
INSERT INTO `tipo_consanguinidad` VALUES ('8', 'CUÑADA');
INSERT INTO `tipo_consanguinidad` VALUES ('9', 'ABUELO');
INSERT INTO `tipo_consanguinidad` VALUES ('10', 'ABUELA');
INSERT INTO `tipo_consanguinidad` VALUES ('11', 'SOBRINO');
INSERT INTO `tipo_consanguinidad` VALUES ('12', 'SOBRINA');
INSERT INTO `tipo_consanguinidad` VALUES ('13', 'PADRASTRO');
INSERT INTO `tipo_consanguinidad` VALUES ('14', 'MADRASTRA');
INSERT INTO `tipo_consanguinidad` VALUES ('15', 'OTRO');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `estado` int DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('2', 'Isai Ismael Sandoval Ccaccro', 'isai', '202cb962ac59075b964b07152d234b70', 'isai.ismael1999@gmail.com', '1', '013645', '1');
INSERT INTO `usuario` VALUES ('6', 'prueba2', 'prueba2', '202cb962ac59075b964b07152d234b70', 'prueba2@gmail.com', '1', null, '2');
