/*
 Navicat Premium Backup

 Source Server         : comixloan
 Source Server Type    : PostgreSQL
 Source Server Version : 90308
 Source Host           : localhost
 Source Database       : comixloan
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90308
 File Encoding         : utf-8

 Date: 06/17/2015 07:40:33 AM
*/

-- ----------------------------
--  Sequence structure for community_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "community_id_seq" CASCADE;
CREATE SEQUENCE "community_id_seq" INCREMENT 1 START 7 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "community_id_seq" OWNER TO "comixloan";

-- ----------------------------
--  Sequence structure for historyloan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "historyloan_id_seq" CASCADE;
CREATE SEQUENCE "historyloan_id_seq" INCREMENT 1 START 12 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "historyloan_id_seq" OWNER TO "comixloan";

-- ----------------------------
--  Sequence structure for loan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "loan_id_seq" CASCADE;
CREATE SEQUENCE "loan_id_seq" INCREMENT 1 START 15 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "loan_id_seq" OWNER TO "comixloan";

-- ----------------------------
--  Sequence structure for serie_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "serie_id_seq" CASCADE;
CREATE SEQUENCE "serie_id_seq" INCREMENT 1 START 13 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "serie_id_seq" OWNER TO "comixloan";

-- ----------------------------
--  Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "users_id_seq" CASCADE;
CREATE SEQUENCE "users_id_seq" INCREMENT 1 START 12 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "users_id_seq" OWNER TO "comixloan";

-- ----------------------------
--  Sequence structure for volume_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "volume_id_seq" CASCADE;
CREATE SEQUENCE "volume_id_seq" INCREMENT 1 START 670 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "volume_id_seq" OWNER TO "comixloan";

-- ----------------------------
--  Table structure for loan
-- ----------------------------
DROP TABLE IF EXISTS "loan" CASCADE;
CREATE TABLE "loan" (
	"id" int8 NOT NULL DEFAULT nextval('loan_id_seq'::regclass),
	"startdate" timestamp(6) NOT NULL,
	"owner_id" int8,
	"user_id" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "loan" OWNER TO "comixloan";

-- ----------------------------
--  Records of loan
-- ----------------------------
BEGIN;
INSERT INTO "loan" VALUES ('2', '2015-06-15 09:09:02.435', '5', '2');
INSERT INTO "loan" VALUES ('13', '2015-06-16 11:05:16.492', '4', '5');
INSERT INTO "loan" VALUES ('15', '2015-06-16 21:54:39.498', '8', '2');
COMMIT;

-- ----------------------------
--  Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS "community" CASCADE;
CREATE TABLE "community" (
	"id" int8 NOT NULL DEFAULT nextval('community_id_seq'::regclass),
	"description" varchar(255) NOT NULL COLLATE "default",
	"name" varchar(255) NOT NULL COLLATE "default",
	"admin_id" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "community" OWNER TO "comixloan";

-- ----------------------------
--  Records of community
-- ----------------------------
BEGIN;
INSERT INTO "community" VALUES ('1', 'amici dell''uni!', 'comunita uniroma3', '2');
INSERT INTO "community" VALUES ('2', 'è di ale', 'comunita uniroma3 di ale', '3');
INSERT INTO "community" VALUES ('3', 'Troppo ', 'DarioTroppoBello', '5');
INSERT INTO "community" VALUES ('4', '', 'prova loan', '4');
INSERT INTO "community" VALUES ('5', 'comunita degli amici di scuola', 'Comunita di scuola', '3');
INSERT INTO "community" VALUES ('6', 'leggere sopra', 'Amici nerd', '8');
INSERT INTO "community" VALUES ('7', '', 'comunità di famiglia', '9');
COMMIT;

-- ----------------------------
--  Table structure for historyloan
-- ----------------------------
DROP TABLE IF EXISTS "historyloan" CASCADE;
CREATE TABLE "historyloan" (
	"id" int8 NOT NULL DEFAULT nextval('historyloan_id_seq'::regclass),
	"dateend" timestamp(6) NOT NULL,
	"datestart" timestamp(6) NOT NULL,
	"owner_id" int8,
	"user_id" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "historyloan" OWNER TO "comixloan";

-- ----------------------------
--  Records of historyloan
-- ----------------------------
BEGIN;
INSERT INTO "historyloan" VALUES ('1', '2015-06-15 08:45:02.114', '2015-06-15 08:44:02.973', '2', '1');
INSERT INTO "historyloan" VALUES ('2', '2015-06-15 12:30:40.939', '2015-06-15 12:30:34.997', '4', '2');
INSERT INTO "historyloan" VALUES ('3', '2015-06-15 12:32:50.16', '2015-06-15 12:32:34.411', '4', '5');
INSERT INTO "historyloan" VALUES ('4', '2015-06-15 17:41:30.523', '2015-06-15 17:40:15.738', '2', '1');
INSERT INTO "historyloan" VALUES ('5', '2015-06-15 17:41:31.787', '2015-06-15 17:40:42.208', '2', '4');
INSERT INTO "historyloan" VALUES ('6', '2015-06-15 17:41:32.927', '2015-06-15 17:41:12.82', '2', '3');
INSERT INTO "historyloan" VALUES ('7', '2015-06-15 17:41:36.44', '2015-06-15 17:40:49.625', '2', '5');
INSERT INTO "historyloan" VALUES ('8', '2015-06-15 17:43:17.035', '2015-06-15 17:42:58.312', '2', '4');
INSERT INTO "historyloan" VALUES ('9', '2015-06-15 20:48:11.498', '2015-06-15 20:46:54.675', '8', '2');
INSERT INTO "historyloan" VALUES ('10', '2015-06-16 06:39:25.088', '2015-06-16 06:38:56.579', '9', '2');
INSERT INTO "historyloan" VALUES ('11', '2015-06-16 10:56:36.243', '2015-06-15 11:20:56.665', '3', '2');
INSERT INTO "historyloan" VALUES ('12', '2015-06-16 18:09:22.031', '2015-06-16 18:08:47.821', '3', '1');
COMMIT;

-- ----------------------------
--  Table structure for serie
-- ----------------------------
DROP TABLE IF EXISTS "serie" CASCADE;
CREATE TABLE "serie" (
	"id" int8 NOT NULL DEFAULT nextval('serie_id_seq'::regclass),
	"author" varchar(255) COLLATE "default",
	"date" timestamp(6) NULL,
	"description" varchar(255) COLLATE "default",
	"editor" varchar(255) NOT NULL COLLATE "default",
	"name" varchar(255) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "serie" OWNER TO "comixloan";

-- ----------------------------
--  Records of serie
-- ----------------------------
BEGIN;
INSERT INTO "serie" VALUES ('1', 'Tite Kubo', '2015-06-15 08:41:21.717', 'manga ', 'Jump', 'Bleach');
INSERT INTO "serie" VALUES ('2', 'Kishimoto Masashi', '2015-06-15 08:42:26.998', 'manga', 'Jump', 'Naruto');
INSERT INTO "serie" VALUES ('3', 'Vari', '2015-06-15 08:51:18.238', 'topolino', 'Disney', 'Topolino');
INSERT INTO "serie" VALUES ('4', 'Vari', '2015-06-15 11:08:11.593', 'fumetto', 'Marvel', 'IronMAn');
INSERT INTO "serie" VALUES ('5', '?', '2015-06-15 12:29:52.421', 'manga', 'Jump', 'Nana');
INSERT INTO "serie" VALUES ('6', 'Takeshi Obata & Tsugumi Oda', '2015-06-15 20:35:43.968', 'manga', 'jump', 'Death note');
INSERT INTO "serie" VALUES ('7', 'Takeshi Obata & Tsugumi Oda', '2015-06-15 20:36:35.811', 'manga', 'jump', 'Bakuman');
INSERT INTO "serie" VALUES ('8', 'Ishiyama', '2015-06-15 20:38:19.704', 'manga', 'Kodansha', 'Attack on titan');
INSERT INTO "serie" VALUES ('9', 'Norihiro Yagi', '2015-06-15 20:40:13.118', 'Manga', 'Square Jump', 'Claymore');
INSERT INTO "serie" VALUES ('10', 'Asushi okubo', '2015-06-15 20:41:50.508', 'manga', 'Shonen gan gan', 'Soul Eater');
INSERT INTO "serie" VALUES ('11', 'Hiromu Arakawa', '2015-06-15 20:44:10.455', 'manga', 'Shonen gan gan - Square enix', 'Full metal Alchemist');
INSERT INTO "serie" VALUES ('12', 'bonelli', '2015-06-16 06:38:00.343', 'fumetto', 'audace', 'tex');
INSERT INTO "serie" VALUES ('13', 'Leo Ortolani', '2015-06-16 11:02:44.759', 'Fumetto', 'panini', 'Rat-man');
COMMIT;

-- ----------------------------
--  Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users" CASCADE;
CREATE TABLE "users" (
	"id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
	"email" varchar(255) NOT NULL COLLATE "default",
	"name" varchar(255) NOT NULL COLLATE "default",
	"password" varchar(255) NOT NULL COLLATE "default",
	"surname" varchar(255) NOT NULL COLLATE "default",
	"username" varchar(255) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "users" OWNER TO "comixloan";

-- ----------------------------
--  Records of users
-- ----------------------------
BEGIN;
INSERT INTO "users" VALUES ('2', 'ale@gmail.com', 'Alessandro', 'f5ca38f748a1d6eaf726b8a42fb575c3c71f1864a8143301782de13da2d9202b', 'Oddi', 'adixia');
INSERT INTO "users" VALUES ('3', 'demo@comixloan.tk', 'demo', 'f5ca38f748a1d6eaf726b8a42fb575c3c71f1864a8143301782de13da2d9202b', 'demo', 'demo');
INSERT INTO "users" VALUES ('1', 'matteo@gmail.com', 'matteo', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'filippi', 'matteo');
INSERT INTO "users" VALUES ('4', 'ambra@gmail.com', 'ambra', '74e3ce93e1abd77aa3065ffa7dfb3ede2516b990d2191919e17b59a9f5cfe4bb', 'ambra', 'ambra');
INSERT INTO "users" VALUES ('5', 'dario@gmail.com', 'Dario', '49078b6887962a9849fb6f57b90e0463d5e39ea18b0036733e70db919d0d638c', 'Di Nado', 'Dario');
INSERT INTO "users" VALUES ('6', 'ale@gmail.com', 'Alessandro ', 'f5ca38f748a1d6eaf726b8a42fb575c3c71f1864a8143301782de13da2d9202b', 'Oddi', 'ale1');
INSERT INTO "users" VALUES ('7', 'oddi@gmail.com', 'Alessandro', 'f5ca38f748a1d6eaf726b8a42fb575c3c71f1864a8143301782de13da2d9202b', 'Oddi', 'adixia1');
INSERT INTO "users" VALUES ('8', 'bart@yahoo.it', 'Alessandro', 'f5ca38f748a1d6eaf726b8a42fb575c3c71f1864a8143301782de13da2d9202b', 'Oddi', 'caspian');
INSERT INTO "users" VALUES ('9', 'luigi.oddi@gmail.com', 'luigi', 'bf0ec3694e122e067d9964a38ec7d8415781df4b24f442ad767b4621fb98f8c5', 'oddi', 'vince.50');
INSERT INTO "users" VALUES ('10', 'leyrahh203@gmail.com', 'sussanna', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'salvoni', 'lalalla');
INSERT INTO "users" VALUES ('11', 'rossi@stud.uniroma3.it', 'mario', '9bd4af346868dda2e855af48a3571bc80924fd6360f1599d61998fe4091bf4df', 'rossi', 'm.rossi');
INSERT INTO "users" VALUES ('12', 'fratoccichia@gmail.com', 'Chiara', 'f78e1bda372c819d53a361f4f14454e99550c39f61f4a7cb941be1d9e279007b', 'Frattocchi', '93chiara');
COMMIT;

-- ----------------------------
--  Table structure for historyloan_volume
-- ----------------------------
DROP TABLE IF EXISTS "historyloan_volume" CASCADE;
CREATE TABLE "historyloan_volume" (
	"loanhistory_id" int8,
	"volumes_id" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "historyloan_volume" OWNER TO "comixloan";

-- ----------------------------
--  Records of historyloan_volume
-- ----------------------------
BEGIN;
INSERT INTO "historyloan_volume" VALUES ('1', '6');
INSERT INTO "historyloan_volume" VALUES ('1', '3');
INSERT INTO "historyloan_volume" VALUES ('1', '1');
INSERT INTO "historyloan_volume" VALUES ('1', '2');
INSERT INTO "historyloan_volume" VALUES ('3', '14');
INSERT INTO "historyloan_volume" VALUES ('3', '15');
INSERT INTO "historyloan_volume" VALUES ('3', '16');
INSERT INTO "historyloan_volume" VALUES ('4', '182');
INSERT INTO "historyloan_volume" VALUES ('4', '181');
INSERT INTO "historyloan_volume" VALUES ('4', '180');
INSERT INTO "historyloan_volume" VALUES ('4', '179');
INSERT INTO "historyloan_volume" VALUES ('4', '178');
INSERT INTO "historyloan_volume" VALUES ('4', '177');
INSERT INTO "historyloan_volume" VALUES ('4', '4');
INSERT INTO "historyloan_volume" VALUES ('4', '7');
INSERT INTO "historyloan_volume" VALUES ('4', '8');
INSERT INTO "historyloan_volume" VALUES ('6', '186');
INSERT INTO "historyloan_volume" VALUES ('7', '2');
INSERT INTO "historyloan_volume" VALUES ('7', '6');
INSERT INTO "historyloan_volume" VALUES ('7', '5');
INSERT INTO "historyloan_volume" VALUES ('7', '3');
INSERT INTO "historyloan_volume" VALUES ('7', '1');
INSERT INTO "historyloan_volume" VALUES ('8', '7');
INSERT INTO "historyloan_volume" VALUES ('8', '6');
INSERT INTO "historyloan_volume" VALUES ('9', '393');
INSERT INTO "historyloan_volume" VALUES ('9', '394');
INSERT INTO "historyloan_volume" VALUES ('9', '365');
INSERT INTO "historyloan_volume" VALUES ('9', '367');
INSERT INTO "historyloan_volume" VALUES ('9', '378');
INSERT INTO "historyloan_volume" VALUES ('9', '366');
INSERT INTO "historyloan_volume" VALUES ('9', '252');
INSERT INTO "historyloan_volume" VALUES ('9', '440');
INSERT INTO "historyloan_volume" VALUES ('9', '441');
INSERT INTO "historyloan_volume" VALUES ('9', '442');
INSERT INTO "historyloan_volume" VALUES ('9', '443');
INSERT INTO "historyloan_volume" VALUES ('9', '444');
INSERT INTO "historyloan_volume" VALUES ('9', '445');
INSERT INTO "historyloan_volume" VALUES ('10', '463');
INSERT INTO "historyloan_volume" VALUES ('10', '467');
INSERT INTO "historyloan_volume" VALUES ('10', '468');
INSERT INTO "historyloan_volume" VALUES ('12', '564');
COMMIT;

-- ----------------------------
--  Table structure for users_community
-- ----------------------------
DROP TABLE IF EXISTS "users_community" CASCADE;
CREATE TABLE "users_community" (
	"users_id" int8,
	"communities_id" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "users_community" OWNER TO "comixloan";

-- ----------------------------
--  Records of users_community
-- ----------------------------
BEGIN;
INSERT INTO "users_community" VALUES ('2', '1');
INSERT INTO "users_community" VALUES ('1', '1');
INSERT INTO "users_community" VALUES ('3', '2');
INSERT INTO "users_community" VALUES ('1', '2');
INSERT INTO "users_community" VALUES ('5', '3');
INSERT INTO "users_community" VALUES ('2', '3');
INSERT INTO "users_community" VALUES ('4', '4');
INSERT INTO "users_community" VALUES ('2', '4');
INSERT INTO "users_community" VALUES ('3', '5');
INSERT INTO "users_community" VALUES ('2', '5');
INSERT INTO "users_community" VALUES ('5', '4');
INSERT INTO "users_community" VALUES ('1', '4');
INSERT INTO "users_community" VALUES ('8', '6');
INSERT INTO "users_community" VALUES ('2', '6');
INSERT INTO "users_community" VALUES ('9', '7');
INSERT INTO "users_community" VALUES ('2', '7');
COMMIT;

-- ----------------------------
--  Table structure for volume
-- ----------------------------
DROP TABLE IF EXISTS "volume" CASCADE;
CREATE TABLE "volume" (
	"id" int8 NOT NULL DEFAULT nextval('volume_id_seq'::regclass),
	"description" varchar(2000) COLLATE "default",
	"number" int8 NOT NULL,
	"price" float8 NOT NULL,
	"user_id" int8,
	"loan_id" int8,
	"serie_id" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "volume" OWNER TO "comixloan";

-- ----------------------------
--  Records of volume
-- ----------------------------
BEGIN;
INSERT INTO "volume" VALUES ('3', '', '3', '3', '2', null, '1');
INSERT INTO "volume" VALUES ('1', '', '1', '3', '2', null, '1');
INSERT INTO "volume" VALUES ('7', '', '2', '3', '2', null, '2');
INSERT INTO "volume" VALUES ('6', '', '3', '4', '2', null, '2');
INSERT INTO "volume" VALUES ('14', '', '1', '3', '4', '13', '5');
INSERT INTO "volume" VALUES ('4', '1', '1', '3', '2', null, '2');
INSERT INTO "volume" VALUES ('15', '2', '2', '3', '4', '13', '5');
INSERT INTO "volume" VALUES ('8', '', '3000', '3', '2', null, '3');
INSERT INTO "volume" VALUES ('9', '', '1', '100', '3', null, '3');
INSERT INTO "volume" VALUES ('10', '', '101', '2', '3', null, '3');
INSERT INTO "volume" VALUES ('11', '2', '3000', '2', '3', null, '3');
INSERT INTO "volume" VALUES ('12', 'puppa', '12000', '-2', '5', '2', '2');
INSERT INTO "volume" VALUES ('13', '', '1223', '5', '5', null, '4');
INSERT INTO "volume" VALUES ('16', '', '3', '3', '4', '13', '5');
INSERT INTO "volume" VALUES ('2', '', '2', '3', '2', null, '1');
INSERT INTO "volume" VALUES ('17', '', '1', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('18', '', '2', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('19', '', '3', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('20', '', '4', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('21', '', '5', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('22', '', '6', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('23', '', '7', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('24', '', '8', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('25', '', '9', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('26', '', '10', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('27', '', '11', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('28', '', '12', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('29', '', '13', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('30', '', '14', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('31', '', '15', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('32', '', '16', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('33', '', '17', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('34', '', '18', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('35', '', '19', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('36', '', '20', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('37', '', '21', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('38', '', '22', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('39', '', '23', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('40', '', '24', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('41', '', '25', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('42', '', '26', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('43', '', '27', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('44', '', '28', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('45', '', '29', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('46', '', '30', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('47', '', '31', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('48', '', '32', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('49', '', '33', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('50', '', '34', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('51', '', '35', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('52', '', '36', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('53', '', '37', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('54', '', '38', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('55', '', '39', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('56', '', '40', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('57', '', '41', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('58', '', '42', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('59', '', '43', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('60', '', '44', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('61', '', '45', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('62', '', '46', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('63', '', '47', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('64', '', '48', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('65', '', '49', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('66', '', '50', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('67', '', '51', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('68', '', '52', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('69', '', '53', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('70', '', '54', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('71', '', '55', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('72', '', '56', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('73', '', '57', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('74', '', '58', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('75', '', '59', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('76', '', '60', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('77', '', '61', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('78', '', '62', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('79', '', '63', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('80', '', '64', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('81', '', '65', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('82', '', '66', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('83', '', '67', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('84', '', '68', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('85', '', '69', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('86', '', '70', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('87', '', '71', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('88', '', '72', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('89', '', '73', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('5', '', '4', '3', '2', null, '1');
INSERT INTO "volume" VALUES ('90', '', '74', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('91', '', '75', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('92', '', '76', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('93', '', '77', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('94', '', '78', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('95', '', '79', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('96', '', '80', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('97', '', '81', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('98', '', '82', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('99', '', '83', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('100', '', '84', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('101', '', '85', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('102', '', '86', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('103', '', '87', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('104', '', '88', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('105', '', '89', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('106', '', '90', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('107', '', '91', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('108', '', '92', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('109', '', '93', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('110', '', '94', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('111', '', '95', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('112', '', '96', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('113', '', '97', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('114', '', '98', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('115', '', '99', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('116', '', '100', '1.5', '1', null, '2');
INSERT INTO "volume" VALUES ('117', '', '1', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('118', '', '2', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('119', '', '3', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('120', '', '4', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('121', '', '5', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('122', '', '6', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('123', '', '7', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('124', '', '8', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('125', '', '9', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('126', '', '10', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('127', '', '11', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('128', '', '12', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('129', '', '13', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('130', '', '14', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('131', '', '15', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('132', '', '16', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('133', '', '17', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('134', '', '18', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('135', '', '19', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('136', '', '20', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('137', '', '21', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('138', '', '22', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('139', '', '23', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('140', '', '24', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('141', '', '25', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('142', '', '26', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('143', '', '27', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('144', '', '28', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('145', '', '29', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('146', '', '30', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('147', '', '31', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('148', '', '32', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('149', '', '33', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('150', '', '34', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('151', '', '35', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('152', '', '36', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('153', '', '37', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('154', '', '38', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('155', '', '39', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('156', '', '40', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('157', '', '41', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('158', '', '42', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('159', '', '43', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('160', '', '44', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('161', '', '45', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('162', '', '46', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('163', '', '47', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('164', '', '48', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('165', '', '49', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('166', '', '50', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('167', '', '51', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('168', '', '52', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('169', '', '53', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('170', '', '54', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('171', '', '55', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('172', '', '56', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('173', '', '57', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('174', '', '58', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('175', '', '59', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('176', '', '60', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('183', '', '67', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('184', '', '68', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('185', '', '69', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('186', '', '70', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('187', '', '1', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('188', '', '2', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('189', '', '3', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('190', '', '4', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('191', '', '5', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('192', '', '6', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('182', '', '66', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('181', '', '65', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('180', '', '64', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('179', '', '63', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('178', '', '62', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('177', '', '61', '0', '2', null, '1');
INSERT INTO "volume" VALUES ('193', '', '7', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('194', '', '8', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('195', '', '9', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('196', '', '10', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('197', '', '11', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('198', '', '12', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('199', '', '13', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('200', '', '14', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('201', '', '15', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('202', '', '16', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('203', '', '17', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('204', '', '18', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('205', '', '19', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('206', '', '20', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('207', '', '21', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('208', '', '22', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('209', '', '23', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('210', '', '24', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('211', '', '25', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('212', '', '26', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('213', '', '27', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('214', '', '28', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('215', '', '29', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('216', '', '30', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('217', '', '31', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('218', '', '32', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('219', '', '33', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('220', '', '34', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('221', '', '35', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('222', '', '36', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('223', '', '37', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('224', '', '38', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('225', '', '39', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('226', '', '40', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('227', '', '41', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('228', '', '42', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('229', '', '43', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('230', '', '44', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('231', '', '45', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('232', '', '46', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('233', '', '47', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('234', '', '48', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('235', '', '49', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('236', '', '50', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('237', '', '51', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('238', '', '52', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('239', '', '53', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('240', '', '54', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('241', '', '55', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('242', '', '56', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('243', '', '57', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('244', '', '58', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('245', '', '59', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('246', '', '60', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('247', '', '61', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('248', '', '62', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('249', '', '63', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('250', '', '64', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('251', '', '65', '3.9', '8', null, '1');
INSERT INTO "volume" VALUES ('253', '', '2', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('254', '', '3', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('255', '', '4', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('256', '', '5', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('257', '', '6', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('258', '', '7', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('259', '', '8', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('260', '', '9', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('261', '', '10', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('262', '', '11', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('263', '', '12', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('264', '', '13', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('265', '', '14', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('266', '', '15', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('267', '', '16', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('273', '', '22', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('274', '', '23', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('275', '', '24', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('276', '', '25', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('277', '', '26', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('278', '', '27', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('279', '', '28', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('280', '', '29', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('281', '', '30', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('282', '', '31', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('283', '', '32', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('284', '', '33', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('285', '', '34', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('286', '', '35', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('287', '', '36', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('288', '', '37', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('289', '', '38', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('290', '', '39', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('291', '', '40', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('292', '', '41', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('293', '', '42', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('294', '', '43', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('295', '', '44', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('296', '', '45', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('297', '', '46', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('298', '', '47', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('299', '', '48', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('300', '', '49', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('301', '', '50', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('302', '', '51', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('303', '', '52', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('268', '', '17', '3.9', '8', '15', '2');
INSERT INTO "volume" VALUES ('269', '', '18', '3.9', '8', '15', '2');
INSERT INTO "volume" VALUES ('270', '', '19', '3.9', '8', '15', '2');
INSERT INTO "volume" VALUES ('272', '', '21', '3.9', '8', '15', '2');
INSERT INTO "volume" VALUES ('304', '', '53', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('305', '', '54', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('306', '', '55', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('307', '', '56', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('308', '', '57', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('309', '', '58', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('310', '', '59', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('311', '', '60', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('312', '', '61', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('313', '', '62', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('314', '', '63', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('315', '', '64', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('316', '', '65', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('317', '', '66', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('318', '', '67', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('319', '', '68', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('320', '', '69', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('321', '', '70', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('322', '', '1', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('323', '', '2', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('324', '', '3', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('325', '', '4', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('326', '', '5', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('327', '', '6', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('328', '', '7', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('329', '', '8', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('330', '', '9', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('331', '', '10', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('332', '', '11', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('333', '', '12', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('334', '', '13', '3.9', '8', null, '6');
INSERT INTO "volume" VALUES ('335', '', '1', '3.9', '8', null, '7');
INSERT INTO "volume" VALUES ('336', '', '2', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('337', '', '3', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('338', '', '4', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('339', '', '5', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('340', '', '6', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('341', '', '7', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('342', '', '8', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('343', '', '9', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('344', '', '10', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('345', '', '11', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('346', '', '12', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('347', '', '13', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('348', '', '14', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('349', '', '15', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('350', '', '16', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('351', '', '17', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('352', '', '18', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('353', '', '19', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('354', '', '20', '0', '8', null, '7');
INSERT INTO "volume" VALUES ('355', '', '1', '4.2', '8', null, '8');
INSERT INTO "volume" VALUES ('356', '', '2', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('357', '', '3', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('358', '', '4', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('359', '', '5', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('360', '', '6', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('361', '', '7', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('362', '', '8', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('363', '', '9', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('364', '', '10', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('368', '', '14', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('369', '', '15', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('370', '', '16', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('371', '', '1', '3.2', '8', null, '9');
INSERT INTO "volume" VALUES ('372', '', '2', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('373', '', '3', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('374', '', '4', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('375', '', '5', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('376', '', '6', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('377', '', '7', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('379', '', '9', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('380', '', '10', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('381', '', '11', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('382', '', '12', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('383', '', '13', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('384', '', '14', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('385', '', '15', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('386', '', '16', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('387', '', '17', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('388', '', '18', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('389', '', '19', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('390', '', '20', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('391', '', '21', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('392', '', '22', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('395', '', '25', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('396', '', '26', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('397', '', '27', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('398', '', '1', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('399', '', '2', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('400', '', '3', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('401', '', '4', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('402', '', '5', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('403', '', '6', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('404', '', '7', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('405', '', '8', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('406', '', '9', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('407', '', '10', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('408', '', '11', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('409', '', '12', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('410', '', '13', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('393', '', '23', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('411', '', '14', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('412', '', '15', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('413', '', '16', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('414', '', '17', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('415', '', '18', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('416', '', '19', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('417', '', '20', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('418', '', '21', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('419', '', '22', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('420', '', '23', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('421', '', '24', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('422', '', '25', '3.9', '8', null, '10');
INSERT INTO "volume" VALUES ('423', '', '1', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('424', '', '2', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('425', '', '3', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('426', '', '4', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('427', '', '5', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('428', '', '6', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('429', '', '7', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('430', '', '8', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('431', '', '9', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('432', '', '10', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('433', '', '11', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('434', '', '12', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('435', '', '13', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('436', '', '14', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('437', '', '15', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('438', '', '16', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('439', '', '17', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('446', '', '24', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('447', '', '25', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('448', '', '26', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('463', '', '14', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('467', '', '18', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('468', '', '19', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('394', '', '24', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('365', '', '11', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('367', '', '13', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('378', '', '8', '3.9', '8', null, '9');
INSERT INTO "volume" VALUES ('366', '', '12', '0', '8', null, '8');
INSERT INTO "volume" VALUES ('252', '', '1', '3.9', '8', null, '2');
INSERT INTO "volume" VALUES ('441', '', '19', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('442', '', '20', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('443', '', '21', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('444', '', '22', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('445', '', '23', '3.9', '8', null, '11');
INSERT INTO "volume" VALUES ('450', '', '1', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('451', '', '2', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('452', '', '3', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('453', '', '4', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('454', '', '5', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('455', '', '6', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('456', '', '7', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('457', '', '8', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('458', '', '9', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('459', '', '10', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('460', '', '11', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('461', '', '12', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('462', '', '13', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('464', '', '15', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('465', '', '16', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('466', '', '17', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('469', '', '20', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('470', '', '21', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('471', '', '22', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('472', '', '23', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('473', '', '24', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('474', '', '25', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('475', '', '26', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('476', '', '27', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('477', '', '28', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('478', '', '29', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('479', '', '30', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('480', '', '31', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('481', '', '32', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('482', '', '33', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('483', '', '34', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('484', '', '35', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('485', '', '36', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('486', '', '37', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('487', '', '38', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('488', '', '39', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('489', '', '40', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('490', '', '41', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('491', '', '42', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('492', '', '43', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('493', '', '44', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('494', '', '45', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('495', '', '46', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('449', '', '27', '3.9', '8', '15', '11');
INSERT INTO "volume" VALUES ('440', '', '18', '3.9', '8', '15', '11');
INSERT INTO "volume" VALUES ('496', '', '47', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('497', '', '48', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('498', '', '49', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('499', '', '50', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('500', '', '51', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('501', '', '52', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('502', '', '53', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('503', '', '54', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('504', '', '55', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('505', '', '56', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('506', '', '57', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('507', '', '58', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('508', '', '59', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('509', '', '60', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('510', '', '61', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('511', '', '62', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('512', '', '63', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('513', '', '64', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('514', '', '65', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('515', '', '66', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('516', '', '67', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('517', '', '68', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('518', '', '69', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('519', '', '70', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('520', '', '71', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('521', '', '72', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('522', '', '73', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('523', '', '74', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('524', '', '75', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('525', '', '76', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('526', '', '77', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('527', '', '78', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('528', '', '79', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('529', '', '80', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('530', '', '81', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('531', '', '82', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('532', '', '83', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('533', '', '84', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('534', '', '85', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('535', '', '86', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('536', '', '87', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('537', '', '88', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('538', '', '89', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('539', '', '90', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('540', '', '91', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('541', '', '92', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('542', '', '93', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('543', '', '94', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('544', '', '95', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('545', '', '96', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('546', '', '97', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('547', '', '98', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('548', '', '99', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('549', '', '100', '5', '9', null, '12');
INSERT INTO "volume" VALUES ('550', '', '22', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('551', '', '23', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('552', '', '24', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('553', '', '25', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('554', '', '26', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('555', '', '27', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('556', '', '28', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('557', '', '29', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('558', '', '30', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('559', '', '31', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('560', '', '32', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('561', '', '33', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('562', '', '34', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('563', '', '35', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('565', '', '2001', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('566', '', '2002', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('567', '', '2003', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('568', '', '2004', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('569', '', '2005', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('570', '', '2006', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('571', '', '2007', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('572', '', '2008', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('573', '', '2009', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('574', '', '2010', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('575', '', '2011', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('576', '', '2012', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('577', '', '2013', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('578', '', '2014', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('579', '', '2015', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('580', '', '2016', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('581', '', '2017', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('582', '', '2018', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('583', '', '2019', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('584', '', '2020', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('585', '', '2021', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('586', '', '2022', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('587', '', '2023', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('588', '', '2024', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('589', '', '2025', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('590', '', '2026', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('591', '', '2027', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('592', '', '2028', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('593', '', '2029', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('594', '', '2030', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('595', '', '2031', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('596', '', '2032', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('597', '', '2033', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('598', '', '2034', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('599', '', '2035', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('600', '', '2036', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('601', '', '2037', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('602', '', '2038', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('603', '', '2039', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('604', '', '2040', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('605', '', '2041', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('606', '', '2042', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('607', '', '2043', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('608', '', '2044', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('609', '', '2045', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('610', '', '2046', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('611', '', '2047', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('612', '', '2048', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('613', '', '2049', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('614', '', '2050', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('615', '', '2051', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('616', '', '2052', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('617', '', '2053', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('618', '', '2054', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('619', '', '2055', '4', '3', null, '4');
INSERT INTO "volume" VALUES ('620', '', '1', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('621', '', '2', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('622', '', '3', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('623', '', '4', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('624', '', '5', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('625', '', '6', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('626', '', '7', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('627', '', '8', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('628', '', '9', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('629', '', '10', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('630', '', '11', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('631', '', '12', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('632', '', '13', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('633', '', '14', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('634', '', '15', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('635', '', '16', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('636', '', '17', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('637', '', '18', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('638', '', '19', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('639', '', '20', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('640', '', '21', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('641', '', '22', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('642', '', '23', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('643', '', '24', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('644', '', '25', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('645', '', '26', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('646', '', '27', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('647', '', '28', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('648', '', '29', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('649', '', '30', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('650', '', '31', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('651', '', '32', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('652', '', '33', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('653', '', '34', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('654', '', '35', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('655', '', '36', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('656', '', '37', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('657', '', '38', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('658', '', '39', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('659', '', '40', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('660', '', '41', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('661', '', '42', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('662', '', '43', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('663', '', '44', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('664', '', '45', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('665', '', '46', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('666', '', '47', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('667', '', '48', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('668', '', '49', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('669', '', '50', '3', '3', null, '13');
INSERT INTO "volume" VALUES ('670', '', '1', '3.9', '12', null, '7');
INSERT INTO "volume" VALUES ('564', '', '36', '5', '3', null, '12');
INSERT INTO "volume" VALUES ('271', '', '20', '3.9', '8', '15', '2');
COMMIT;


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "community_id_seq" RESTART 8 OWNED BY "community"."id";
ALTER SEQUENCE "historyloan_id_seq" RESTART 13 OWNED BY "historyloan"."id";
ALTER SEQUENCE "loan_id_seq" RESTART 16 OWNED BY "loan"."id";
ALTER SEQUENCE "serie_id_seq" RESTART 14 OWNED BY "serie"."id";
ALTER SEQUENCE "users_id_seq" RESTART 13 OWNED BY "users"."id";
ALTER SEQUENCE "volume_id_seq" RESTART 671 OWNED BY "volume"."id";
-- ----------------------------
--  Primary key structure for table loan
-- ----------------------------
ALTER TABLE "loan" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table community
-- ----------------------------
ALTER TABLE "community" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table historyloan
-- ----------------------------
ALTER TABLE "historyloan" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table serie
-- ----------------------------
ALTER TABLE "serie" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table users
-- ----------------------------
ALTER TABLE "users" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table volume
-- ----------------------------
ALTER TABLE "volume" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table loan
-- ----------------------------
ALTER TABLE "loan" ADD CONSTRAINT "loan_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "loan" ADD CONSTRAINT "loan_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table community
-- ----------------------------
ALTER TABLE "community" ADD CONSTRAINT "community_admin_id_fkey" FOREIGN KEY ("admin_id") REFERENCES "users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table historyloan
-- ----------------------------
ALTER TABLE "historyloan" ADD CONSTRAINT "historyloan_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "historyloan" ADD CONSTRAINT "historyloan_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table historyloan_volume
-- ----------------------------
ALTER TABLE "historyloan_volume" ADD CONSTRAINT "historyloan_volume_loanhistory_id_fkey" FOREIGN KEY ("loanhistory_id") REFERENCES "historyloan" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "historyloan_volume" ADD CONSTRAINT "historyloan_volume_volumes_id_fkey" FOREIGN KEY ("volumes_id") REFERENCES "volume" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table users_community
-- ----------------------------
ALTER TABLE "users_community" ADD CONSTRAINT "users_community_communities_id_fkey" FOREIGN KEY ("communities_id") REFERENCES "community" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "users_community" ADD CONSTRAINT "users_community_users_id_fkey" FOREIGN KEY ("users_id") REFERENCES "users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table volume
-- ----------------------------
ALTER TABLE "volume" ADD CONSTRAINT "volume_loan_id_fkey" FOREIGN KEY ("loan_id") REFERENCES "loan" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "volume" ADD CONSTRAINT "volume_serie_id_fkey" FOREIGN KEY ("serie_id") REFERENCES "serie" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "volume" ADD CONSTRAINT "volume_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;

