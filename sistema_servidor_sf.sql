/*
Navicat MySQL Data Transfer

Source Server         : conex 3306
Source Server Version : 80300
Source Host           : 127.0.0.1:3306
Source Database       : sistema_servidor_sf

Target Server Type    : MYSQL
Target Server Version : 80300
File Encoding         : 65001

Date: 2025-06-27 14:07:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for archivo_compartido
-- ----------------------------
DROP TABLE IF EXISTS `archivo_compartido`;
CREATE TABLE `archivo_compartido` (
  `id_archivo_compartido` int NOT NULL AUTO_INCREMENT,
  `id_grado_seccion` int DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_archivo_compartido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of archivo_compartido
-- ----------------------------

-- ----------------------------
-- Table structure for grado_seccion
-- ----------------------------
DROP TABLE IF EXISTS `grado_seccion`;
CREATE TABLE `grado_seccion` (
  `id_grado_seccion` int NOT NULL AUTO_INCREMENT,
  `grado` varchar(255) DEFAULT NULL,
  `seccion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_grado_seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of grado_seccion
-- ----------------------------
INSERT INTO `grado_seccion` VALUES ('1', '1', 'A', null);
INSERT INTO `grado_seccion` VALUES ('2', '1', 'B', null);
INSERT INTO `grado_seccion` VALUES ('3', '1', 'C', null);
INSERT INTO `grado_seccion` VALUES ('4', '1', 'D', null);
INSERT INTO `grado_seccion` VALUES ('5', '1', 'E', null);
INSERT INTO `grado_seccion` VALUES ('6', '1', 'F', null);
INSERT INTO `grado_seccion` VALUES ('7', '1', 'G', null);
INSERT INTO `grado_seccion` VALUES ('8', '2', 'A', null);
INSERT INTO `grado_seccion` VALUES ('9', '2', 'B', null);
INSERT INTO `grado_seccion` VALUES ('10', '2', 'C', null);
INSERT INTO `grado_seccion` VALUES ('11', '2', 'D', null);
INSERT INTO `grado_seccion` VALUES ('12', '2', 'E', null);
INSERT INTO `grado_seccion` VALUES ('13', '2', 'F', null);
INSERT INTO `grado_seccion` VALUES ('14', '2', 'G', null);
INSERT INTO `grado_seccion` VALUES ('15', '3', 'A', null);
INSERT INTO `grado_seccion` VALUES ('16', '3', 'B', null);
INSERT INTO `grado_seccion` VALUES ('17', '3', 'C', null);
INSERT INTO `grado_seccion` VALUES ('18', '3', 'D', null);
INSERT INTO `grado_seccion` VALUES ('19', '3', 'E', null);
INSERT INTO `grado_seccion` VALUES ('20', '3', 'F', null);
INSERT INTO `grado_seccion` VALUES ('21', '3', 'G', null);
INSERT INTO `grado_seccion` VALUES ('22', '4', 'A', null);
INSERT INTO `grado_seccion` VALUES ('23', '4', 'B', null);
INSERT INTO `grado_seccion` VALUES ('24', '4', 'C', null);
INSERT INTO `grado_seccion` VALUES ('25', '4', 'D', null);
INSERT INTO `grado_seccion` VALUES ('26', '4', 'E', null);
INSERT INTO `grado_seccion` VALUES ('27', '4', 'F', null);
INSERT INTO `grado_seccion` VALUES ('28', '4', 'G', null);
INSERT INTO `grado_seccion` VALUES ('29', '5', 'A', null);
INSERT INTO `grado_seccion` VALUES ('30', '5', 'B', null);
INSERT INTO `grado_seccion` VALUES ('31', '5', 'C', null);
INSERT INTO `grado_seccion` VALUES ('32', '5', 'D', null);
INSERT INTO `grado_seccion` VALUES ('33', '5', 'E', null);
INSERT INTO `grado_seccion` VALUES ('34', '5', 'F', null);
INSERT INTO `grado_seccion` VALUES ('45', '5', 'G', null);

-- ----------------------------
-- Table structure for trabajo
-- ----------------------------
DROP TABLE IF EXISTS `trabajo`;
CREATE TABLE `trabajo` (
  `id_trabajo` int NOT NULL AUTO_INCREMENT,
  `id_grado_seccion` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_trabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of trabajo
-- ----------------------------

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of usuario
-- ----------------------------
