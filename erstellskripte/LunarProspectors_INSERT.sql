/*===============================================================*/
/*                                                               */
/*                      T E S T D A T E N                        */
/*                 - - - - - - - - - - - - - -                   */
/*                                                               */
/*  Datei:     Lunarprospectors_INSERT.sql                       */
/*  Projekt:   Lunar Prospectors (Praktikumsgruppe 1)            */
/*                                                               */
/*  mit dem Skript wird ein Beispiel-Szenario mit allen          */
/*  entsprechend Tabelleneinträgen erstellt, bestehende          */
/*  Tabelleneinträge werden dabei zunächst gelöscht              */
/*                                                               */
/*  vor der Ausführung des Skripts muss eine Datenbankstruktur   */
/*  mit dem Erstellskript unter 'LunarProspectors_CREATE.sql'    */
/*  generiert worden sein                                        */
/*                                                               */
/*  DBMS:      ORACLE Version 19c                                */
/*                                                               */
/*===============================================================*/


--- alle bisherigen Tabelleneinträge löschen
@@LunarProspectors_CLEAR



--- GEBAEUDE mit RAEUMEN erstellen
@@Testdaten_Gebaeude.sql

--- LAGER (mit LAGERPOSITIONEN) für die entsprechenden RAEUMEN erstellen
@@Testdaten_Lager.sql



--- JOBS mit ARBEITSZEITEN, benötigte JOBGERAETE / -RESSOURCEN und
--- JOBQUALIFIKATIONEN über erforderlichen QUALIFIKATIONEN erstellen
@@Testdaten_Jobs.sql

--- MISSIONEN mit entsprechenden MISSIONSGRUPPEN und deren
--- JOBS (wieder mitsamt ARBEITSZEITEN, JOBQUALIFIKATIONEN, etc.) erstellen
@@Testdaten_Missionen.sql

--- PERSONEN mit NACHWEISEN über QUALIFIKATIONSNACHWEISE, BEWERBUNGEN
--- und entsprechenden JOBVERGABEN für JOBS erstellen
@@Testdaten_Personen.sql



--- RESSOURCEN / GERAETE-Produkte eintragen, entsprechende POSTEN erstellen und
--- den LAGERPOSITIONEN zuweisen sowie AUSGABEN (von RESSOURCEN an PERSONEN) vermerken 
@@Testdaten_Posten.sql



--- LIEFERANTEN mit einigen LIEFERANGEBOTEN erstellen, entsprechende LIEFERBUCHUNGEN vermerken,
--- und ANGEBOTE sowie BESTELLUNGEN (für Produkte) eintragen, außerdem PERSONENBEFOERDERUNGEN hinzufügen
--- und LAGERTRANSPORTE für bereits angelieferte POSTEN erstellen
@@Testdaten_Lieferanten.sql



--- Umfang der erzeugten Tabelleneinträge zusammenfassend ausgeben
@@Tabellen_Uebersicht.sql

