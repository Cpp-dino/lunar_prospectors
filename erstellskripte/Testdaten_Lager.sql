
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*                         L A G E R                             */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


declare
	raumid NUMBER(38);

begin
	--- Importlager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Import-Lagerhalle')
	and (r.bezeichnung = 'Lagerhalle');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Importlager', raumid, 4000, 'kurzfristige Unterbringung von ankommenden Bestellungen, von aus hier werden Geräte an ihren Einsatzort, bzw. ins Große Maschinenlager transportiert, der Großteil der Ressourcen wird ins Zentral-Depot transportiert', to_date('2022-03-13', 'YYYY-MM-DD'));

	for i in 1..40 loop
		for j in 1..100 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Importlager', i, j);
		end loop;	
	end loop;


	--- Raketenreparatur-Lager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Reparatur-Hangar') and (r.bezeichnung = 'Lagerhalle');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Raketenreparatur-Lager', raumid, 250, 'Unterbringung von Geräten und Ersatzteilen für die Reparatur beschädigter Raketen', to_date('2022-05-04', 'YYYY-MM-DD'));

	for i in 1..5 loop
		for j in 1..50 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Raketenreparatur-Lager', i, j);
		end loop;	
	end loop;

	--- Wasseraufbereitung-Chemiekalienlager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Wasseraufbereitung-Lagerhalle') and (r.bezeichnung = 'Chemikalien-Lagerraum');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Wasseraufbereitung-Chemiekalienlager', raumid, 50, 'Unterbringung von Chemiekalien für die Wasseraufbereitungsanlage', to_date('2022-07-28', 'YYYY-MM-DD'));

	for i in 1..2 loop
		for j in 1..25 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Wasseraufbereitung-Chemiekalienlager', i, j);
		end loop;	
	end loop;

	--- Wasseraufbereitung-Gerätelager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Wasseraufbereitung-Lagerhalle') and (r.bezeichnung = 'Ersatzteile- und Geräte-Lagerraum');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Wasseraufbereitung-Gerätelager', raumid, 50, 'Unterbringung der Geräten für die Wasseraufbereitung, Unterbringung von Ersatzteilen für die Anlage', to_date('2022-07-29', 'YYYY-MM-DD'));

	for i in 1..5 loop
		for j in 1..10 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Wasseraufbereitung-Gerätelager', i, j);
		end loop;	
	end loop;


	--- Laborgeräte-Lager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Labor') and (r.bezeichnung = 'Geräte-Lagerraum');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Laborgeräte-Lager', raumid, 100, 'Unterbringung von Laborgeräten aus den Geologie-, Chemie- und Biologielaboren', to_date('2024-01-08', 'YYYY-MM-DD'));

	for i in 1..10 loop
		for j in 1..10 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Laborgeräte-Lager', i, j);
		end loop;	
	end loop;

	--- Krankenhaus-Apotheke ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Krankenhaus') and (r.bezeichnung = 'Apotheke');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Krankenhaus-Apotheke', raumid, 250, 'Vorrat aller benötigten Medikamente für die ambulante Versorgung und den normalen Krankenhausbetrieb', to_date('2023-09-14', 'YYYY-MM-DD'));

	for i in 1..5 loop
		for j in 1..50 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Krankenhaus-Apotheke', i, j);
		end loop;	
	end loop;

	--- Solarpark-Gerätelager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Solarpark-Steuerung') and (r.bezeichnung = 'Geräte-Lagerraum');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Solarpark-Gerätelager', raumid, 100, 'Unterbringung der Geräte für den Solarpark', to_date('2023-02-07', 'YYYY-MM-DD'));

	for i in 1..10 loop
		for j in 1..10 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Solarpark-Gerätelager', i, j);
		end loop;	
	end loop;

	--- Zentral-Depot 1 ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Zentral-Depot') and (r.bezeichnung = 'Lagerhalle (Lebensmittel)');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Zentral-Depot 1', raumid, 5000, 'Unterbringung von Lebensmitteln für den persönlichen Bedarf', to_date('2022-12-21', 'YYYY-MM-DD'));

	for i in 1..50 loop
		for j in 1..100 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Zentral-Depot 1', i, j);
		end loop;	
	end loop;

	--- Zentral-Depot 2 ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Zentral-Depot') and (r.bezeichnung = 'Lagerhalle (Lebensmittel und Drogerie)');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Zentral-Depot 2', raumid, 5000, 'Unterbringung von Lebensmitteln und Drogerieprodukten für den persönlichen Bedarf', to_date('2022-12-21', 'YYYY-MM-DD'));

	for i in 1..50 loop
		for j in 1..100 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Zentral-Depot 2', i, j);
		end loop;	
	end loop;

	--- Zentral-Depot 3 ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Zentral-Depot') and (r.bezeichnung = 'Lagerhalle (Verbrauchsprodukte für Jobs)');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Zentral-Depot 3', raumid, 2500, 'Unterbringung von Verrbauchspordukten für Arbeiten in der Basis', to_date('2023-04-20', 'YYYY-MM-DD'));

	for i in 1..25 loop
		for j in 1..100 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Zentral-Depot 3', i, j);
		end loop;	
	end loop;

	--- Botaniklager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Greenhouse') and (r.bezeichnung = 'Lagerraum');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Botaniklager', raumid, 50, 'Unterbringung der botanischen Produkten für das Greenhouse', to_date('2024-03-26', 'YYYY-MM-DD'));

	for i in 1..2 loop
		for j in 1..25 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Botaniklager', i, j);
		end loop;	
	end loop;

	--- Kantinen-Kühllager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Kantine')
	and (r.bezeichnung = 'Kühllager');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Kantinen-Kühllager', raumid, 1000, 'Unterbringung von Lebensmitteln für die Kantinenküche', to_date('2023-05-30', 'YYYY-MM-DD'));

	for i in 1..40 loop
		for j in 1..25 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Kantinen-Kühllager', i, j);
		end loop;	
	end loop;

	--- Großes Maschinenlager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Großes Maschinenlager') and (r.bezeichnung = 'Maschinen-Lagerhalle');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Großes Maschinenlager', raumid, 3000, 'Unterbringung aller Maschinen und Geräte, Ausgabe von Geräten für Arbeiten in der Basis', to_date('2023-08-16', 'YYYY-MM-DD'));

	for i in 1..30 loop
		for j in 1..100 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Großes Maschinenlager', i, j);
		end loop;	
	end loop;

	--- Werkstattlager (Großes Maschinenlager) ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Großes Maschinenlager')
	and (r.bezeichnung = 'Ersatzteile-Lagerhalle');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Werkstattlager (Großes Maschinenlager)', raumid, 1000, 'Unterbringung von Ersatzteilen für die Werkstatt im Großen Maschinenlager', to_date('2023-08-16', 'YYYY-MM-DD'));

	for i in 1..10 loop
		for j in 1..100 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Werkstattlager (Großes Maschinenlager)', i, j);
		end loop;	
	end loop;

	--- Treibstofffabrik-Ersatzteilelager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Treibstofffabrik')
	and (r.bezeichnung = 'Ersatzteile-Lagerraum');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Treibstofffabrik-Ersatzteilelager', raumid, 500, 'Unterbringung von Ersatzteilen und Geräten für die Treibstofffabrik', to_date('2024-02-24', 'YYYY-MM-DD'));

	for i in 1..20 loop
		for j in 1..25 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Treibstofffabrik-Ersatzteilelager', i, j);
		end loop;	
	end loop;

	--- Kleines Maschinenlager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Kleines Maschinenlager')
	and (r.bezeichnung = 'Lagerhalle');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Kleines Maschinenlager', raumid, 250, 'Unterbringung von Maschinen und Geräten, haupstächlich für die Fahrzeug-Werkstatt', to_date('2023-06-12', 'YYYY-MM-DD'));

	for i in 1..5 loop
		for j in 1..50 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Kleines Maschinenlager', i, j);
		end loop;	
	end loop;

	--- Fahrzeug-Ersatzteilelager ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Fahrzeug-Ersatzteilehalle')
	and (r.bezeichnung = 'Lagerhalle');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Fahrzeug-Ersatzteilelager', raumid, 500, 'Unterbringung von Ersatzteilen für die Fahrzeug-Werkstatt', to_date('2023-06-29', 'YYYY-MM-DD'));

	for i in 1..20 loop
		for j in 1..25 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Fahrzeug-Ersatzteilelager', i, j);
		end loop;	
	end loop;

	--- Werkstattlager (Fahrzeugwerkstatt) ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Fahrzeug-Werkstatt')
	and (r.bezeichnung = 'Geräte-Lagerhalle');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Werkstattlager (Fahrzeugwerkstatt)', raumid, 150, 'Unterbringung von Geräten für die Fahrzeugwerkstatt', to_date('2023-05-10', 'YYYY-MM-DD'));

	for i in 1..6 loop
		for j in 1..25 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Werkstattlager (Fahrzeugwerkstatt)', i, j);
		end loop;	
	end loop;

	--- Reinigungslager (Wohnkomplex A) ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Wohnkomplex A')
	and (r.bezeichnung = 'Lagerraum');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Reinigungslager (Wohnkomplex A)', raumid, 100, 'Unterbringung von Reinigungsgeräten und -produkten für Wohnkomplex A', to_date('2022-07-18', 'YYYY-MM-DD'));

	for i in 1..10 loop
		for j in 1..10 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Reinigungslager (Wohnkomplex A)', i, j);
		end loop;	
	end loop;

	--- Reinigungslager (Wohnkomplex B) ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Wohnkomplex B')
	and (r.bezeichnung = 'Lagerraum');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Reinigungslager (Wohnkomplex B)', raumid, 100, 'Unterbringung von Reinigungsgeräten und -produkten für Wohnkomplex B', to_date('2024-01-26', 'YYYY-MM-DD'));

	for i in 1..10 loop
		for j in 1..10 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Reinigungslager (Wohnkomplex B)', i, j);
		end loop;	
	end loop;

	--- Reinigungslager (Unterkunft Ost) ---
	select r.id
	into raumid
	from RAUM r
	join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
	where (g.name = 'Unterkunft Ost')
	and (r.bezeichnung = 'Lagerraum');

	insert into LAGER(bezeichnung, RAUM_id, kapazitaet_limit, verwendung, datum_erstellung)
	values('Reinigungslager (Unterkunft Ost)', raumid, 60, 'Unterbringung von Reinigungsgeräten und -produkten für Unterkunft Ost', to_date('2023-03-07', 'YYYY-MM-DD'));

	for i in 1..6 loop
		for j in 1..10 loop
			insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr)
			values('Reinigungslager (Unterkunft Ost)', i, j);
		end loop;	
	end loop;
end;
/

