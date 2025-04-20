
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	   	          	L I E F E R A N T	E N 			              */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


--- für die Erzeugung von Testdaten ist ein Trigger zu deaktivieren, da hiermit im normalen Betrieb
--- geprüft wird, ob SYSDATE bei einer neuen BUCHUNGEN vor dem entsprechenden Liefertermin bzw. der Deadline liegt,
--- Einträge über gebuchte Lieferungen in der Vergangeheit könnten ansonten hier nicht erstellt werden
alter trigger TRG_LIEFBUCH_B_INS
disable
/



declare
   lieferantid NUMBER(38);
   angebotid   NUMBER(38);
   buchungid   NUMBER(38);

begin
   --- Space X ---
   insert into LIEFERANT(name, telefon, iban, email)
   values('Space X', '+1 310-363-6000', 'IE79 3844 7724 8517 63', 'customer@spacex.com');
   select LIEFERANT_seq.currval into lieferantid from dual;

   --- 2025-01-06 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2024-12-23', 'YYYY-MM-DD'), to_date('2025-01-06', 'YYYY-MM-DD'), (400 * 1000.000), 400, 10, 700000.00);

   select LIEFERANGEBOT_seq.currval into angebotid from dual;
   select LIEFERBUCHUNG_seq.nextval into buchungid from dual;
   insert into LIEFERBUCHUNG(id, LAGER_bezeichnung, ANGEBOT_id, bestell_deadline)
   values(buchungid, 'Importlager', angebotid, to_date('2024-12-30', 'YYYY-MM-DD'));

   --- 2025-01-20 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-01-06', 'YYYY-MM-DD'), to_date('2025-01-20', 'YYYY-MM-DD'), (250 * 1000.000), 250, 25, 450000.00);

   --- 2025-02-03 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-01-20', 'YYYY-MM-DD'), to_date('2025-02-03', 'YYYY-MM-DD'), (400 * 1200.000), 400, 10, 700000.00);

   select LIEFERANGEBOT_seq.currval into angebotid from dual;
   select LIEFERBUCHUNG_seq.nextval into buchungid from dual;
   insert into LIEFERBUCHUNG(id, LAGER_bezeichnung, ANGEBOT_id, bestell_deadline)
   values(buchungid, 'Importlager', angebotid, to_date('2025-01-27', 'YYYY-MM-DD'));

   --- 2025-02-17 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-02-03', 'YYYY-MM-DD'), to_date('2025-02-17', 'YYYY-MM-DD'), (250 * 1000.000), 250, 25, 450000.00);

   --- 2025-03-03 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-02-17', 'YYYY-MM-DD'), to_date('2025-03-03', 'YYYY-MM-DD'), (400 * 1200.000), 400, 10, 700000.00);

   select LIEFERANGEBOT_seq.currval into angebotid from dual;
   select LIEFERBUCHUNG_seq.nextval into buchungid from dual;
   insert into LIEFERBUCHUNG(id, LAGER_bezeichnung, ANGEBOT_id, bestell_deadline)
   values(buchungid, 'Importlager', angebotid, to_date('2025-02-24', 'YYYY-MM-DD'));

   --- 2025-03-17 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-03-03', 'YYYY-MM-DD'), to_date('2025-03-17', 'YYYY-MM-DD'), (250 * 1000.000), 250, 25, 450000.00);

   --- 2025-03-31 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-03-17', 'YYYY-MM-DD'), to_date('2025-03-31', 'YYYY-MM-DD'), (400 * 1200.000), 400, 10, 700000.00);



   --- Blue Origin ---
   insert into LIEFERANT(name, telefon, iban, email)
   values('Blue Origin', '+1 72-314-62', 'IE21 3248 2914 7441 88', 'delivery@blueorigin.com');
   select LIEFERANT_seq.currval into lieferantid from dual;

   --- 2025-01-27 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-01-10', 'YYYY-MM-DD'), to_date('2025-01-27', 'YYYY-MM-DD'), (200 * 900.000), 200, 30, 580000.00);

   select LIEFERANGEBOT_seq.currval into angebotid from dual;
   select LIEFERBUCHUNG_seq.nextval into buchungid from dual;
   insert into LIEFERBUCHUNG(id, LAGER_bezeichnung, ANGEBOT_id, bestell_deadline)
   values(buchungid, 'Importlager', angebotid, to_date('2025-01-20', 'YYYY-MM-DD'));

   --- 2025-02-27 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-02-10', 'YYYY-MM-DD'), to_date('2025-02-27', 'YYYY-MM-DD'), (200 * 900.000), 200, 30, 580000.00);

   --- 2025-03-27 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-03-10', 'YYYY-MM-DD'), to_date('2025-03-27', 'YYYY-MM-DD'), (200 * 900.000), 200, 30, 580000.00);

   --- 2025-04-27 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-04-10', 'YYYY-MM-DD'), to_date('2025-04-27', 'YYYY-MM-DD'), (200 * 900.000), 200, 30, 580000.00);



   --- Virgin Galactic ---
   insert into LIEFERANT(name, telefon, iban, email)
   values('Virgin Galactic', '+1 801-12-6', 'UK44 9461 7721 8525 44', 'contact@virgingalactic.com');
   select LIEFERANT_seq.currval into lieferantid from dual;

   --- 2025-01-25 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-01-20', 'YYYY-MM-DD'), to_date('2025-01-25', 'YYYY-MM-DD'), (240 * 1100.000), 240, 0, 515000.00);

   --- 2025-02-20 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-02-15', 'YYYY-MM-DD'), to_date('2025-02-20', 'YYYY-MM-DD'), (240 * 1100.000), 240, 0, 515000.00);

   --- 2025-02-25 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-03-20', 'YYYY-MM-DD'), to_date('2025-03-25', 'YYYY-MM-DD'), (240 * 1100.000), 240, 0, 515000.00);

   --- 2025-03-20 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-04-15', 'YYYY-MM-DD'), to_date('2025-04-20', 'YYYY-MM-DD'), (240 * 1100.000), 240, 0, 515000.00);



   --- Deutscher Raumversand ---
   insert into LIEFERANT(name, telefon, iban, email)
   values('Deutscher Raumversand', '+49 736-829-273', 'DE11 9028 6351 7498 23', 'delivery@deutscher_raumversand.de');
   select LIEFERANT_seq.currval into lieferantid from dual;

   --- 2025-02-15 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-01-18', 'YYYY-MM-DD'), to_date('2025-02-15', 'YYYY-MM-DD'), (150 * 800.000), 150, 0, 390000.00);

   select LIEFERANGEBOT_seq.currval into angebotid from dual;
   select LIEFERBUCHUNG_seq.nextval into buchungid from dual;
   insert into LIEFERBUCHUNG(id, LAGER_bezeichnung, ANGEBOT_id, bestell_deadline)
   values(buchungid, 'Importlager', angebotid, to_date('2025-02-02', 'YYYY-MM-DD'));

   --- 2025-04-15 ---
   insert into LIEFERANGEBOT(lieferant_id, buchung_deadline, liefertermin, gewicht_limit, kapazitaet_limit, personen_limit, lieferkosten)
   values(lieferantid, to_date('2025-03-18', 'YYYY-MM-DD'), to_date('2025-04-15', 'YYYY-MM-DD'), (150 * 800.000), 150, 0, 390000.00);
end;
/



--- für den Normalbetrieb ist der entsprechende Trigger selbstverständlich wieder aktiv (und problemfrei)
alter trigger TRG_LIEFBUCH_B_INS
enable
/





/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	        A N G E B O T E  -  B E S T E L L U N G E N	        */
/*                L A G E R T R A N S P O R T E                  */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


--- hier wird ebenfalls im Normalbetrieb durch einen Trigger geprüft, ob SYSDATE bei einer neuen BESTELLUNGEN vor der Deadline liegt,
--- Einträge über Bestellungen für Lieferungen in der Vergangeheit könnten ansonsten hier nicht erstellt werden
alter trigger TRG_BESTELLUNG_B_INS
disable
/



--- ANGEBOTE, POSTEN (für die ANGEBOTE), BESTELLUNGEN und LAGERTRANSPORTE
--- für die POSTEN der letzten Lieferung von Anfang Januar erstellen
declare
   postenid          NUMBER(38);
   duplikate_anzahl  NUMBER(38);
   posten_anzahl     NUMBER(38);

begin
   --- LAGERTRANSPORT vom Import-Lager zu den jeweiligen LAGERN erstellen
   insert into LAGERTRANSPORT(START_bezeichnung, ZIEL_bezeichnung, termin)
   values('Importlager', 'Zentral-Depot 1', to_date('2025-01-12', 'YYYY-MM-DD'));
   
   insert into LAGERTRANSPORT(START_bezeichnung, ZIEL_bezeichnung, termin)
   values('Importlager', 'Zentral-Depot 2', to_date('2025-01-12', 'YYYY-MM-DD'));

   insert into LAGERTRANSPORT(START_bezeichnung, ZIEL_bezeichnung, termin)
   values('Importlager', 'Kantinen-Kühllager', to_date('2025-01-17', 'YYYY-MM-DD'));

   --- ANGEBOTE und BESTELLUNGEN der letzten Lieferung vom 06.01. erstellen
   for post in (
      select *
      from POSTEN
      where trunc(datum_eingang) = to_date('2025-01-11', 'YYYY-MM-DD')
      or trunc(datum_eingang) = to_date('2025-01-16', 'YYYY-MM-DD')
   ) loop
      --- LAGERTRANSPORT vom Import-Lager zum entsprechenden Lager hinzufügen
      insert into TRANSPORTPOSTEN(POSTEN_id, TRANSPORT_id)
      values(
         post.id,
         (
            select transport.id
            from LAGERTRANSPORT transport
            join LAGERPOSITION position on transport.ZIEL_bezeichnung = position.LAGER_bezeichnung
            where position.POSTEN_id = post.id
         )
      );

      --- bei mehrfachen POSTEN des selben Produkts im LAGER,
      --- nur ein ANGEBOT dieses Produkts erstellen, nicht mehrfach hinzufügen 
      select count(id)
      into duplikate_anzahl
      from POSTEN
      where typ = 'ANGEBOT'
      and RESSOURCE_id = post.RESSOURCE_id;

      if (duplikate_anzahl = 0) then
         --- POSTEN für das neue ANGEBOT erstellen
         --- in verschiedener Bündelung (ca. 250 / ca. 500 / ca. 1000)
         if(post.anzahl > 300) then
            insert into POSTEN(gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
            values(post.gewicht, (post.kaufpreis * 0.60), post.RESSOURCE_id, (post.anzahl / 2), post.hersteller);

            select POSTEN_seq.currval into postenid from dual;

            --- ANGEBOT für den LIEFERANTEN SpaceX hinzufügen
            insert into ANGEBOT(POSTEN_id, LIEFERANT_id)
            values(
               postenid,
               (select id from LIEFERANT where name = 'Space X')
            );
         end if;

         if(post.anzahl > 600) then
            insert into POSTEN(gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
            values(post.gewicht, (post.kaufpreis * 0.36), post.RESSOURCE_id, (post.anzahl / 4), post.hersteller);

            select POSTEN_seq.currval into postenid from dual;

            --- ANGEBOT für den LIEFERANTEN SpaceX hinzufügen
            insert into ANGEBOT(POSTEN_id, LIEFERANT_id)
            values(
               postenid,
               (select id from LIEFERANT where name = 'Space X')
            );
         end if;

         insert into POSTEN(gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
         values(post.gewicht, post.kaufpreis, post.RESSOURCE_id, post.anzahl, post.hersteller);

         select POSTEN_seq.currval into postenid from dual;

         --- ANGEBOT für den LIEFERANTEN SpaceX hinzufügen
         insert into ANGEBOT(POSTEN_id, LIEFERANT_id)
         values(
            postenid,
            (select id from LIEFERANT where name = 'Space X')
         );

         --- Anzahl dieses POSTEN für die Anzahl in BESTELLUNG ermitteln
         select count(id)
         into posten_anzahl
         from POSTEN
         where (
            trunc(datum_eingang) = to_date('2025-01-11', 'YYYY-MM-DD')
            or trunc(datum_eingang) = to_date('2025-01-16', 'YYYY-MM-DD')
         )
         and (RESSOURCE_id = post.RESSOURCE_id);

         --- BESTELLUNG für die entsprechende LIEFERBUCHUNG hinzufügen
         insert into BESTELLUNG(POSTEN_id, BUCHUNG_id, anzahl)
         values(
            postenid,
            (
               select lieferant.id
               from LIEFERBUCHUNG buchung
               join LIEFERANGEBOT angebot on angebot.id = buchung.ANGEBOT_id
               join LIEFERANT lieferant on lieferant.id = angebot.LIEFERANT_id
               where lieferant.name = 'Space X'
               and angebot.liefertermin = to_date('2025-01-06', 'YYYY-MM-DD')
            ),
            posten_anzahl
         );
      end if;
   end loop;
end;
/



--- für den Normalbetrieb ist der entsprechende Trigger ebenfalls wieder aktiv (und problemfrei)
alter trigger TRG_BESTELLUNG_B_INS
enable
/



--- ANGEBOTE und POSTEN (für die ANGEBOTE)
--- für die restlichen GERAETE und RESSOURCEN erstellen
declare
   postenid          NUMBER(38);
   duplikate_anzahl  NUMBER(38);

   rest2             NUMBER(1) := 0;

begin
   --- ANGEBOTE für die übrigen GERAETE und RESSOURCEN erstellen
   for post in (
      select *
      from POSTEN
      where trunc(datum_eingang) != to_date('2025-01-11', 'YYYY-MM-DD')
      and trunc(datum_eingang) != to_date('2025-01-16', 'YYYY-MM-DD')
      and typ = 'LAGER_BESTAND'
   ) loop
      --- bei mehrfachen POSTEN des selben Produkts im LAGER,
      --- nur ein ANGEBOT dieses Produkts pro LIEFERANT erstellen, nicht mehrfach hinzufügen
      select count(posten.id)
      into duplikate_anzahl
      from POSTEN posten
      join ANGEBOT angebot on angebot.POSTEN_id = posten.id
      where typ = 'ANGEBOT'
      and coalesce(posten.RESSOURCE_id, posten.GERAET_id) = coalesce(post.RESSOURCE_id, post.GERAET_id);

      --- jeweils abwechselnd LIEFERANTEN mit gerader / ungerader ID durchgehen
      --- somit hat jeder LIEFERANT eine Auswahl ANGEBOTE über ca. 50% der Produkte
      for lief in (select * from LIEFERANT where mod(id, 2) = rest2) loop
         if (duplikate_anzahl = 0) then
            --- POSTEN für das neue ANGEBOT erstellen
            --- für RESSOURCEN-POSTEN: in verschiedener Bündelung (ca. 250 / ca. 500 / ca. 1000)
            if ((post.RESSOURCE_id is not null) and (post.anzahl > 300)) then
               insert into POSTEN(gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
               values(post.gewicht, (post.kaufpreis * 0.60), post.RESSOURCE_id, (post.anzahl / 2), post.hersteller);

               select POSTEN_seq.currval into postenid from dual;

               --- ANGEBOT für diesen LIEFERANTEN hinzufügen
               insert into ANGEBOT(POSTEN_id, LIEFERANT_id)
               values(postenid, lief.id);
            end if;

            if ((post.RESSOURCE_id is not null) and (post.anzahl > 600)) then
               insert into POSTEN(gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
               values(post.gewicht, (post.kaufpreis * 0.36), post.RESSOURCE_id, (post.anzahl / 4), post.hersteller);

               select POSTEN_seq.currval into postenid from dual;

               --- ANGEBOT für diesen LIEFERANTEN hinzufügen
               insert into ANGEBOT(POSTEN_id, LIEFERANT_id)
               values(postenid, lief.id);
            end if;

            --- ist der POSTEN eine RESSOURCE oder ein GERAET ?
            --- gemäß des Typs passendes Insert-Statement verwenden
            if (post.RESSOURCE_id is not null) then
               insert into POSTEN(gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
               values(post.gewicht, post.kaufpreis, post.RESSOURCE_id, post.anzahl, post.hersteller);
            else
               insert into POSTEN(gewicht, kaufpreis, GERAET_id, "ALTER")
               values(post.gewicht, post.kaufpreis, post.GERAET_id, post."ALTER");
            end if;

            select POSTEN_seq.currval into postenid from dual;

            --- ANGEBOT für diesen LIEFERANTEN hinzufügen
            insert into ANGEBOT(POSTEN_id, LIEFERANT_id)
            values(postenid, lief.id);
         end if;
      end loop;

      --- der nächste POSTEN gilt wieder für die anderen LIEFERANTEN
      if (rest2 = 0) then
         rest2 := 1;
      else
         rest2 := 0;
      end if;
   end loop;
end;
/





/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	     	  P E R S O N E N B E F O E R D E R U N G E N			  */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


--- hier wird ebenfalls im Normalbetrieb durch einen Trigger geprüft, ob
--- SYSDATE bei einer neuen PERSONENBEFOERDERUNG vor der Deadline liegt,
--- Einträge über PERSONENBEFOERDERUNG für Lieferungen in der Vergangeheit
--- könnten ansonsten hier nicht erstellt werden
alter trigger TRG_PERSBEF_B_INS
disable
/



--- PERSONENBEFOERDERUNGEN für willkürlich ausgewählte PERSONEN erstellen,
--- um alle freien Plätze der kommenden, gebuchten LIEFERUNGEN zu belegen
declare
   gepaeck     NUMBER(6, 3) := 20.000;
   persbefid   NUMBER(38);

begin
   --- alle gebuchten Lieferungen durchgehen
   for lieferung in (
      select lieferbuchung.id, lieferangebot.liefertermin, lieferangebot.personen_limit
      from LIEFERBUCHUNG lieferbuchung
      join LIEFERANGEBOT lieferangebot on lieferbuchung.ANGEBOT_id = lieferangebot.id
   ) loop
      --- PERSONEN auswählen, in der Anzahl abhängig vom Personenlimit der Lieferung,
      --- für die keine JOBS nach dem entsprechenden Abflugdatum (bzw. Liefertermin) vorliegen
      --- (falls keine JOBS vorhanden, wird einfach 01.01.2000 als Platzhalter verwendet - dadurch wird die PERSON
      --- als ohne JOBS nach dem Abflugdatum betrachtet (alle Lieferungen liegen zeitlich definitv dahinter)
      for pers in (
         select *
         from PERSON person
         where person.abreise_datum is null
         and ((
            select nvl(min(zeit.datum), to_date('2000-01-01', 'YYYY-MM-DD'))
            from ARBEITSZEIT zeit
            join JOB job on job.id = zeit.JOB_id
            join JOBVERGABE vergabe on vergabe.id = job.VERGABE_id
            where vergabe.PERSON_id = person.id
         ) < lieferung.liefertermin)
         fetch first lieferung.personen_limit rows only
      ) loop
         --- Liefertermin als Abreisedatum in PERSON übernehmen
         update PERSON
         set abreise_datum = lieferung.liefertermin
         where id = pers.id;

         --- PERSONENBEFOERDERUNG für diese PERSON erstellen
         select PERSONENBEFOERDERUNG_seq.nextval into persbefid from dual;
         insert into PERSONENBEFOERDERUNG(id, BUCHUNG_id, gepaeck_gewicht, PERSON_id, richtung)
         values(persbefid, lieferung.id, gepaeck, pers.id, 1);

         --- Gepäck-Gewicht für die nächste Person generieren (willkürliche Werte zwischen 20 und 40kg)
         gepaeck := ((mod(pers.id, 20000) + 20000) / 1000);
      end loop;
   end loop;
end;
/



--- für den Normalbetrieb ist der entsprechende Trigger ebenfalls wieder aktiv (und problemfrei)
alter trigger TRG_PERSBEF_B_INS
enable
/