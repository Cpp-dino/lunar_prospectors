/*===============================================================*/
/*                                                               */
/*                E I N T Ä G E   L Ö S C H E N                  */
/*            - - - - - - - - - - - - - - - - - - -              */
/*                                                               */
/*  Datei:     Lunarprospectors_CLEAR.sql                        */
/*  Projekt:   Lunar Prospectors (Praktikumsgruppe 1)            */
/*                                                               */
/*  mit dem Skript werden alle bisherigen Tabelleneinträge       */
/*  der Datenbank gelöscht, wobei jedoch Tabellen mit vom        */
/*  Erstellskript abweichenden Symbol-Bezeichnungen nicht        */
/*  berücksichtigt werden                                        */
/*                                                               */
/*  die Tabellenstruktur der Datenbank bleibt hierbei erhalten   */
/*                                                               */
/*  DBMS:      ORACLE Version 19c                                */
/*                                                               */
/*===============================================================*/


delete from BEWERBUNG;

delete from JOBVERGABE;

delete from QUALIFIKATIONSNACHWEIS;

delete from NACHWEIS;

delete from AUSGABE;

delete from PERSON;

delete from PERSONENBEFOERDERUNG;

delete from BESTELLUNG;

delete from ANGEBOT;

delete from LIEFERBUCHUNG;

delete from LIEFERANGEBOT;

delete from LIEFERANT;

delete from MAENGEL;

delete from TRANSPORTPOSTEN;

delete from LAGERTRANSPORT;

delete from LAGERPOSITION;

delete from POSTEN;

delete from ARBEITSZEIT;

delete from JOBQUALIFIKATION;

delete from JOBGERAET;

delete from JOBRESSOURCE;

delete from RESSOURCE;

delete from GERAET;

delete from JOB;

delete from MISSIONSGRUPPE;

delete from MISSION;

delete from LAGER;

delete from RAUM;

delete from GEBAEUDE;

delete from QUALIFIKATION;

