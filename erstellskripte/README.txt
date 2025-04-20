* * * * * * * *  E R S T E L L S K R I P T E  * * * * * * * *


Das Verzeichnis 'LunarProspectos/Erstellskripte/' enthält zum
einen Skripte zum Aufbau und Abbau der Datenbank, also auch
Skripte zur Erzeugung der entsprechenden Tabelleneinträge für
die Daten des Test-Szenarios.

Zur Erzeugung der kompletten Datenbank mit allen Testdaten
muss nur bei SQLPlus das Skript 'LunarProspectors_CREATE.sql'
aufgerufen werden, entsprechende Testdaten-Skripte werden
hierbei kaskadierend aufgerufen.

Da in der Testumgebung 'DLAB' keine Partionierung möglich ist,
gibt es zum einen die Version für die Testumgebung, ohne Parti-
tionen 'LunarProspectors_CREATE.sql' sowie die vollständige
Fassung 'LunarProspectors_CREATE_Full.sql', mit Partitionen
für die einzelnen Tabellen (und Indexe). Für die Testumgebung
Wurden die Partitionen sowie die 'global' / 'local' Optionen
Der entsprechenden Indexe entfernt.


ÜBERSICHT DER DATEIEN:
  - LunarProspectors_CREATE_Full.sql	Generierung der Datenbank
				        mit allen Tabellen, im
					Anschluss werden alle
					Testdaten hier eingefügt
					(vollständige Fassung mit
					Partitionsschema)

  - LunarProspectors_CREATE.sql		Generierung der Datenbank
				        mit allen Tabellen, im
					Anschluss werden alle
					Testdaten hier eingefügt

  - LunarProspectors_DELETE.sql		Entfernen der Datenbank
					mit allen Tabellen

  - LunarProspectors_INSERT.sql		Erzeugung der Testdaten
					(setzt korrekt generierte
					Datenbank voraus)

  - LunarProsectors_CLEAR.sql		Löschen aller Testdaten
					bzw. aller Einträge der
					bekannten Tabellenstruktur
					(Datenbank bleibt erhalten,
					nur Daten werden entfernt)

  - Testdaten_Gebaeude.sql		Skripte zur Erzeugung der
  - Testdaten_Lager.sql			Testdaten, bei Bedarf können
  - Testdaten_Jobs.sql			somit auch einzelne Bereiche
  - Testdaten_Missionen.sql		des Test-Szenarios geladen
  - Testdaten_Personen.sql		werden (statt vollständig mit
  - Testdaten_Posten.sql		dem INSERT-Skript)
  - Testdaten_Lieferanten.sql
