/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*                       G E B A E U D E                         */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


--- Landeplatz ---
insert into GEBAEUDE(standort_x, standort_y, name, beschreibung)
	values(44.27488, 17.30451, 'Landeplatz', 'Raketen-Landeplatz für Versorgungslieferungen und Personentransporte, unmittelbar angeschlossen an ein Importlager zur Unterbringung der Bestellungen und Werkstatt zur Reparatur beschädigter Raketen')
/


--- Import-Lagerhalle ---
insert into GEBAEUDE(standort_x, standort_y, name, beschreibung, stockwerke)
	values(44.27614, 17.30452, 'Import-Lagerhalle', 'Import-Lager bietet die Möglichkeit, eingetroffene Bestellungen temporär unterzubringen', 2)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27614, 17.30452, 'Lagerhalle', 0, 900.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27614, 17.30452, 'WC', 0, 20.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27614, 17.30452, 'Pausenraum', 0, 80.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27614, 17.30452, 'Büro (Lagerlogistik)', 0, 100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27614, 17.30452, 'Büro (Lagereingang)', 1, 100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27614, 17.30452, 'Büro (Transportlogistik)', 1, 100.00)
/


--- Reparatur-Hangar ---
insert into GEBAEUDE(standort_x, standort_y, name, beschreibung, stockwerke)
	values(44.27488, 17.30577, 'Reparatur-Hangar', 'der Hangar bietet am Landeplatz die Möglichkeit, Reperaturen durchzuführen, um beschädigte Raketen wieder flugtauglich zu machen', 1)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.27488, 17.30577, 'Reparaturhalle', 0, 300.00, 'Deckenkran, Hebebühne, Triebwerk-Teststand')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.27488, 17.30577, 'Lagerhalle', 0, 300.00, 'Deckenkran')
/


--- Landeplatz-Kontrollturm ---
insert into GEBAEUDE(standort_x, standort_y, name, beschreibung, stockwerke)
	values(44.27614, 17.30577, 'Landeplatz-Kontrollturm', 'Kontrollturm zur Überwachung des Landeplatzes, Koordinierung von Starts und Landungen sowie direkter Komunikation mit den entsprechenden Raketen', 4)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27614, 17.30577, 'WC', 2, 80.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27614, 17.30577, 'Kontrollraum', 3, 120.00)
/


--- Wasseraufbereitung-Steuerung ---
insert into GEBAEUDE(standort_x, standort_y, name, beschreibung, stockwerke)
	values(44.27884, 17.30595, 'Wasseraufbereitung-Steuerung', 'Büros und Technik zur Steuerung und Überwachung der Wasseraufbereitungsanlage', 2)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27884, 17.30595, 'Pausenraum', 0, 100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27884, 17.30595, 'WC', 0, 100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27884, 17.30595, 'Büro (Anlagensteuerung)', 0, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.27884, 17.30595, 'Pumpenraum', 0, 400.00, '2x Durchlaufpumpe')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27884, 17.30595, 'Serverraum', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27884, 17.30595, 'Büro (Wassernetz-Steuerung)', 1, 400.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27884, 17.30595, 'Büro (Leitung)', 1, 200.00)
/


--- Wasseraufbereitung-Lagerhalle ---
insert into GEBAEUDE(standort_x, standort_y, name, beschreibung, stockwerke)
	values(44.28172, 17.30487, 'Wasseraufbereitung-Lagerhalle', 'Lager zur Unterbringung von benötigten Chemikalien und benötigter Geräte und Ersatzteile', 1)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28172, 17.30487, 'Chemikalien-Lagerraum', 0, 400.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28172, 17.30487, 'Ersatzteile- und Geräte-Lagerraum', 0, 400.00)
/


--- Wohnkomplex A ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28316, 17.30487, 'Wohnkomplex A', 'Unterkunft für 400 Bewohner, mit Schlafkapseln und Gemeinschaftsräumen für die Freizeitbeschäftigung', 5)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Lounge', 0, 1500.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Wäscherei', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Lagerraum', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Pausenraum', 0, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'WC', 0, 100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Sanitär 1', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Sanitär 2', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Küche', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Gemeinschaftsraum', 1, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Sanitär 1', 2, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Sanitär 2', 2, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Küche', 2, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Gemeinschaftsraum', 2, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Sanitär 1', 3, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Sanitär 2', 3, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Küche', 3, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Gemeinschaftsraum', 3, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Sanitär 1', 4, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Sanitär 2', 4, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Küche', 4, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.30487, 'Gemeinschaftsraum', 4, 600.00)
/


--- Sternwarte ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.29036, 17.30451, 'Sternwarte', 'die Sternwarte bietet die Möglichkeit, astronomische Beobachtungen in der vorteilhaften Mondumgebung durchzuführen', 3)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29036, 17.30451, 'WC', 0, 80.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29036, 17.30451, 'Serverraum', 0, 120.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29036, 17.30451, 'Kontrollraum', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.29036, 17.30451, 'Teleskopraum', 2, 100.00, 'Spiegelteleskop(800 mm Öfnnung, 12 300 mm Brennweite)')
/


--- Labor ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28784, 17.30595, 'Labor', 'Büros und Labor für Forschende bieten die Möglichkeit zur Forschung, insbesondere in den Bereichen Geologie, Chemie und Biologie', 4)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28784, 17.30595, 'Geräte-Lagerraum', 0, 300.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28784, 17.30595, 'Chemie-Labor', 0, 350.00, 'Abzugsystem, UV-Spektrometer, Massenspektrometor, Gaschromatograph')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28784, 17.30595, 'Geologie-Labor 1', 0, 350.00, 'Gesteinssäge, Dünnschliffgerät, Seismometer, Mikroskop, Elektronenrastermikroskop')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28784, 17.30595, 'Geologie-Labor 2', 0, 400.00, 'Röntgendiffraktometer, Röntgenfluoreszenzspektrometer, Elektronenmikrosonde, ICP-Massenspektrometer')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28784, 17.30595, 'Biologie-Labor', 1, 600.00, 'Zentrifuge, Mikroskop, Homogenisator, Schüttelinkubator, PCR-Gerät, Elektronenphorese-Gerät, Spektorphotometer')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28784, 17.30595, 'Proben-Lagerraum', 1, 300.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28784, 17.30595, 'Büro 1', 1, 250.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28784, 17.30595, 'Büro 2', 1, 250.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28784, 17.30595, 'Konferenzraum', 1, 300.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28784, 17.30595, 'Büro 3', 1, 250.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28784, 17.30595, 'Büro 4', 1, 250.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28784, 17.30595, 'Serverraum', 2, 400.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28784, 17.30595, 'Büro (IT)', 2, 200.00)
/


--- Krankenhaus ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.29072, 17.30649, 'Krankenhaus', 'zentrales Krankenhaus mit Notaufnahme, OPs und Unterbringsunsmöglichkeiten für Patienten', 3)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29072, 17.30649, 'Apotheke', 0, 275.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29072, 17.30649, 'Pausenraum', 0, 300.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29072, 17.30649, 'Notaufnahme', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.29072, 17.30649, 'OP 1', 1, 225.00, 'OP-Tisch, OP-Lampe, Anästhesie-Gerät, Absaugpumpe')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.29072, 17.30649, 'OP 2', 1, 225.00, 'OP-Tisch, OP-Lampe, Anästhesie-Gerät, Absaugpumpe')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29072, 17.30649, 'Sterilraum', 1, 250.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29072, 17.30649, 'Büro 1', 2, 150.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29072, 17.30649, 'Büro 2', 2, 150.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29072, 17.30649, 'Patientenzimmer', 2, 600.00)
/


--- Solarpark ---
insert into GEBAEUDE(standort_x, standort_y, name, beschreibung)
	values(44.27488, 17.30802, 'Solarpark', 'die Photovoltaik-Anlage sichert die Stromversorgung der gesamten Mondbasis')
/


--- Solarpark-Steuerung ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.27740, 17.30865, 'Solarpark-Steuerung', 'Büros und Technik zur Steuerung und Überwachung zum einen der Stromerzeugung im Solarpark, aber auch des gesamten Stromnetztes', 3)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27740, 17.30865, 'WC', 0, 80.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27740, 17.30865, 'Pausenraum', 0, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27740, 17.30865, 'Geräte-Lagerraum', 0, 350.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27740, 17.30865, 'Büro (Energiespeicherung)', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27740, 17.30865, 'Büro (Steuerung Solaranlage)', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27740, 17.30865, 'Serverraum', 1, 230.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27740, 17.30865, 'Büro (Überwachung Stromnetz)', 2, 430.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27740, 17.30865, 'Büro (Leitung)', 2, 200.00)
/
	

--- Umspannwerk ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28740, 17.30757, 'Umspannwerk', 'im Umspannwerk wird die erzeugte Spannung wechselgerichtet und anschließend auf die benötigte Spannung transformiert', 1)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28740, 17.30757, 'Transformatorenraum', 0, 200.00)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28740, 17.30757, 'Wechselrichterraum', 0, 200.00)
/


--- Speicherblock --
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28848, 17.30757, 'Speicherblock', 'hier sind ausreichend Batterien untergebracht, um die Schwankungen bei Erzeugung und Verbauch auszugleichen', 1)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28848, 17.30757, 'Speicherraum', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28848, 17.30757, 'Notstrom-Technikraum', 0, 100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28848, 17.30757, 'Technikraum', 0, 100.00)
/


--- Zentral-Depot ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28028, 17.30757, 'Zentral-Depot', 'hier werden alle Dinge, des persönlichen Bedarfs untergebracht und ausgegeben, außerdem werden hier Verbrauchsgegenstände für Jobs gelagert und ausgeben (zB. Reinigungsmittel, Spüllappen, etc.)', 3)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28028, 17.30757, 'Verladehalle', 0, 800.00, 'Deckenkran, Verpackungsanlage')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28028, 17.30757, 'Büro (Wareneingang / -ausgang)', 0, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28028, 17.30757, 'WC', 0, 80.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28028, 17.30757, 'Pausenraum', 0, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28028, 17.30757, 'Lagerhalle (Lebensmittel)', 0, 2600.00, '3x Deckenkran')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28028, 17.30757, 'Ausgabe (Lebensmittel)', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28028, 17.30757, 'Lagerhalle (Lebensmittel und Drogerie)', 1, 2600.00, '3x Deckenkran')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28028, 17.30757, 'Ausgabe (Lebensmittel und Drogerie)', 1, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28028, 17.30757, 'Lagerhalle (Verbrauchsprodukte für Jobs)', 2, 1600.00, '3x Deckenkran')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28028, 17.30757, 'Ausgabe (Verbrauchsprodukte für Jobs)', 2, 600.00)
/


--- Verwaltung ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28280, 17.30757, 'Verwaltung', 'in der Verwaltung werden Missionen geplant und koordiniert, Jobs vermittelt, Personen von der Erde angeheuert, Angelegenheiten von Bewohnern verwaltet und alle anderen organisatorischen Aufgaben ausgeführt', 4)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Empfang', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Poststelle', 0, 500.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Server', 0, 300.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'WC', 0, 100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (IT)', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'kommunikation', 0, 900.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (Versorgungslieferungen)', 1, 800.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (Einkauf)', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Konferenzraum', 1, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (Leitung Jobverwaltung)', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (Jobverwaltung)', 1, 800.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'WC', 1, 150.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Pausenraum', 1, 250.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (Missionsverwaltung)', 2, 800.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (Leitung Missionsverwaltung)', 2, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (Konferenzraum)', 2, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'WC', 2, 150.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (Lagerverwaltung)', 2, 1100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Sateliten-Technikraum', 3, 250.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Serverraum', 3, 400.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (Personalverwaltung)', 3, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Konferenzraum', 3, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28280, 17.30757, 'Büro (Leitung Mondbasis)', 3, 300.00)
/


--- Greenhouse ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28532, 17.30757, 'Greenhouse', 'hier werden Pflanzen hochgezogen, für Forschung und persönlichen Ressourcenbedarf, außerdem wird für die gesamte Basis die Sauerstoffversorgung sichergestellt, die Bewohner können diesen Garten in ihrer Freizeit besuchen', 3)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28532, 17.30757, 'Lagerraum', 0, 400.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28532, 17.30757, 'Technikraum', 0, 400.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28532, 17.30757, 'Aquaponik', 0, 1200.00, 'Bewässerungsanlage, Pflanzen-Beleuchtung')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28532, 17.30757, 'Aeroponik', 1, 1200.00, 'Bewässerungsanlage, Pflanzen-Beleuchtung')
/


--- Kantine ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28532, 17.30955, 'Kantine', 'in der Kantine können die Bewohner warme Mahlzeiten verzeeren', 2)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28532, 17.30955, 'Pausenraum', 0, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28532, 17.30955, 'WC', 0, 100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28532, 17.30955, 'Küche', 0, 1000.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28532, 17.30955, 'Kühllager', 0, 700.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28532, 17.30955, 'WC', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28532, 17.30955, 'Speiseraum', 1, 1100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28532, 17.30955, 'Essensausgabe', 1, 700.00)
/


--- Unterkunft Ost ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28820, 17.31623, 'Unterkunft Ost', 'kleinere Unterkunft für 200 Bewohner, mit Schlafkapseln und Gemeinschaftsräumen für die Freizeitbeschäftigung', 3)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Lounge', 0, 1500.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Wäscherei', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Lagerraum', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Pausenraum', 0, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'WC', 0, 100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Sanitär 1', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Sanitär 2', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Küche', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Gemeinschaftsraum', 1, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Sanitär 1', 2, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Sanitär 2', 2, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Küche', 2, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28820, 17.31623, 'Gemeinschaftsraum', 2, 600.00)
/


--- Sporthalle ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.29036, 17.30847, 'Sporthalle', 'hier können Bewohner in ihrer Freizeit sportliche Aktivitäten ausüben', 1)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29036, 17.30847, 'Umkleide Herren', 0, 300.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29036, 17.30847, 'Umkleide Damen', 0, 300.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29036, 17.30847, 'Sporthalle', 0, 900.00)
/


--- Großes Maschinenlager ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.27488, 17.31207, 'Großes Maschinenlager', 'das Große Maschinenlager dient der Unterbringung des Gerätebestands, für Jobs benötigte Geräte können hier abgeholt werden, außerdem können Geräte vom Solarpark und der Treibstofffabrik in der Nähe hier untergebracht werden', 2)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27488, 17.31207, 'Werkstatt', 0, 300.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27488, 17.31207, 'Ersatzteile-Lagerhalle', 0, 850.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.27488, 17.31207, 'Maschinen-Lagerhalle', 0, 1150.00, '2x Deckenkran')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.27488, 17.31207, 'Verladehalle', 0, 500.00, 'Deckenkran, Verpackungsanlage')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27488, 17.31207, 'Büro (Wareneingang / -ausgang)', 0, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27488, 17.31207, 'Pausenraum', 1, 350.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27488, 17.31207, 'WC', 1, 150.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27488, 17.31207, 'Büro (Transportlogistik)', 1, 400.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27488, 17.31207, 'Büro (Lagerlogistik)', 1, 450.00)
/


--- Treibstofffabrik ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.27776, 17.31429, 'Treibstofffabrik', 'in der Fabrik wird wasserstoffbasierter Treibstoff für Raketen hergestellt, Wasserstoff wird durch Hydrolyse von Wasser gewonnen', 3)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27776, 17.31429, 'Ersatzteile-Lagerraum', 0, 375.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27776, 17.31429, 'Pausenraum', 0, 525.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27776, 17.31429, 'WC', 0, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27776, 17.31429, 'Büro (Werksleitung)', 0, 175.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27776, 17.31429, 'Geräte-Lagerraum', 0, 450.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.27776, 17.31429, 'Hydrolyse-Halle', 0, 3125.00, 'Durchlaufpumpe, Elektrolyse-Anlage')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27776, 17.31429, 'Büro (Hydrolyse-Chemie)', 0, 250.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.27776, 17.31429, 'CO2-Abscheidung-Halle', 1, 2450.00, 'Durchlaufturbine, CO2-Abscheidungsanlage, CO2-Elektrolyseanlage')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27776, 17.31429, 'Büro (CO2-Abschneidungs-Chemie)', 1, 250.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.27776, 17.31429, 'Fischer-Tropsch-Halle', 2, 1075.00, 'Fischer-Tropsch-Reaktor, Destillationsanlage')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.27776, 17.31429, 'Büro (Fischer-Tropsch-Reaktion)', 2, 250.00)
/


--- Wohnkomplex B ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28316, 17.31315, 'Wohnkomplex B', 'Unterkunft für 400 Bewohner, mit Schlafkapseln und Gemeinschaftsräumen für die Freizeitbeschäftigung', 5)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Lounge', 0, 1500.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Wäscherei', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Lagerraum', 0, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Pausenraum', 0, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'WC', 0, 100.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Sanitär 1', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Sanitär 2', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Küche', 1, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Gemeinschaftsraum', 1, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Sanitär 1', 2, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Sanitär 2', 2, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Küche', 2, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Gemeinschaftsraum', 2, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Sanitär 1', 3, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Sanitär 2', 3, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Küche', 3, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Gemeinschaftsraum', 3, 600.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Sanitär 1', 4, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Sanitär 2', 4, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Küche', 4, 200.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28316, 17.31315, 'Gemeinschaftsraum', 4, 600.00)
/


--- Fahrzeug-Werkstatt ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28964, 17.31243, 'Fahrzeug-Werkstatt', 'in der Werkstatt können beschädigte oder wartungsbedürftige Fahrzeuge repariert bzw. gewartet werden', 1)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28964, 17.31243, 'Geräte-Lagerhalle', 0, 525.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28964, 17.31243, 'Reperaturhalle', 0, 915.00, '3x Hebebühne')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28964, 17.31243, 'Pausenraum', 0, 165.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28964, 17.31243, 'WC', 0, 80.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28964, 17.31243, 'Büro (Werksleitung)', 0, 225.00)
/


--- Fahrzeug-Ersatzteilehalle ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.29036, 17.31135, 'Fahrzeug-Ersatzteilehalle', 'hier werden Ersatzteile für die Reparatur von Fahrzeugen untergebracht', 1)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29036, 17.31135, 'Lagerhalle', 0, 1230.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.29036, 17.31135, 'Büro (Lagerlogistik)', 0, 175.00)
/


--- Kleines Maschinenlager ---
insert into GEBAEUDE(standort_x, standort_y, name, Beschreibung, stockwerke)
	values(44.28892, 17.31459, 'Kleines Maschinenlager', 'hier sind Geräte hauptsächlich für die Reparatur von Fahrzeugen untergebracht', 1)
/

insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse, ausstattung)
	values(44.28892, 17.31459, 'Lagerhalle', 0, 875.00, 'Deckenkran')
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28892, 17.31459, 'Pausenraum', 0, 275.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28892, 17.31459, 'WC', 0, 75.00)
/
insert into RAUM(gebaeude_standort_x, gebaeude_standort_y, bezeichnung, stockwerk, groesse)
	values(44.28892, 17.31459, 'Büro (Lagerlogistik)', 0, 300.00)
/


