
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	   		          M I S S I O N E N	 		                 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


--- Missionsgruppen (Erschließung von Slicium) ---
declare
    missionsid  NUMBER(38);
    gruppeid    NUMBER(38);
    jobid       NUMBER(38);
    chefid      NUMBER(38);
    raumid      NUMBER(38);
    
begin
    --- Mission ---
    insert into MISSION(titel, auftrag, startdatum)
    values(
        'Erschließung von Slicium',
        'Forschungsprojekt zur geologischen Analyse von 2 potentiellen Siliciumquellen im Norden-Westen und im Nord-Osten',
        to_date('2025-02-01', 'YYYY-MM-DD')
    );
    select MISSION_seq.currval into missionsid from dual;



    --- Gruppe: Gesteinsproben Sammeln 1 ---
    insert into LAGER(bezeichnung, kapazitaet_limit, verwendung, datum_erstellung)
    values('Siliciummission / Probensammler-Gruppe 1', 1000, 'das Gepäck der ersten Gruppe Gesteinsprobensammler der Mission zur Erschließung von Siliciumquellen', to_date('2025-01-01', 'YYYY-MM-DD'));

	for i in 1..1000 loop
		insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr) values('Siliciummission / Probensammler-Gruppe 1', 1, i);
	end loop;

    insert into MISSIONSGRUPPE(LAGER_bezeichnung, MISSION_id, titel, auftrag)
    values(
        'Siliciummission / Probensammler-Gruppe 1',
        missionsid,
        'Gesteinsproben Sammeln 1',
        'die Gruppe fährt zur potentiellen Siliciumquelle im Nord-Westen, sammelt eine Reihe von Gesteinsproben und kehrt zur Basis zurück. Dafür ist etwa ein Zeitraum von 2 Wochen geplant.'
    );
    select MISSIONSGRUPPE_seq.currval into gruppeid from dual;

    select r.id
    into raumid
    from RAUM r
    join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
    where (g.name = 'Verwaltung')
    and (r.bezeichnung = 'Empfang');

    --- leitender Gesteinsprobensammler
    insert into JOB(RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet) values(raumid, gruppeid, 'leitender Gesteinsprobensammler', 'Leitung der ersten Gesteinsprobensammler-Missionsgruppe, eine Reihe von Gesteinsproben von der potentiellen Siliciumquelle im Nord-Westen sammeln', 0, 4400, 0);
    select JOB_seq.currval into jobid from dual;
    select JOB_seq.currval into chefid from dual;
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Fahrzeug Führerschein');
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Mondfahrzeug Grundkurs');

    --- 3x Gesteinsprobensammler
    for i in 1..3 loop
        insert into JOB(CHEF_id, RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet) values(chefid, raumid, gruppeid, 'Gesteinsprobensammler', 'eine Reihe von Gesteinsproben von der potentiellen Siliciumquelle im Nord-Westen sammeln', 0, 4135, 0);
        select JOB_seq.currval into jobid from dual;
        insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Fahrzeug Führerschein');
        insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Mondfahrzeug Grundkurs');
    end loop;



    --- Gruppe: Gesteinsproben Sammeln 2 ---
    insert into LAGER(bezeichnung, kapazitaet_limit, verwendung, datum_erstellung)
    values('Siliciummission / Probensammler-Gruppe 2', 1000, 'das Gepäck der ersten Gruppe Gesteinsprobensammler der Mission zur Erschließung von Siliciumquellen', to_date('2025-01-01', 'YYYY-MM-DD'));

	for i in 1..1000 loop
		insert into LAGERPOSITION(LAGER_bezeichnung, regal_nr, position_nr) values('Siliciummission / Probensammler-Gruppe 2', 1, i);
	end loop;

    insert into MISSIONSGRUPPE(LAGER_bezeichnung, MISSION_id, titel, auftrag)
    values(
        'Siliciummission / Probensammler-Gruppe 2',
        missionsid,
        'Gesteinsproben Sammeln 2',
        'die Gruppe fährt zur potentiellen Siliciumquelle im Nord-Osten, sammelt eine Reihe von Gesteinsproben und kehrt zur Basis zurück. Dafür ist etwa ein Zeitraum von 2 Wochen geplant.'
    );
    select MISSIONSGRUPPE_seq.currval into gruppeid from dual;

    --- leitender Gesteinsprobensammler
    insert into JOB(RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet) values(raumid, gruppeid, 'leitender Gesteinsprobensammler', 'Leitung der zweiten Gesteinsprobensammler-Missionsgruppe, eine Reihe von Gesteinsproben von der potentiellen Siliciumquelle im Nord-Osten sammeln', 0, 4400, 0);
    select JOB_seq.currval into jobid from dual;
    select JOB_seq.currval into chefid from dual;
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Fahrzeug Führerschein');
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Mondfahrzeug Grundkurs');

    --- 3x Gesteinsprobensammler
    for i in 1..3 loop
        insert into JOB(CHEF_id, RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet) values(chefid, raumid, gruppeid, 'Gesteinsprobensammler', 'eine Reihe von Gesteinsproben von der potentiellen Siliciumquelle im Nord-Osten sammeln', 0, 4135, 0);
        select JOB_seq.currval into jobid from dual;
        insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Fahrzeug Führerschein');
        insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Mondfahrzeug Grundkurs');
    end loop;



    --- Gruppe: Gesteinsproben analysieren ---
    insert into MISSIONSGRUPPE(LAGER_bezeichnung, MISSION_id, titel, auftrag)
    values(
        'Laborgeräte-Lager',
        missionsid,
        'Gesteinsproben analysieren',
        'die Forschungsgruppe stellt mit den gesammelten Gesteinsproben geologische und chemische Forschungen im Labor an. Ziel der Untersuchung ist dabei, festzustellen ob sich der Silicumabbau in einer der Regionen ertragsmäßig lohnt, und zu erwartende Erträge beim Abbaus für potentielle Investoren des Projekts zu ermitteln'
    );
    select MISSIONSGRUPPE_seq.currval into gruppeid from dual;

    --- Geologie Dr. habil.
    select r.id
    into raumid
    from RAUM r
    join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
    where (g.name = 'Labor')
    and (r.bezeichnung = 'Geologie-Labor 1');

    insert into JOB(RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet)
    values(raumid, gruppeid, 'Geologie Forscher', 'Leitung der Forschungsgruppe, geologische Analyse der Gesteinsproben hinsichtlich Abbaubedingungen bei einer potentiellen Siliciumerschließung', 0, 5560, 0);
    select JOB_seq.currval into jobid from dual;
    select JOB_seq.currval into chefid from dual;
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Geologie Doktor');
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Geologie Habilitation');

    insert into ARBEITSZEIT(JOB_id, datum, schicht_beginn, schicht_ende)
    values(
        jobid,
        to_date('2025-02-16', 'YYYY-MM-DD'),
        to_date('08:00', 'HH24:MI'),
        to_date('14:00', 'HH24:MI')
    );

    --- Labortechnischer Assistent
    insert into JOB(CHEF_id, RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet)
    values(chefid, raumid, gruppeid, 'Labortechnischer Assistent', 'Technische Arbeiten im Geologielabor durchführen, Unterstützung des Dr. habil. Geologie, Instandhaltung der Laborgeräte', 0, 3540, 0);
    select JOB_seq.currval into jobid from dual;
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Labortechnischer Assistent Ausbildung');
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Fortbildung für Geologie-Labortechnik');

    insert into ARBEITSZEIT(JOB_id, datum, schicht_beginn, schicht_ende)
    values(
        jobid,
        to_date('2025-02-16', 'YYYY-MM-DD'),
        to_date('08:00', 'HH24:MI'),
        to_date('14:00', 'HH24:MI')
    );

    --- Chemie Dr. habil.
    select r.id
    into raumid
    from RAUM r
    join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
    where (g.name = 'Labor')
    and (r.bezeichnung = 'Chemie-Labor');

    insert into JOB(CHEF_id, RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet)
    values(chefid, raumid, gruppeid, 'Chemie Forscher', 'Chemische Analyse der Gesteinsproben hinsichtlich Siliciumgehalt der untersuchten Siliciumquellen', 0, 5560, 0);
    select JOB_seq.currval into chefid from dual;
    select JOB_seq.currval into jobid from dual;
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Chemie Doktor');
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Chemie Habilitation');

    insert into ARBEITSZEIT(JOB_id, datum, schicht_beginn, schicht_ende)
    values(
        jobid,
        to_date('2025-02-16', 'YYYY-MM-DD'),
        to_date('08:00', 'HH24:MI'),
        to_date('14:00', 'HH24:MI')
    );

    --- Labortechnischer Assistent
    insert into JOB(CHEF_id, RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet)
    values(chefid, raumid, gruppeid, 'Labortechnischer Assistent', 'Technische Arbeiten im Chemielabor durchführen, Unterstützung des Dr. habil. Chemie, Instandhaltung der Laborgeräte', 0, 3540, 0);
    select JOB_seq.currval into jobid from dual;
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Labortechnischer Assistent Ausbildung');
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Fortbildung für Chemie-Labortechnik');

    insert into ARBEITSZEIT(JOB_id, datum, schicht_beginn, schicht_ende)
    values(
        jobid,
        to_date('2025-02-16', 'YYYY-MM-DD'),
        to_date('08:00', 'HH24:MI'),
        to_date('14:00', 'HH24:MI')
    );
end;
/



--- Mission: Forschung zu Botanik auf dem Mond ---
declare
    missionsid  NUMBER(38);
    gruppeid    NUMBER(38);
    jobid       NUMBER(38);
    chefid      NUMBER(38);
    raumid      NUMBER(38);

begin
    --- Mission ---
    insert into MISSION(titel, auftrag, startdatum)
    values(
        'Forschung zu Botanik auf dem Mond',
        'Forschungsprojekt zur potentiell autarken Versorgung mit Nahrungsmitteln durch Botanik in künstlicher Umgebung (elektrisches Licht, maschinelle Sauerstoffgewinnung, etc.)',
        to_date('2025-02-15', 'YYYY-MM-DD')
    );
    select MISSION_seq.currval into missionsid from dual;

    --- Gruppe: Forschungsgruppe ---
    insert into MISSIONSGRUPPE(LAGER_bezeichnung, MISSION_id, titel, auftrag)
    values(
        'Laborgeräte-Lager',
        missionsid,
        'biologische Forschungsgruppe',
        'die Forschungsgruppe nimmt in Absprache mit der botanischen Leitung des Greenhouse Proben von Pflanzen aus dem Aeroponik- und Aquaponikbereich. Dieses werden dann im Biologielabor untersucht, ggf. können darauf hin weitere Pflanzen entsprechend der Bedfürfnisse der Forschungsgruppe im Greenhouse aufgezogen werden. Ziel der Untersuchung ist, eine Minimal-Demonstration einer (botanisch) autarken Pflanzenaufzucht zu erreichen, mit der entsprechende Nährwerte erreicht werden.'
    );
    select MISSIONSGRUPPE_seq.currval into gruppeid from dual;

    --- Biologie Dr. habil.
    select r.id
    into raumid
    from RAUM r
    join GEBAEUDE g on (r.gebaeude_standort_x = g.standort_x and r.gebaeude_standort_y = g.standort_y)
    where (g.name = 'Labor')
    and (r.bezeichnung = 'Biologie-Labor');

    insert into JOB(RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet)
    values(raumid, gruppeid, 'Biologie Forscher', 'Leitung der Forschungsgruppe, Biologische Analyse der botanischen Proben hinsichtlich Wiederstandsfähigkeit gegen die entsprechenden Bedingungen und hinsichtlich des Nährwertegehalts, Zusammenarbeit mit der Botanik im Greenhouse, Demonstration der minimalen, künstlichen Umgebung', 0, 5110, 0);
    select JOB_seq.currval into chefid from dual;
    select JOB_seq.currval into jobid from dual;
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Biologie Doktor');
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Biologie Habilitation');

    insert into ARBEITSZEIT(JOB_id, datum, schicht_beginn, schicht_ende)
    values(
        jobid,
        to_date('2025-02-16', 'YYYY-MM-DD'),
        to_date('08:00', 'HH24:MI'),
        to_date('14:00', 'HH24:MI')
    );

    --- Biologie Postdoc ---
    insert into JOB(CHEF_id, RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet)
    values(chefid, raumid, gruppeid, 'Biologie Postdoc', 'Forschungsarbeiten unter der Anleitung des leitenden Dr. habil. Biologie ausführen, in der übrigen Zeit kann an eigenen Projekten gearbeitet werden', 0, 4330, 0);
    select JOB_seq.currval into jobid from dual;
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Biologie Doktor');

    insert into ARBEITSZEIT(JOB_id, datum, schicht_beginn, schicht_ende)
    values(
        jobid,
        to_date('2025-02-16', 'YYYY-MM-DD'),
        to_date('08:00', 'HH24:MI'),
        to_date('16:00', 'HH24:MI')
    );

    --- Labortechnischer Assistent
    insert into JOB(CHEF_id, RAUM_id, GRUPPE_id, titel, auftrag, erledigt, gehalt, befristet)
    values(chefid, raumid, gruppeid, 'Labortechnischer Assistent', 'Technische Arbeiten im Biologielabor durchführen, Unterstützung des Dr. habil. Biologie, Instandhaltung der Laborgeräte', 0, 3325, 0);
    select JOB_seq.currval into jobid from dual;
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Labortechnischer Assistent Ausbildung');
    insert into JOBQUALIFIKATION(JOB_id, QUALI_bezeichnung) values(jobid, 'Fortbildung für Biologie-Labortechnik');

    insert into ARBEITSZEIT(JOB_id, datum, schicht_beginn, schicht_ende)
    values(
        jobid,
        to_date('2025-02-16', 'YYYY-MM-DD'),
        to_date('08:00', 'HH24:MI'),
        to_date('14:00', 'HH24:MI')
    );
end;
/