/*===============================================================*/
/*                                                               */
/*                 E R S T E L L S K R I P T                     */
/*            - - - - - - - - - - - - - - - - - -                */
/*                                                               */
/*  Datei:     Lunarprospectors_CREATE.sql                       */
/*  Projekt:   Lunar Prospectors (Praktikumsgruppe 1)            */
/*                                                               */
/*  mit dem Skript wird die Datenbank generiert, bestehende      */
/*  Tabellenstrukturen bzw. andere Datenbankobjekte mit          */
/*  entsprechenden Bezeichnungen und sonstige Datenobjekte       */
/*  werden dabei zunächst entfernt                               */
/*  nach erfolgreichem Datenbank-Aufbau werden die Testdaten     */
/*  in die erzeugte Tabellenstruktur eingepflegt                 */
/*                                                               */
/*  DBMS:      ORACLE Version 19c                                */
/*                                                               */
/*  dies ist die vollständige Fassung mit Partionsschema         */
/*                                                               */
/*===============================================================*/


-- Type package declaration
create or replace package PDTypes  
as
    TYPE ref_cursor IS REF CURSOR;
end;
/



-- Integrity package declaration
create or replace package IntegrityPackage AS
 procedure InitNestLevel;
 function GetNestLevel return number;
 procedure NextNestLevel;
 procedure PreviousNestLevel;
 end IntegrityPackage;
/

-- Integrity package definition
create or replace package body IntegrityPackage AS
 NestLevel number;

-- Procedure to initialize the trigger nest level
 procedure InitNestLevel is
 begin
 NestLevel := 0;
 end;


-- Function to return the trigger nest level
 function GetNestLevel return number is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 return(NestLevel);
 end;

-- Procedure to increase the trigger nest level
 procedure NextNestLevel is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 NestLevel := NestLevel + 1;
 end;

-- Procedure to decrease the trigger nest level
 procedure PreviousNestLevel is
 begin
 NestLevel := NestLevel - 1;
 end;

 end IntegrityPackage;
/



/*==============================================================*/
/*             - - -  A U F R Ä U M E N  - - -                  */
/*==============================================================*/

@@Lunarprospectors_DELETE.sql



/*==============================================================*/
/*            - - -  S E Q U E N Z E N  - - -                   */
/*==============================================================*/

create sequence ARBEITSZEIT_SEQ
increment by 1
start with 1
maxvalue 9999999999999999999999999999
cycle
cache 25
/

create sequence AUSGABE_SEQ
increment by 1
start with 1
maxvalue 9999999999999999999999999999
cycle
cache 500
/

create sequence BEWERBUNG_SEQ
increment by 1
start with 1
cache 100
/

create sequence JOBVERGABE_SEQ
increment by 1
start with 1
cache 25
/

create sequence JOB_SEQ
increment by 1
start with 1
cache 25
/

create sequence LAGERPOSITION_SEQ
increment by 1
start with 1
cache 500
/

create sequence LAGERTRANSPORT_SEQ
increment by 1
start with 1
/

create sequence LIEFERANGEBOT_SEQ
increment by 1
start with 1
/

create sequence LIEFERANT_SEQ
increment by 1
start with 1
nocache
/

create sequence LIEFERBUCHUNG_SEQ
increment by 1
start with 1
/

create sequence MAENGEL_SEQ
increment by 1
start with 1
/

create sequence MISSIONSGRUPPE_SEQ
increment by 1
start with 1
/

create sequence MISSION_SEQ
increment by 1
start with 1
/

create sequence NACHWEIS_SEQ
increment by 1
start with 1
/

create sequence PERSONENBEFOERDERUNG_SEQ
increment by 1
start with 1
/

create sequence PERSON_SEQ
increment by 1
start with 1
/

create sequence POSTEN_SEQ
increment by 1
start with 1
cache 50
/

create sequence PRODUKT_SEQ
increment by 1
start with 1
cache 10
/

create sequence RAUM_SEQ
increment by 1
start with 1
/



/*==============================================================*/
/* Table: ANGEBOT                                               */
/*    Zwischentabelle für die Umsetzung der n:m-Beziehung       */
/*    zwischen LIEFERANT und POSTEN                             */
/*==============================================================*/

create table ANGEBOT (
   POSTEN_ID            NUMBER(38)            not null,
   LIEFERANT_ID         NUMBER(38)            not null
)
   partition by list (LIEFERANT_ID) automatic (
      partition P_NULL values(null)
   )
/

alter table ANGEBOT
   add constraint CKC_POSTEN_ID_ANGEBOT check (POSTEN_ID >= 1)
/

alter table ANGEBOT
   add constraint CKC_LIEFERANT_ID_ANGEBOT check (LIEFERANT_ID >= 1)
/

alter table ANGEBOT
   add constraint ANGEBOT_PK_CONS primary key (POSTEN_ID, LIEFERANT_ID)
/



create index IDX_ANGEBOT_POSTEN on ANGEBOT (
   POSTEN_ID ASC
)
local
/



/*==============================================================*/
/* Table: ARBEITSZEIT                                           */
/*    genaue Arbeitszeiten für einen Arbeitstag,                */
/*    also Schichtbeginn und -ende                              */
/*==============================================================*/

create table ARBEITSZEIT (
   ID                   NUMBER(38)            not null,
   JOB_ID               NUMBER(38)            not null,
   DATUM                DATE                  not null,
   SCHICHT_BEGINN       DATE                  not null,
   SCHICHT_ENDE         DATE
)
   partition by reference (ARBEITSZEIT_JOB_FK_CONS)
/

alter table ARBEITSZEIT
   add constraint CKT_ARBEITSZEIT check (
      ((extract(HOUR from cast(SCHICHT_BEGINN as TIMESTAMP)) * 60) + extract(MINUTE from cast(SCHICHT_BEGINN as TIMESTAMP)))
      < ((extract(HOUR from cast(SCHICHT_ENDE as TIMESTAMP)) * 60) + extract(MINUTE from cast(SCHICHT_ENDE as TIMESTAMP)))
   )
/

alter table ARBEITSZEIT
   add constraint CKC_ID_ARBEITSZ check (ID >= 1)
/

alter table ARBEITSZEIT
   add constraint CKC_JOB_ID_ARBEITSZ check (JOB_ID >= 1)
/

alter table ARBEITSZEIT
   add constraint ARBEITSZEIT_PK_CONS primary key (ID)
/



create index IDX_ARBEITSZEIT_JOB_LOC on ARBEITSZEIT (
   JOB_ID ASC
)
local
/

create unique index IDX_ARBEITSZEIT_DATUM_JOB_GLO on ARBEITSZEIT (
   DATUM ASC,
   JOB_ID ASC
)
global
/



/*==============================================================*/
/* Table: AUSGABE                                               */
/*    Ausgabe einer Ressourcen an eine Person, an einem Tag     */
/*==============================================================*/

create table AUSGABE (
   ID                   NUMBER(38)           not null,
   RESSOURCE_ID         NUMBER(38)           not null,
   PERSON_ID            NUMBER(38)           not null,
   DATUM                DATE                 default SYSDATE
                                             not null,
   ANZAHL               NUMBER(3)            default 1
                                             not null
)
   partition by range (DATUM) interval (numtomyinterval(1, MONTH))
   subpartition by hash (RESSOURCE_ID) (
      partition AUSGABE_2024 values less than (to_date('2025-01-01', 'YYYY-MM-DD'))
   )
/

alter table AUSGABE
   add constraint CKC_ID_AUSGABE check (ID >= 1)
/

alter table AUSGABE
   add constraint CKC_RESSOURCE_ID_AUSGABE check (RESSOURCE_ID >= 1)
/

alter table AUSGABE
   add constraint CKC_PERSON_ID_AUSGABE check (PERSON_ID >= 1)
/

alter table AUSGABE
   add constraint CKC_ANZAHL_AUSGABE check (ANZAHL >= 1)
/

alter table AUSGABE
   add constraint AUSGABE_PK_CONS primary key (ID)
/



create index IDX_AUSGABE_RESS_DATUM_LOC on AUSGABE (
   RESSOURCE_ID ASC,
   DATUM ASC
)
local
/

create index IDX_AUSGABE_DATUM_GLO on AUSGABE (
   DATUM ASC
)
global
/

create index IDX_AUSG_PERS_DATUM_GLO on AUSGABE (
   PERSON_ID ASC,
   DATUM ASC
)
global
/



/*==============================================================*/
/* Table: BESTELLUNG                                            */
/*    Zwischentabelle für die Umsetzung der n:m-Beziehung       */
/*    zwischen LIEFERBUCHUNG und POSTEN                         */
/*==============================================================*/

create table BESTELLUNG (
   POSTEN_ID            NUMBER(38)           not null,
   BUCHUNG_ID           NUMBER(38)           not null,
   ANZAHL               NUMBER(4)            default 1
                                             not null
)
   partition by list(BUCHUNG_ID) automatic (
      partition P_NULL values(null)
   )
/

alter table BESTELLUNG
   add constraint CKC_POSTEN_ID_BESTELLU check (POSTEN_ID >= 1)
/

alter table BESTELLUNG
   add constraint CKC_BUCHUNG_ID_BESTELLU check (BUCHUNG_ID >= 1)
/

alter table BESTELLUNG
   add constraint CKC_ANZAHL_BESTELLU check (ANZAHL >= 1)
/

alter table BESTELLUNG
   add constraint BESTELLUNG_PK_CONS primary key (POSTEN_ID, BUCHUNG_ID)
/



create index IDX_BESTELLUNG_POSTEN_LOC on BESTELLUNG (
   POSTEN_ID ASC
)
local
/



/*==============================================================*/
/* Table: BEWERBUNG                                             */
/*    eine Bewerbung für einen ausgeschriebenen Job             */
/*==============================================================*/

create table BEWERBUNG (
   ID                   NUMBER(38)            not null,
   PERSON_ID            NUMBER(38)            not null,
   JOB_ID               NUMBER(38)            not null,
   DATUM                DATE                  not null,
   ANSCHREIBEN          CLOB
)
   partition by reference (JOB_ID)
/

alter table BEWERBUNG
   add constraint CKC_ID_BEWERBUN check (ID >= 1)
/

alter table BEWERBUNG
   add constraint CKC_PERSON_ID_BEWERBUN check (PERSON_ID >= 1)
/

alter table BEWERBUNG
   add constraint CKC_JOB_ID_BEWERBUN check (JOB_ID >= 1)
/

alter table BEWERBUNG
   add constraint BEWERBUNG_PK_CONS primary key (ID)
/



create index IDX_BEWERBUNG_JOB_LOC on BEWERBUNG (
   JOB_ID ASC
)
local
/

create index IDX_BERWERBUNG_PERSON_GLO on BEWERBUNG (
   PERSON_ID ASC
)
global
/



/*==============================================================*/
/* Table: GEBAEUDE                                              */
/*    ein Gebäude als Teil der Mondbasis-Anlage                 */
/*==============================================================*/

create table GEBAEUDE (
   STANDORT_X           NUMBER(8, 5)         not null,
   STANDORT_Y           NUMBER(7, 5)         not null,
   NAME                 CHAR(50 CHAR)        default 'Neues Gebäude'
                                             not null,
   BESCHREIBUNG         VARCHAR2(1000),
   STOCKWERKE           NUMBER(4)
)
/

alter table GEBAEUDE
   add constraint CKC_STANDORT_X_GEBAEUDE check (STANDORT_X between -180.00000 and 179.99999)
/

alter table GEBAEUDE
   add constraint CKC_STANDORT_Y_GEBAEUDE check (STANDORT_Y between -90.00000 and 89.99999)
/

alter table GEBAEUDE
   add constraint CKC_STOCKWERKE_GEBAEUDE check (STOCKWERKE is null or (STOCKWERKE >= 0))
/

alter table GEBAEUDE
   add constraint GEBAEUDE_PK_CONS primary key (STANDORT_X, STANDORT_Y)
/



/*==============================================================*/
/* Table: GERAET                                                */
/*    Geräte-Modell eines Herstellers, wie zB. eine stationäre  */
/*    Maschine oder ein Werkzeug(-Set), jedoch kein Verbrauchs- */
/*    produkt, wie zB. ein Ersatzteil oder Maschinenöl          */
/*==============================================================*/

create table GERAET (
   ID                   NUMBER(38)            not null,
   BEZEICHNUNG          CHAR(50 CHAR)         not null,
   HERSTELLER           CHAR(50 CHAR)
)
/

alter table GERAET
   add constraint CKC_ID_GERAET check (ID >= 1)
/

alter table GERAET
   add constraint GERAET_PK_CONS primary key (ID)
/



/*==============================================================*/
/* Table: JOB                                                   */
/*    ein Job zur Ausschreibung und anschließender Vergabe an   */
/*    einen Bewerber, meist befrister (zB. auf 2 Wochen) aber   */
/*    auch unbefristet möglich                                  */
/*==============================================================*/

create table JOB (
   ID                   NUMBER(38)           not null,
   CHEF_ID              NUMBER(38),
   RAUM_ID              NUMBER(38)           not null,
   GRUPPE_ID            NUMBER(38),
   VERGABE_ID           NUMBER(38),
   TITEL                CHAR(50 CHAR)        default 'Neuer Job'
                                             not null,
   AUFTRAG              CLOB                 not null,
   ERLEDIGT             NUMBER(1),
   GEHALT               NUMBER(9, 2)         default 0.00
                                             not null,
   BEFRISTET            NUMBER(1)            not null
)
   partition by list (VERGABE_ID)
   subpartition by hash (ID)
   (
      partition JOB_FREI      values (null)     indexing off,
      partition JOB_VERGEBEN  values (default)  indexing on
   )
/

alter table JOB
   add constraint CKT_JOB check (
      ((BEFRISTET = 1) and (ERLEDIGT is null))
      or ((BEFRISTET = 0) and (ERLEDIGT is not null))
   )
/

alter table JOB
   add constraint CKC_ID_JOB check (ID >= 1)
/

alter table JOB
   add constraint CKC_CHEF_ID_JOB check (CHEF_ID is null or (CHEF_ID >= 1))
/

alter table JOB
   add constraint CKC_RAUM_ID_JOB check (RAUM_ID >= 1)
/

alter table JOB
   add constraint CKC_GRUPPE_ID_JOB check (GRUPPE_ID is null or (GRUPPE_ID >= 1))
/

alter table JOB
   add constraint CKC_VERGABE_ID_JOB check (VERGABE_ID is null or (VERGABE_ID >= 1))
/

alter table JOB
   add constraint CKC_ERLEDIGT_JOB check (ERLEDIGT is null or (ERLEDIGT between 0 and 1))
/

alter table JOB
   add constraint CKC_GEHALT_JOB check (GEHALT >= 0.00)
/

alter table JOB
   add constraint CKC_BEFRISTET_JOB check (BEFRISTET between 0 and 1)
/

alter table JOB
   add constraint JOB_PK_CONS primary key (ID)
/

alter table JOB
   add constraint JOB_JOBVERGABE_UNIQ_CONS unique (VERGABE_ID)
/



create unique index IDX_JOB_ID_LOC on JOB (
   ID ASC
)
local
indexing full
/

create index IDX_JOB_VERGABE_GLO on JOB (
   VERGABE_ID ASC
)
global
indexing partial
/



/*==============================================================*/
/* Table: JOBGERAET                                             */
/*    Zwischentabelle für die Umsetzung der n:m-Beziehung       */
/*    zwischen JOB und GERAET                                   */
/*==============================================================*/

create table JOBGERAET (
   GERAET_ID            NUMBER(38)            not null,
   JOB_ID               NUMBER(38)            not null
)
   partition by reference (JOBGERAET_JOB_FK_CONS)
/

alter table JOBGERAET
   add constraint CKC_GERAET_ID_JOBGERAE check (GERAET_ID >= 1)
/

alter table JOBGERAET
   add constraint CKC_JOB_ID_JOBGERAE check (JOB_ID >= 1)
/

alter table JOBGERAET
   add constraint JOBGERAET_PK_CONS primary key (JOB_ID, GERAET_ID)
/



create index IDX_JOBGERAET_JOB_LOC on JOBGERAET (
   JOB_ID ASC
)
local
/



/*==============================================================*/
/* Table: JOBQUALIFIKATION                                      */
/*    Zwischentabelle für die Umsetzung der n:m-Beziehung       */
/*    zwischen JOB und QUALIFIKATION                            */
/*==============================================================*/

create table JOBQUALIFIKATION (
   JOB_ID               NUMBER(38)            not null,
   QUALI_BEZEICHNUNG    CHAR(50 CHAR)         not null
)
   partition by reference (JOBQUALI_JOB_FK_CONS)
/

alter table JOBQUALIFIKATION
   add constraint CKC_JOB_ID_JOBQUALI check (JOB_ID >= 1)
/

alter table JOBQUALIFIKATION
   add constraint JOBQUALI_PK_CONS primary key (JOB_ID, QUALI_BEZEICHNUNG)
/



create index IDX_JOBQUALI_JOB_LOC on JOBQUALIFIKATION (
   JOB_ID ASC
)
local
/



/*==============================================================*/
/* Table: JOBRESSOURCE                                          */
/*    Zwischentabelle für die Umsetzung der n:m-Beziehung       */
/*    zwischen JOB und RESSOURCE                                */
/*==============================================================*/

create table JOBRESSOURCE (
   JOB_ID               NUMBER(38)            not null,
   RESSOURCE_ID         NUMBER(38)            not null
)
   partition by reference (JOBRESS_JOB_FK_CONS)
/

alter table JOBRESSOURCE
   add constraint CKC_JOB_ID_JOBRESSO check (JOB_ID >= 1)
/

alter table JOBRESSOURCE
   add constraint CKC_RESSOURCE_ID_JOBRESSO check (RESSOURCE_ID >= 1)
/

alter table JOBRESSOURCE
   add constraint JOBRESS_PK_CONS primary key (JOB_ID, RESSOURCE_ID)
/



create index IDX_JOBRESSOURCE_JOB_LOC on JOBRESSOURCE (
   JOB_ID ASC
)
local
/



/*==============================================================*/
/* Table: JOBVERGABE                                            */
/*    Vergabe eines ausgeschriebenen Jobs an einen Bewerber     */
/*==============================================================*/

create table JOBVERGABE (
   ID                   NUMBER(38)           not null,
   PERSON_ID            NUMBER(38)           not null,
   DATUM                DATE                 default SYSDATE
                                             not null,
   HINWEISE             CLOB
)
   partition by hash (PERSON_ID)
/

alter table JOBVERGABE
   add constraint CKC_ID_JOBVERGA check (ID >= 1)
/

alter table JOBVERGABE
   add constraint CKC_PERSON_ID_JOBVERGA check (PERSON_ID >= 1)
/

alter table JOBVERGABE
   add constraint JOBVERGABE_PK_CONS primary key (ID)
/



create index IDX_JOBVERGABE_PERSON_LOC on JOBVERGABE (
   PERSON_ID ASC
)
local
/



/*==============================================================*/
/* Table: LAGER                                                 */
/*    ein Lager zur Unterbringung von Ressourcen und Geräten    */
/*==============================================================*/

create table LAGER (
   BEZEICHNUNG          CHAR(50 CHAR)        not null,
   RAUM_ID              NUMBER(38),
   KAPAZITAET_LIMIT     NUMBER(38)           not null,
   VERWENDUNG           VARCHAR2(1000)       not null,
   DATUM_ERSTELLUNG     DATE                 default SYSDATE
                                             not null,
   DATUM_AUFLOESUNG     DATE
)
/

alter table LAGER
   add constraint CKT_LAGER check ((DATUM_AUFLOESUNG is null) or (DATUM_ERSTELLUNG < DATUM_AUFLOESUNG))
/

alter table LAGER
   add constraint CKC_RAUM_ID_LAGER check (RAUM_ID is null or (RAUM_ID >= 1))
/

alter table LAGER
   add constraint CKC_KAPAZITAET_LIMIT_LAGER check (KAPAZITAET_LIMIT >= 1)
/

alter table LAGER
   add constraint LAGER_PK_CONS primary key (BEZEICHNUNG)
/

alter table LAGER
   add constraint LAGER_RAUM_UNQ_CONS unique (RAUM_ID)
/



/*==============================================================*/
/* Table: LAGERPOSITION                                         */
/*    eine Position in einem Lagers (zB. Regal-Nr. 123,         */
/*    Position 1742), eine Position entspricht dabei einer      */
/*    Einheit bezüglich der Kapazität (eine Palette)            */
/*==============================================================*/

create table LAGERPOSITION (
   ID                   NUMBER(38)            not null,
   LAGER_BEZEICHNUNG    CHAR(50 CHAR)         not null,
   REGAL_NR             NUMBER(15)            not null,
   POSITION_NR          NUMBER(15)            not null,
   POSTEN_ID            NUMBER(38)
)
   partition by list (LAGER_BEZEICHNUNG) automatic (
      partition P_NULL values(null)
   )
/

alter table LAGERPOSITION
   add constraint CKC_ID_LAGERPOS check (ID >= 1)
/

alter table LAGERPOSITION
   add constraint CKC_REGAL_NR_LAGERPOS check (REGAL_NR >= 1)
/

alter table LAGERPOSITION
   add constraint CKC_POSITION_NR_LAGERPOS check (POSITION_NR >= 1)
/

alter table LAGERPOSITION
   add constraint CKC_POSTEN_ID_LAGERPOS check (POSTEN_ID is null or (POSTEN_ID >= 1))
/

alter table LAGERPOSITION
   add constraint LAGPOS_PK_CONS primary key (ID)
/

alter table LAGERPOSITION
   add constraint LAGPOS_POSTEN_UNQI_CONS unique (POSTEN_ID)
/

alter table LAGERPOSITION
   add constraint LAGERPOS_AK_CONS unique (LAGER_BEZEICHNUNG, REGAL_NR, POSITION_NR)
/



create unique index IDX_LAGERPOSITION_POSTEN_GLO on LAGERPOSITION (
   POSTEN_ID ASC
)
global
/

create unique index IDX_LAGERPOSITION_ID_LOC on LAGERPOSITION (
   ID ASC
)
local
/



/*==============================================================*/
/* Table: LAGERTRANSPORT                                        */
/*    Transport eines Postens (Ressourcen- oder Geräteposten)   */
/*    zwischen zwei Lagern, Informationen wie zB. Datum,        */
/*    optional Uhrzeit, Ausgangs- und Ziellager des Transports  */
/*==============================================================*/

create table LAGERTRANSPORT (
   ID                   NUMBER(38)            not null,
   START_BEZEICHNUNG    CHAR(50 CHAR)         not null,
   ZIEL_BEZEICHNUNG     CHAR(50 CHAR)         not null,
   TERMIN               DATE                  not null,
   UHRZEIT              DATE
)
/

alter table LAGERTRANSPORT
   add constraint CKT_LAGERTRANSPORT check (START_BEZEICHNUNG != ZIEL_BEZEICHNUNG)
/

alter table LAGERTRANSPORT
   add constraint CKC_ID_LAGERTRA check (ID >= 1)
/

alter table LAGERTRANSPORT
   add constraint LAGERTRANS_PK_CONS primary key (ID)
/



create index IDX_LAGERTRANSPORT_TERMIN on LAGERTRANSPORT (
   TERMIN ASC
)
/



/*==============================================================*/
/* Table: LIEFERANGEBOT                                         */
/*    ein Terminangebot für eine Versorgungslieferung durch     */
/*    einen Lieferanten, umfasst Informationen zu Terminen,     */
/*    Lieferkapazität und Kosten                                */
/*==============================================================*/

create table LIEFERANGEBOT (
   ID                   NUMBER(38)            not null,
   LIEFERANT_ID         NUMBER(38)            not null,
   BUCHUNG_DEADLINE     DATE                  not null,
   LIEFERTERMIN         DATE                  not null,
   GEWICHT_LIMIT        NUMBER(9, 3)          not null,
   KAPAZITAET_LIMIT     NUMBER(4)             not null,
   PERSONEN_LIMIT       NUMBER(4),
   LIEFERKOSTEN         NUMBER(9,2)           not null
)
/

alter table LIEFERANGEBOT
   add constraint CKT_LIEFERANGEBOT check (BUCHUNG_DEADLINE < LIEFERTERMIN)
/

alter table LIEFERANGEBOT
   add constraint CKC_ID_LIEFANG check (ID >= 1)
/

alter table LIEFERANGEBOT
   add constraint CKC_LIEFERANT_ID_LIEFERAN check (LIEFERANT_ID >= 1)
/

alter table LIEFERANGEBOT
   add constraint CKC_GEWICHT_LIMIT_LIEFERAN check (GEWICHT_LIMIT >= 0.000)
/

alter table LIEFERANGEBOT
   add constraint CKC_KAPAZITAET_LIMIT_LIEFERAN check (KAPAZITAET_LIMIT >= 0)
/

alter table LIEFERANGEBOT
   add constraint CKC_PERSONEN_LIMIT_LIEFERAN check (PERSONEN_LIMIT is null or (PERSONEN_LIMIT >= 0))
/

alter table LIEFERANGEBOT
   add constraint CKC_LIEFERKOSTEN_LIEFERAN check (LIEFERKOSTEN >= 0.00)
/

alter table LIEFERANGEBOT
   add constraint LIEFANG_PK_CONS primary key (ID)
/



/*==============================================================*/
/* Table: LIEFERANT                                             */
/*    ein Anbieter von Versorgungslieferungen, diese            */
/*    Unternehmen bieten Ressourcen und Geräte an und           */
/*    ermöglichen im Rahmen von Lieferangeboten Versorgungs-    */
/*    lieferungen mit diesen Produkten                          */
/*==============================================================*/

create table LIEFERANT (
   ID                   NUMBER(38)           not null,
   NAME                 CHAR(50 CHAR)        default 'Neuer Lieferant'
                                             not null,
   TELEFON              CHAR(25 CHAR),
   EMAIL                CHAR(50 CHAR),
   IBAN                 CHAR(50 CHAR)
)
/

alter table LIEFERANT
   add constraint CKC_ID_LIEFERANT check (id >= 1)
/

alter table LIEFERANT
   add constraint CKC_TELEFON_LIEFERAN check (
      TELEFON is null
      or (
         regexp_like(
            replace(
               replace(TELEFON, '-', ''),
               ' ', ''
            ),
            '^[+0][0-9]{3,15}$'
         )
      )
   )
/

alter table LIEFERANT
   add constraint CKC_EMAIL_LIEFERAN check (
      EMAIL is null
      or (
         (instr(reverse(EMAIL), '.') < instr(reverse(EMAIL), '@'))
         and ((length(EMAIL) - length(replace(EMAIL, '@', '')) = 1))
      )
   )
/

alter table LIEFERANT
   add constraint CKC_IBAN_LIEFERAN check (
      IBAN is null
      or (
         regexp_like(
            replace(
               replace(IBAN, '-', ''),
               ' ', ''
            ),
            '^[A-Za-z]{2}[0-9]{13,31}$'
         )
      )
   )
/

alter table LIEFERANT
   add constraint LIEFERANT_PK_CONS primary key (ID)
/



/*==============================================================*/
/* Table: LIEFERBUCHUNG                                         */
/*    verbindliche Buchung einer Lieferoption, beinhaltet       */
/*    u.A. die neue Deadline für die Abgabe von Bestellungen    */
/*==============================================================*/

create table LIEFERBUCHUNG (
   ID                   NUMBER(38)            not null,
   LAGER_BEZEICHNUNG    CHAR(50 CHAR)         not null,
   ANGEBOT_ID           NUMBER(38)            not null,
   BESTELL_DEADLINE     DATE                  not null
)
/

alter table LIEFERBUCHUNG
   add constraint CKC_ID_LIEFERBU check (ID >= 1)
/

alter table LIEFERBUCHUNG
   add constraint CKC_ANGEBOT_ID_LIEFERBU check (ANGEBOT_ID >= 1)
/

alter table LIEFERBUCHUNG
   add constraint LIEFBUCH_PK_CONS primary key (ID)
/

alter table LIEFERBUCHUNG
   add constraint LIEFBUCH_LIEFANG_UNIQ_CONS unique (ANGEBOT_ID)
/



/*==============================================================*/
/* Table: MAENGEL                                               */
/*    Beschreibung eines Reperatur- bzw.                        */
/*    Wartungsbedarfs bei einem Gerät                           */
/*==============================================================*/

create table MAENGEL (
   ID                   NUMBER(38)            not null,
   POSTEN_ID            NUMBER(38)            not null,
   BESCHREIBUNG         CLOB                  not null,
   DRINGLICHKEIT        NUMBER(1)             not null
)
/

alter table MAENGEL
   add constraint CKC_ID_MAENGEL check (ID >= 1)
/

alter table MAENGEL
   add constraint CKC_POSTEN_ID_MAENGEL check (POSTEN_ID >= 1)
/

alter table MAENGEL
   add constraint CKC_DRINGLICHKEIT_MAENGEL check (DRINGLICHKEIT between 1 and 9)
/

alter table MAENGEL
   add constraint MAENGEL_PK_CONS primary key (ID)
/



/*==============================================================*/
/* Table: MISSION                                               */
/*    ein geplantes Missionsvorhaben bzw.                       */
/*    eine aktuelle oder abgeschlossene Mission der Mondbasis   */
/*==============================================================*/

create table MISSION (
   ID                   NUMBER(38)           not null,
   TITEL                CHAR(50 CHAR)        default 'Neue Mission'
                                             not null,
   AUFTRAG              CLOB,
   STARTDATUM           DATE,
   ENDDATUM             DATE
)
/

alter table MISSION
   add constraint CKT_MISSION check (
      ((STARTDATUM is null) and (ENDDATUM is null))
      or ((STARTDATUM is not null) and (ENDDATUM is null))
      or ((STARTDATUM is not null) and (ENDDATUM is not null) and (STARTDATUM < ENDDATUM))
   )
/

alter table MISSION
   add constraint CKC_ID_MISSION check (ID >= 1)
/

alter table MISSION
   add constraint MISSION_PK_CONS primary key (ID)
/



/*==============================================================*/
/* Table: MISSIONSGRUPPE                                        */
/*    eine Gruppe als Teil einer Mission, die Mitglieder haben  */
/*    seperate Aufgaben, bewegen sich jedoch gemeinsam fort     */
/*==============================================================*/

create table MISSIONSGRUPPE (
   ID                   NUMBER(38)           not null,
   LAGER_BEZEICHNUNG    CHAR(50 CHAR)        not null,
   MISSION_ID           NUMBER(38)           not null,
   TITEL                CHAR(50 CHAR)        default 'Neue Gruppe'
                                             not null,
   AUFTRAG              CLOB,
   POSITION_X           NUMBER(8, 5),
   POSITION_Y           NUMBER(7, 5)
)
/

alter table MISSIONSGRUPPE
   add constraint CKC_ID_MISSIONS check (ID >= 1)
/

alter table MISSIONSGRUPPE
   add constraint CKC_MISSION_ID_MISSIONS check (MISSION_ID >= 1)
/

alter table MISSIONSGRUPPE
   add constraint CKC_POSITION_X_MISSIONS check (POSITION_X is null or (POSITION_X between -180.00000 and 179.99999))
/

alter table MISSIONSGRUPPE
   add constraint CKC_POSITION_Y_MISSIONS check (POSITION_Y is null or (POSITION_Y between -90.00000 and 89.99999))
/

alter table MISSIONSGRUPPE
   add constraint MISGRUPPE_PK_CONS primary key (ID)
/



/*==============================================================*/
/* Table: NACHWEIS                                              */
/*    ein Nachweis über eine oder mehrere Qualifikationen,      */
/*    zB. ein Zeugnis, ein Ausbildungsnachweis, etc.            */
/*==============================================================*/

create table NACHWEIS (
   ID                   NUMBER(38)            not null,
   PERSON_ID            NUMBER(38)            not null,
   DATUM                DATE                  not null,
   FAKULTAET            CHAR(50 CHAR)         not null,
   NOTE                 NUMBER(1),
   ANMERKUNGEN          CLOB
)
/

alter table NACHWEIS
   add constraint CKC_ID_NACHWEIS check (ID >= 1)
/

alter table NACHWEIS
   add constraint CKC_PERSON_ID_NACHWEIS check (PERSON_ID >= 1)
/

alter table NACHWEIS
   add constraint CKC_NOTE_NACHWEIS check (NOTE is null or (NOTE between 1 and 6))
/

alter table NACHWEIS
   add constraint NACHWEIS_PK_CONS primary key (ID)
/



create index IDX_NACHWEIS_PERSON on NACHWEIS (
   PERSON_ID ASC
)
/



/*==============================================================*/
/* Table: PERSON                                                */
/*    ein Bewohner der Mondbasis                                */
/*==============================================================*/

create table PERSON (
   ID                   NUMBER(38)           not null,
   NAME                 CHAR(50 CHAR)        default 'Unbekannte Person'
                                             not null,
   GEBURTSDATUM         DATE                 not null,
   ANREISE_DATUM        DATE                 not null,
   ABREISE_DATUM        DATE,
   NATIONALITAET        CHAR(50 CHAR)        not null,
   GEWICHT              NUMBER(9, 3)         not null,
   IBAN                 CHAR(50 CHAR)
)
/

alter table PERSON
   add constraint CKT_PERSON check (
      (GEBURTSDATUM < ANREISE_DATUM)
      and (
         (ABREISE_DATUM is null)
         or (ANREISE_DATUM < ABREISE_DATUM)
      )
   )
/

alter table PERSON
   add constraint CKC_ID_PERSON check (ID >= 1)
/

alter table PERSON
   add constraint CKC_NATIONALITAET_PERSON check (
      NATIONALITAET in (
         'Afghanistan','Ägypten','Albanien','Algerien','Andorra','Angola','Antigua und Barbuda','Äquatorialguinea','Argentinien','Armenien','Aserbaidschan','Äthopien','Australien','Bahamas',
         'Bahrain','Bangladesch','Barbados','Belarus','Belgien','Belize','Benin','Bhutan','Bolivien','Bosnien und Herzogovina','Botswana','Brasilien','Brunei','Bulgarien','Burkina Faso',
         'Burundi','Chile','China','Taiwan','Cookinseln','Costa Rica','Dänemark','Deutschland','Dominica','Dominikanische Republik','Dschibuti','Ecuador','El Salvador','Elfenbeinküste',
         'Eritrea','Estland','Eswatini','Fidschi','Finnland','Frankreich','Gabun','Gambia','Georgien','Ghana','Grenada','Griechenland','Guatemala','Guinea','Guinea Bissau','Guyana','Haiti',
         'Honduras','Indien','Indonesien','Irak','Iran','Irland','Island','Israel','Italien','Jamaika','Japan','Jemen','Jordanien','Kambodscha','Kamerun','Kanada','Kap Verde','Kasachstan',
         'Katar','Kenia','Kirgisistan','Kiribati','Kolumbien','Komoren','Kongo','Nordkorea','Südkorea','Kosovo','Kroatien','Kuba','Kuwait','Laos','Lesothon','Lettland','Libanon','Liberia',
         'Lybien','Lichtenstein','Litauen','Luxemburg','Madagaska','Malawi','Malaysia','Malediven','Mali','Malta','Marokko','Marshallinseln','Mauretanien','Mauritius','Mexiko','Mikronesien',
         'Moldau','Monaco','Mongolei','Montenegro','Mosambik','Myanmar','Namibia','Nauru','Nepal','Neuseeland','Nicaraga','Niederlande','Niger','Nigeria','Niue','Nordmazedonien','Nordzypern',
         'Norwegen','Oman','Österreich','Osttimur','Pakistan','Palästina','Palau','Panama','Papua Neuguinea','Paraguay','Peru','Polen','Portugal','Ruanda','Rumänien','Russland','Salamonen',
         'Sambia','Samoa','San Marino','Sao Tome und Principe','Saudi Arabien','Schweden','Schweiz','Senegal','Serbien','Seychellen','Sierra Leone','Simbabwe','Singapur','Slowakei','Slowenien',
         'Somalia','Somaliland','Spanien','Sri Lanka','Saint Kitts und Nevis','Saint Lucia','Saint Vincent und die Grenadinen','Südafrika','Sudan','Südossetien','Südsudan','Suriname','Syrien',
         'Tadschikistan','Tansania','Thailand','Togo','Tonga','Transnistrien','Trinidad und Tobago','Tschad','Tschechien','Tunesien','Türkei','Turkmenistan','Tuvalu','Uganda','Ukraine','Ungarn',
         'Uruguay','Usbekistan','Vanuatu','Vatikanstadt','Venezuela','VAE','USA','UK','Vietnam','Westsahara','Zentralafrikanische Republik','Zypern','staatenlos','unbekannt'
      )
   )
/

alter table PERSON
   add constraint CKC_GEWICHT_PERSON check (GEWICHT >= 0.000)
/

alter table PERSON
   add constraint CKC_IBAN_PERSON check (
      IBAN is null
      or (
         regexp_like(
            replace(
               replace(IBAN, '-', ''),
               ' ', ''
            ),
         '^[A-Za-z]{2}[0-9]{13,31}$'
         )
      )
   )
/

alter table PERSON
   add constraint PERSON_PK_CONS primary key (ID)
/



/*==============================================================*/
/* Table: PERSONENBEFOERDERUNG                                  */
/*    Ticket für den Personentransport einer Person von oder    */
/*    zur Mondbasis, das jeweilige Datum (für An- oder Abreise) */
/*    der entsprechenden Person muss vor dem Ticketkauf         */
/*    festgelegt sein                                           */
/*==============================================================*/

create table PERSONENBEFOERDERUNG (
   ID                   NUMBER(38)            not null,
   BUCHUNG_ID           NUMBER(38)            not null,
   HINWEISE             CLOB,
   GEPAECK_GEWICHT      NUMBER(9, 3)          not null,
   PERSON_ID            NUMBER(38)            not null,
   RICHTUNG             NUMBER(1)             not null
)
/

alter table PERSONENBEFOERDERUNG
   add constraint CKC_ID_PERSONEN check (ID >= 1)
/

alter table PERSONENBEFOERDERUNG
   add constraint CKC_BUCHUNG_ID_PERSONEN check (BUCHUNG_ID >= 1)
/

alter table PERSONENBEFOERDERUNG
   add constraint CKC_GEPAECK_GEWICHT_PERSONEN check (GEPAECK_GEWICHT >= 0.000)
/

alter table PERSONENBEFOERDERUNG
   add constraint CKC_PERSON_ID_PERSONEN check (PERSON_ID >= 1)
/

alter table PERSONENBEFOERDERUNG
   add constraint CKC_RICHTUNG_PERSONEN check (RICHTUNG between 0 and 1)
/

alter table PERSONENBEFOERDERUNG
   add constraint PERSBEF_PK_CONS primary key (ID)
/



/*==============================================================*/
/* Table: POSTEN                                                */
/*    ein Posten im Lager (im Bestand / alt) oder ein Angebot   */
/*    eines Lieferanten, jeweils entweder ein Gerät             */
/*    oder eine Ressource                                       */
/*==============================================================*/

create table POSTEN (
   ID                   NUMBER(38)           not null,
   DATUM_EINGANG        DATE,
   DATUM_AUSGANG        DATE,
   GEWICHT              NUMBER(9, 3)         not null,
   KAUFPREIS            NUMBER(11, 2),
   GERAET_ID            NUMBER(38),
   "ALTER"              DATE,
   RESSOURCE_ID         NUMBER(38),
   ANZAHL               NUMBER(7),
   HERSTELLER           CHAR(50 CHAR),
   TYP                  generated always as (
      case
         when (
            (DATUM_EINGANG is null)
            and (DATUM_AUSGANG is null)
            and (KAUFPREIS is not null)
         )
            then 'ANGEBOT'
         when (
            (DATUM_EINGANG is not null)
            and (DATUM_AUSGANG is not null)
            and (DATUM_EINGANG < DATUM_AUSGANG)
         )
            then 'LAGER_ALT'
         when (
            (DATUM_EINGANG is not null)
            and (DATUM_AUSGANG is null)
         )
            then 'LAGER_BESTAND'
         else
            'FEHLER'
      end
   ) virtual
)
   partition by list (TYP) (
      partition POSTEN_ANGEBOT         values ('ANGEBOT'),
      partition POSTEN_LAGER_BESTAND   values ('LAGER_BESTAND'),
      partition POSTEN_LAGER_ALT       values ('LAGER_ALT')
   )
/

alter table POSTEN
   add constraint CKT_POSTEN check (((
            (GERAET_ID is not null)
            and (RESSOURCE_ID is null)
            and (ANZAHL is null)
            and (HERSTELLER is null)
         )
         or (
            (GERAET_ID is null)
            and (RESSOURCE_id is not null)
            and (ANZAHL is not null)
            and ("ALTER" is null)
         )
      )
      and (typ != 'FEHLER')
   )
/

alter table POSTEN
   add constraint CKC_ID_POSTEN check (ID >= 1)
/

alter table POSTEN
   add constraint CKC_GEWICHT_POSTEN check (GEWICHT >= 0.000)
/

alter table POSTEN
   add constraint CKC_KAUFPREIS_POSTEN check (KAUFPREIS is null or (KAUFPREIS >= 0.00))
/

alter table POSTEN
   add constraint CKC_GERAET_ID_POSTEN check (GERAET_ID is null or (GERAET_ID >= 1))
/

alter table POSTEN
   add constraint CKC_RESSOURCE_ID_POSTEN check (RESSOURCE_ID is null or (RESSOURCE_ID >= 1))
/

alter table POSTEN
   add constraint CKC_ANZAHL_POSTEN check (ANZAHL is null or (ANZAHL >= 1))
/

alter table POSTEN
   add constraint POSTEN_PK_CONS primary key (ID)
/



create unique index IDX_POSTEN_ID_LOC on POSTEN (
   ID ASC
)
local
/

create index IDX_POSTEN_PRODUCT_ID on POSTEN (
   coalesce(RESSOURCE_ID, GERAET_ID) ASC,
   ID ASC
)
local
/



/*==============================================================*/
/* Table: QUALIFIKATION                                         */
/*    eine Qualifikation als Berechtigung                       */
/*    für bestimmte Arbeiten                                    */
/*==============================================================*/

create table QUALIFIKATION (
   BEZEICHNUNG          CHAR(50 CHAR)        default 'Neue Qualifikation'
                                             not null,
   "LEVEL"              NUMBER(2)            not null
)
/

alter table QUALIFIKATION
   add constraint CKC_LEVEL_QUALIFIK check ("LEVEL" >= 1)
/

alter table QUALIFIKATION
   add constraint QUALIFIKATION_PK_CONS primary key (BEZEICHNUNG)
/



/*==============================================================*/
/* Table: QUALIFIKATIONSNACHWEIS                                */
/*    Zwischentabelle für die Umsetzung der n:m-Beziehung       */
/*    zwischen QUALIFIKATION und NACHWEIS                       */
/*==============================================================*/

create table QUALIFIKATIONSNACHWEIS (
   NACHWEIS_ID          NUMBER(38)            not null,
   QUALI_BEZEICHNUNG    CHAR(50 CHAR)         not null
)
   partition by hash (NACHWEIS_ID)
/

alter table QUALIFIKATIONSNACHWEIS
   add constraint CKC_NACHWEIS_ID_QUALIFIK check (NACHWEIS_ID >= 1)
/

alter table QUALIFIKATIONSNACHWEIS
   add constraint QUALINACHWEIS_PK_CONS primary key (NACHWEIS_ID, QUALI_BEZEICHNUNG)
/



create index IDX_QUALINACHWEIS_NACHWEIS_LOC on QUALIFIKATIONSNACHWEIS (
   NACHWEIS_ID ASC
)
local
/



/*==============================================================*/
/* Table: RAUM                                                  */
/*    ein Raum innerhalb eines Gebäudes der Mondbasis           */
/*==============================================================*/

create table RAUM (
   ID                   NUMBER(38)           not null,
   GEBAEUDE_STANDORT_X  NUMBER(8, 5)         not null,
   GEBAEUDE_STANDORT_Y  NUMBER(8, 5)         not null,
   BEZEICHNUNG          CHAR(50 CHAR)        default 'Neuer Raum'
                                             not null,
   STOCKWERK            NUMBER(4)            not null,
   GROESSE              NUMBER(8,2),
   AUSSTATTUNG          VARCHAR2(1000)
)
/

alter table RAUM
   add constraint CKC_ID_RAUM check (ID >= 1)
/

alter table RAUM
   add constraint CKC_GEBAEUDE_X_RAUM check (GEBAEUDE_STANDORT_X between -180.00000 and 179.99999)
/

alter table RAUM
   add constraint CKC_GEBAEUDE_Y_RAUM check (GEBAEUDE_STANDORT_Y between -180.00000 and 179.99999)
/

alter table RAUM
   add constraint CKC_GROESSE_RAUM check (GROESSE is null or (GROESSE >= 0.00))
/

alter table RAUM
   add constraint RAUM_PK_CONS primary key (ID)
/



/*==============================================================*/
/* Table: RESSOURCE                                             */
/*    ein Verbrauchsprodukt unabhängig des Herstellers,         */
/*    wie zB. ein Lebensmittel, ein Ersatzteil, etc.            */
/*==============================================================*/

create table RESSOURCE (
   ID                   NUMBER(38)            not null,
   BEZEICHNUNG          CHAR(50 CHAR)         not null,
   TYP                  CHAR(50 CHAR)
)
/

alter table RESSOURCE
   add constraint CKC_ID_RESSOURC check (ID >= 1)
/

alter table RESSOURCE
   add constraint RESSOURCE_PK_CONS primary key (ID)
/



/*==============================================================*/
/* Table: TRANSPORTPOSTEN                                       */
/*    Zwischentabelle für die Umsetzung der n:m-Beziehung       */
/*    zwischen LAGERTRANSPORT und POSTEN                        */
/*==============================================================*/

create table TRANSPORTPOSTEN (
   POSTEN_ID            NUMBER(38)            not null,
   TRANSPORT_ID         NUMBER(38)            not null
)
/

alter table TRANSPORTPOSTEN
   add constraint CKC_POSTEN_ID_TRANSPOR check (POSTEN_ID >= 1)
/

alter table TRANSPORTPOSTEN
   add constraint CKC_TRANSPORT_ID_TRANSPOR check (TRANSPORT_ID >= 1)
/

alter table TRANSPORTPOSTEN
   add constraint TRANSPOSTEN_PK_CONS primary key (POSTEN_ID, TRANSPORT_ID)
/



create index IDX_TRANSPOST_TRANSPORT_ID on TRANSPORTPOSTEN (
   TRANSPORT_ID ASC
)
/



/*==============================================================*/
/*           - - -  R E F E R E N Z E N  - - -                  */
/*==============================================================*/

alter table ANGEBOT
   add constraint ANGEBOT_LIEFERANT_FK_CONS foreign key (LIEFERANT_ID)
      references LIEFERANT (ID)
      on delete cascade
/

alter table ANGEBOT
   add constraint ANGEBOT_POSTEN_FK_CONS foreign key (POSTEN_ID)
      references POSTEN (ID)
      on delete cascade
/

alter table ARBEITSZEIT
   add constraint ARBEITSZEIT_JOB_FK_CONS foreign key (JOB_ID)
      references JOB (ID)
      on delete cascade
/

alter table AUSGABE
   add constraint AUSGABE_PERSON_FK_CONS foreign key (PERSON_ID)
      references PERSON (ID)
/

alter table AUSGABE
   add constraint AUSGABE_RESSOURCE_FK_CONS foreign key (RESSOURCE_ID)
      references RESSOURCE (ID)
/

alter table BESTELLUNG
   add constraint BESTELLUNG_LIEFBUCH_FK_CONS foreign key (BUCHUNG_ID)
      references LIEFERBUCHUNG (ID)
      on delete cascade
/

alter table BESTELLUNG
   add constraint BESTELLUNG_POSTEN_FK_CONS foreign key (POSTEN_ID)
      references POSTEN (ID)
      on delete cascade
/

alter table BEWERBUNG
   add constraint BEWERBUNG_PERSON_FK_CONS foreign key (PERSON_ID)
      references PERSON (ID)
      on delete cascade
/

alter table BEWERBUNG
   add constraint BEWERBUNG_JOB_FK_CONS foreign key (JOB_ID)
      references JOB (ID)
      on delete cascade
/

alter table JOB
   add constraint JOB_JOB_CHEF_JOB_FK_CONS foreign key (CHEF_ID)
      references JOB (ID)
/

alter table JOB
   add constraint JOB_JOBVERGABE_FK_CONS foreign key (VERGABE_ID)
      references JOBVERGABE (ID)
      on delete set null
/

alter table JOB
   add constraint JOB_MISGRUPPE_FK_CONS foreign key (GRUPPE_ID)
      references MISSIONSGRUPPE (ID)
      on delete cascade
/

alter table JOB
   add constraint RAUM_JOB_FK_CONS foreign key (RAUM_ID)
      references RAUM (ID)
/

alter table JOBGERAET
   add constraint JOBGERAET_GERAET_FK_CONS foreign key (GERAET_ID)
      references GERAET (ID)
/

alter table JOBGERAET
   add constraint JOBGERAET_JOB_FK_CONS foreign key (JOB_ID)
      references JOB (ID)
      on delete cascade
/

alter table JOBQUALIFIKATION
   add constraint JOBQUALI_JOB_FK_CONS foreign key (JOB_ID)
      references JOB (ID)
      on delete cascade
/

alter table JOBQUALIFIKATION
   add constraint JOBQUALI_QUALI_FK_CONS foreign key (QUALI_BEZEICHNUNG)
      references QUALIFIKATION (BEZEICHNUNG)
/

alter table JOBRESSOURCE
   add constraint JOBRESS_JOB_FK_CONS foreign key (JOB_ID)
      references JOB (ID)
      on delete cascade
/

alter table JOBRESSOURCE
   add constraint JOBRESS_RESS_FK_CONS foreign key (RESSOURCE_ID)
      references RESSOURCE (ID)
/

alter table JOBVERGABE
   add constraint JOBVERGABE_PERSON_FK_CONS foreign key (PERSON_ID)
      references PERSON (ID)
/

alter table LAGER
   add constraint LAGER_RAUM_FK_CONS foreign key (RAUM_ID)
      references RAUM (ID)
/

alter table LAGERPOSITION
   add constraint LAGERPOSITION_LAGER_FK_CONS foreign key (LAGER_BEZEICHNUNG)
      references LAGER (BEZEICHNUNG)
      on delete cascade
/

alter table LAGERPOSITION
   add constraint LAGERPOSITION_POSTEN_CONS foreign key (POSTEN_ID)
      references POSTEN (ID)
/

alter table LAGERTRANSPORT
   add constraint LAGTRANS_START_LAGER_FK_CONS foreign key (START_BEZEICHNUNG)
      references LAGER (BEZEICHNUNG)
      on delete cascade
/

alter table LAGERTRANSPORT
   add constraint FK_LAGERTRANSPORT_ZIEL_LAGER foreign key (ZIEL_BEZEICHNUNG)
      references LAGER (BEZEICHNUNG)
      on delete cascade
/

alter table LIEFERANGEBOT
   add constraint FK_LIEFERAN_LIEFERANG_LIEFERAN foreign key (LIEFERANT_ID)
      references LIEFERANT (ID)
      on delete cascade
/

alter table LIEFERBUCHUNG
   add constraint LIEFBUCH_LAGER_FK_CONS foreign key (LAGER_BEZEICHNUNG)
      references LAGER (BEZEICHNUNG)
      on delete cascade
/

alter table LIEFERBUCHUNG
   add constraint LIEFBUCH_LIEFANG_FK_CONS foreign key (ANGEBOT_ID)
      references LIEFERANGEBOT (ID)
/

alter table MAENGEL
   add constraint FK_MAENGEL_POSTEN foreign key (POSTEN_ID)
      references POSTEN (ID)
      on delete cascade
/

alter table MISSIONSGRUPPE
   add constraint MISGRUPPE_LAGER_FK_CONS foreign key (LAGER_BEZEICHNUNG)
      references LAGER (BEZEICHNUNG)
/

alter table MISSIONSGRUPPE
   add constraint MISGRUPPE_MISSION_FK_CONS foreign key (MISSION_ID)
      references MISSION (ID)
      on delete cascade
/

alter table NACHWEIS
   add constraint NACHWEIS_PERSON_FK_CONS foreign key (PERSON_ID)
      references PERSON (ID)
      on delete cascade
/

alter table PERSONENBEFOERDERUNG
   add constraint PERSBEF_LIEFBUCH foreign key (BUCHUNG_ID)
      references LIEFERBUCHUNG (ID)
      on delete cascade
/

alter table PERSONENBEFOERDERUNG
   add constraint PERSBEF_PERSON_FK_CONS foreign key (PERSON_ID)
      references PERSON (ID)
/

alter table POSTEN
   add constraint POSTEN_GERAET_FK_CONS foreign key (GERAET_ID)
      references GERAET (ID)
/

alter table POSTEN
   add constraint POSTEN_RESSOURCE_FK_CONS foreign key (RESSOURCE_ID)
      references RESSOURCE (ID)
/

alter table QUALIFIKATIONSNACHWEIS
   add constraint QUALINACHWEIS_NACHWEIS_FK_CONS foreign key (NACHWEIS_ID)
      references NACHWEIS (ID)
      on delete cascade
/

alter table QUALIFIKATIONSNACHWEIS
   add constraint QUALINACHWEIS_QUALI_FK_CONS foreign key (QUALI_BEZEICHNUNG)
      references QUALIFIKATION (BEZEICHNUNG)
/

alter table RAUM
   add constraint RAUM_GEBAEUDE_FK_CONS foreign key (GEBAEUDE_STANDORT_X, GEBAEUDE_STANDORT_Y)
      references GEBAEUDE (STANDORT_X, STANDORT_Y)
      on delete cascade
/

alter table TRANSPORTPOSTEN
   add constraint TRANSPOST_LAGERTRANS_FK_CONS foreign key (TRANSPORT_ID)
      references LAGERTRANSPORT (ID)
      on delete cascade
/

alter table TRANSPORTPOSTEN
   add constraint TRANSPORTPOSTEN_POSTEN_FK_CONS foreign key (POSTEN_ID)
      references POSTEN (ID)
      on delete cascade
/



/*==============================================================*/
/*                - - -  T R I G G E R  - - -                   */
/*==============================================================*/

--- ANGEBOT / Before-Insert-Trigger ---
create trigger TRG_ANGEBOT_B_INS before insert
on ANGEBOT for each row
declare
   posten_typ CHAR(13 CHAR);

begin
    --- Typ des referenzierten POSTEN ermitteln
    select posten.typ
    into posten_typ
    from POSTEN posten
    where posten.id = :new.POSTEN_id;
    
    --- passt der Typ des POSTEN (entspricht also 'ANGEBOT') ?
    if (rtrim(posten_typ) != 'ANGEBOT') then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20001, 'FEHLER: der Posten eines Angebots muss selbst ebenfalls ein Angebot sein, kein tatsächlicher oder alter Lagerposten');
    end if;
end;
/



--- ANGEBOT / Before-Update-Trigger (*) ---
create trigger TRG_ANGEBOT_B_UPD before update
on ANGEBOT for each row
begin
    --- jegliche Änderungen am Fremdschlüssel (bzw. auch Primärschlüssel) verbieten
    raise_application_error(-20002, 'FEHLER: der Lieferant oder das Produktangebot eines Angebot-Eintrags kann nachträglich nicht geändert werden, stattdessen den Eintrag entfernen / neu anlegen');
end;
/



--- ARBEITSZEIT / Before-Insert-Trigger ---
create trigger TRG_ARBEITSZEIT_B_INS before insert
on ARBEITSZEIT for each row
begin
    --- ARBEITSZEIT verwendet ARBEITSZEIT_seq als Sequenzgenerator
    select ARBEITSZEIT_seq.nextval into :new.id from dual;
end;
/



--- ARBEITSZEIT / Before-Update-Trigger (*) ---
create trigger TRG_ARBEITSZEIT_B_UPD before update
on ARBEITSZEIT for each row
begin
    --- jegliche Änderungen verbieten
    raise_application_error(-20003, 'FEHLER: ein Arbeitszeiten-Eintrag kann nachträglich nicht geöndert werden, stattdessen löschen und neu erstellen');
end;
/



--- AUSGABE / Before-Insert-Trigger ---
create trigger TRG_AUSGABE_B_INS before insert
on AUSGABE for each row
declare
    person_anreise DATE;
    person_abreise DATE;

begin
    --- An- und ggf. Abreisedatum der referenzierten PERSON ermitteln
    select person.anreise_datum, person.abreise_datum
    into person_anreise, person_abreise
    from PERSON person
    where person.id = :new.PERSON_id;

    --- ist das Datum im Zeitraum des Aufenthalts der PERSON ?
    if ((trunc(person_anreise) <= trunc(:new.datum)) and ((person_abreise is null) or (trunc(:new.datum) <= trunc(person_abreise)))) then
        --- AUSGABE verwendet AUSGABE_seq als Sequenzgenerator
        select AUSGABE_seq.nextval into :new.id from dual;
    else
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20004, 'FEHLER: die Person ist zum Ausgabezeitpunkt noch nicht bzw. nicht mehr auf der Mondbasis');
    end if;
end;
/



--- AUSGABE / Before-Update-Trigger (*) ---
create trigger TRG_AUSGABE_B_UPD before update
on AUSGABE for each row
begin
    --- jegliche Änderungen verbieten
    raise_application_error(-20005, 'FEHLER: ein Ressourcenausgabe-Eintrag kann nachträglich nicht geändert werden, stattdessen den Eintrag entfernen / neu anlegen');
end;
/



--- BESTELLUNG / Before-Insert-Trigger ---
create trigger TRG_BESTELLUNG_B_INS before insert
on BESTELLUNG for each row
declare
    buchung_deadline    DATE;
    
    posten_gewicht      NUMBER(9,3);
    kapazitaet_max      NUMBER(4);
    gewicht_max         NUMBER(9,3);
    kapazitaet_aktuell  NUMBER(4);
    gewicht_aktuell     NUMBER(9,3);

    lieferantid         NUMBER(38);
    angebot_vorhanden   NUMBER(1);

begin
    --- Deadline für Bestellungen der LIEFERBUCHUNG ermitteln
    --- (als Grenze gilt das Ende des Tages, bzw. 0:00 Uhr des nächsten Tages - das ergibt sich mit trunc(DATE) + 1)
    select trunc(buchung.bestell_deadline) + 1
    into buchung_deadline
    from LIEFERBUCHUNG buchung
    where buchung.id = :new.BUCHUNG_id;
    
    --- ist die Deadline schon erreicht (dazu wird SYSDATE mit genauer Uhrzeit verwendet) ?
    if (buchung_deadline <= SYSDATE) then
        --- in diesem Fall, mit Fehlermeldung abbrechen
        raise_application_error(-20006, 'FEHLER: die Deadline für Bestellung für die Lieferung ist erreicht');
    end if;
    
    --- Kapazität, Gewichtslimit, und Lieferant des gebuchten LIEFERANGEBOTS ermitteln
    select lieferung.kapazitaet_limit, lieferung.gewicht_limit, lieferung.LIEFERANT_id
    into kapazitaet_max, gewicht_max, lieferantid
    from LIEFERANGEBOT lieferung
    join LIEFERBUCHUNG buchung on buchung.ANGEBOT_id = lieferung.id
    where buchung.id = :new.BUCHUNG_id;
    
    --- Gewicht des referenzierten POSTENS (des Angebots) ermitteln
    select posten.gewicht
    into posten_gewicht
    from POSTEN posten
    where posten.id = :new.POSTEN_id;
    
    --- Gewicht und Anzahl für alle BESTELLUNGEN der Lieferung bisher ermitteln
    select sum(bestellung.anzahl), sum(bestellung.anzahl * posten.gewicht)
    into kapazitaet_aktuell, gewicht_aktuell
    from BESTELLUNG bestellung
    join POSTEN posten on posten.id = bestellung.POSTEN_id
    where bestellung.BUCHUNG_id = :new.BUCHUNG_id;
    
    --- ist diese BESTELLUNG noch im Rahmen der Kapazitäts- und Gewichtsgrenzen der Lieferung ?
    if not (
        ((kapazitaet_aktuell + :new.anzahl) <= kapazitaet_max)
        and ((gewicht_aktuell + (:new.anzahl * posten_gewicht)) <= gewicht_max)
    ) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20007, 'FEHLER: die Kapazität der Bestellung bietet für die Bestellung keinen Platz mehr');
    end if;
    
    --- gehört das bestellte Angebot (u.A. auch) zum LIEFERANTEN der angegebenen Lieferung ?
    select nvl(count(*), 0)
    into angebot_vorhanden
    from ANGEBOT angebot
    where angebot.POSTEN_id = :new.POSTEN_id
    and angebot.LIEFERANT_id = lieferantid;
    
    if (angebot_vorhanden = 0) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20008, 'FEHLER: das Produktangebot wird vom Lieferanten der Lieferung gar nicht angeboten');
    end if;
end;
/



--- AUSGABE / Before-Update-Trigger (POSTEN_id, BUCHUNG_id) ---
create trigger TRG_BESTELLUNG_B_UPD_FKS before update
of POSTEN_id, BUCHUNG_id
on BESTELLUNG for each row
begin
    --- jegliche Änderungen am Fremdschlüssel (bzw. auch Primärschlüssel) verbieten
    raise_application_error(-20010, 'FEHLER: die Lieferung oder das Produktangebot eines Bestellung kann nachträglich nicht geändert werden, stattdessen den Eintrag entfernen / neu anlegen');
end;
/



--- BEWERBUNG / Before-Insert-Trigger ---
create trigger TRG_BEWERBUNG_B_INS before insert
on BEWERBUNG for each row
declare
    datum_start          DATE;
    vergabeid            NUMBER(38);
    
    person_anreise       DATE;
    person_abreise       DATE;
    anforderung_erfuellt NUMBER(38);
    
begin

    --- ersten Arbeitstag des JOBS ermitteln
    --- (für unbefristet Jobs - dh. ohne Arbeitszeiten - wird der morgige Tag als ersten Arbeitstag genommen)
    select nvl(min(zeit.datum), SYSDATE + 1)
    into datum_start
    from ARBEITSZEIT zeit
    where zeit.JOB_id = :new.JOB_id;

    --- 'VERGABE_id' des referenzierten JOBS ermitteln
    select job.VERGABE_id
    into vergabeid
    from JOB job
    where job.id = :new.JOB_id;

    --- liegt das Bewerbungsdatum vor dem Start des JOBS, oder ist der JOB noch gar nicht vermittelt ?
    --- (der Bewerbungszeitraum endet mit Arbeistbeginn, Jobs können jedoch gekündigt werden,
    --- dann ist 'VERGABE_id' null und die Bewerbung wieder möglich)
    if not ((vergabeid is null) or (:new.datum < datum_start)) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20011, 'FEHLER: der Job ist bereits vergeben, keine Bewerbungen mehr möglich');
    end if;

    --- An- und Abreisdatum der referenzierten PERSON ermitteln
    select person.anreise_datum, person.abreise_datum
    into person_anreise, person_abreise
    from PERSON person
    where person.id = :new.PERSON_id;

    --- liegt das Bewerbungsdatum im Bereich des Aufenthalts der PERSON ?
    if not ((person_anreise < :new.datum) and ((person_abreise is null) or (:new.datum < person_abreise))) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20012, 'FEHLER: der Aufenthaltszeitraum der Person passt nicht zum Eingangsdatum der Bewerbung');
    end if;
    
    --- für jede Anforderung des referenzierten JOBS sicherstellen,
    --- dass die PERSON die entsprechende QUALIFIKATION aufweist
    for anforderung in (select * from JOBQUALIFIKATION where JOB_id = :new.JOB_id) loop
        --- QUALIFIKATION dieser Anforderung in NACHWEISEN der PERSON suchen
        select nvl(count(qualinachweis.QUALI_bezeichnung), 0)
        into anforderung_erfuellt
        from QUALIFIKATIONSNACHWEIS qualinachweis
        join NACHWEIS nachweis on nachweis.id = qualinachweis.NACHWEIS_id
        where nachweis.PERSON_id = :new.PERSON_id
        and qualinachweis.QUALI_bezeichnung = anforderung.QUALI_bezeichnung;
        
        --- war die Suche erfolgreich ?
        if (anforderung_erfuellt != 1) then
            --- ansonten, mit Fehlermeldung abbrechen
            raise_application_error(-20013, 'FEHLER: die Anforderungen des Jobs werden durch die Person nicht vollständig erfüllt, Bewerbung nicht möglich');
        end if;
    end loop;

    --- BEWERBUNG verwendet BEWERBUNG_seq als Sequenzgenerator
    select BEWERBUNG_seq.nextval into :new.id from dual;
end;
/



--- BEWERBUNG / Before-Update-Trigger (datum, JOB_id, PERSON_id) ---
create trigger TRG_BEWERBUNG_DATUM_FKS before update
of datum, JOB_id, PERSON_id
on BEWERBUNG for each row
begin
    --- jegliche Änderungen der Fremdschlüssel bzw. des Datums verbieten
    raise_application_error(-20014, 'FEHLER: das Datum, der Job oder die Person können nachträglich nicht geändert werden, stattdessen den Eintrag entfernen / neu anlegen');
end;
/



--- GEBAEUDE / Before-Update-Trigger (standort_x, standort_y) ---
create trigger TRG_GEBAEUDE_B_UPD_PK before update
of standort_x, standort_y
on GEBAEUDE for each row
begin
    --- jegliche Änderung des Standorts verbieten
    raise_application_error(-20015, 'FEHLER: Standorte von Gebäuden können nicht geändert werden');
end;
/



--- GEBAEUDE / Before-Update-Trigger (stockwerke) ---
create trigger TRG_GEBAEUDE_B_UPD_STOCKWERKE before update
of stockwerke
on GEBAEUDE for each row
declare
    stock_max           NUMBER(38);
    stock_min           NUMBER(38);
    
begin
    --- werden Stockwerke abgerissen (oder nur zusätzliche gebaut) ?
    --- für zusätzliche Stockwerke ist die Änderung problemlos möglich
    if (:new.stockwerke < :old.stockwerke) then
        --- Minimum und Maximum von 'stockwerk' für alle RAEUME dieses GEBAEUDES ermitteln
        select min(raum.stockwerk), max(raum.stockwerk)
        into stock_min, stock_max
        from RAUM raum
        where (raum.GEBAEUDE_standort_x = :new.standort_x) and (raum.GEBAEUDE_standort_y = :new.standort_y);

        --- passt die geänderte Anzzahl Stockwerke zu den RAEUMEN des GEBAEUDES ?
        if ((stock_max - stock_min + 1) > (:new.stockwerke)) then
            --- ansonten, mit Fehlerausgabe abbrechen
            raise_application_error(-20016, 'FEHLER: Die Stockwerke können hier nicht verringert werden, bitte erst entsprechende Räume entfernen');
        end if;
    end if;
end;
/



--- GERAET / Before-Insert-Trigger ---
create trigger TRG_GERAET_B_INS before insert
on GERAET for each row
begin
    -- GERAET verwendet PRODUKT_seq als Sequenzgenerator
    select PRODUKT_seq.nextval into :new.id from dual;
end;
/



--- JOB / Before-Insert-Trigger ---
create trigger TRG_JOB_B_INS before insert
on JOB for each row
begin
    --- jeder JOBVERGABE muss eine BEWERBUNG vorausgehen, diese ist jedoch ohne refernzierten JOB nicht möglich
    --- dh. zu Beginn kann ein Job nicht vergeben sein -> die Referenz 'VERGABE_id' muss also NULL sein
    if (:new.VERGABE_id is not null) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20017, 'FEHLER: ein Job kann nicht bereits zu Beginn vergeben sein - erst den Job erstellen, dann bewerben, danach vergeben');
    else
        --- JOB verwendet JOB_seq als Sequenzgenerator
        select JOB_seq.nextval into :new.id from dual;
    end if;
end;
/



--- GERAET / Before-Update-Trigger (VERGABE_id) ---
create trigger TRG_JOB_B_UPD_VERGABE before update
of VERGABE_id
on JOB for each row
declare
    bewerbung_vorhanden NUMBER(1);

begin
    --- wurde der JOB tatsächlich vergeben, oder nur gekündigt (dh. 'VERGABE_id' = NULL) ?
    if (:new.VERGABE_id is not null) then
        --- falls ja: BEWERBUNG für diesen JOB der entsprechenden PERSON suchen
        select nvl(count(bewerbung.id), 0)
        into bewerbung_vorhanden
        from BEWERBUNG bewerbung
        join JOBVERGABE vergabe on vergabe.PERSON_id = bewerbung.PERSON_id
        where vergabe.id = :new.VERGABE_id
        and bewerbung.JOB_id = :new.id;

        --- liegt von der PERSON eine solche BEWERBUNG vor ?
        if not (bewerbung_vorhanden != 0) then
            --- ansonten, mit Fehlermeldung abbrechen
            raise_application_error(-20018, 'FEHLER: für die Person liegt gar keine Bewerbung vor, möglich sind nur Jobvergaben an Bewerber');
        end if;
    end if;
end;
/



--- JOB / Before-Update-Trigger (GRUPPE_id) ---
create trigger TRG_JOB_B_UPD_MISSIONSGRUPPE before update
of GRUPPE_id
on JOB for each row
begin
    --- jegliche Änderungen des Fremdschlüssels verbieten
    raise_application_error(-20019, 'FEHLER: ein Job kann nicht von einer Mission auf eine andere übertagen werden');
end;
/



--- JOBGERAET / Before-Update-Trigger (*) ---
create trigger TRG_JOBGERAET_B_UPD before update
on JOBGERAET for each row
begin
    --- jegliche Änderungen am Fremdschlüssel (bzw. auch Primärschlüssel) verbieten
    raise_application_error(-20020, 'FEHLER: der Job oder das Produkt einer Produkt-Anforderung eines Jobs kann nachträglich nicht geändert werden, stattdessen den Eintrag entfernen / neu anlegen');
end;
/



--- JOBQUALIFIKATION / Before-Update-Trigger (*) ---
create trigger TRG_JOBQUALIFIKATION_B_UPD before update
on JOBQUALIFIKATION for each row
begin
    --- jegliche Änderungen am Fremdschlüssel (bzw. auch Primärschlüssel) verbieten
    raise_application_error(-20021, 'FEHLER: der Job oder die Qualifikation einer Jobanforderung kann nachträglich nicht geändert werden, stattdessen den Eintrag entfernen / neu anlegen');
end;
/



--- JOBRESSOURCE / Before-Update-Trigger (*) ---
create trigger TRG_JOBRESSOURCE_B_UPD before update
on JOBRESSOURCE for each row
begin
    --- jegliche Änderungen am Fremdschlüssel (bzw. auch Primärschlüssel) verbieten
    raise_application_error(-20022, 'FEHLER: der Job oder das Produkt einer Produkt-Anforderung eines Jobs kann nachträglich nicht geändert werden, stattdessen den Eintrag entfernen / neu anlegen');
end;
/



--- JOBVERGABE / Before-Insert-Trigger ---
create trigger TRG_JOBVERGABE_B_INS before insert
on JOBVERGABE for each row
declare
    person_anreise DATE;
    person_abreise DATE;

begin
    --- An- und Abreisdatum der referenzierten PERSON ermitteln
    select person.anreise_datum, person.abreise_datum
    into person_anreise, person_abreise
    from PERSON person
    where person.id = :new.PERSON_id;

    --- liegt das Vergabedatum im Zeitraum des Aufenthalts der PERSON ?
    if ((person_anreise < :new.datum) and ((person_abreise is null) or (:new.datum < person_abreise))) then
        --- JOBVERGABE verwendet JOBVERGABE_seq als Sequenzgenerator
        select JOBVERGABE_seq.nextval into :new.id from dual;
    else
        raise_application_error(-20023, 'FEHLER: das Vergabedatum passt nicht zum Aufenthaltszeitraum der Person');
    end if;
end;
/



--- JOBVERGABE / Before-Update-Trigger (datum, PERSON_id) ---
create trigger TRG_JOBVERGABE_B_UPD_DATUM_FK before update
of datum, PERSON_id
on JOBVERGABE for each row
begin
    --- jegliche Änderungen der Fremdschlüssel bzw. des Datums verbieten
    raise_application_error(-20024, 'FEHLER: das Datum und die Person eines Jobvergabe-Eintrags kann nachträglich nicht geändert werden, stattdessen den Eintrag entfernen / neu anlegen');
end;
/



--- LAGER / Before-Update-Trigger (kapazitaet_limit) ---
create trigger TRG_LAGER_B_UPD_KAPAZITAET before update
of kapazitaet_limit
on LAGER for each row
declare
    anzahl_belegt NUMBER(38);

begin
    --- wird das LAGER verkleinert (oder nur erweitert) ?
    --- eine Erweiterung des LAGERS ist problemlos möglich
    if (:new.kapazitaet_limit < :old.kapazitaet_limit) then
        --- Anzahl belegter LAGERPOSITIONEN dieses LAGERS ermitteln
        select nvl(count(position.id), 0)
        into anzahl_belegt
        from LAGERPOSITION position
        where (position.LAGER_bezeichnung = :new.bezeichnung) and (position.POSTEN_id is not null);
        
        --- passt die aktuelle Belegung in das verkleinerte LAGER ?
        if (:new.kapazitaet_limit < anzahl_belegt) then
            --- ansonten mit Fehlermeldung abbrechen
            raise_application_error(-20025, 'FEHLER: Im Lager sind zu viele Waren für eine Verkleinerung, zuerst Waren auslagern.');
        end if;
    end if;
end;
/



--- LAGER / Before-Update-Trigger (datum_aufloesung) ---
create trigger TRG_LAGER_AUFLOESUNG before update
of datum_aufloesung
on LAGER for each row
declare
    posten_anzahl       NUMBER(38);
    transporte_anzahl   NUMBER(38);

begin
    --- wird das Auflösungsdatum neu gesetzt, oder entfernt ('datum_aufloesung' = NULL) ?
    if (:new.datum_aufloesung is not null) then
        --- falls ja (neues Auflösungsdatum gesetzt, nicht entfernt):
        --- wurde die Auflösung schon umgesetzt / ist aktuell, oder ist die Auflösung erst geplant ?
        if (trunc(:new.datum_aufloesung) <= trunc(SYSDATE)) then
            --- falls bereits umgesetztt:
            --- Anzahl der Posten in diesem LAGER ermitteln
            select nvl(count(position.POSTEN_id), 0)
            into posten_anzahl
            from LAGERPOSITION position
            where position.LAGER_bezeichnung = :new.bezeichnung
            and position.POSTEN_id is not null;
    
            --- ist das LAGER leer, oder gibt es noch POSTEN im LAGER ?
            if (posten_anzahl != 0) then
                --- ansonsten, mit Fehlermeldung abbrechen
                raise_application_error(-20026, 'FEHLER: Lager ist nicht leer, Auflösungen eines Lagers können nur für leere Lager vermerkt werden');
            end if;
        end if;
    
        --- Anzahl der Transporte mit diesem LAGER als Ziel- oder Start,
        --- die für Termine nach der Auflösung des LAGERS angesetzt sind, ermitteln
        select nvl(count(transport.id), 0)
        into transporte_anzahl
        from LAGERTRANSPORT transport
        where (
            (transport.START_bezeichnung = :new.bezeichnung)
            or (transport.ZIEL_bezeichnung = :new.bezeichnung)
        ) and (
            (trunc(:new.datum_aufloesung) < trunc(transport.termin))
        );

        --- gibt es dahingehende Konflikte, oder wurden keine LAGERTRANSPORTE gefunden ?
        if (transporte_anzahl != 0) then
            --- ansonten, mit Fehlermeldung abbrechen
            raise_application_error(-20027, 'FEHLER: für das Lager sind noch Warentransporte nach dem angegebenen Auflösungsdatum geplant');
        end if;
    end if;
end;
/



--- LAGERPOSITION / Before-Insert-Trigger ---
create trigger TRG_LAGPOS_B_INS before insert
on LAGERPOSITION for each row
declare
    pos_anzahl          NUMBER(38);
    pos_limit           NUMBER(38);
    posten_in_bestand   NUMBER(1);
    
begin
    --- Anzahl LAGERPOSITIONEN zu diesem LAGER ermitteln
    select nvl(count(position.id), 0)
    into pos_anzahl
    from LAGERPOSITION position
    where position.LAGER_bezeichnung = :new.LAGER_bezeichnung;
    
    --- Limit für dieses LAGER ermitteln
    select lager.kapazitaet_limit
    into pos_limit
    from LAGER lager
    where lager.bezeichnung = :new.LAGER_bezeichnung;
    
    --- ist das Limit bereits erreicht ?
    if (pos_anzahl = pos_limit) then
        --- in diesem, mit Fehlerausgabe abbrechen
	    raise_application_error(-20028, 'FEHLER: Kapazität dieses Lagers ist erreicht, alle Lagerpositionen sind bereits vermerkt');
    end if;

    --- gibt es bereits eine Belegung mit einem POSTEN ?
    if (:new.POSTEN_id is not null) then
        --- der verlinkte POSTEN muss ein tatsächlicher Lagerposten sein
        --- dh. POSTEN muss "LAGER_BESTAND" zum 'typ' haben
        select nvl(count(posten.id), 0)
        into posten_in_bestand
        from POSTEN posten
        where (posten.id = :new.POSTEN_id)
        and (rtrim(posten.typ) = 'LAGER_BESTAND');
    
        --- wurde der POSTEN gefunden (im Lagerbestand) ?
        if (posten_in_bestand != 1) then
            --- ansonten, mit Fehlermeldung abbrechen
            raise_application_error(-20029, 'FEHLER: der vermerkte Posten ist kein Lagerposten, sondern Produkt-Angebot oder Altbestand');
        end if;
    end if;

    -- LAGERPOSITION verwendet LAGERPOSITION_seq als Sequenzgenerator
    select LAGERPOSITION_seq.nextval into :new.id from dual;
 end;
/



--- LAGERPOSITION / Before-Update-Trigger (POSTEN_id) ---
create trigger TRG_LAGPOS_B_UPD_POSTEN before update
of POSTEN_id
on LAGERPOSITION for each row
declare
    posten_in_bestand   NUMBER(1);
    
begin
    --- gibt es überhaupt eine Belegung, oder ist 'POSTEN_id' = NULL ?
    if (:new.POSTEN_id is not null) then
        --- der verlinkte POSTEN muss ein tatsächlicher Lagerposten sein
        --- dh. POSTEN muss "LAGER_BESTAND" zum 'typ' haben
        select nvl(count(posten.id), 0)
        into posten_in_bestand
        from POSTEN posten
        where (posten.id = :new.POSTEN_id)
        and (rtrim(posten.typ) = 'LAGER_BESTAND');
      
        --- wurde der POSTEN gefunden (im Lagerbestand) ?
        if (posten_in_bestand != 1) then
            --- ansonten, mit Fehlermeldung abbrechen
            raise_application_error(-20030, 'FEHLER: der vermerkte Posten ist kein Lagerposten, sondern Produkt-Angebot oder Altbestand');
        end if;
    end if;
end;
/



--- LAGERPOSITION / Before-Update-Trigger (LAGER_bezeichnung) ---
create trigger TRG_LAGPOS_B_UPD_LAGER before update
of LAGER_bezeichnung
on LAGERPOSITION for each row
begin
    --- jegliche Änderungen am LAGER-Fremdschlüssel verbieten
    raise_application_error(-20031, 'FEHLER: eine Position kann nicht von einem Lager in ein anderes verschoben werden');
end;
/



--- LAGERTRANSPORT / Before-Insert-Trigger ---
create trigger TRG_LAGTRANS_B_INS before insert
on LAGERTRANSPORT for each row
declare
    start_erstellung    DATE;
    start_aufloesung    DATE;
    
    ziel_erstellung     DATE;
    ziel_aufloesung     DATE;

begin
    --- ist der LAGERTRANSPORTS später als die Erstellung der entsprechenden LAGERS
    --- und jeweils vor einer ggf. vorhandenen Auflösung des LAGERS ?
    select lager.datum_erstellung, lager.datum_aufloesung
    into start_erstellung, start_aufloesung
    from LAGER lager
    where lager.bezeichnung = :new.START_bezeichnung;
    
    if ((:new.termin < start_erstellung) or ((start_aufloesung is not null) and (start_aufloesung < :new.termin))) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20032, 'FEHLER: der Termin des Warentransports passt nicht zu dem aktiven Zeitraum des Ausgangslagers');
    end if;
    
    select lager.datum_erstellung, lager.datum_aufloesung
    into ziel_erstellung, ziel_aufloesung
    from LAGER lager
    where lager.bezeichnung = :new.ZIEL_bezeichnung;
    
    if ((:new.termin < ziel_erstellung) or ((ziel_aufloesung is not null) and (ziel_aufloesung < :new.termin))) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20033, 'FEHLER: der Termin des Warentransports passt nicht zu dem aktiven Zeitraum des Ziellagers');
    else
        --- LLAGERTRANSPORT verwendet LAGERPOSITION_seq als Sequenzgenerator
        select LAGERTRANSPORT_seq.nextval into :new.id from dual;
    end if;
end;
/



--- LAGERTRANSPORT / Before-Update-Trigger (termin, uhrzeit) ---
create trigger TRG_LAGTRANS_B_UPD_TERMIN before update
of termin, uhrzeit
on LAGERTRANSPORT for each row
declare
    start_erstellung    DATE;
    start_aufloesung    DATE;
    ziel_erstellung     DATE;
    ziel_aufloesung     DATE;

begin
    --- die Uhrzeit kann am angesetzten Tag des Transports nicht mehr geändert werden
    if ((:new.uhrzeit is not null) and (:new.uhrzeit != :old.uhrzeit) and (trunc(SYSDATE) = trunc(:new.termin))) then
        --- bei einer solchen Änderung, mit Fehlermeldung abbrechen
        raise_application_error(-20034, 'FEHLER: die Uhrzeit des Warentransports kann am Ereignistag nicht mehr geänderten werden');
    end if;

    --- ebenso darf ein geplanter Transport nicht zu einem bereits umgesetzten werden oder andersrum
    --- SYSDATE darf also nicht zwischen dem alten und neuen Termin liegen
    if (trunc(SYSDATE) between trunc(:old.termin) and trunc(:new.termin)) then
        --- bei einer solchen Änderung, mit Fehlermeldung abbrechen
        raise_application_error(-20035, 'FEHLER: ein geplanter Transport darf nicht in die Vergangenheit, ein vergangener Transport nicht in die Zukunft gelegt werden');
    end if;
    
    --- ist der neue Termin später als die Erstellung der entsprechenden LAGER
    --- und jeweils vor einer ggf. vorhandenen Auflösung des LAGERS ?
    select lager.datum_erstellung, lager.datum_aufloesung
    into start_erstellung, start_aufloesung
    from LAGER lager
    where lager.bezeichnung = :old.START_bezeichnung;
    
    if ((:new.termin < start_erstellung) or ((start_aufloesung is not null) and (start_aufloesung < :new.termin))) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20036, 'FEHLER: der Termin des Warentransports passt nicht zu dem aktiven Zeitraum des Ausgangslagers');
    end if;
    
    select lager.datum_erstellung, lager.datum_aufloesung
    into ziel_erstellung, ziel_aufloesung
    from LAGER lager
    where lager.bezeichnung = :old.ZIEL_bezeichnung;
    
    if ((:new.termin < ziel_erstellung) or ((ziel_aufloesung is not null) and (ziel_aufloesung < :new.termin))) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20037, 'FEHLER: der Termin des Warentransports passt nicht zu dem aktiven Zeitraum des Ziellagers');
    end if;
end;
/



--- LAGERTRANSPORT / Before-Update-Trigger (START_bezeichnung, ZIEL_bezeichnung) ---
create trigger TRG_LAGTRANS_B_UPD_LAGER before update
of START_bezeichnung, ZIEL_bezeichnung
on LAGERTRANSPORT for each row
begin
    --- wurde das Ausgangs- oder Ziellager tatsächlich geändert ?
    if ((:new.START_bezeichnung != :old.START_bezeichnung) or (:new.ZIEL_bezeichnung != :old.ZIEL_bezeichnung)) then
        --- in diesem Fall, mit Fehlermeldung abbrechen
        raise_application_error(-20038, 'FEHER: Start- und Ziel eines Warentransports können nachträglich nicht mehr geändert werden, stattdessen diesen Transport entfernen und neu erstellen'); 
    end if;
end;
/



--- LIEFERANGEBOT / Before-Update-Trigger (LIEFERANT_id) ---
create trigger TRG_LIEFANGEBOT_B_UPD_LIEFRNT before update
of LIEFERANT_id
on LIEFERANGEBOT for each row
begin
    --- jegliche Änderungen des Fremdschlüssels verbieten
    raise_application_error(-20039, 'FEHLER: ein Angebot einer Lieferung kann nicht von einem Lieferanten auf einen anderen übertragen werden');
end;
/



--- LIEFERANGEBOT / Before-Insert-Trigger ---
create trigger TRG_LIEFERANGEBOT_B_INS before insert
on LIEFERANGEBOT for each row
begin
    --- LIEFERANGEBOT verwendet LIEFERANGEBOT_seq als Sequenzgenerator
    select LIEFERANGEBOT_seq.nextval into :new.id from dual;
end;
/



--- LIEFERANT / Before-Insert-Trigger ---
create trigger TRG_LIEFERANT_B_INS before insert
on LIEFERANT for each row
begin
    --- LIEFERANT verwendet LIEFERANT_seq als Sequenzgenerator
    select LIEFERANT_seq.nextval into :new.id from dual;
end;
/



--- LIEFERBUCHUNG / Before-Insert-Trigger ---
create trigger TRG_LIEFBUCH_B_INS before insert
on LIEFERBUCHUNG for each row
declare
    lieferung_buchung_deadline  DATE;
    lieferung_liefertermin      DATE;
    
    ziellager_start             DATE;
    ziellager_ende              DATE;

begin
    --- Erstell- und Auflösungsdatum des referenzierten Ziel-LAGERS ermitteln
    select lager.datum_erstellung, lager.datum_aufloesung
    into ziellager_start, ziellager_ende
    from LAGER lager
    where lager.bezeichnung = :new.LAGER_bezeichnung;

    --- Deadline für die Buchung und Liefertermin des referenzierten LIEFERANGEBOTS ermitteln
    select lieferung.buchung_deadline, lieferung.liefertermin
    into lieferung_buchung_deadline, lieferung_liefertermin
    from LIEFERANGEBOT lieferung
    where lieferung.id = :new.ANGEBOT_id;

    --- liegt der Liefertermin innerhalb des aktiven Zeitraums des LAGERS ?
    if not (
        (trunc(ziellager_start) <= trunc(lieferung_liefertermin))
        and ((ziellager_ende is null) or (trunc(lieferung_liefertermin) <= trunc(ziellager_ende)))
    ) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20040, 'FEHLER: das Lager zur Unterbringung der Bestellungen ist zum geplanten Liefertermin noch nicht / nicht mehr aktiv');
    end if;

    --- wurde die Deadline für diese LIEFERBUCHUNG eingehalten (es zählt das Ende des Tages) ?
    --- (dh. Obergrenze ist der Beginn des nächsten Tags, dies erhält man mit 'trunc(DATE) + 1')
    if not (SYSDATE <= trunc(lieferung_buchung_deadline) + 1) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20041, 'FEHLER: die Deadline für die Buchung dieser Lieferung wurde bereits überschritten');
    end if;
    
    --- ist die neue Deadline (für Bestellungen) später als die alte Deadline (zur Buchung) ?
    --- (betrachtet werden jeweils nur die Datumsangaben, nicht die genaue Uhrzeit, dh. die neue Deadline muss zumindest 24h später sein)
    if (trunc(lieferung_buchung_deadline) < trunc(:new.bestell_deadline)) then
        --- LIEFERBUCHUNG verwendet LIEFERBUCHUNG_seq als Sequenzgenerator
        select LIEFERBUCHUNG_seq.nextval into :new.id from dual;
    else
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20042, 'FEHLER: die neue Deadline (für Bestellungen) kann nicht früher als die alte Deadline (für Buchungen) sein');
    end if;
end;
/



--- LIEFERBUCHUNG / Before-Update-Trigger (ANGEBOT_id) ---
create trigger TRG_LIEFBUCH_B_UPD_LIEFANGEBOT before update
of ANGEBOT_id
on LIEFERBUCHUNG for each row
begin
    --- jegliche Änderungen des Fremdschlüssels verbieten
    raise_application_error(-20043, 'FEHLER: eine Buchung kann nicht von einer Lieferung auf eine andere übertragen werden');
end;
/



--- LIEFERBUCHUNG / Before-Update-Trigger (bestell_deadline) ---
create trigger TRG_LIEFBUCH_B_UPD_DEADLINE before update
of bestell_deadline
on LIEFERBUCHUNG for each row
declare
    lieferung_liefertermin DATE;

begin
    --- Liefertermin der referenzierten Lieferung ermitteln
    select lieferung.liefertermin
    into lieferung_liefertermin
    from LIEFERANGEBOT lieferung
    where lieferung.id = :new.ANGEBOT_id;
    
    --- liegt die neue Bestelldeadline in der Zukunft (nicht in der Vergangenheit)
    --- und vor dem Liefertermin der entsprechenden Lieferung
    if not ((SYSDATE < :new.bestell_deadline) and (:new.bestell_deadline < lieferung_liefertermin)) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20044, 'FEHLER: Die Bestell-Deadline muss früher als der Liefertermin, jedoch immernoch in der Zukunft sein');
    end if;
end;
/



--- LIEFERBUCHUNG / Before-Update-Trigger (LAGER_bezeichnung) ---
create trigger TRG_LIEFBUCH_B_UPD_LAGER before update
of LAGER_bezeichnung
on LIEFERBUCHUNG for each row
declare
    lieferung_liefertermin  DATE;
    
    ziellager_start         DATE;
    ziellager_ende          DATE;
    
begin
    --- Liefertermin der referenzierten Lieferung ermitteln
    select lieferung.liefertermin
    into lieferung_liefertermin
    from LIEFERANGEBOT lieferung
    where lieferung.id = :new.ANGEBOT_id;
    
    --- ist der Liefertermin bereits alt, oder die Lieferung noch nicht eingetroffen ?
    --- (es gilt hier als Obergrenze der Beginn des Tages, zu dem die Lieferung eintrifft)
    if not (SYSDATE < trunc(lieferung_liefertermin)) then
        --- in diesem Fall, mit Fehlermeldung abbrechen
        raise_application_error(-20045, 'FEHLER: Das Lager für die Aufnahme der Waren kann nach der Lieferung nicht mehr geändert werden');
    end if;
    
    -- ansonten (für geplante Lieferungen):
    --- Erstell- und Auflösungsdatum des referenzierten Ziel-LAGERS ermitteln
    select lager.datum_erstellung, lager.datum_aufloesung
    into ziellager_start, ziellager_ende
    from LAGER lager
    where lager.bezeichnung = :new.LAGER_bezeichnung;

    --- liegt der Liefertermin innerhalb des aktiven Zeitraums des LAGERS ?
    if not (
        (trunc(ziellager_start) <= trunc(lieferung_liefertermin))
        and ((ziellager_ende is null) or (trunc(lieferung_liefertermin) <= trunc(ziellager_ende)))
    ) then
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20046, 'FEHLER: das Lager zur Unterbringung der Bestellungen ist zum geplanten Liefertermin noch nicht / nicht mehr aktiv');
    end if;
end;
/



--- MAENGEL / Before-Insert-Trigger ---
create trigger TRG_MAENGEL_B_INS before insert
on MAENGEL for each row
declare
    geraetid_posten NUMBER(38);
    
begin
    --- 'GERAET_id' des referenzierten POSTEN ermitteln
    select posten.GERAET_id
    into geraetid_posten
    from POSTEN posten
    where posten.id = :new.POSTEN_id;

    --- ist der verlinkte POSTEN ein Geräteposten ('GERAET_id' ist NOT NULL) ?
    if (geraetid_posten is not null) then
        -- MAENGEL verwendet MAENGEL_seq als Sequenzgenerator
        select MAENGEL_seq.nextval into :new.id from dual;
    else    
        --- ansonten, mit Fehlerausgabe abbrechen
	    raise_application_error(-20047, 'FEHLER: Mängel sind nur für Geräteposten zu vermerken');
    end if;
end;
/



--- MAENGEL / Before-Update-Trigger (POSTEN_id) ---
create trigger TRG_MAENGEL_B_UPD_POSTEN before update
of POSTEN_id
on MAENGEL for each row
begin
    --- jegliche Änderungen verbieten
    raise_application_error(-20048, 'FEHLER: ein Mängel-Eintrag kann nicht von einem Gerät auf ein anderes übertragen werden');
end;
/



--- MISSION / Before-Insert-Trigger ---
create trigger TRG_MISSION_B_INS before insert
on MISSION for each row
begin
    --- MISSION verwendet MISSION_seq als Sequenzgenerator
    select MISSION_seq.nextval into :new.id from dual;
end;
/



--- MISSIONSGRUPPE / Before-Update-Trigger (MISSION_id) ---
create trigger TRG_MISSGRUPPE_B_UPD_MISSION before update
of MISSION_id
on MISSIONSGRUPPE for each row
begin
    --- jegliche Änderungen des Fremdschlüssels verbieten
    raise_application_error(-20049, 'FEHLER: ein Missionsgruppe kann nicht von einer Mission auf ein andere übertragen werden');
end;
/



--- MISSIONSGRUPPE / Before-Insert-Trigger ---
create trigger TRG_MISSIONSGRUPPE_B_INS before insert
on MISSIONSGRUPPE for each row
declare
    lager_start     DATE;
    lager_ende      DATE;

    mission_start   DATE;
    mission_ende    DATE;

begin
    --- Erstell- und Auflösungsdatum des referenzierten LAGERS ermitteln
    select lager.datum_erstellung, lager.datum_aufloesung
    into lager_start, lager_ende
    from LAGER lager
    where lager.bezeichnung = :new.LAGER_bezeichnung;

    --- Zeitraum der zugehörigen MISSION ermitteln
    select mission.startdatum, mission.enddatum
    into mission_start, mission_ende
    from MISSION mission
    where mission.id = :new.MISSION_id;

    --- liegt der Missionszeitraum der zugehörigen MISSION innerhalb des aktiven Zeitraums des LAGERS ?
    if (
        (trunc(lager_start) <= trunc(mission_start))
        and ((lager_ende is null) or (trunc(mission_start) <= trunc(lager_ende)))
        and ((mission_ende is null) or (lager_ende is null) or (trunc(mission_ende) <= trunc(lager_ende)))
    ) then
        --- MISSIONSGRUPPE verwendet MISSIONSGRUPPE_seq als Sequenzgenerator
        select MISSIONSGRUPPE_seq.nextval into :new.id from dual;
    else
        --- ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20050, 'FEHLER: der aktive Zeitraum des Lagers passt nicht zum Missionszeitraum');
    end if;
end;
/



--- NACHWEIS / Before-Insert-Trigger ---
create trigger TRG_NACHWEIS_B_INS before insert
on NACHWEIS for each row
declare
    person_geburtsdatum   DATE;
    
begin
    --- Geburtsdatum der verlinkten PERSON ermitteln
    select person.geburtsdatum
    into person_geburtsdatum
    from PERSON person
    where person.ID = :new.PERSON_id;

    --- ist das Austellungsdatum des neuen NACHWEISES später als 'geburtsdatum' der PERSON
    if (person_geburtsdatum < :new.datum) then
        -- NACHWEIS verwendet NACHWEIS_seq als Sequenzgenerator
        select NACHWEIS_seq.nextval into :new.id from dual;
    else    
        --- ansonten, mit Fehlerausgabe abbrechen
	    raise_application_error(-20051, 'FEHLER: ein Nachweise kann nicht vor dem Geburtsdatum der Person ausgestellt worden sein');
    end if;
end;
/



--- NACHWEIS / Before-Update-Trigger (PERSON_id) ---
create trigger TRG_NACHWEIS_B_UPD_PERSON before update
of PERSON_id
on NACHWEIS for each row
begin
    --- wurde die referenzierte Person tatsächlich geändert ?
    if (:new.PERSON_id != :old.PERSON_id) then
       raise_application_error(-20052, 'FEHLER: ein Nachweis kann nicht von einer Person auf eine andere verschoben werden');
    end if;
end;
/



--- PERSON / Before-Insert-Trigger ---
create trigger TRG_PERSON_B_INS before insert
on PERSON for each row
begin
    --- PERSON verwendet PERSON_seq als Sequenzgenerator
    select PERSON_seq.nextval into :new.id from dual;
end;
/



--- PERSON / Before-Update-Trigger (anreise_datum) ---
create trigger TRG_PERSON_B_UPD_ANREISE before update
of anreise_datum
on PERSON for each row
declare
    alter_eintrag_vorhanden NUMBER(38);
    
begin
    --- ist der alte  Hinflug (dh. 'richtung' = 0) noch eingetragen ?
    select nvl(count(persbef.id), 0)
    into alter_eintrag_vorhanden
    from PERSONENBEFOERDERUNG persbef
    join LIEFERBUCHUNG buchung on buchung.id = persbef.BUCHUNG_id
    join LIEFERANGEBOT lieferung on lieferung.id = buchung.ANGEBOT_id 
    where persbef.richtung = 0
    and trunc(lieferung.liefertermin) = trunc(:old.anreise_datum);

    if (alter_eintrag_vorhanden != 0) then
        --- in diesem Fall, mit Fehlermeldung abbrechen
        raise_application_error(-20053, 'FEHLER: das Hinflugticket des alten Termins ist noch gebucht, zuerst das Ticket stornieren und neu buchen');
    end if;
end;
/



--- PERSON / Before-Update-Trigger (abreise_datum) ---
create trigger TRG_PERSON_B_UPD_ABREISE before update
of abreise_datum
on PERSON for each row
declare
    alter_eintrag_vorhanden NUMBER(38);
    
begin
    --- ist der alte  Rückflug (dh. 'richtung' = 1) noch eingetragen ?
    select nvl(count(persbef.id), 0)
    into alter_eintrag_vorhanden
    from PERSONENBEFOERDERUNG persbef
    join LIEFERBUCHUNG buchung on buchung.id = persbef.BUCHUNG_id
    join LIEFERANGEBOT lieferung on lieferung.id = buchung.ANGEBOT_id 
    where persbef.richtung = 1
    and trunc(lieferung.liefertermin) = trunc(:old.abreise_datum);

    if (alter_eintrag_vorhanden != 0) then
        --- in diesem Fall, mit Fehlermeldung abbrechen
        raise_application_error(-20054, 'FEHLER: das Rückflugticket des alten Termins ist noch gebucht, zuerst das Ticket stornieren und neu buchen');
    end if;
end;
/

--- PERSONENBEFOERDERUNG / Before-Insert-Trigger ---
create trigger TRG_PERSBEF_B_INS before insert
on PERSONENBEFOERDERUNG for each row
declare
    transport_vorhanden         NUMBER(1);
    flugbuchung_deadline        DATE;
    flug_liefertermin           DATE;

    person_anreise_datum        DATE;
    person_abreise_datum        DATE;

    personen_gewicht_aktuell    NUMBER(9,3);
    fracht_gewicht_aktuell      NUMBER(9,3);
    new_person_gewicht          NUMBER(9,3);
    gewicht_max                 NUMBER(9,3);
    
    personen_anzahl_aktuell     NUMBER(4);
    personen_anzahl_max         NUMBER(4);

begin
    --- gibt es bereits eine PERSONENBEFOERDERUNGEN für diese Person in gleicher Richuntg ?
    select nvl(count(persbef.id), 0)
    into transport_vorhanden
    from PERSONENBEFOERDERUNG persbef
    where persbef.PERSON_id = :new.PERSON_id
    and persbef.richtung = :new.richtung;
    
    if (transport_vorhanden != 0) then
        --- in diesem Fall, mit Fehlermeldung abbrechen
        raise_application_error(-20055, 'FEHLER: diese Strecke ist für diese Person bereits gebucht, eine Person kann nur einen Hin- und einen Rückflug haben');
    end if;

    --- alle PERSONENBEFOERDERUNGEN mit selber Richtung (Personenlimit gilt jeweils für Hin- und Rückflug) zählen
    --- ebenso das Gesamtgewicht aller entsprechenden PERSONEN samt Gepäck ermitteln
    select nvl(count(persbef.id), 0), (sum(person.gewicht + persbef.gepaeck_gewicht))
    into personen_anzahl_aktuell, personen_gewicht_aktuell
    from PERSONENBEFOERDERUNG persbef
    join PERSON person on person.id = persbef.PERSON_id
    where persbef.richtung = :new.richtung
    and persbef.BUCHUNG_id = :new.BUCHUNG_id;
    
    --- Eigengewicht, An- und Abreisedatum der referenzierten PERSON ermitteln
    select person.gewicht, person.anreise_datum, person.abreise_datum
    into new_person_gewicht, person_anreise_datum, person_abreise_datum
    from PERSON person
    where person.id = :new.PERSON_id;

    --- Grenzwerte für PERSONEN und Maximalgewicht, sowie die Bestell-Deadline
    --- und den Liefertermin der entsprechenden Lieferung ermitteln
    select nvl(lieferung.personen_limit, 0), lieferung.gewicht_limit, buchung.bestell_deadline, lieferung.liefertermin
    into personen_anzahl_max, gewicht_max, flugbuchung_deadline, flug_liefertermin
    from LIEFERANGEBOT lieferung
    join LIEFERBUCHUNG buchung on buchung.ANGEBOT_id = lieferung.id
    where buchung.id = :new.BUCHUNG_id;

    --- Frachtgewicht bestimmten, abhängig von der Richtung des Transports (Hinflug / Rückflug)
    if (:new.richtung = 0) then
        --- nur falls ':new' ein Hinflug ist (Rückflüge sind ja ohne Fracht):
        --- Gesamtgewicht der Bestellungen dieser Lieferung ermitteln
        select sum(bestellung.anzahl * posten.gewicht)
        into fracht_gewicht_aktuell
        from BESTELLUNG bestellung
        join POSTEN posten on posten.id = bestellung.POSTEN_id
        where bestellung.BUCHUNG_id = :new.BUCHUNG_id;
    else
        --- falls ':new' ein Rückflug ist, gibt es keine Fracht (dh. Frachtgewicht ist 0)
        fracht_gewicht_aktuell := 0.000;
    end if;

    --- passt das Datum des Flugs (dh. 'flug_liefertermin') zur An- bzw. Abreisedatum der PERSON ?
    --- (bei einem Hinflug ('richtung' = 0) muss das Anreisedatum passen, bei einem Rückflug ('richtung' = 1) das Abreisdatum)
    if not (
        ((:new.richtung = 0) and (flug_liefertermin = person_anreise_datum))
        or ((:new.richtung = 1) and (person_abreise_datum is not null) and (flug_liefertermin = person_abreise_datum))
    ) then
        ---  ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20056, 'FEHLER: der Termin des Flugs passt nicht zum (geplanten) An- bzw. Abreisedatum der Personen, ggf. dieses Datum erst ändern');
    end if;

    --- ist die Buchung dieses Flugs innerhalb der Deadline (es zählt das Ende des Tages) ?
    --- (dh. Obergrenze ist der Beginn des nächsten Tags, dies erhält man mit 'trunc(DATE) + 1')
    if not (SYSDATE < (trunc(flugbuchung_deadline) + 1)) then
        ---  ansonten, mit Fehlermeldung abbrechen
        raise_application_error(-20057, 'FEHLER: die Deadline für diese Lieferung ist bereits überschritten, es können keine weiteren Flugtickets mehr gebucht werden');
    end if;

    --- wird das Gewichtslimit durch die zu transportierende Person überschritten ?
    if not ((personen_gewicht_aktuell + fracht_gewicht_aktuell + new_person_gewicht + :new.gepaeck_gewicht) <= gewicht_max) then
        --- in diesem Fall, mit Fehlermeldung abbrechen
        raise_application_error(-20058, 'FEHLER: das Reisegewicht der Person mit Gepäck überschreitet die Obergrenze für diessen Flug');
    end if;

    --- wird das Personenlimit durch die zu transportierende Person überschritten ?
    if not (personen_anzahl_aktuell < personen_anzahl_max) then
        --- in diesem Fall, mit Fehlermeldung abbrechen
        raise_application_error(-20059, 'FEHLER: der Personentransport ist bereits vollständig ausgebucht');
    else
        --- PERSONENBEFOERDERUNG verwendet PERSONENBEFOERDERUNG_seq als Sequenzgenerator
        select PERSONENBEFOERDERUNG_seq.nextval into :new.id from dual;
    end if;
end;
/



--- PERSONENBEFOERDERUNG / Before-Update-Trigger (richtung, BUCHUNG_id, PERSON_id) ---
create trigger TRG_PERSONENBEFOERDERUNG_B_UPD before update
of richtung, BUCHUNG_id, PERSON_id
on PERSONENBEFOERDERUNG for each row
begin
    --- jegliche Änderungen der Fremdschlüssel bzw. von 'richtung' verbieten
    raise_application_error(-20060, 'FEHLER: Änderungen von Hinflugticket zu Rückflugticket (oder andersrum), an der transportierten Person oder der entsprechenden Lieferung sind nachträglich nicht mehr möglich');
end;
/



--- POSTEN / Before-Insert-Trigger ---
create trigger TRG_POSTEN_B_INS before insert
on POSTEN for each row
begin
    --  POSTEN verwendet POSTEN_seq als Sequenzgenerator
    select POSTEN_seq.nextval INTO :new.id from dual;
end;
/



--- QUALIFIKATIONSNACHWEIS / Before-Update-Trigger (*) ---
create trigger TRG_QUALINACHWEIS_B_UPD before update
on QUALIFIKATIONSNACHWEIS for each row
begin
    --- jegliche Änderungen am Fremdschlüssel (bzw. auch Primärschlüssel) verbieten
    raise_application_error(-20061, 'FEHLER: der Nachweis oder die Qualifikation eines Qualiifkationseintrags kann nachträglich nicht geändert werden, stattdessen den Eintrag entfernen / neu anlegen');
end;
/



--- RAUM / Before-Insert-Trigger ---
create trigger TRG_RAUM_B_INS before insert
on RAUM for each row
declare
    max_stockwerke      NUMBER(38);
    stock_max           NUMBER(38);
    stock_min           NUMBER(38);
    
begin
    --- Anzahl 'stockwerke' im referenzierten GEBAEUDE ermitteln
    select gebaeude.stockwerke
    into max_stockwerke
    from GEBAEUDE gebaeude
    where (gebaeude.standort_x = :new.GEBAEUDE_standort_x)
    and (gebaeude.standort_y = :new.GEBAEUDE_standort_y);

    --- Minimum und Maximum von 'stockwerk' für alle RAEUME des GEBAEUDES ermitteln
    select min(raum.stockwerk), max(raum.stockwerk)
    into stock_min, stock_max
    from RAUM raum
    where (raum.GEBAEUDE_standort_x = :new.GEBAEUDE_standort_x)
    and (raum.GEBAEUDE_standort_y = :new.GEBAEUDE_standort_y);

    --- wird mit ':new.stockwerk' die Anzahl 'stockwerke' im GEBAEUDE überschritten ?
    if ((greatest(stock_max, :new.stockwerk) - least(stock_min, :new.stockwerk) + 1) > max_stockwerke) then
        --- in diesem Fall, mit Fehlerausgabe abbrechen
	    raise_application_error(-20062, 'FEHLER: Stockwerk des neuen Raums passt nicht zum Gebäudes.');
    else
        -- RAUM verwendet RAUM_seq als Sequenzgenerator
        select RAUM_seq.nextval into :new.id from dual;
    end if;
end;
/



--- RAUM / Before-Update-Trigger (stockwerk) ---
create trigger TRG_RAUM_B_UPD_STOCKWERK before update
of stockwerk
on RAUM for each row
begin
    --- jegliche Änderungen am Stockwerk verbieten
    raise_application_error(-20063, 'FEHLER: Stockwerk eines Raums kann nicht geändert werden.');
end;
/



--- RAUM / Before-Update-Trigger (GEBAEUDE_standort_x, GEBAEUDE_standort_y) ---
create trigger TRG_RAUM_B_UPD_GEBAEUDE before update
of GEBAEUDE_standort_x, GEBAEUDE_standort_y
on RAUM for each row
begin
    --- jegliche Änderung am Fremdschlüssel verbieten
    raise_application_error(-20064, 'FEHLER: Ein Raum kann nicht in ein anderes Gebäude verschoben werden.');
end;
/



--- RESSOURCE / Before-Insert-Trigger ---
create trigger TRG_RESSOURCE_B_INS before insert
on RESSOURCE for each row
begin
    -- RESSOURCE verwendet PRODUKT_seq als Sequenzgenerator
    select PRODUKT_seq.nextval into :new.id from dual;
end;
/



--- TRANSPORTPOSTEN / Before-Insert-Trigger ---
create trigger TRG_TRANSPOSTEN_B_INS before insert
on TRANSPORTPOSTEN for each row
declare
    --- aktueller Zeitpunkt, im Format der abgefragten Termine
    date_now         DATE := TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'), 'YYYY-MM-DD HH24:MI');

    termin_datum     DATE;
    start_lager      CHAR(50 CHAR);
    transport_anzahl NUMBER(38);

    posten_lager     CHAR(50 CHAR);
    posten_eingang   DATE;
    posten_ausgang   DATE;
    
begin
    --- Transport-Termin, Start- und Ziellager ermitteln
    --- ist keine Uhrzeit gegeben, gilt '23:59' Uhr als Deadline
    select transport.START_bezeichnung, to_date(
        to_char(transport.termin, 'YYYY-MM-DD') || ' ' ||
        nvl(
            to_char(transport.uhrzeit, 'HH24:MI'),
            '23:59'
        ),
        'YYYY-MM-DD HH24:MI'
    )
    into start_lager, termin_datum
    from LAGERTRANSPORT transport
    where transport.id = :new.TRANSPORT_id;

    --- Ein-, Ausgangsdatum und ggf. das LAGER des POSTEN ermitteln
    select lagpos.LAGER_bezeichnung, posten.datum_eingang, posten.datum_ausgang
    into posten_lager, posten_eingang, posten_ausgang
    from POSTEN posten
    left join LAGERPOSITION lagpos on lagpos.POSTEN_id = posten.id
    where posten.ID = :new.POSTEN_id;
    
    --- ist der Termin geplant oder historisch ?
    if (date_now < termin_datum) then
        --- wieviel geplante Transporte gibt es für diesen POSTEN ?
        select nvl(count(transport.id), 0)
        into transport_anzahl
        from LAGERTRANSPORT transport
        join TRANSPORTPOSTEN posten on posten.TRANSPORT_id = transport.id
        where posten.POSTEN_id = :new.POSTEN_id
        and date_now <= trunc(transport.termin);
        
        --- gibt es bereits einen geplanten Tranport ?
        --- nur ein geplanter Transport gleichzeitig erlaubt
        if ((transport_anzahl is not null) and (transport_anzahl != 0)) then
            --- in diesem Fall, mit Fehlermeldung abbrechen
            raise_application_error(-20065, 'FEHLER: dieser POSTEN ist bereits in einem Warentransport geplant, diesen abwarten oder löschen');
        end if;
    
        --- für geplante Termine muss der POSTEN tatsächlich im LAGER sein
        if (posten_lager is null) then
            --- in diesem Fall, mit Fehlermeldung abbrechen
            raise_application_error(-20066, 'FEHLER: der Posten ist kein tatsächlicher Lagerposten');
        end if;
        
        --- das Ausgangslager des geplanten Transports muss zum aktuellen Standort des POSTEN passt
        if (rtrim(start_lager) != rtrim(posten_lager)) then
            --- in diesem Fall, mit Fehlermeldung abbrechen
	        raise_application_error(-20067, 'FEHLER: Ausgangslager des Transports stimmt nicht mit dem Standort des Posten überein');
        end if;
    else
        --- für historische Transporte muss der Termin des Transports
        --- zum Ein- und Ausgangsdatum des POSTEN passen
        if not (
            ((posten_ausgang is null) and (trunc(posten_eingang) <= trunc(termin_datum)))
            or ((posten_ausgang is not null) and (trunc(termin_datum) between trunc(posten_eingang) and trunc(posten_ausgang)))
        ) then
            --- in diesem Fall, mit Fehlermeldung abbrechen
	        raise_application_error(-20068, 'FEHLER: das Datum des alten Transports passt nicht zum Zeitraum des Posten im Lagerverbund');
        end if;
    end if;
end;
/



--- TRANSPORTPOSTEN / Before-Update-Trigger (*) ---
create trigger TRG_TRANSPOSTEN_B_UPD before update
on TRANSPORTPOSTEN for each row
begin
    --- jegliche Änderung an TRANSPORTPOSTEN ist verboten
    raise_application_error(-20009, 'FEHLER: Änderungen am Posten oder Transport eines Transportpostens sind nicht erlaubt ');
end;
/



/*==============================================================*/
/*              - - -  T E S T D A T E N  - - -                 */
/*==============================================================*/

--- alle Daten des Test-Szenarios in die erzeugte Tabellenstruktur einpflegen,
--- abschließend wird eine Übersicht vom Umfang der Tabelleneinträge ausgegeben
@@LunarProspectors_INSERT.sql