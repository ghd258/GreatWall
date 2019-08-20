/*========================================================== 1. 创建数据库 ===========================================================*/
/*
DROP database IF EXISTS "GreatWall";
create database "GreatWall";
*/
/*========================================================== 2. 创建架构 ===========================================================*/
CREATE SCHEMA IF NOT EXISTS "Systems";

/*========================================================== 3. 创建表 ===========================================================*/


-- ----------------------------
-- Table structure for Application
-- ----------------------------
DROP TABLE IF EXISTS "Systems"."Application";
CREATE TABLE "Systems"."Application" (
  "ApplicationId" uuid NOT NULL,
  "Code" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "Name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "Enabled" bool NOT NULL,
  "RegisterEnabled" bool NOT NULL,
  "Remark" varchar(500) COLLATE "pg_catalog"."default",
  "Extend" varchar(10485760) COLLATE "pg_catalog"."default",
  "CreationTime" timestamp(6),
  "CreatorId" uuid,
  "LastModificationTime" timestamp(6),
  "LastModifierId" uuid,
  "IsDeleted" bool NOT NULL,
  "Version" bytea
)
;
COMMENT ON COLUMN "Systems"."Application"."ApplicationId" IS '应用程序标识';
COMMENT ON COLUMN "Systems"."Application"."Code" IS '应用程序编码';
COMMENT ON COLUMN "Systems"."Application"."Name" IS '应用程序名称';
COMMENT ON COLUMN "Systems"."Application"."Enabled" IS '启用';
COMMENT ON COLUMN "Systems"."Application"."RegisterEnabled" IS '启用注册';
COMMENT ON COLUMN "Systems"."Application"."Remark" IS '备注';
COMMENT ON COLUMN "Systems"."Application"."Extend" IS '扩展';
COMMENT ON COLUMN "Systems"."Application"."CreationTime" IS '创建时间';
COMMENT ON COLUMN "Systems"."Application"."CreatorId" IS '创建人标识';
COMMENT ON COLUMN "Systems"."Application"."LastModificationTime" IS '最后修改时间';
COMMENT ON COLUMN "Systems"."Application"."LastModifierId" IS '最后修改人标识';
COMMENT ON COLUMN "Systems"."Application"."IsDeleted" IS '是否删除';
COMMENT ON COLUMN "Systems"."Application"."Version" IS '版本号';
COMMENT ON TABLE "Systems"."Application" IS '应用程序';

-- ----------------------------
-- Records of Application
-- ----------------------------
INSERT INTO "Systems"."Application" VALUES ('e9138a35-a4ff-460e-ac55-b743d55b9691', 'greatwall-admin', '权限后台', 't', 't', 'GreatWall权限管理后台', '{"ApplicationType":3,"IsClient":true,"Client":{"AllowedGrantType":1,"AllowAccessTokensViaBrowser":true,"AllowedCorsOrigins":["http://localhost:10081"],"RequireConsent":null,"RedirectUris":["http://localhost:10081/callback"],"PostLogoutRedirectUris":["http://localhost:10081"],"AllowedScopes":["openid","profile","greatwall-api"],"AccessTokenLifetime":36000}}', '2019-07-07 16:06:09.47', NULL, '2019-08-09 23:55:47.337293', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'6041cf5d-8eea-49a1-a671-acfdf5438c11');

-- ----------------------------
-- Table structure for Claim
-- ----------------------------
DROP TABLE IF EXISTS "Systems"."Claim";
CREATE TABLE "Systems"."Claim" (
  "ClaimId" uuid NOT NULL,
  "Name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "Enabled" bool NOT NULL,
  "SortId" int4,
  "Remark" varchar(500) COLLATE "pg_catalog"."default",
  "CreationTime" timestamp(6),
  "CreatorId" uuid,
  "LastModificationTime" timestamp(6),
  "LastModifierId" uuid,
  "IsDeleted" bool NOT NULL,
  "Version" bytea
)
;
COMMENT ON COLUMN "Systems"."Claim"."ClaimId" IS '声明标识';
COMMENT ON COLUMN "Systems"."Claim"."Name" IS '声明名称';
COMMENT ON COLUMN "Systems"."Claim"."Enabled" IS '启用';
COMMENT ON COLUMN "Systems"."Claim"."SortId" IS '排序号';
COMMENT ON COLUMN "Systems"."Claim"."Remark" IS '备注';
COMMENT ON COLUMN "Systems"."Claim"."CreationTime" IS '创建时间';
COMMENT ON COLUMN "Systems"."Claim"."CreatorId" IS '创建人标识';
COMMENT ON COLUMN "Systems"."Claim"."LastModificationTime" IS '最后修改时间';
COMMENT ON COLUMN "Systems"."Claim"."LastModifierId" IS '最后修改人标识';
COMMENT ON COLUMN "Systems"."Claim"."IsDeleted" IS '是否删除';
COMMENT ON COLUMN "Systems"."Claim"."Version" IS '版本号';
COMMENT ON TABLE "Systems"."Claim" IS '声明';

-- ----------------------------
-- Records of Claim
-- ----------------------------
INSERT INTO "Systems"."Claim" VALUES ('3d78cc4d-53dd-5f27-2020-e8c81cac0897', 'nickname', 't', 4, '昵称', '2019-07-26 09:58:53.636551', NULL, '2019-08-08 21:26:48.396287', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'587e259d-4096-4879-a166-3ddb752b5a71');
INSERT INTO "Systems"."Claim" VALUES ('91b92e54-3434-1352-60d3-d79e922d4794', 'profile', 't', 2, NULL, '2019-07-26 09:58:53.636551', NULL, '2019-08-08 21:26:48.396287', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'493031e9-159c-4e72-948e-0157d2c3cca9');
INSERT INTO "Systems"."Claim" VALUES ('ee612ca0-8159-9851-620a-4610cbbab13a', 'name', 't', 3, '用户名', '2019-07-26 09:33:15.845595', NULL, '2019-08-08 21:26:48.396287', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'd53c3ed0-70da-4136-ac51-61936c90d806');
INSERT INTO "Systems"."Claim" VALUES ('a55444ac-72f1-81f3-3a25-7dc3105f4727', 'application_id', 't', 7, '应用程序标识', '2019-08-08 21:26:48.396287', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-08 21:26:48.396287', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'b668b58c-8516-4a84-9cfa-1feec19befa8');
INSERT INTO "Systems"."Claim" VALUES ('62325b3f-9753-a46a-2801-417464e697ee', 'phone_number', 't', 6, '手机号', '2019-08-08 21:26:48.396287', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-08 21:26:48.396287', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'0ca876e5-68c1-4b75-8ab6-0ab01c2549dc');
INSERT INTO "Systems"."Claim" VALUES ('d8e80be9-0f86-a84c-01c5-7e621d5c24a2', 'email', 't', 5, '电子邮件', '2019-08-08 21:26:48.396287', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-08 21:26:48.396287', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'45fc5ca3-4bc5-4eb8-b9be-6ad63d29ebaf');
INSERT INTO "Systems"."Claim" VALUES ('e1399420-a6c6-fc36-6520-490a13ee8064', 'sub', 't', 1, '用户标识', '2019-08-08 21:26:48.396287', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-08 22:59:45.042557', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'1e442bed-55f1-4f57-af44-58df4a8f926d');

-- ----------------------------
-- Table structure for Permission
-- ----------------------------
DROP TABLE IF EXISTS "Systems"."Permission";
CREATE TABLE "Systems"."Permission" (
  "PermissionId" uuid NOT NULL,
  "RoleId" uuid NOT NULL,
  "ResourceId" uuid NOT NULL,
  "IsDeny" bool NOT NULL,
  "Sign" varchar(256) COLLATE "pg_catalog"."default",
  "CreationTime" timestamp(6),
  "CreatorId" uuid,
  "LastModificationTime" timestamp(6),
  "LastModifierId" uuid,
  "IsDeleted" bool NOT NULL,
  "Version" bytea
)
;

-- ----------------------------
-- Records of Permission
-- ----------------------------
INSERT INTO "Systems"."Permission" VALUES ('177bd898-b303-49b3-964b-07a56de947d2', '03b7f379-404a-4659-9d1e-7a58299f6bdf', 'be022f2f-559c-4ac3-ad1f-74eb61fc896d', 'f', NULL, '2019-07-26 10:21:10.75803', NULL, '2019-07-26 10:21:10.75803', NULL, 'f', E'a47135bb-5359-49dd-8ff4-81dd9cf0ad2a');
INSERT INTO "Systems"."Permission" VALUES ('17523449-9e9a-45a2-b35f-97343ec549f1', '03b7f379-404a-4659-9d1e-7a58299f6bdf', '1e6ede35-bc76-40b9-aa20-8481a55281bd', 'f', NULL, '2019-07-26 10:21:10.75903', NULL, '2019-07-26 10:21:10.75903', NULL, 'f', E'e2389b0f-ccd1-4274-9d63-ad270c5a6746');
INSERT INTO "Systems"."Permission" VALUES ('56241b74-3d61-40c4-a210-4ad4c61a7b1d', '03b7f379-404a-4659-9d1e-7a58299f6bdf', '6af8de88-d22b-403a-9c2c-e8f49e24ccad', 'f', NULL, '2019-07-26 10:21:10.75903', NULL, '2019-07-26 10:21:10.75903', NULL, 'f', E'242f1175-7104-4697-8ed4-a40f7ad545b5');
INSERT INTO "Systems"."Permission" VALUES ('7f68dcea-2268-47e1-a6d3-06828287fa1c', '03b7f379-404a-4659-9d1e-7a58299f6bdf', '6b7a742c-4d69-408e-9363-7edb2c2d1816', 'f', NULL, '2019-07-26 10:21:10.75903', NULL, '2019-07-26 10:21:10.75903', NULL, 'f', E'a2b4b0ce-bfae-4179-ab7b-6a0c92732891');
INSERT INTO "Systems"."Permission" VALUES ('9973ea50-0f22-469d-ae7c-4551bb36ae96', '03b7f379-404a-4659-9d1e-7a58299f6bdf', '894dabae-aad4-4c64-a7fc-2aebfce18f0d', 'f', NULL, '2019-07-26 10:21:10.75903', NULL, '2019-07-26 10:21:10.75903', NULL, 'f', E'2fdd4b2d-a278-47be-8d4f-25023fcd0827');
INSERT INTO "Systems"."Permission" VALUES ('8aadcbde-4e3e-4c34-8d81-0f205ff68575', '03b7f379-404a-4659-9d1e-7a58299f6bdf', 'e2306a73-b1f4-4974-b90d-323b800e0a4a', 'f', NULL, '2019-07-26 10:21:10.75903', NULL, '2019-07-26 10:21:10.75903', NULL, 'f', E'0939a4bb-61bb-4502-9bb2-49da977b858f');
INSERT INTO "Systems"."Permission" VALUES ('a31f1ac1-d884-4a40-8400-d11da8ace08f', '03b7f379-404a-4659-9d1e-7a58299f6bdf', '8eb03219-907b-40b3-8dd3-56f1e9a9dd30', 'f', NULL, '2019-07-26 10:21:10.75903', NULL, '2019-07-26 10:21:10.75903', NULL, 'f', E'fd55dc75-969d-4472-bcbb-170a6907c6ac');
INSERT INTO "Systems"."Permission" VALUES ('83311f0a-c1ca-4524-885c-b6acfb52d797', '03b7f379-404a-4659-9d1e-7a58299f6bdf', '97e4b363-c448-4cb8-8c57-6bd55213fcdf', 'f', NULL, '2019-07-26 10:21:10.75903', NULL, '2019-07-26 10:21:10.75903', NULL, 'f', E'186c0ff5-a5cc-4e63-8cc7-4b72eac6f713');
INSERT INTO "Systems"."Permission" VALUES ('dda721d2-9aab-4c85-83a5-060205c79298', '03b7f379-404a-4659-9d1e-7a58299f6bdf', 'ada8d8dc-49fb-4973-bdb1-fee1928aff73', 'f', NULL, '2019-08-08 21:23:29.337901', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-08 21:23:29.337901', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'a22da57f-9d67-4065-8832-e8a8d69db315');
INSERT INTO "Systems"."Permission" VALUES ('357a6ec0-1466-48bd-a4bc-2ddfa2b902f2', '03b7f379-404a-4659-9d1e-7a58299f6bdf', '819d804d-b620-4a78-b847-02de9128aa11', 'f', NULL, '2019-08-08 21:23:29.338901', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-08 21:23:29.338901', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'05467020-83ad-4d56-9d9e-7dd56aa03af5');

-- ----------------------------
-- Table structure for Resource
-- ----------------------------
DROP TABLE IF EXISTS "Systems"."Resource";
CREATE TABLE "Systems"."Resource" (
  "ResourceId" uuid NOT NULL,
  "ApplicationId" uuid,
  "Uri" varchar(300) COLLATE "pg_catalog"."default",
  "Name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "Type" int4 NOT NULL,
  "ParentId" uuid,
  "Path" varchar(800) COLLATE "pg_catalog"."default",
  "Level" int4,
  "Remark" varchar(500) COLLATE "pg_catalog"."default",
  "PinYin" varchar(200) COLLATE "pg_catalog"."default",
  "Enabled" bool NOT NULL,
  "SortId" int4,
  "Extend" varchar(10485760) COLLATE "pg_catalog"."default",
  "CreationTime" timestamp(6),
  "CreatorId" uuid,
  "LastModificationTime" timestamp(6),
  "LastModifierId" uuid,
  "IsDeleted" bool NOT NULL,
  "Version" bytea
)
;
COMMENT ON COLUMN "Systems"."Resource"."ResourceId" IS '资源标识';
COMMENT ON COLUMN "Systems"."Resource"."ApplicationId" IS '应用程序标识';
COMMENT ON COLUMN "Systems"."Resource"."Uri" IS '资源标识';
COMMENT ON COLUMN "Systems"."Resource"."Name" IS '资源名称';
COMMENT ON COLUMN "Systems"."Resource"."Type" IS '资源类型';
COMMENT ON COLUMN "Systems"."Resource"."ParentId" IS '父标识';
COMMENT ON COLUMN "Systems"."Resource"."Path" IS '路径';
COMMENT ON COLUMN "Systems"."Resource"."Level" IS '层级';
COMMENT ON COLUMN "Systems"."Resource"."Remark" IS '备注';
COMMENT ON COLUMN "Systems"."Resource"."PinYin" IS '拼音简码';
COMMENT ON COLUMN "Systems"."Resource"."Enabled" IS '启用';
COMMENT ON COLUMN "Systems"."Resource"."SortId" IS '排序号';
COMMENT ON COLUMN "Systems"."Resource"."Extend" IS '扩展';
COMMENT ON COLUMN "Systems"."Resource"."CreationTime" IS '创建时间';
COMMENT ON COLUMN "Systems"."Resource"."CreatorId" IS '创建人标识';
COMMENT ON COLUMN "Systems"."Resource"."LastModificationTime" IS '最后修改时间';
COMMENT ON COLUMN "Systems"."Resource"."LastModifierId" IS '最后修改人标识';
COMMENT ON COLUMN "Systems"."Resource"."IsDeleted" IS '是否删除';
COMMENT ON COLUMN "Systems"."Resource"."Version" IS '版本号';
COMMENT ON TABLE "Systems"."Resource" IS '资源';

-- ----------------------------
-- Records of Resource
-- ----------------------------
INSERT INTO "Systems"."Resource" VALUES ('be022f2f-559c-4ac3-ad1f-74eb61fc896d', 'e9138a35-a4ff-460e-ac55-b743d55b9691', NULL, '主菜单', 1, NULL, 'be022f2f-559c-4ac3-ad1f-74eb61fc896d,', 1, NULL, 'zcc', 't', 1, '{"Icon":null,"Expanded":null}', '2019-07-26 10:11:18.94618', NULL, '2019-07-26 10:11:18.94618', NULL, 'f', E'48c82e3d-72ba-4b1d-a780-1ac15e3e6a14');
INSERT INTO "Systems"."Resource" VALUES ('1e6ede35-bc76-40b9-aa20-8481a55281bd', 'e9138a35-a4ff-460e-ac55-b743d55b9691', '/dashboard/v1', '仪表盘', 1, 'be022f2f-559c-4ac3-ad1f-74eb61fc896d', 'be022f2f-559c-4ac3-ad1f-74eb61fc896d,1e6ede35-bc76-40b9-aa20-8481a55281bd,', 2, NULL, 'ybp', 't', 1, '{"Icon":"anticon anticon-dashboard","Expanded":null}', '2019-07-26 10:11:56.430324', NULL, '2019-07-26 10:11:56.430324', NULL, 'f', E'7c6c88da-dc09-4fa6-983d-757db90f97d6');
INSERT INTO "Systems"."Resource" VALUES ('6af8de88-d22b-403a-9c2c-e8f49e24ccad', 'e9138a35-a4ff-460e-ac55-b743d55b9691', NULL, '系统管理', 1, NULL, '6af8de88-d22b-403a-9c2c-e8f49e24ccad,', 1, NULL, 'jtgl', 't', 2, '{"Icon":null,"Expanded":null}', '2019-07-26 10:13:26.661485', NULL, '2019-07-26 10:13:26.661485', NULL, 'f', E'53ae0798-01e7-4dd1-a45d-d6a644107f26');
INSERT INTO "Systems"."Resource" VALUES ('6b7a742c-4d69-408e-9363-7edb2c2d1816', 'e9138a35-a4ff-460e-ac55-b743d55b9691', '/systems/claim', '声明', 1, '6af8de88-d22b-403a-9c2c-e8f49e24ccad', '6af8de88-d22b-403a-9c2c-e8f49e24ccad,6b7a742c-4d69-408e-9363-7edb2c2d1816,', 2, NULL, 'sm', 't', 1, '{"Icon":"anticon anticon-tag","Expanded":null}', '2019-07-26 10:14:04.923674', NULL, '2019-07-26 10:14:04.923674', NULL, 'f', E'be857374-756e-4ce6-b2e2-0be9d44ca871');
INSERT INTO "Systems"."Resource" VALUES ('894dabae-aad4-4c64-a7fc-2aebfce18f0d', 'e9138a35-a4ff-460e-ac55-b743d55b9691', '/systems/application', '应用程序', 1, '6af8de88-d22b-403a-9c2c-e8f49e24ccad', '6af8de88-d22b-403a-9c2c-e8f49e24ccad,894dabae-aad4-4c64-a7fc-2aebfce18f0d,', 2, NULL, 'yycx', 't', 2, '{"Icon":"anticon anticon-database","Expanded":null}', '2019-07-26 10:14:32.224235', NULL, '2019-07-26 10:14:32.224235', NULL, 'f', E'84685570-44f3-44fc-b065-6ee08e226083');
INSERT INTO "Systems"."Resource" VALUES ('ada8d8dc-49fb-4973-bdb1-fee1928aff73', 'e9138a35-a4ff-460e-ac55-b743d55b9691', '/systems/identity-resource', '身份资源', 1, '6af8de88-d22b-403a-9c2c-e8f49e24ccad', '6af8de88-d22b-403a-9c2c-e8f49e24ccad,ada8d8dc-49fb-4973-bdb1-fee1928aff73,', 2, NULL, 'sfzy', 't', 3, '{"Icon":"anticon anticon-meh","Expanded":true}', '2019-08-08 21:22:03.806009', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-08 21:22:55.549969', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'792a783f-de43-498b-b3ce-2d5f697d3b94');
INSERT INTO "Systems"."Resource" VALUES ('819d804d-b620-4a78-b847-02de9128aa11', 'e9138a35-a4ff-460e-ac55-b743d55b9691', '/systems/api-resource', 'Api资源', 1, '6af8de88-d22b-403a-9c2c-e8f49e24ccad', '6af8de88-d22b-403a-9c2c-e8f49e24ccad,819d804d-b620-4a78-b847-02de9128aa11,', 2, NULL, 'apizy', 't', 4, '{"Icon":"anticon anticon-api","Expanded":true}', '2019-08-08 21:22:26.300296', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-08 21:23:00.650261', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'c81a2de1-e6cd-4ef6-a257-b47d2aea72e9');
INSERT INTO "Systems"."Resource" VALUES ('e2306a73-b1f4-4974-b90d-323b800e0a4a', 'e9138a35-a4ff-460e-ac55-b743d55b9691', '/systems/module', '模块', 1, '6af8de88-d22b-403a-9c2c-e8f49e24ccad', '6af8de88-d22b-403a-9c2c-e8f49e24ccad,e2306a73-b1f4-4974-b90d-323b800e0a4a,', 2, NULL, 'mk', 't', 5, '{"Icon":"anticon anticon-menu-fold","Expanded":true}', '2019-07-26 10:15:02.699978', NULL, '2019-08-08 21:23:05.643546', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'9d7411c3-06a6-4638-9dd3-5837c07e1a07');
INSERT INTO "Systems"."Resource" VALUES ('8eb03219-907b-40b3-8dd3-56f1e9a9dd30', 'e9138a35-a4ff-460e-ac55-b743d55b9691', '/systems/user', '用户', 1, '6af8de88-d22b-403a-9c2c-e8f49e24ccad', '6af8de88-d22b-403a-9c2c-e8f49e24ccad,8eb03219-907b-40b3-8dd3-56f1e9a9dd30,', 2, NULL, 'yh', 't', 6, '{"Icon":"anticon anticon-user","Expanded":true}', '2019-07-26 10:19:22.960865', NULL, '2019-08-08 21:23:12.122917', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'dccc624d-cfb3-4119-95c0-75e6c765e976');
INSERT INTO "Systems"."Resource" VALUES ('97e4b363-c448-4cb8-8c57-6bd55213fcdf', 'e9138a35-a4ff-460e-ac55-b743d55b9691', '/systems/role', '角色', 1, '6af8de88-d22b-403a-9c2c-e8f49e24ccad', '6af8de88-d22b-403a-9c2c-e8f49e24ccad,97e4b363-c448-4cb8-8c57-6bd55213fcdf,', 2, NULL, 'js', 't', 7, '{"Icon":"anticon anticon-team","Expanded":true}', '2019-07-26 10:19:52.400548', NULL, '2019-08-08 21:23:17.166205', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'cc4b6e36-e609-4a52-9d06-815e44b672d7');
INSERT INTO "Systems"."Resource" VALUES ('736c31ce-d5c4-40a6-a2db-e3333cdaf422', NULL, 'openid', 'openid', 5, NULL, NULL, 0, '用户标识', NULL, 't', 1, '{"Required":true,"Emphasize":false,"ShowInDiscoveryDocument":true,"Claims":["sub"]}', '2019-08-08 21:28:34.558359', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-08 21:28:34.558359', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'9ce4fed4-cc51-4f3a-9813-2a9af60de3f8');
INSERT INTO "Systems"."Resource" VALUES ('ffd48855-c0e3-416d-bfb4-30a529b70236', NULL, 'profile', 'profile', 5, NULL, NULL, 0, '用户个人信息', NULL, 't', 2, '{"Required":false,"Emphasize":true,"ShowInDiscoveryDocument":true,"Claims":["profile","name","nickname"]}', '2019-08-08 21:29:20.134966', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-08 21:29:20.134966', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'2b43b187-caa4-42f7-8a94-97ceb434c83a');
INSERT INTO "Systems"."Resource" VALUES ('6b5a8fe9-fc93-4615-982a-753120f7c1cb', NULL, 'greatwall-api', 'greatwall-api', 6, NULL, NULL, 0, 'GreatWall权限Api', NULL, 't', 1, '{"Claims":["email","phone_number","application_id"]}', '2019-08-08 21:30:46.067881', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', '2019-08-09 23:54:42.529586', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'f', E'1e90d713-3c61-43b3-8eea-4e3c9f35381a');

-- ----------------------------
-- Table structure for Role
-- ----------------------------
DROP TABLE IF EXISTS "Systems"."Role";
CREATE TABLE "Systems"."Role" (
  "RoleId" uuid NOT NULL,
  "Code" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "Name" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "NormalizedName" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "Type" varchar(80) COLLATE "pg_catalog"."default" NOT NULL,
  "IsAdmin" bool NOT NULL,
  "ParentId" uuid,
  "Path" varchar(800) COLLATE "pg_catalog"."default" NOT NULL,
  "Level" int4 NOT NULL,
  "SortId" int4,
  "Enabled" bool NOT NULL,
  "Remark" varchar(500) COLLATE "pg_catalog"."default",
  "PinYin" varchar(200) COLLATE "pg_catalog"."default",
  "Sign" varchar(256) COLLATE "pg_catalog"."default",
  "CreationTime" timestamp(6),
  "CreatorId" uuid,
  "LastModificationTime" timestamp(6),
  "LastModifierId" uuid,
  "IsDeleted" bool NOT NULL,
  "Version" bytea
)
;

-- ----------------------------
-- Records of Role
-- ----------------------------
INSERT INTO "Systems"."Role" VALUES ('03b7f379-404a-4659-9d1e-7a58299f6bdf', 'admin', '管理员', '管理员', 'Role', 'f', NULL, '03b7f379-404a-4659-9d1e-7a58299f6bdf,', 1, 1, 't', '管理员', 'gly', NULL, '2019-07-26 10:10:50.029527', NULL, '2019-07-26 10:10:50.030527', NULL, 'f', E'32bd551d-bff0-484d-815a-7093be8dce95');

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS "Systems"."User";
CREATE TABLE "Systems"."User" (
  "UserId" uuid NOT NULL,
  "UserName" varchar(256) COLLATE "pg_catalog"."default",
  "NormalizedUserName" varchar(256) COLLATE "pg_catalog"."default",
  "Email" varchar(256) COLLATE "pg_catalog"."default",
  "NormalizedEmail" varchar(256) COLLATE "pg_catalog"."default",
  "EmailConfirmed" bool NOT NULL,
  "PhoneNumber" varchar(64) COLLATE "pg_catalog"."default",
  "PhoneNumberConfirmed" bool NOT NULL,
  "Password" varchar(256) COLLATE "pg_catalog"."default",
  "PasswordHash" varchar(1024) COLLATE "pg_catalog"."default",
  "SafePassword" varchar(256) COLLATE "pg_catalog"."default",
  "SafePasswordHash" varchar(1024) COLLATE "pg_catalog"."default",
  "TwoFactorEnabled" bool NOT NULL,
  "Enabled" bool NOT NULL,
  "DisabledTime" timestamp(6),
  "LockoutEnabled" bool NOT NULL,
  "LockoutEnd" timestamp(6),
  "AccessFailedCount" int4,
  "LoginCount" int4,
  "RegisterIp" varchar(30) COLLATE "pg_catalog"."default",
  "LastLoginTime" timestamp(6),
  "LastLoginIp" varchar(30) COLLATE "pg_catalog"."default",
  "CurrentLoginTime" timestamp(6),
  "CurrentLoginIp" varchar(30) COLLATE "pg_catalog"."default",
  "SecurityStamp" varchar(1024) COLLATE "pg_catalog"."default",
  "Remark" varchar(500) COLLATE "pg_catalog"."default",
  "CreationTime" timestamp(6),
  "CreatorId" uuid,
  "LastModificationTime" timestamp(6),
  "LastModifierId" uuid,
  "IsDeleted" bool NOT NULL,
  "Version" bytea
)
;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO "Systems"."User" VALUES ('73d29518-9b9d-45c8-a84a-c8df19d9bbd7', 'admin', 'ADMIN', NULL, NULL, 'f', NULL, 'f', NULL, 'AQAAAAEAACcQAAAAEDQXo/2ZnzJo8S3my9NLKCkRCsr71IEHQgNk3RhWg482O663Wr980SE2fRT9FUI8Rw==', NULL, NULL, 'f', 't', NULL, 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SGZJUN4FMMKTQ7I23Q4KWT75XDPXXZFU', NULL, '2019-07-26 10:07:20.969569', NULL, '2019-07-26 10:07:20.969569', NULL, 'f', E'c6ce2174-2cc7-42c2-af8a-3a5fa11ea750');

-- ----------------------------
-- Table structure for UserRole
-- ----------------------------
DROP TABLE IF EXISTS "Systems"."UserRole";
CREATE TABLE "Systems"."UserRole" (
  "RoleId" uuid NOT NULL,
  "UserId" uuid NOT NULL
)
;

-- ----------------------------
-- Records of UserRole
-- ----------------------------
INSERT INTO "Systems"."UserRole" VALUES ('03b7f379-404a-4659-9d1e-7a58299f6bdf', '73d29518-9b9d-45c8-a84a-c8df19d9bbd7');

-- ----------------------------
-- Indexes structure for table Application
-- ----------------------------
CREATE INDEX "clus_idx_application_creationti" ON "Systems"."Application" USING btree (
  "CreationTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table Application
-- ----------------------------
ALTER TABLE "Systems"."Application" ADD CONSTRAINT "pk_application" PRIMARY KEY ("ApplicationId");

-- ----------------------------
-- Indexes structure for table Claim
-- ----------------------------
CREATE INDEX "clus_idx_creationtime" ON "Systems"."Claim" USING btree (
  "CreationTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table Claim
-- ----------------------------
ALTER TABLE "Systems"."Claim" ADD CONSTRAINT "pk_claim" PRIMARY KEY ("ClaimId");

-- ----------------------------
-- Primary Key structure for table Permission
-- ----------------------------
ALTER TABLE "Systems"."Permission" ADD CONSTRAINT "pk_permission" PRIMARY KEY ("PermissionId");

-- ----------------------------
-- Indexes structure for table Resource
-- ----------------------------
CREATE INDEX "cls_idx_sortid" ON "Systems"."Resource" USING btree (
  "SortId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table Resource
-- ----------------------------
ALTER TABLE "Systems"."Resource" ADD CONSTRAINT "pk_resource" PRIMARY KEY ("ResourceId");

-- ----------------------------
-- Primary Key structure for table Role
-- ----------------------------
ALTER TABLE "Systems"."Role" ADD CONSTRAINT "pk_role" PRIMARY KEY ("RoleId");

-- ----------------------------
-- Primary Key structure for table User
-- ----------------------------
ALTER TABLE "Systems"."User" ADD CONSTRAINT "pk_user" PRIMARY KEY ("UserId");

-- ----------------------------
-- Primary Key structure for table UserRole
-- ----------------------------
ALTER TABLE "Systems"."UserRole" ADD CONSTRAINT "pk_userrole" PRIMARY KEY ("RoleId", "UserId");
