INSERT INTO complat_role (name,type,spec,pinyin) VALUES ('系统管理员',0,'拥有整个系统的最高权限','XTGLY');
INSERT INTO complat_role (name,type,spec,pinyin) VALUES ('机构管理员',1,'可以管理指定机构及其子孙机构','JGGLY');
INSERT INTO complat_role (name,type,spec,isdefault,pinyin) VALUES ('普通用户',6,'普通用户',1,'PTYH');
INSERT INTO complat_user (uuid,name,pwd,enable,loginname) values ('bdf699cf97284db0a9524332f0648f22','系统管理员','3a090d6e00937caea9f708f87092f4e6b43fce2984aa8ffa:962674decac13307bb260661d2b473688cfae4675f5194f4',1,'admin');
