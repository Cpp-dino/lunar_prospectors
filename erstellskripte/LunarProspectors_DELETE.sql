/*===============================================================*/
/*                                                               */
/*                 A B B A U S K R I P T                         */
/*            - - - - - - - - - - - - - - - - - -                */
/*                                                               */
/*  Datei:     LunarProspectors_DELETE.sql                       */
/*  Projekt:   Lunar Prospectors (Praktikumsgruppe 1)            */
/*                                                               */
/*  mit dem Skript wird die bestehnde Tabellenstruktur der       */
/*  Datenbank wieder entfernt, wobei jedoch Tabellen mit vom     */
/*  Erstellskript abweichenden Symbol-Bezeichnungen nicht        */
/*  berücksichtigt werden                                        */
/*                                                               */
/*  DBMS:      ORACLE Version 19c                                */
/*                                                               */
/*===============================================================*/


/*==============================================================*/
/*                - - -  T R I G G E R  - - -                   */
/*==============================================================*/

drop trigger TRG_ANGEBOT_B_INS
/

drop trigger TRG_ANGEBOT_B_UPD
/

drop trigger TRG_ARBEITSZEIT_B_INS
/

drop trigger TRG_ARBEITSZEIT_B_UPD
/

drop trigger TRG_AUSGABE_B_INS
/

drop trigger TRG_AUSGABE_B_UPD
/

drop trigger TRG_BESTELLUNG_B_INS
/

drop trigger TRG_BESTELLUNG_B_UPD_FKS
/

drop trigger TRG_BEWERBUNG_B_INS
/

drop trigger TRG_BEWERBUNG_DATUM_FKS
/

drop trigger TRG_GEBAEUDE_B_UPD_PK
/

drop trigger TRG_GEBAEUDE_B_UPD_STOCKWERKE
/

drop trigger TRG_GERAET_B_INS
/

drop trigger TRG_JOB_B_INS
/

drop trigger TRG_JOB_B_UPD_VERGABE
/

drop trigger TRG_JOB_B_UPD_MISSIONSGRUPPE
/

drop trigger TRG_JOBGERAET_B_UPD
/

drop trigger TRG_JOBQUALIFIKATION_B_UPD
/

drop trigger TRG_JOBRESSOURCE_B_UPD
/

drop trigger TRG_JOBVERGABE_B_INS
/

drop trigger TRG_JOBVERGABE_B_UPD_DATUM_FK
/

drop trigger TRG_LAGER_B_UPD_KAPAZITAET
/

drop trigger TRG_LAGER_AUFLOESUNG
/

drop trigger TRG_LAGPOS_B_INS
/

drop trigger TRG_LAGPOS_B_UPD_POSTEN
/

drop trigger TRG_LAGPOS_B_UPD_LAGER
/

drop trigger TRG_LAGTRANS_B_INS
/

drop trigger TRG_LAGTRANS_B_UPD_TERMIN
/

drop trigger TRG_LAGTRANS_B_UPD_LAGER
/

drop trigger TRG_LIEFANGEBOT_B_UPD_LIEFRNT
/

drop trigger TRG_LIEFERANGEBOT_B_INS
/

drop trigger TRG_LIEFERANT_B_INS
/

drop trigger TRG_LIEFBUCH_B_INS
/

drop trigger TRG_LIEFBUCH_B_UPD_LIEFANGEBOT
/

drop trigger TRG_LIEFBUCH_B_UPD_DEADLINE
/

drop trigger TRG_LIEFBUCH_B_UPD_LAGER
/

drop trigger TRG_MAENGEL_B_INS
/

drop trigger TRG_MAENGEL_B_UPD_POSTEN
/

drop trigger TRG_MISSION_B_INS
/

drop trigger TRG_MISSGRUPPE_B_UPD_MISSION
/

drop trigger TRG_MISSIONSGRUPPE_B_INS
/

drop trigger TRG_NACHWEIS_B_INS
/

drop trigger TRG_NACHWEIS_B_UPD_PERSON
/

drop trigger TRG_PERSON_B_INS
/

drop trigger TRG_PERSON_B_UPD_ANREISE
/

drop trigger TRG_PERSON_B_UPD_ABREISE
/

drop trigger TRG_PERSBEF_B_INS
/

drop trigger TRG_PERSONENBEFOERDERUNG_B_UPD
/

drop trigger TRG_POSTEN_B_INS
/

drop trigger TRG_QUALINACHWEIS_B_UPD
/

drop trigger TRG_RAUM_B_INS
/

drop trigger TRG_RAUM_B_UPD_STOCKWERK
/

drop trigger TRG_RAUM_B_UPD_GEBAEUDE
/

drop trigger TRG_RESSOURCE_B_INS
/

drop trigger TRG_TRANSPOSTEN_B_INS
/

drop trigger TRG_TRANSPOSTEN_B_UPD
/



/*==============================================================*/
/*         - - -  F R E M D S C H L Ü S S E L  - - -            */
/*==============================================================*/

alter table LAGER
   drop constraint LAGER_RAUM_FK_CONS
/

alter table LAGERTRANSPORT
   drop constraint LAGTRANS_START_LAGER_FK_CONS
/

alter table LAGERTRANSPORT
   drop constraint FK_LAGERTRANSPORT_ZIEL_LAGER
/

alter table LIEFERANGEBOT
   drop constraint FK_LIEFERAN_LIEFERANG_LIEFERAN
/

alter table LIEFERBUCHUNG
   drop constraint LIEFBUCH_LAGER_FK_CONS
/

alter table LIEFERBUCHUNG
   drop constraint LIEFBUCH_LIEFANG_FK_CONS
/

alter table MAENGEL
   drop constraint FK_MAENGEL_POSTEN
/

alter table MISSIONSGRUPPE
   drop constraint MISGRUPPE_LAGER_FK_CONS
/

alter table MISSIONSGRUPPE
   drop constraint MISGRUPPE_MISSION_FK_CONS
/

alter table NACHWEIS
   drop constraint NACHWEIS_PERSON_FK_CONS
/

alter table PERSONENBEFOERDERUNG
   drop constraint PERSBEF_LIEFBUCH
/

alter table PERSONENBEFOERDERUNG
   drop constraint PERSBEF_PERSON_FK_CONS
/

alter table RAUM
   drop constraint RAUM_GEBAEUDE_FK_CONS
/

alter table TRANSPORTPOSTEN
   drop constraint TRANSPOST_LAGERTRANS_FK_CONS
/

alter table TRANSPORTPOSTEN
   drop constraint TRANSPORTPOSTEN_POSTEN_FK_CONS
/



/*==============================================================*/
/*         - - -  T A B L E S  -  I N D E X E  - - -            */
/*==============================================================*/

/*
drop index IDX_ANGEBOT_POSTEN
/
*/

alter table ANGEBOT
   drop primary key cascade
/

drop table ANGEBOT cascade constraints
/

drop index IDX_ARBEITSZEIT_DATUM_JOB_GLO
/

drop index IDX_ARBEITSZEIT_JOB_LOC
/

alter table ARBEITSZEIT
   drop primary key cascade
/

drop table ARBEITSZEIT cascade constraints
/

drop index IDX_AUSG_PERS_DATUM_GLO
/

drop index IDX_AUSGABE_DATUM_GLO
/

drop index IDX_AUSGABE_RESS_DATUM_LOC
/

alter table AUSGABE
   drop primary key cascade
/

drop table AUSGABE cascade constraints
/

drop index IDX_BESTELLUNG_POSTEN_LOC
/

alter table BESTELLUNG
   drop primary key cascade
/

drop table BESTELLUNG cascade constraints
/

drop index IDX_BERWERBUNG_PERSON_GLO
/

drop index IDX_BEWERBUNG_JOB_LOC
/

alter table BEWERBUNG
   drop primary key cascade
/

drop table BEWERBUNG cascade constraints
/

alter table GEBAEUDE
   drop primary key cascade
/

drop table GEBAEUDE cascade constraints
/

alter table GERAET
   drop primary key cascade
/

drop table GERAET cascade constraints
/

drop index IDX_JOB_VERGABE_GLO
/

drop index IDX_JOB_ID_LOC
/

alter table JOB
   drop unique (VERGABE_ID) cascade
/

alter table JOB
   drop primary key cascade
/

drop table JOB cascade constraints
/

drop index IDX_JOBGERAET_JOB_LOC
/

alter table JOBGERAET
   drop primary key cascade
/

drop table JOBGERAET cascade constraints
/

drop index IDX_JOBQUALI_JOB_LOC
/

alter table JOBQUALIFIKATION
   drop primary key cascade
/

drop table JOBQUALIFIKATION cascade constraints
/

drop index IDX_JOBRESSOURCE_JOB_LOC
/

alter table JOBRESSOURCE
   drop primary key cascade
/

drop table JOBRESSOURCE cascade constraints
/

drop index IDX_JOBVERGABE_PERSON_LOC
/

alter table JOBVERGABE
   drop primary key cascade
/

drop table JOBVERGABE cascade constraints
/

alter table LAGER
   drop unique (RAUM_ID) cascade
/

alter table LAGER
   drop primary key cascade
/

drop table LAGER cascade constraints
/

drop index IDX_LAGERPOSITION_ID_LOC
/

drop index IDX_LAGERPOSITION_POSTEN_GLO
/

alter table LAGERPOSITION
   drop unique (LAGER_BEZEICHNUNG, REGAL_NR, POSITION_NR) cascade
/

alter table LAGERPOSITION
   drop unique (POSTEN_ID) cascade
/

alter table LAGERPOSITION
   drop primary key cascade
/

drop table LAGERPOSITION cascade constraints
/

drop index IDX_LAGERTRANSPORT_TERMIN
/

alter table LAGERTRANSPORT
   drop primary key cascade
/

drop table LAGERTRANSPORT cascade constraints
/

alter table LIEFERANGEBOT
   drop primary key cascade
/

drop table LIEFERANGEBOT cascade constraints
/

alter table LIEFERANT
   drop primary key cascade
/

drop table LIEFERANT cascade constraints
/

alter table LIEFERBUCHUNG
   drop unique (ANGEBOT_ID) cascade
/

alter table LIEFERBUCHUNG
   drop primary key cascade
/

drop table LIEFERBUCHUNG cascade constraints
/

alter table MAENGEL
   drop primary key cascade
/

drop table MAENGEL cascade constraints
/

alter table MISSION
   drop primary key cascade
/

drop table MISSION cascade constraints
/

alter table MISSIONSGRUPPE
   drop primary key cascade
/

drop table MISSIONSGRUPPE cascade constraints
/

drop index IDX_NACHWEIS_PERSON
/

alter table NACHWEIS
   drop primary key cascade
/

drop table NACHWEIS cascade constraints
/

alter table PERSON
   drop primary key cascade
/

drop table PERSON cascade constraints
/

alter table PERSONENBEFOERDERUNG
   drop primary key cascade
/

drop table PERSONENBEFOERDERUNG cascade constraints
/

drop index IDX_POSTEN_PRODUCT_ID
/

drop index IDX_POSTEN_ID_LOC
/

alter table POSTEN
   drop primary key cascade
/

drop table POSTEN cascade constraints
/

alter table QUALIFIKATION
   drop primary key cascade
/

drop table QUALIFIKATION cascade constraints
/

drop index IDX_QUALINACHWEIS_NACHWEIS_LOC
/

alter table QUALIFIKATIONSNACHWEIS
   drop primary key cascade
/

drop table QUALIFIKATIONSNACHWEIS cascade constraints
/

alter table RAUM
   drop primary key cascade
/

drop table RAUM cascade constraints
/

alter table RESSOURCE
   drop primary key cascade
/

drop table RESSOURCE cascade constraints
/

drop index IDX_TRANSPOST_TRANSPORT_ID
/

alter table TRANSPORTPOSTEN
   drop primary key cascade
/

drop table TRANSPORTPOSTEN cascade constraints
/



/*==============================================================*/
/*              - - -  S E Q U E N Z E N  - - -                 */
/*==============================================================*/

drop sequence ARBEITSZEIT_SEQ
/

drop sequence AUSGABE_SEQ
/

drop sequence BEWERBUNG_SEQ
/

drop sequence JOBVERGABE_SEQ
/

drop sequence JOB_SEQ
/

drop sequence LAGERPOSITION_SEQ
/

drop sequence LAGERTRANSPORT_SEQ
/

drop sequence LIEFERANGEBOT_SEQ
/

drop sequence LIEFERANT_SEQ
/

drop sequence LIEFERBUCHUNG_SEQ
/

drop sequence MAENGEL_SEQ
/

drop sequence MISSIONSGRUPPE_SEQ
/

drop sequence MISSION_SEQ
/

drop sequence NACHWEIS_SEQ
/

drop sequence PERSONENBEFOERDERUNG_SEQ
/

drop sequence PERSON_SEQ
/

drop sequence POSTEN_SEQ
/

drop sequence PRODUKT_SEQ
/

drop sequence RAUM_SEQ
/

