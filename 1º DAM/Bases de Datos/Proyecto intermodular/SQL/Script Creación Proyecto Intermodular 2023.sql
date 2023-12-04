REM   Script: ProyectoFinal
REM   Proyecto FInal

alter table ACCESO 
   drop constraint FK_ACCESO_ASIGNA_TAQUILLA;

alter table ACCESO 
   drop constraint FK_ACCESO_ESCOGE_MENU;

alter table ACCESO 
   drop constraint FK_ACCESO_HACE_ZONA_JUE;

alter table ACCESO 
   drop constraint FK_ACCESO_RELATIONS_USUARIO;

alter table ASISTE 
   drop constraint FK_ASISTE_ASISTE_USUARIO;

alter table ASISTE 
   drop constraint FK_ASISTE_ASISTE2_EVENTO;

alter table EVENTO 
   drop constraint FK_EVENTO_OFRECE_MENU;

alter table INCLUYE 
   drop constraint FK_INCLUYE_INCLUYE_EVENTO;

alter table INCLUYE 
   drop constraint FK_INCLUYE_INCLUYE2_ANIMACIO;

alter table RESERVA 
   drop constraint FK_RESERVA_ADMITE_USUARIO;

alter table RESERVA 
   drop constraint FK_RESERVA_CORRESPON_EVENTO;

alter table TIENE 
   drop constraint FK_TIENE_TIENE_USUARIO;

alter table TIENE 
   drop constraint FK_TIENE_TIENE2_USUARIO;

alter table TRABAJA 
   drop constraint FK_TRABAJA_TRABAJA_ZONA_JUE;

alter table TRABAJA 
   drop constraint FK_TRABAJA_TRABAJA2_PERSONAL;

drop index HACE_FK;

drop index ESCOGE_FK;

drop index ASIGNA_FK;

drop index RELATIONSHIP_2_FK;

drop table ACCESO cascade constraints;

drop table ANIMACION cascade constraints;

drop index ASISTE2_FK;

drop index ASISTE_FK;

drop table ASISTE cascade constraints;

drop index OFRECE_FK;

drop table EVENTO cascade constraints;

drop index INCLUYE2_FK;

drop index INCLUYE_FK;

drop table INCLUYE cascade constraints;

drop table MENU cascade constraints;

drop table PERSONAL cascade constraints;

drop index CORRESPONDE_FK;

drop index ADMITE_FK;

drop table RESERVA cascade constraints;

drop table TAQUILLA cascade constraints;

drop index TIENE2_FK;

drop index TIENE_FK;

drop table TIENE cascade constraints;

drop index TRABAJA2_FK;

drop index TRABAJA_FK;

drop table TRABAJA cascade constraints;

drop table USUARIO cascade constraints;

drop table ZONA_JUEGOS cascade constraints;

create table ACCESO  
( 
   NUMERO_ACCESO        NUMBER(10)           not null, 
   NUMERO_TAQUILLA      NUMBER(2)            not null, 
   ID_ZONAJUEGO         NUMBER(10)           not null, 
   DNI_USUARIO          VARCHAR2(9)	     not null, 
   ID_MENU              NUMBER(1), 
   PRECIO_ACCESO        NUMBER(4,2), 
   FECHA_ACCESO         DATE, 
   constraint PK_ACCESO primary key (NUMERO_ACCESO) 
);

insert into ACCESO (NUMERO_ACCESO,NUMERO_TAQUILLA,ID_ZONAJUEGO,DNI_USUARIO,ID_MENU,PRECIO_ACCESO,FECHA_ACCESO) 
            values (1,1,1,'57853543X',null,7.15,'7/MAY/2022');

insert into ACCESO (NUMERO_ACCESO,NUMERO_TAQUILLA,ID_ZONAJUEGO,DNI_USUARIO,ID_MENU,PRECIO_ACCESO,FECHA_ACCESO) 
            values (2,2,2,'88391414E',1,8.20,'7/MAY/2022');

insert into ACCESO (NUMERO_ACCESO,NUMERO_TAQUILLA,ID_ZONAJUEGO,DNI_USUARIO,ID_MENU,PRECIO_ACCESO,FECHA_ACCESO) 
            values (3,5,3,'88391414E',2,5.20,'7/MAY/2022');

insert into ACCESO (NUMERO_ACCESO,NUMERO_TAQUILLA,ID_ZONAJUEGO,DNI_USUARIO,ID_MENU,PRECIO_ACCESO,FECHA_ACCESO) 
            values (4,2,4,'57853543X',null,8.90,'20/APR/2022');

insert into ACCESO (NUMERO_ACCESO,NUMERO_TAQUILLA,ID_ZONAJUEGO,DNI_USUARIO,ID_MENU,PRECIO_ACCESO,FECHA_ACCESO) 
            values (5,1,5,'88391414E',2,7.40,'20/APR/2022');

insert into ACCESO (NUMERO_ACCESO,NUMERO_TAQUILLA,ID_ZONAJUEGO,DNI_USUARIO,ID_MENU,PRECIO_ACCESO,FECHA_ACCESO) 
            values (6,6,1,'57853543X',3,5.20,'12/MAR/2022');

insert into ACCESO (NUMERO_ACCESO,NUMERO_TAQUILLA,ID_ZONAJUEGO,DNI_USUARIO,ID_MENU,PRECIO_ACCESO,FECHA_ACCESO) 
            values (7,7,1,'88391414E',1,6.75,'12/MAR/2022');

insert into ACCESO (NUMERO_ACCESO,NUMERO_TAQUILLA,ID_ZONAJUEGO,DNI_USUARIO,ID_MENU,PRECIO_ACCESO,FECHA_ACCESO) 
            values (8,1,2,'57853543X',null,5.20,'5/FEB/2022');

insert into ACCESO (NUMERO_ACCESO,NUMERO_TAQUILLA,ID_ZONAJUEGO,DNI_USUARIO,ID_MENU,PRECIO_ACCESO,FECHA_ACCESO) 
            values (9,1,2,'52982197H',2,8.20,'5/FEB/2022');

create index RELATIONSHIP_2_FK on ACCESO ( 
   DNI_USUARIO ASC 
);

create index ASIGNA_FK on ACCESO ( 
   NUMERO_TAQUILLA ASC 
);

create index ESCOGE_FK on ACCESO ( 
   ID_MENU ASC 
);

create index HACE_FK on ACCESO ( 
   ID_ZONAJUEGO ASC 
);

create table ANIMACION  
( 
   DNI_ANIMADOR         VARCHAR2(9)          not null, 
   NOMBRE_ANIMADOR      VARCHAR2(100), 
   TELEFONO_ANIMADOR    NUMBER(9), 
   DIRECCION_ANIMADOR   VARCHAR2(100), 
   constraint PK_ANIMACION primary key (DNI_ANIMADOR) 
);

insert into ANIMACION (DNI_ANIMADOR,NOMBRE_ANIMADOR,TELEFONO_ANIMADOR,DIRECCION_ANIMADOR)  
               values ('37588067H','Maria Castillo',601094787,'Calle de Alcala');

insert into ANIMACION (DNI_ANIMADOR,NOMBRE_ANIMADOR,TELEFONO_ANIMADOR,DIRECCION_ANIMADOR)  
               values ('65703101J','Juan Garcia',601025412,'Gran Vía');

insert into ANIMACION (DNI_ANIMADOR,NOMBRE_ANIMADOR,TELEFONO_ANIMADOR,DIRECCION_ANIMADOR)  
               values ('17541797L','Ana Villa',587458774,'Via Laietana');

insert into ANIMACION (DNI_ANIMADOR,NOMBRE_ANIMADOR,TELEFONO_ANIMADOR,DIRECCION_ANIMADOR)  
               values ('45720162A','Carmen Alonso',452214002,'Paseo del Prado');

insert into ANIMACION (DNI_ANIMADOR,NOMBRE_ANIMADOR,TELEFONO_ANIMADOR,DIRECCION_ANIMADOR)  
               values ('68115770M','Santiago Abascal',452147789,'Paseo de la Castellana');

insert into ANIMACION (DNI_ANIMADOR,NOMBRE_ANIMADOR,TELEFONO_ANIMADOR,DIRECCION_ANIMADOR)  
               values ('22820236G','Enrique Pastor',125478963,'Avenida Diagonal');

insert into ANIMACION (DNI_ANIMADOR,NOMBRE_ANIMADOR,TELEFONO_ANIMADOR,DIRECCION_ANIMADOR)  
               values ('72700314M','Rodrigo Iglesias',487521369,'Avenida de los Campos Elíseos');

insert into ANIMACION (DNI_ANIMADOR,NOMBRE_ANIMADOR,TELEFONO_ANIMADOR,DIRECCION_ANIMADOR)  
               values ('85168445C','Isabel Sanchez',587459632,'Avenida de los Campos Guatemaltecos');

insert into ANIMACION (DNI_ANIMADOR,NOMBRE_ANIMADOR,TELEFONO_ANIMADOR,DIRECCION_ANIMADOR)  
               values ('98273435R','Paco Gutierrez',587412369,'Oxford Street');

create table ASISTE  
( 
   DNI_USUARIO          VARCHAR2(9)          not null, 
   ID_EVENTO            NUMBER(10)           not null, 
   constraint PK_ASISTE primary key (DNI_USUARIO, ID_EVENTO) 
);

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (1,'57853543X');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (1,'74639362S');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (1,'88391414E');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (1,'02330065G');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (1,'45874520T');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (1,'57416696W');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (1,'52982197H');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (2,'45874520T');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (2,'42565482A');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (2,'57416696W');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (2,'02330065G');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (2,'18289601R');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (3,'57853543X');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (3,'88391414E');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (3,'74639362S');

insert into ASISTE (ID_EVENTO, DNI_USUARIO) 
            values (3,'52982197H');

create index ASISTE_FK on ASISTE ( 
   DNI_USUARIO ASC 
);

create index ASISTE2_FK on ASISTE ( 
   ID_EVENTO ASC 
);

create table EVENTO  
( 
   ID_EVENTO            NUMBER(10)           not null, 
   ID_MENU              NUMBER(1)            not null, 
   NOMBRE_EVENTO        VARCHAR2(100), 
   FECHA_EVENTO         DATE, 
   NUMERO_SALA          NUMBER(10), 
   ES_CUMPLE            SMALLINT, 
   constraint PK_EVENTO primary key (ID_EVENTO) 
);

insert into EVENTO (ID_EVENTO,ID_MENU,NOMBRE_EVENTO,FECHA_EVENTO,NUMERO_SALA,ES_CUMPLE) 
            values (1,0,'Cumpleaños Juan','15/FEB/2022',1,1);

insert into EVENTO (ID_EVENTO,ID_MENU,NOMBRE_EVENTO,FECHA_EVENTO,NUMERO_SALA,ES_CUMPLE) 
            values (2,1,'Cumpleaños María','15/FEB/2022',2,1);

insert into EVENTO (ID_EVENTO,ID_MENU,NOMBRE_EVENTO,FECHA_EVENTO,NUMERO_SALA,ES_CUMPLE) 
            values (3,2,'Evento solidario "Mirando por África"','15/FEB/2022',null, 0);

insert into EVENTO (ID_EVENTO,ID_MENU,NOMBRE_EVENTO,FECHA_EVENTO,NUMERO_SALA,ES_CUMPLE) 
            values (4,3,'Cumpleaños Alberto','12/MAR/2022',null,1);

insert into EVENTO (ID_EVENTO,ID_MENU,NOMBRE_EVENTO,FECHA_EVENTO,NUMERO_SALA,ES_CUMPLE) 
            values (5,0,'Cumpleaños Ana','12/MAR/2022',3,1);

insert into EVENTO (ID_EVENTO,ID_MENU,NOMBRE_EVENTO,FECHA_EVENTO,NUMERO_SALA,ES_CUMPLE) 
            values (6,0,'Cumpleaños Lucía','23/APR/2022',1,1);

insert into EVENTO (ID_EVENTO,ID_MENU,NOMBRE_EVENTO,FECHA_EVENTO,NUMERO_SALA,ES_CUMPLE) 
            values (7,2,'Comunión Martín','24/APR/2022',2,0);

insert into EVENTO (ID_EVENTO,ID_MENU,NOMBRE_EVENTO,FECHA_EVENTO,NUMERO_SALA,ES_CUMPLE) 
            values (8,2,'Cumpleaños Fernando','24/APR/2022',3,1);

insert into EVENTO (ID_EVENTO,ID_MENU,NOMBRE_EVENTO,FECHA_EVENTO,NUMERO_SALA,ES_CUMPLE) 
            values (9,1,'Cumpleaños Martina','24/APR/2022',1,1);

insert into EVENTO (ID_EVENTO,ID_MENU,NOMBRE_EVENTO,FECHA_EVENTO,NUMERO_SALA,ES_CUMPLE) 
            values (10,3,'Cumpleaños Carlos','24/APR/2022',null,1);

create index OFRECE_FK on EVENTO ( 
   ID_MENU ASC 
);

create table INCLUYE  
( 
   ID_EVENTO            NUMBER(10)           not null, 
   DNI_ANIMADOR         VARCHAR2(9)          not null, 
   constraint PK_INCLUYE primary key (ID_EVENTO, DNI_ANIMADOR) 
);

insert into INCLUYE (ID_EVENTO,DNI_ANIMADOR) 
            values (2,'37588067H');

insert into INCLUYE (ID_EVENTO,DNI_ANIMADOR) 
            values (2,'17541797L');

insert into INCLUYE (ID_EVENTO,DNI_ANIMADOR) 
            values (3,'68115770M');

insert into INCLUYE (ID_EVENTO,DNI_ANIMADOR) 
            values (7,'68115770M');

insert into INCLUYE (ID_EVENTO,DNI_ANIMADOR) 
            values (9,'68115770M');

create index INCLUYE_FK on INCLUYE ( 
   ID_EVENTO ASC 
);

create index INCLUYE2_FK on INCLUYE ( 
   DNI_ANIMADOR ASC 
);

create table MENU  
( 
   ID_MENU              NUMBER(1)            not null, 
   NOMBRE_MENU          VARCHAR2(100), 
   PRECIO_MENU          NUMBER(4,2), 
   constraint PK_MENU primary key (ID_MENU) 
);

insert into MENU(ID_MENU,NOMBRE_MENU,PRECIO_MENU) 
          values(0,'Sin menú',7);

insert into MENU(ID_MENU,NOMBRE_MENU,PRECIO_MENU) 
          values(1,'Menu Verde',8.5);

insert into MENU(ID_MENU,NOMBRE_MENU,PRECIO_MENU) 
          values(2,'Menu Amarillo',11.0);

insert into MENU(ID_MENU,NOMBRE_MENU,PRECIO_MENU) 
          values(3,'Menu Rojo',15.0);

insert into MENU(ID_MENU,NOMBRE_MENU,PRECIO_MENU) 
          values(4,'Añadido Cumpleaños',0);

create table PERSONAL  
( 
   DNI_PERSONAL         VARCHAR2(9)          not null, 
   NOMBRE_PERSONAL      VARCHAR2(100), 
   TELEFONO_PERSONAL    NUMBER(9), 
   DIRECCION_PERSONAL   VARCHAR2(100), 
   CORREO_PERSONAL      VARCHAR2(100), 
   PUESTO_PERSONAL      VARCHAR2(100), 
   constraint PK_PERSONAL primary key (DNI_PERSONAL) 
);

insert into PERSONAL (DNI_PERSONAL,NOMBRE_PERSONAL,TELEFONO_PERSONAL,DIRECCION_PERSONAL,CORREO_PERSONAL,PUESTO_PERSONAl) 
            values ('96421587K','Juliana Mateos',666558459,'Calle Mayor','julianamateos@gmail.com','MONITOR');

insert into PERSONAL (DNI_PERSONAL,NOMBRE_PERSONAL,TELEFONO_PERSONAL,DIRECCION_PERSONAL,CORREO_PERSONAL,PUESTO_PERSONAl) 
            values ('75662989G','Mateo Vega',589652301,'Calle Alcala','mateovega@gmail.com','EQUIPO COCINA');

insert into PERSONAL (DNI_PERSONAL,NOMBRE_PERSONAL,TELEFONO_PERSONAL,DIRECCION_PERSONAL,CORREO_PERSONAL,PUESTO_PERSONAl) 
            values ('38148206S','Carlos Villa',111125698,'Calle Serrano','carlosvilla@gmail.com','MONITOR');

insert into PERSONAL (DNI_PERSONAL,NOMBRE_PERSONAL,TELEFONO_PERSONAL,DIRECCION_PERSONAL,CORREO_PERSONAL,PUESTO_PERSONAl) 
            values ('24716980F','Sebastian Yatra',554789652,'Calle de Fuencarral','sebasalbus@gmail.com','MONITOR');

insert into PERSONAL (DNI_PERSONAL,NOMBRE_PERSONAL,TELEFONO_PERSONAL,DIRECCION_PERSONAL,CORREO_PERSONAL,PUESTO_PERSONAl) 
            values ('66486658Y','Adolfo Rivera',556988741,'Calle de Goya','adolforivera@gmail.com','MONITOR');

insert into PERSONAL (DNI_PERSONAL,NOMBRE_PERSONAL,TELEFONO_PERSONAL,DIRECCION_PERSONAL,CORREO_PERSONAL,PUESTO_PERSONAl) 
            values ('65036580D','Francisco Blanco',111002547,'Calle de Juan Bravo','franciscano@gmail.com','EQUIPO COCINA');

insert into PERSONAL (DNI_PERSONAL,NOMBRE_PERSONAL,TELEFONO_PERSONAL,DIRECCION_PERSONAL,CORREO_PERSONAL,PUESTO_PERSONAl) 
            values ('35375454M','Luis Villa',222223658,'Calle de Ourense','luisiao@gmail.com','RECEPCIONISTA');

insert into PERSONAL (DNI_PERSONAL,NOMBRE_PERSONAL,TELEFONO_PERSONAL,DIRECCION_PERSONAL,CORREO_PERSONAL,PUESTO_PERSONAl) 
            values ('24527716X','Manuel Pardo',220005874,'Calle de Castilla','manuelpardo@gmail.com','MONITOR');

insert into PERSONAL (DNI_PERSONAL,NOMBRE_PERSONAL,TELEFONO_PERSONAL,DIRECCION_PERSONAL,CORREO_PERSONAL,PUESTO_PERSONAl) 
            values ('02800810P','Javier Sanchez',548552110,'Calle de Antonio López','javiermsa@gmail.com','MONITOR');

create table RESERVA  
( 
   ID_RESERVA           NUMBER(3)            not null, 
   DNI_USUARIO          VARCHAR2(9)          not null, 
   ID_EVENTO            NUMBER(10)           not null, 
   FECHA_RESERVA        DATE, 
   constraint PK_RESERVA primary key (ID_RESERVA) 
);

insert into RESERVA(ID_RESERVA,DNI_USUARIO,ID_EVENTO,FECHA_RESERVA) 
             values(1,'57853543X',1,'1/FEB/2022');

insert into RESERVA(ID_RESERVA,DNI_USUARIO,ID_EVENTO,FECHA_RESERVA) 
             values(2,'57853543X',2,'2/FEB/2022');

insert into RESERVA(ID_RESERVA,DNI_USUARIO,ID_EVENTO,FECHA_RESERVA) 
             values(3,'42565482A',3,'4/FEB/2022');

insert into RESERVA(ID_RESERVA,DNI_USUARIO,ID_EVENTO,FECHA_RESERVA) 
             values(4,'42565482A',4,'3/MAR/2022');

insert into RESERVA(ID_RESERVA,DNI_USUARIO,ID_EVENTO,FECHA_RESERVA) 
             values(5,'74639362S',5,'9/MAR/2022');

insert into RESERVA(ID_RESERVA,DNI_USUARIO,ID_EVENTO,FECHA_RESERVA) 
             values(6,'74639362S',6,'10/MAR/2022');

insert into RESERVA(ID_RESERVA,DNI_USUARIO,ID_EVENTO,FECHA_RESERVA) 
             values(7,'45874520T',7,'12/APR/2022');

insert into RESERVA(ID_RESERVA,DNI_USUARIO,ID_EVENTO,FECHA_RESERVA) 
             values(8,'57853543X',8,'12/APR/2022');

insert into RESERVA(ID_RESERVA,DNI_USUARIO,ID_EVENTO,FECHA_RESERVA) 
             values(9,'42565482A',9,'13/APR/2022');

insert into RESERVA(ID_RESERVA,DNI_USUARIO,ID_EVENTO,FECHA_RESERVA) 
             values(10,'45874520T',10,'13/APR/2022');

create index ADMITE_FK on RESERVA ( 
   DNI_USUARIO ASC 
);

create index CORRESPONDE_FK on RESERVA ( 
   ID_EVENTO ASC 
);

create table TAQUILLA  
( 
   NUMERO_TAQUILLA      NUMBER(2)            not null, 
   constraint PK_TAQUILLA primary key (NUMERO_TAQUILLA) 
);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(1);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(2);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(3);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(4);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(5);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(6);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(7);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(8);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(9);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(10);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(11);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(12);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(13);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(14);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(15);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(16);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(17);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(18);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(19);

insert into TAQUILLA (NUMERO_TAQUILLA) 
            values(20);

create table TIENE  
( 
   DNI_USUARIO          VARCHAR2(9)          not null, 
   USU_DNI_USUARIO      VARCHAR2(9)          not null, 
   constraint PK_TIENE primary key (DNI_USUARIO, USU_DNI_USUARIO) 
);

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('57853543X', '88391414E');

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('57853543X', '52982197H');

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('57853543X', '74639362S');

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('45874520T', '52982197H');

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('45874520T', '18289601R');

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('45874520T', '75298117G');

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('42565482A', '02330065G');

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('42565482A', '57416696W');

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('42565482A', '45874520T');

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('42565482A', '42565482A');

insert into TIENE (DNI_USUARIO, USU_DNI_USUARIO) 
            values ('42565482A', '57853543X');

create index TIENE_FK on TIENE ( 
   DNI_USUARIO ASC 
);

create index TIENE2_FK on TIENE ( 
   USU_DNI_USUARIO ASC 
);

create table TRABAJA  
( 
   ID_ZONAJUEGO         NUMBER(10)           not null, 
   DNI_PERSONAL         VARCHAR2(9)          not null, 
   constraint PK_TRABAJA primary key (ID_ZONAJUEGO, DNI_PERSONAL) 
);

insert into TRABAJA(ID_ZONAJUEGO,DNI_PERSONAL) 
            values(1,'96421587K');

insert into TRABAJA(ID_ZONAJUEGO,DNI_PERSONAL) 
            values(3,'38148206S');

insert into TRABAJA(ID_ZONAJUEGO,DNI_PERSONAL) 
            values(4,'24716980F');

insert into TRABAJA(ID_ZONAJUEGO,DNI_PERSONAL) 
            values(5,'66486658Y');

insert into TRABAJA(ID_ZONAJUEGO,DNI_PERSONAL) 
            values(2,'24527716X');

insert into TRABAJA(ID_ZONAJUEGO,DNI_PERSONAL) 
            values(3,'02800810P');

create index TRABAJA_FK on TRABAJA ( 
   ID_ZONAJUEGO ASC 
);

create index TRABAJA2_FK on TRABAJA ( 
   DNI_PERSONAL ASC 
);

create table USUARIO  
( 
   DNI_USUARIO          VARCHAR2(9)          not null, 
   NOMBRE_USUARIO       VARCHAR2(100), 
   TELEFONO_USUARIO     NUMBER(9), 
   CORREO_USUARIO       VARCHAR2(200), 
   DIRECCION_USUARIO    VARCHAR2(100), 
   ALERGIAS_USUARIO     VARCHAR2(100), 
   FECHA_NACIMIENTO_USUARIO DATE, 
   constraint PK_USUARIO primary key (DNI_USUARIO) 
);

insert into USUARIO(DNI_USUARIO,NOMBRE_USUARIO,TELEFONO_USUARIO,CORREO_USUARIO,DIRECCION_USUARIO,ALERGIAS_USUARIO,FECHA_NACIMIENTO_USUARIO) 
             values('57853543X','Carlos Gomez',601025874,'carlosgomez@gmail.com','Calle La Malaza',null,'04/DEC/1991');

insert into USUARIO(DNI_USUARIO,NOMBRE_USUARIO,TELEFONO_USUARIO,CORREO_USUARIO,DIRECCION_USUARIO,ALERGIAS_USUARIO,FECHA_NACIMIENTO_USUARIO) 
             values('88391414E','Belen Villa',601025478,'belenvila@gmail.com','Calle El Prado',null,'02/FEB/2008');

insert into USUARIO(DNI_USUARIO,NOMBRE_USUARIO,TELEFONO_USUARIO,CORREO_USUARIO,DIRECCION_USUARIO,ALERGIAS_USUARIO,FECHA_NACIMIENTO_USUARIO) 
             values('74639362S','Antonio Alonso',547821023,'antonalonso@gmail.com','Calle La Remolacha',null,'02/MAY/2009');

insert into USUARIO(DNI_USUARIO,NOMBRE_USUARIO,TELEFONO_USUARIO,CORREO_USUARIO,DIRECCION_USUARIO,ALERGIAS_USUARIO,FECHA_NACIMIENTO_USUARIO) 
             values('52982197H','Ana Gomez',589635478,'anagomez@gmail.com','Calle Petunias',null,'03/MAY/2005');

insert into USUARIO(DNI_USUARIO,NOMBRE_USUARIO,TELEFONO_USUARIO,CORREO_USUARIO,DIRECCION_USUARIO,ALERGIAS_USUARIO,FECHA_NACIMIENTO_USUARIO) 
             values('18289601R','Ruben Alonso',604785632,'rubenalo@gmail.com','Calle La Amargura','GLUTEN','02/SEP/2008');

insert into USUARIO(DNI_USUARIO,NOMBRE_USUARIO,TELEFONO_USUARIO,CORREO_USUARIO,DIRECCION_USUARIO,ALERGIAS_USUARIO,FECHA_NACIMIENTO_USUARIO) 
             values('75298117G','Eduardo Martin',587452100,'emartin@gmail.com','Calle Los Enanos','LACTOSA','02/FEB/2007');

insert into USUARIO(DNI_USUARIO,NOMBRE_USUARIO,TELEFONO_USUARIO,CORREO_USUARIO,DIRECCION_USUARIO,ALERGIAS_USUARIO,FECHA_NACIMIENTO_USUARIO) 
             values('02330065G','Belen Cuenca',587456201,'belencuenca@gmail.com','Calle Los Gigantes','GLUTEN','01/MAR/2006');

insert into USUARIO(DNI_USUARIO,NOMBRE_USUARIO,TELEFONO_USUARIO,CORREO_USUARIO,DIRECCION_USUARIO,ALERGIAS_USUARIO,FECHA_NACIMIENTO_USUARIO) 
             values('57416696W','Alberto Cabrero',585800001,'antocabrero@gmail.com','Calle Arenal','FRUTOS SECOS','29/MAR/2006');

insert into USUARIO(DNI_USUARIO,NOMBRE_USUARIO,TELEFONO_USUARIO,CORREO_USUARIO,DIRECCION_USUARIO,ALERGIAS_USUARIO,FECHA_NACIMIENTO_USUARIO) 
             values('42565482A','Carlos Azaustre',874563220,'carlosazaustre@gmail.com','Calle La Gata','FRUTOS SECOS','05/MAY/1983');

insert into USUARIO(DNI_USUARIO,NOMBRE_USUARIO,TELEFONO_USUARIO,CORREO_USUARIO,DIRECCION_USUARIO,ALERGIAS_USUARIO,FECHA_NACIMIENTO_USUARIO) 
             values('45874520T','Antonio Cabrero',745236547,'antoniocabrero@gmail.com','Calle La Maleza','GLUTEN','05/MAY/1987');

create table ZONA_JUEGOS  
( 
   ID_ZONAJUEGO         NUMBER(10)           not null, 
   NOMBRE_ZONAJUEGO     VARCHAR2(100), 
   constraint PK_ZONA_JUEGOS primary key (ID_ZONAJUEGO) 
);

insert into ZONA_JUEGOS(ID_ZONAJUEGO,NOMBRE_ZONAJUEGO) 
                 values(1,'VOLCAN');

insert into ZONA_JUEGOS(ID_ZONAJUEGO,NOMBRE_ZONAJUEGO) 
                 values(2,'CASTILLO');

insert into ZONA_JUEGOS(ID_ZONAJUEGO,NOMBRE_ZONAJUEGO) 
                 values(3,'ZONA BABY');

insert into ZONA_JUEGOS(ID_ZONAJUEGO,NOMBRE_ZONAJUEGO) 
                 values(4,'TIROLINAS');

insert into ZONA_JUEGOS(ID_ZONAJUEGO,NOMBRE_ZONAJUEGO) 
                 values(5,'CAMPOS DE FUTBOL');

alter table ACCESO 
   add constraint FK_ACCESO_ASIGNA_TAQUILLA foreign key (NUMERO_TAQUILLA) 
      references TAQUILLA (NUMERO_TAQUILLA);

alter table ACCESO 
   add constraint FK_ACCESO_ESCOGE_MENU foreign key (ID_MENU) 
      references MENU (ID_MENU);

alter table ACCESO 
   add constraint FK_ACCESO_HACE_ZONA_JUE foreign key (ID_ZONAJUEGO) 
      references ZONA_JUEGOS (ID_ZONAJUEGO);

alter table ACCESO 
   add constraint FK_ACCESO_RELATIONS_USUARIO foreign key (DNI_USUARIO) 
      references USUARIO (DNI_USUARIO);

alter table ASISTE 
   add constraint FK_ASISTE_ASISTE_USUARIO foreign key (DNI_USUARIO) 
      references USUARIO (DNI_USUARIO);

alter table ASISTE 
   add constraint FK_ASISTE_ASISTE2_EVENTO foreign key (ID_EVENTO) 
      references EVENTO (ID_EVENTO);

alter table EVENTO 
   add constraint FK_EVENTO_OFRECE_MENU foreign key (ID_MENU) 
      references MENU (ID_MENU);

alter table INCLUYE 
   add constraint FK_INCLUYE_INCLUYE_EVENTO foreign key (ID_EVENTO) 
      references EVENTO (ID_EVENTO);

alter table INCLUYE 
   add constraint FK_INCLUYE_INCLUYE2_ANIMACIO foreign key (DNI_ANIMADOR) 
      references ANIMACION (DNI_ANIMADOR);

alter table RESERVA 
   add constraint FK_RESERVA_ADMITE_USUARIO foreign key (DNI_USUARIO) 
      references USUARIO (DNI_USUARIO);

alter table RESERVA 
   add constraint FK_RESERVA_CORRESPON_EVENTO foreign key (ID_EVENTO) 
      references EVENTO (ID_EVENTO);

alter table TIENE 
   add constraint FK_TIENE_TIENE_USUARIO foreign key (DNI_USUARIO) 
      references USUARIO (DNI_USUARIO);

alter table TIENE 
   add constraint FK_TIENE_TIENE2_USUARIO foreign key (USU_DNI_USUARIO) 
      references USUARIO (DNI_USUARIO);

alter table TRABAJA 
   add constraint FK_TRABAJA_TRABAJA_ZONA_JUE foreign key (ID_ZONAJUEGO) 
      references ZONA_JUEGOS (ID_ZONAJUEGO);

alter table TRABAJA 
   add constraint FK_TRABAJA_TRABAJA2_PERSONAL foreign key (DNI_PERSONAL) 
      references PERSONAL (DNI_PERSONAL);