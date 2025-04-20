
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	   	          	     P O S T E N 			                    */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


--- Großes Maschinenlager ---
declare
   produktid   NUMBER(38);
   postenid    NUMBER(38);

begin
   insert into GERAET(bezeichnung, hersteller)
   values('Schweißgerät', 'Bosch');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..6 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-02-14', 'YYYY-MM-DD'), 121.310, 719.99, produktid, to_date('2023-08-14', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Schweißgerät', 'ESAB');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..7 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-02-14', 'YYYY-MM-DD'), 155.270, 1499.99, produktid, to_date('2023-10-03', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Bohrmaschine', 'Makita');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..9 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-02-14', 'YYYY-MM-DD'), 14.360, 249.99, produktid, to_date('2023-09-17', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Bohrmaschine', 'Bosch');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..12 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-02-14', 'YYYY-MM-DD'), 12.890, 329.99, produktid, to_date('2024-01-26', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Akkuschrauber', 'Festtool');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..23 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-02-14', 'YYYY-MM-DD'), 4.630, 79.99, produktid, to_date('2023-11-15', 'YYYY-MM-DD'), NULL);
   end loop;

   insert into GERAET(bezeichnung, hersteller)
   values('Akkuschrauber', 'Bosch');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..18 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-02-14', 'YYYY-MM-DD'), 6.390, 119.99, produktid, to_date('2023-12-09', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Nass-Trocken-Sauger', 'Kärcher');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..2 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-05-28', 'YYYY-MM-DD'), 138.120, 2499.99, produktid, to_date('2024-02-08', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Kompaktbagger', 'Caterpillar');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2023-10-02', 'YYYY-MM-DD'), 832.650, 6799.99, produktid, to_date('2022-03-10', 'YYYY-MM-DD'), NULL);
   select POSTEN_seq.currval into postenid from dual;

   insert into MAENGEL(POSTEN_id, beschreibung, dringlichkeit)
   values(postenid, 'Wartungsintervall schreibt für den 12.03.2025 eine technische Überprüfung vor', 1);


   insert into GERAET(bezeichnung, hersteller)
   values('Betonmischer', 'Kubota');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..2 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2023-10-02', 'YYYY-MM-DD'), 178.380, 499.99, produktid, to_date('2023-05-17', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Serverschrank', 'Dell');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..4 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-06-07', 'YYYY-MM-DD'), 54.720, 399.99, produktid, to_date('2024-03-17', 'YYYY-MM-DD'), NULL);
   end loop;

   insert into GERAET(bezeichnung, hersteller)
   values('Serverschrank', 'HP');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..7 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2023-08-18', 'YYYY-MM-DD'), 51.970, 429.99, produktid, to_date('2023-02-01', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('MRT-Gerät', 'Siemens');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2023-12-20', 'YYYY-MM-DD'), 947.140, 239000.00, produktid, to_date('2021-08-04', 'YYYY-MM-DD'), NULL);
   select POSTEN_seq.currval into postenid from dual;

   insert into MAENGEL(POSTEN_id, beschreibung, dringlichkeit)
   values(postenid, 'Wartungsintervall schreibt für den 23.05.2025 eine technische Überprüfung vor', 1);
   insert into MAENGEL(POSTEN_id, beschreibung, dringlichkeit)
   values(postenid, 'am 06.07.2023 wurde ein elektronischer Fehler festgestellt: Erzeugung von Bilddaten erfolgt mit einzelnen, geringfügigen Bildfehler, die entsprechende Meldung deutet auf einen Fehler der Sensor-Elektronik hin', 2);


   insert into GERAET(bezeichnung, hersteller)
   values('EKG-Monitor', 'Phillips');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..3 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2023-12-20', 'YYYY-MM-DD'), 94.350, 9800.00, produktid, to_date('2021-08-04', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Anästhesie-Gerät', 'Dräger');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2023-12-20', 'YYYY-MM-DD'), 124.620, 14900.00, produktid, to_date('2021-08-04', 'YYYY-MM-DD'), NULL);


   insert into GERAET(bezeichnung, hersteller)
   values('Rohrventilator', 'Atlas Copco');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..7 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-07-20', 'YYYY-MM-DD'), 38.730, 2389.00, produktid, to_date('2024-05-18', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Kompressor', 'Atlas Copco');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..6 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-07-20', 'YYYY-MM-DD'), 87.190, 1849.00, produktid, to_date('2024-05-18', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Flüssigpumpe', 'Atlas Copco');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..7 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-07-20', 'YYYY-MM-DD'), 102.930, 1994.00, produktid, to_date('2024-05-18', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Industrie-Geschirrspüler', 'Miele');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..8 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-03-22', 'YYYY-MM-DD'), 213.540, 4499.99, produktid, to_date('2022-05-12', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Industrie-Waschmaschine', 'Miele');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..16 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-03-22', 'YYYY-MM-DD'), 251.640, 5999.99, produktid, to_date('2022-09-07', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Industrie-Kältemaschine', 'Siemens');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..5 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-03-22', 'YYYY-MM-DD'), 45.720, 1989.95, produktid, to_date('2022-08-01', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Sauerstoffrückgewinnungsanlage', 'Siemens');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..3 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2023-12-11', 'YYYY-MM-DD'), 717.290, 14499.95, produktid, to_date('2023-10-15', 'YYYY-MM-DD'), NULL);
      select POSTEN_seq.currval into postenid from dual;

      insert into MAENGEL(POSTEN_id, beschreibung, dringlichkeit)
      values(postenid, 'Wartungsintervall schreibt für den 01.02.2025 eine technische Überprüfung vor (lebenswichtige Versorgung, Termin unbedingt einhalten)', 1);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Umkehr-Osmose-Anlage', 'Siemens');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..4 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2023-12-11', 'YYYY-MM-DD'), 241.800, 9449.95, produktid, to_date('2023-08-24', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Dieselgenerator', 'Caterpillar');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..4 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2023-12-11', 'YYYY-MM-DD'), 828.320, 4990.00, produktid, to_date('2023-04-04', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Blockheizkraftwerk', 'Viessmann');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..6 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2023-12-11', 'YYYY-MM-DD'), 287.740, 3699.98, produktid, to_date('2022-03-20', 'YYYY-MM-DD'), NULL);
   end loop;
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Großes Maschinenlager';

   select min(id)
   into postenid
   from POSTEN;


   for i in 1..162 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Werkstattlager (Großes Maschinenlager) ---
declare
   produktid NUMBER(38);

begin
   insert into RESSOURCE(bezeichnung, typ)
   values('Mutter 10mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-12', 'YYYY-MM-DD'), 687.730, 3499.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Mutter 15mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-23', 'YYYY-MM-DD'), 748.360, 3999.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Mutter 20mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-12', 'YYYY-MM-DD'), 831.750, 4499.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Mutter 25mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-07', 'YYYY-MM-DD'), 912.960, 4999.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Schraube 10mm (100)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-07', 'YYYY-MM-DD'), 631.930, 3499.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Schraube 15mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-12', 'YYYY-MM-DD'), 743.280, 3999.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Schraube 20mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-12', 'YYYY-MM-DD'), 837.110, 4499.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Schraube 25mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-23', 'YYYY-MM-DD'), 988.990, 4999.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Motoröl 500ml', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-23', 'YYYY-MM-DD'), 351.180, 5299.99, produktid, 500, 'Castrol');


   insert into RESSOURCE(bezeichnung, typ)
   values('Silikon 700ml', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-12', 'YYYY-MM-DD'), 604.230, 6699.99, produktid, 500, 'Bau-Master');


   insert into RESSOURCE(bezeichnung, typ)
   values('Kugellager 15mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-12', 'YYYY-MM-DD'), 537.740, 5499.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Kugellager 30mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-12', 'YYYY-MM-DD'), 992.210, 5999.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Zahnrad 150mm', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-12', 'YYYY-MM-DD'), 1434.210, 3499.95, produktid, 250, 'Eska');


   insert into RESSOURCE(bezeichnung, typ)
   values('Zahnrad 225mm', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-12', 'YYYY-MM-DD'), 1983.480, 4199.95, produktid, 250, 'Eska');


   insert into RESSOURCE(bezeichnung, typ)
   values('Elektromotor (50x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-07', 'YYYY-MM-DD'), 648.350, 6799.99, produktid, 1025, 'Reichelt Elektronik');


   insert into RESSOURCE(bezeichnung, typ)
   values('Transformator 250V / 15V (50x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-07', 'YYYY-MM-DD'), 871.720, 8399.99, produktid, 980, 'Reichelt Elektronik');


   insert into RESSOURCE(bezeichnung, typ)
   values('Transformator 250V / 3V (50x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-07', 'YYYY-MM-DD'), 724.810, 7699.99, produktid, 980, 'Reichelt Elektronik');
   

   insert into RESSOURCE(bezeichnung, typ)
   values('Relais (50x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-07', 'YYYY-MM-DD'), 694.770, 4899.99, produktid, 1120, 'Reichelt Elektronik');


   insert into RESSOURCE(bezeichnung, typ)
   values('Sicherung 5A (50x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-07', 'YYYY-MM-DD'), 541.490, 2799.99, produktid, 950, 'Reichelt Elektronik');


   insert into RESSOURCE(bezeichnung, typ)
   values('Sicherung 40A (50x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-07', 'YYYY-MM-DD'), 593.980, 2899.99, produktid, 950, 'Reichelt Elektronik');


   insert into RESSOURCE(bezeichnung, typ)
   values('Kompressorring 15mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-23', 'YYYY-MM-DD'), 334.210, 1999.95, produktid, 900, 'Eska');


   insert into RESSOURCE(bezeichnung, typ)
   values('Kompressorring 27mm (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-23', 'YYYY-MM-DD'), 484.240, 1999.95, produktid, 900, 'Eska');


   insert into RESSOURCE(bezeichnung, typ)
   values('Druckventil (100x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-23', 'YYYY-MM-DD'), 581.360, 2449.95, produktid, 900, 'Eska');


   insert into RESSOURCE(bezeichnung, typ)
   values('Pneumatikzylinder (50x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-23', 'YYYY-MM-DD'), 1287.840, 4299.95, produktid, 780, 'Eska');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Werkstattlager (Großes Maschinenlager)';

   select (min(id) + 162) 
   into postenid
   from POSTEN;


   for i in 1..24 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Treibstofffabrik-Ersatzteilelager ---
declare
   produktid NUMBER(38);

begin
   select id into produktid
   from GERAET
   where bezeichnung = 'Rohrventilator'
   and hersteller = 'Atlas Copco';

   for i in 1..3 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-10-12', 'YYYY-MM-DD'), 38.730, 2389.00, produktid, to_date('2024-07-23', 'YYYY-MM-DD'), NULL);
   end loop;


   select id into produktid
   from GERAET
   where bezeichnung = 'Kompressor'
   and hersteller = 'Atlas Copco';

   for i in 1..7 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-10-12', 'YYYY-MM-DD'), 87.190, 1849.00, produktid, to_date('2024-07-23', 'YYYY-MM-DD'), NULL);
   end loop;


   select id into produktid
   from GERAET
   where bezeichnung = 'Flüssigpumpe'
   and hersteller = 'Atlas Copco';

   for i in 1..12 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-10-12', 'YYYY-MM-DD'), 102.930, 1994.00, produktid, to_date('2024-07-23', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into RESSOURCE(bezeichnung, typ)
   values('Rohrleitung (gerade) 75mm', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-10-12', 'YYYY-MM-DD'), 2375.510, 1849.95, produktid, 185, 'Eska');


   insert into RESSOURCE(bezeichnung, typ)
   values('Rohrleitung (Eckstück) 75mm', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-10-12', 'YYYY-MM-DD'), 2375.510, 2149.95, produktid, 185, 'Eska');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Kompressorring 15mm (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-10-12', 'YYYY-MM-DD'), 334.210, 1999.95, produktid, 900, 'Eska');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Kompressorring 27mm (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-10-12', 'YYYY-MM-DD'), 484.240, 1999.95, produktid, 900, 'Eska');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Druckventil (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-10-12', 'YYYY-MM-DD'), 581.360, 2449.95, produktid, 900, 'Eska');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Pneumatikzylinder (50x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-10-12', 'YYYY-MM-DD'), 1287.840, 4299.95, produktid, 780, 'Eska');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Mutter 15mm (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-10-12', 'YYYY-MM-DD'), 831.750, 4499.98, produktid, 1000, 'Frey');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Schraube 15mm (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-10-12', 'YYYY-MM-DD'), 743.280, 3999.98, produktid, 1000, 'Frey');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Treibstofffabrik-Ersatzteilelager';

   select (min(id) + 186)
   into postenid
   from POSTEN;


   for i in 1..30 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Wasseraufbereitung-Gerätelager ---
declare
   produktid   NUMBER(38);

begin
   select id into produktid
   from GERAET
   where bezeichnung = 'Flüssigpumpe'
   and hersteller = 'Atlas Copco';

   for i in 1..7 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-05-12', 'YYYY-MM-DD'), 102.930, 1994.00, produktid, to_date('2024-02-19', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Absaugpumpe', 'Bosch');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..4 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-05-12', 'YYYY-MM-DD'), 189.240, 2399.99, produktid, to_date('2024-02-19', 'YYYY-MM-DD'), NULL);
   end loop;


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Rohrleitung (gerade) 75mm'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-12', 'YYYY-MM-DD'), 2375.510, 1849.95, produktid, 120, 'Eska');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Rohrleitung (Eckstück) 75mm'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-12', 'YYYY-MM-DD'), 2375.510, 2149.95, produktid, 120, 'Eska');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Mutter 15mm (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-12', 'YYYY-MM-DD'), 831.750, 4499.98, produktid, 400, 'Frey');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Schraube 15mm (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-12', 'YYYY-MM-DD'), 743.280, 3999.98, produktid, 400, 'Frey');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Wasseraufbereitung-Gerätelager';

   select (min(id) + 216)
   into postenid
   from POSTEN;


   for i in 1..15 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Wasseraufbereitung-Chemiekalienlager ---
declare
   produktid   NUMBER(38);

begin
   insert into RESSOURCE(bezeichnung, typ)
   values('Natriumhypochlorid 20kg', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 2121.790, 7999.95, produktid, 100, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Natriumpellets 5kg', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 627.310, 3999.95, produktid, 100, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Kaliumpellets 5kg', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 626.780, 3999.95, produktid, 100, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Magnesiumpellets 5kg', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 628.280, 3999.95, produktid, 100, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Calciumpellets 5kg', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 629.130, 3999.95, produktid, 100, 'Bayer');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Wasseraufbereitung-Chemiekalienlager';

   select (min(id) + 231)
   into postenid
   from POSTEN;


   for i in 1..5 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Solarpark-Gerätelager ---
declare
   produktid NUMBER(38);

begin
   select id into produktid
   from GERAET
   where bezeichnung = 'Dieselgenerator'
   and hersteller = 'Caterpillar';

   for i in 1..2 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2023-11-19', 'YYYY-MM-DD'), 828.320, 4990.00, produktid, to_date('2023-04-04', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Hochspannungstransformator 45V / 15kV', 'Siemens');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..3 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2023-12-16', 'YYYY-MM-DD'), 1129.260, 12995.00, produktid, to_date('2022-06-02', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Leistungswechselrichter 100kW', 'Siemens');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..3 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2023-12-16', 'YYYY-MM-DD'), 1532.390, 14995.00, produktid, to_date('2022-05-29', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into RESSOURCE(bezeichnung, typ)
   values('Photovoltaikmodul 45V 5A', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-23', 'YYYY-MM-DD'), 1973.140, 22495.00, produktid, 225, 'Reichelt Elektronik');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Transformator 250V / 3V (50x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-23', 'YYYY-MM-DD'), 724.810, 7699.99, produktid, 980, 'Reichelt Elektronik');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Relais (50x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-23', 'YYYY-MM-DD'), 694.770, 4899.99, produktid, 1120, 'Reichelt Elektronik');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Sicherung 5A (50x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-23', 'YYYY-MM-DD'), 541.490, 2799.99, produktid, 950, 'Reichelt Elektronik');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Sicherung 40A (50x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-23', 'YYYY-MM-DD'), 593.980, 2899.99, produktid, 950, 'Reichelt Elektronik');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Solarpark-Gerätelager';

   select (min(id) + 236)
   into postenid
   from POSTEN;


   for i in 1..13 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/





--- Fahrzeug-Ersatzteilelager ---
declare
   produktid NUMBER(38);

begin
   insert into RESSOURCE(bezeichnung, typ)
   values('Zahnriemen 20mm / 1m', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-22', 'YYYY-MM-DD'), 1434.210, 3499.95, produktid, 250, 'Eska');


   insert into RESSOURCE(bezeichnung, typ)
   values('Keilriemen 20mm / 1m', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-07-22', 'YYYY-MM-DD'), 1528.150, 3499.95, produktid, 250, 'Eska');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Mutter 15mm (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-28', 'YYYY-MM-DD'), 748.360, 3999.98, produktid, 1000, 'Frey');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Mutter 25mm (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-28', 'YYYY-MM-DD'), 912.960, 4999.98, produktid, 1000, 'Frey');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Schraube 15mm (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-28', 'YYYY-MM-DD'), 743.280, 3999.98, produktid, 400, 'Frey');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Schraube 25mm (100x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-28', 'YYYY-MM-DD'), 988.990, 4999.98, produktid, 1000, 'Frey');


   insert into RESSOURCE(bezeichnung, typ)
   values('Getriebeöl 500ml', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-12', 'YYYY-MM-DD'), 351.180, 5299.99, produktid, 500, 'Castrol');


   insert into RESSOURCE(bezeichnung, typ)
   values('Kugellager 30mm (10x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-28', 'YYYY-MM-DD'), 992.210, 5999.98, produktid, 1000, 'Frey');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Zahnrad 150mm'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-28', 'YYYY-MM-DD'), 1434.210, 3499.95, produktid, 250, 'Eska');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Zahnrad 225mm'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-28', 'YYYY-MM-DD'), 1983.480, 4199.95, produktid, 250, 'Eska');


   insert into RESSOURCE(bezeichnung, typ)
   values('Batteriemodul 400V / 1000 Ah', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..3 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
      values(to_date('2024-09-14', 'YYYY-MM-DD'), 4512.840, 9898.00, produktid, 100, 'BMW');
   end loop;


   insert into RESSOURCE(bezeichnung, typ)
   values('Autobatterie 15V / 80 Ah', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-14', 'YYYY-MM-DD'), 2139.350, 3498.00, produktid, 100, 'BMW');


   insert into RESSOURCE(bezeichnung, typ)
   values('Asynchron-Elektromotor 400V / 10 A', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..2 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
      values(to_date('2024-09-14', 'YYYY-MM-DD'), 3792.180, 7298.00, produktid, 100, 'BMW');
   end loop;


   insert into RESSOURCE(bezeichnung, typ)
   values('Wechselrichter 1000W', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-14', 'YYYY-MM-DD'), 1753.470, 2648.00, produktid, 400, 'BMW');


   insert into RESSOURCE(bezeichnung, typ)
   values('Transformator 400V / 15V (50x)', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-14', 'YYYY-MM-DD'), 1535.240, 2498.00, produktid, 400, 'BMW');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Relais (50x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-27', 'YYYY-MM-DD'), 694.770, 4899.99, produktid, 1120, 'Reichelt Elektronik');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Sicherung 5A (50x)'
   and typ = 'Ersatzteile';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-27', 'YYYY-MM-DD'), 593.980, 2899.99, produktid, 950, 'Reichelt Elektronik');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Fahrzeug-Ersatzteilelager';

   select (min(id) + 249)
   into postenid
   from POSTEN;


   for i in 1..20 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Werkstattlager (Fahrzeugwerkstatt) ---
declare
   produktid NUMBER(38);

begin
   select id into produktid
   from GERAET
   where bezeichnung = 'Schweißgerät'
   and hersteller = 'ESAB';

   for i in 1..5 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-04-19', 'YYYY-MM-DD'), 155.270, 1499.99, produktid, to_date('2023-10-03', 'YYYY-MM-DD'), NULL);
   end loop;


   select id into produktid
   from GERAET
   where bezeichnung = 'Bohrmaschine'
   and hersteller = 'Makita';

   for i in 1..3 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-04-19', 'YYYY-MM-DD'), 14.360, 249.99, produktid, to_date('2023-09-17', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Schlagschrauber', 'Bosch');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..3 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-04-19', 'YYYY-MM-DD'), 21.660, 249.95, produktid, to_date('2023-09-05', 'YYYY-MM-DD'), NULL);
   end loop;


   select id into produktid
   from GERAET
   where bezeichnung = 'Akkuschrauber'
   and hersteller = 'Festtool';

   for i in 1..23 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-04-19', 'YYYY-MM-DD'), 4.630, 79.99, produktid, to_date('2023-11-15', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into RESSOURCE(bezeichnung, typ)
   values('Schutzgas 10l', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..10 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
      values(to_date('2024-04-19', 'YYYY-MM-DD'), 2702.380, 799.95, produktid, 25, 'Bayer');
   end loop;
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Werkstattlager (Fahrzeugwerkstatt)';

   select (min(id) + 269)
   into postenid
   from POSTEN;


   for i in 1..44 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Kleines Maschinenlager ---
declare
   produktid   NUMBER(38);
   postenid    NUMBER(38);

begin
   insert into GERAET(bezeichnung, hersteller)
   values('Scheren-Hebebühne', 'Nussbaum');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-02-23', 'YYYY-MM-DD'), 3819.650, 6799.99, produktid, to_date('2022-03-10', 'YYYY-MM-DD'), NULL);
   select POSTEN_seq.currval into postenid from dual;

   insert into MAENGEL(POSTEN_id, beschreibung, dringlichkeit)
   values(postenid, 'am 04.11.2023 wurde ein Mängel festgestellt: der Haltebolzen (linke Seite) ist beschädigt, wurde notdürftig durch zwei verschweißte 15mm Schrauben ersetzt, mit der nächsten Lieferung des Ersatzteils bitte umgehend austauschen', 5);


   insert into GERAET(bezeichnung, hersteller)
   values('Batterie-Hebeplatform', 'AC Hydraulik');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-02-23', 'YYYY-MM-DD'), 897.520, 4984.95, produktid, to_date('2022-08-29', 'YYYY-MM-DD'), NULL);


   insert into GERAET(bezeichnung, hersteller)
   values('Hochvolt-Trenner', 'AVL');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-02-23', 'YYYY-MM-DD'), 319.230, 2149.99, produktid, to_date('2023-08-13', 'YYYY-MM-DD'), NULL);
   select POSTEN_seq.currval into postenid from dual;

   insert into MAENGEL(POSTEN_id, beschreibung, dringlichkeit)
   values(postenid, 'Wartungsintervall schreibt für den 17.08.2024 eine technische Überprüfung vor (ACHTUNG: Wartungsintervall überschritten)', 3);


   insert into GERAET(bezeichnung, hersteller)
   values('Achsvermessungsanlage', 'Hofmann');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-02-23', 'YYYY-MM-DD'), 1283.310, 4999.99, produktid, to_date('2023-10-06', 'YYYY-MM-DD'), NULL);


   insert into GERAET(bezeichnung, hersteller)
   values('Reifenwucht-Gerät', 'Hofmann');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-02-23', 'YYYY-MM-DD'), 127.230, 894.99, produktid, to_date('2023-09-17', 'YYYY-MM-DD'), NULL);


   insert into GERAET(bezeichnung, hersteller)
   values('Reifenmontier-Gerät', 'Hofmann');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-02-23', 'YYYY-MM-DD'), 186.220, 599.99, produktid, to_date('2023-09-17', 'YYYY-MM-DD'), NULL);
   select POSTEN_seq.currval into postenid from dual;

   insert into MAENGEL(POSTEN_id, beschreibung, dringlichkeit)
   values(postenid, 'am 07.01.2025 wurde ein Mängel festgestellt: Isolierung des Stromkabels ist beschädigt, bitte umgehend austauschen', 6);
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Kleines Maschinenlager';

   select (min(id) + 313)
   into postenid
   from POSTEN;


   for i in 1..6 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Raketenreparatur-Lager ---
declare
   produktid   NUMBER(38);

begin
   select id into produktid
   from GERAET
   where bezeichnung = 'Schweißgerät'
   and hersteller = 'ESAB';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-08-09', 'YYYY-MM-DD'), 155.270, 1499.99, produktid, to_date('2023-10-03', 'YYYY-MM-DD'), NULL);


   select id into produktid
   from GERAET
   where bezeichnung = 'Bohrmaschine'
   and hersteller = 'Makita';

   for i in 1..2 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
      values(to_date('2024-08-09', 'YYYY-MM-DD'), 14.360, 249.99, produktid, to_date('2023-09-17', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into RESSOURCE(bezeichnung, typ)
   values('Triebwerksmantel 500mm', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..5 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
      values(to_date('2024-08-09', 'YYYY-MM-DD'), 979.130, 1799.95, produktid, 1, 'Space X');
   end loop;


   insert into RESSOURCE(bezeichnung, typ)
   values('Triebwerksmantel 2500mm', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..5 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
      values(to_date('2024-08-09', 'YYYY-MM-DD'), 1739.320, 2799.95, produktid, 1, 'Space X');
   end loop;


   insert into RESSOURCE(bezeichnung, typ)
   values('Triebwerksmantel 5000mm', 'Ersatzteile');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..3 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
      values(to_date('2024-08-09', 'YYYY-MM-DD'), 2892.380, 3799.95, produktid, 1, 'Space X');
   end loop;


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Schutzgas 10l'
   and typ = 'Verbrauchsprodukte';

   for i in 1..8 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-09', 'YYYY-MM-DD'), 2702.380, 799.95, produktid, 25, 'Bayer');
   end loop;
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Raketenreparatur-Lager';

   select (min(id) + 319)
   into postenid
   from POSTEN;


   for i in 1..24 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Botaniklager ---
declare
   produktid   NUMBER(38);

begin
   insert into RESSOURCE(bezeichnung, typ)
   values('Kartoffel Saatgut 100g', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 702.380, 499.95, produktid, 1000, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Paprika Saatgut 100g', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 702.890, 499.95, produktid, 1000, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Aloe Vera Saatgut 100g', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 703.420, 499.95, produktid, 1000, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Hortensien Saatgut 100g', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 703.080, 499.95, produktid, 1000, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Birkenfeige Saatgut 100g', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 702.120, 499.95, produktid, 1000, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Bambus Saatgut 100g', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 702.620, 499.95, produktid, 1000, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Gummibaum 100g', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 702.310, 499.95, produktid, 1000, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Düngemittel 10kg', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 1067.380, 379.95, produktid, 100, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Unkrautvernichter 750ml', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 421.260, 949.95, produktid, 250, 'Bayer');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Botaniklager';

   select (min(id) + 343)
   into postenid
   from POSTEN;


   for i in 1..9 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Laborgeräte-Lager ---
declare
   produktid   NUMBER(38);

begin
   insert into GERAET(bezeichnung, hersteller)
   values('Mikroskop', 'Zeiss');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..5 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-05-02', 'YYYY-MM-DD'), 14.360, 994.99, produktid, to_date('2024-01-30', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Zentrifuge', 'Eppendorf');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..3 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-05-02', 'YYYY-MM-DD'), 34.830, 1499.99, produktid, to_date('2024-01-21', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Laborwaage', 'Mettler Toledo');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..6 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-05-02', 'YYYY-MM-DD'), 18.170, 829.95, produktid, to_date('2024-01-27', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('pH-Messgerät', 'Hanna Instruments');
   select PRODUKT_seq.currval into produktid from dual;

   for i in 1..4 loop
      insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-05-02', 'YYYY-MM-DD'), 7.660, 649.99, produktid, to_date('2024-02-04', 'YYYY-MM-DD'), NULL);
   end loop;


   insert into GERAET(bezeichnung, hersteller)
   values('Spektorphotmeter', 'Tuttnauer');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, GERAET_id, "ALTER", hersteller)
   values(to_date('2024-05-02', 'YYYY-MM-DD'), 148.360, 4499.95, produktid, to_date('2024-02-15', 'YYYY-MM-DD'), NULL);
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Laborgeräte-Lager';

   select (min(id) + 352)
   into postenid
   from POSTEN;


   for i in 1..19 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Reinigungslager (Wohnkomplex A) ---
declare
   produktid   NUMBER(38);

begin
   insert into RESSOURCE(bezeichnung, typ)
   values('Bodenreiniger 1000ml', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 692.260, 990.95, produktid, 500, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Amoniak 450ml', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 389.170, 1294.95, produktid, 500, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Waschmittel Weiss', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 328.190, 598.95, produktid, 1000, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Waschmittel Bunt', 'Verbrauchsprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 327.840, 598.95, produktid, 1000, 'Bayer');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Reinigungslager (Wohnkomplex A)';

   select (min(id) + 371)
   into postenid
   from POSTEN;


   for i in 1..4 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Reinigungslager (Wohnkomplex B) ---
declare
   produktid   NUMBER(38);

begin
   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Bodenreiniger 1000ml'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 692.260, 990.95, produktid, 500, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Amoniak 450ml'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 389.170, 1294.95, produktid, 500, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Waschmittel Weiss'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 328.190, 598.95, produktid, 1000, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Waschmittel Bunt'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 327.840, 598.95, produktid, 1000, 'Bayer');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Reinigungslager (Wohnkomplex B)';

   select (min(id) + 375)
   into postenid
   from POSTEN;


   for i in 1..4 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Reinigungslager (Unterkunft Ost) ---
declare
   produktid   NUMBER(38);

begin
   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Bodenreiniger 1000ml'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 692.260, 990.95, produktid, 250, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Amoniak 450ml'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 389.170, 1294.95, produktid, 250, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Waschmittel Weiss'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 328.190, 598.95, produktid, 500, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Waschmittel Bunt'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-29', 'YYYY-MM-DD'), 327.840, 598.95, produktid, 500, 'Bayer');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Reinigungslager (Unterkunft Ost)';

   select (min(id) + 379)
   into postenid
   from POSTEN;


   for i in 1..4 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Zentral-Depot 3 ---
declare
   produktid   NUMBER(38);

begin
   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Bodenreiniger 1000ml'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-21', 'YYYY-MM-DD'), 692.260, 990.95, produktid, 500, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Amoniak 450ml'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-21', 'YYYY-MM-DD'), 389.170, 1294.95, produktid, 500, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Waschmittel Weiss'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-21', 'YYYY-MM-DD'), 328.190, 598.95, produktid, 1000, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Waschmittel Bunt'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-05-21', 'YYYY-MM-DD'), 327.840, 598.95, produktid, 1000, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Natriumhypochlorid 20kg'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-18', 'YYYY-MM-DD'), 2121.790, 7999.95, produktid, 100, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Natriumpellets 5kg'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-18', 'YYYY-MM-DD'), 627.310, 3999.95, produktid, 100, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Kaliumpellets 5kg'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-18', 'YYYY-MM-DD'), 626.780, 3999.95, produktid, 100, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Magnesiumpellets 5kg'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-18', 'YYYY-MM-DD'), 628.280, 3999.95, produktid, 100, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Calciumpellets 5kg'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-08-18', 'YYYY-MM-DD'), 629.130, 3999.95, produktid, 100, 'Bayer');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Motoröl 500ml'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-04', 'YYYY-MM-DD'), 351.180, 5299.99, produktid, 500, 'Castrol');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Silikon 700ml'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-04', 'YYYY-MM-DD'), 604.230, 6699.99, produktid, 500, 'Bau-Master');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Getriebeöl 500ml'
   and typ = 'Verbrauchsprodukte';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-04', 'YYYY-MM-DD'), 351.180, 5299.99, produktid, 500, 'Castrol');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Zentral-Depot 3';

   select (min(id) + 383)
   into postenid
   from POSTEN;


   for i in 1..12 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Kantinen-Kühllager ---
declare
   produktid   NUMBER(38);

begin
   insert into RESSOURCE(bezeichnung, typ)
   values('Rindfleisch 200g', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 321.180, 1899.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Hähnchenbrust 200g', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 323.230, 1794.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Lachsfilet 100g', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 233.150, 2394.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Milch 1l', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 183.330, 1499.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Butter 250g', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 357.470, 2199.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Eier (12x)', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 424.780, 2399.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Kartoffeln 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 1127.840, 2894.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Zwiebeln 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 1128.210, 2894.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Tomaten 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 1128.160, 3199.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Paprika 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 1128.130, 3199.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Eisbergsalat 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 1127.780, 2699.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Reis 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 1128.270, 1894.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Nudeln 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 1127.910, 1894.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Weizenmehl 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 1127.990, 1199.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Zucker 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 1128.200, 1494.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Salz 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-16', 'YYYY-MM-DD'), 1127.960, 1494.99, produktid, 1000, 'EDEKA');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Kantinen-Kühllager';

   select (min(id) + 395)
   into postenid
   from POSTEN;


   for i in 1..16 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Zentral-Depot 1 ---
declare
   produktid   NUMBER(38);

begin
   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Kartoffeln 1kg'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1127.840, 2894.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Zwiebeln 1kg'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1128.210, 2894.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Tomaten 1kg'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1128.160, 3199.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Paprika 1kg'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1128.130, 3199.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Eisbergsalat 1kg'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1127.780, 2699.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Äpfel 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1128.180, 2194.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Bananen 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1128.140, 2194.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Erbeeren 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1128.210, 2194.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Reis 1kg'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1128.270, 1894.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Nudeln 1kg'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1127.910, 1894.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Weizenmehl 1kg'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1127.990, 1199.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Zucker 1kg'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1128.200, 1494.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Salz 1kg'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1127.960, 1494.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Kaffee 1kg', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1128.330, 4994.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Rotwein 1l', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1342.830, 7994.99, produktid, 790, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Weisswein 1l', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1343.270, 7994.99, produktid, 790, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Bier 500ml', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1642.580, 4994.99, produktid, 980, 'EDEKA');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Zentral-Depot 1';

   select (min(id) + 411)
   into postenid
   from POSTEN;


   for i in 1..17 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Zentral-Depot 2 ---
declare
   produktid   NUMBER(38);

begin
   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Rindfleisch 200g'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 321.180, 1899.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Hähnchenbrust 200g'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 323.230, 1794.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Lachsfilet 100g'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 233.150, 2394.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Salami 500g', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1342.830, 2199.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Schnittkäse 500g', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 1342.740, 2199.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Hartkäse 250g', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 328.260, 2494.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Weichkäse 250', 'Lebensmittel');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 328.110, 2494.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Milch 1l'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 183.330, 1499.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Butter 250g'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 357.470, 2199.99, produktid, 1000, 'EDEKA');


   select id into produktid
   from RESSOURCE
   where bezeichnung = 'Eier (12x)'
   and typ = 'Lebensmittel';

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 424.780, 2399.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Duschgel 275ml', 'Drogerieprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 384.670, 2294.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Shampoo 275ml', 'Drogerieprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 385.140, 2294.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Zahnpasta 65ml', 'Drogerieprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 217.710, 1899.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Einwegrasierer (10x)', 'Drogerieprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 241.620, 2199.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Deodorant 120ml', 'Drogerieprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 236.660, 2294.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Damenbinden (30x)', 'Drogerieprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 191.440, 2494.99, produktid, 1000, 'EDEKA');


   insert into RESSOURCE(bezeichnung, typ)
   values('Tampons (25x)', 'Drogerieprodukte');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2025-01-11', 'YYYY-MM-DD'), 197.280, 2494.99, produktid, 1000, 'EDEKA');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Zentral-Depot 2';

   select (min(id) + 428)
   into postenid
   from POSTEN;


   for i in 1..17 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/



--- Krankenhaus-Apotheke ---
declare
   produktid   NUMBER(38);

begin
   insert into RESSOURCE(bezeichnung, typ)
   values('Ibuprofen 300mg (20x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 136.040, 8999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Paracetamol 250mg (20x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 144.860, 8999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Diazepam 10mg (10x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 229.150, 12999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Morphin 50mg (10x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 222.590, 12999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Adrenalin 1mg (5x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 226.440, 12999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Atropin 1mg (10x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 221.360, 8999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Amiodaron 300mg (20x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 131.970, 7999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Lidocain 50mg (10x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 136.610, 8999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Dobutamin 800ug (10x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 127.070, 7999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Magnesiumsulfat 1g (50x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 137.170, 3999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Midazolam 5mg (20x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 124.940, 7999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Propofol 1mg (20x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 213.880, 12999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Etomidat 60mg (12x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 125.910, 7999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Succinylcholin 100mg (10x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 136.280, 7999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Mannitol 100g', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 149.230, 3999.95, produktid, 250, 'Bayer');


   insert into RESSOURCE(bezeichnung, typ)
   values('Amoxcilin 250mg (50x)', 'Medikamente');
   select PRODUKT_seq.currval into produktid from dual;

   insert into POSTEN(datum_eingang, gewicht, kaufpreis, RESSOURCE_id, anzahl, hersteller)
   values(to_date('2024-09-27', 'YYYY-MM-DD'), 168.790, 6999.95, produktid, 250, 'Bayer');
end;
/

declare
   positionid  NUMBER(38);
   postenid    NUMBER(38);

begin
   select min(id)
   into positionid
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Krankenhaus-Apotheke';

   select (min(id) + 445)
   into postenid
   from POSTEN;


   for i in 1..16 loop
      update LAGERPOSITION
      set POSTEN_ID = postenid
      where id = positionid;

      select min(id) into positionid from LAGERPOSITION where id > positionid;
      postenid := postenid + 1;
   end loop;
end;
/





/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	   	          	    A U S G A B E N			                 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

--- geht die LAGER Zentral-Depot 1 / 2 und das Kühllager der Kantine durch
--- für jeden Tag der letzten 6 Wochen wird pro PERSON eine AUSGABE mit einer RESSOURCE vermerkt
declare
   postenid_first NUMBER(38);
   postenid_last  NUMBER(38);
   postenid       NUMBER(38);

   ressid         NUMBER(38);
   posteneingang  DATE;

   startdate      DATE        := to_date('2024-12-01', 'YYYY-MM-DD');
   rest2          NUMBER(1)   := 0;

begin
   --- ID des ersten POSTEN und letzten POSTEN der gefragten LAGER ermitteln
   --- danach wird für jede PERSON der nächste POSTEN als Ausgabe genommen,
   --- um eine starke Varianz an AUSGABEN zu erzeugen
   select min(POSTEN_id)
   into postenid_first
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Kantinen-Kühllager';

   select max(POSTEN_id)
   into postenid_last
   from LAGERPOSITION
   where LAGER_bezeichnung = 'Zentral-Depot 2';

   postenid := postenid_first;

   --- jeden (zweiten) Tag seit 01.12.2024 durchgehen
   for tag in 0..23 loop
      --- jede zweite PERSON durchgehen (abwechselnde erhält
      --- jeweils eine Hälfte der PERSONEN entsprechende AUSGABEN)
      for person in (select * from PERSON where (mod(id, 1) = rest2)) loop

         --- Ressource des entsprechenden POSTEN ermitteln
         --- (in den entsprechenden LAGERN gibt es nur RESSOURCEN, keine GERAETE)
         select RESSOURCE_id, datum_eingang
         into ressid, posteneingang
         from POSTEN
         where id = postenid;

         --- neue AUSGABE dieser RESSOURCE, an diese PERSON, an diesem Tag hinzufügen
         --- (ür die Anzahl wird eine willkürliche Zahl zwischen 1 und 3 aus den IDs generiert)
         insert into AUSGABE(RESSOURCE_id, PERSON_id, datum, anzahl)
         values(
            ressid,
            person.id,
            (startdate + (2 * tag)),
            (mod((person.id + ressid), 3) + 1)
         );

         --- betrifft die AUSGABE den aktuellen POSTEN im Lager ?
         --- (oder einen alten, mitlerweile leeren, ersetzten Posten)
         if (posteneingang < (startdate + (2 * tag))) then
            --- Anzahl im entsprechenden POSTEN gemäß der AUSGABE reduzieren
            update POSTEN
            set anzahl = anzahl - (mod((person.id + ressid), 3) + 1)
            where id = postenid;
         end if;

         --- für die nächste AUSGABE (bzw. nächste PERSON) zum nächsten POSTEN gehen
         --- am Ende angelangt, wieder beim ersten POSTEN beginnen
         postenid := postenid + 1;

         if (postenid > postenid_last) then
            postenid := postenid_first;
         end if;
      end loop;

      --- für den nächsten Termin, andere Hälfte der PERSONEN verwenden
      rest2 := mod((rest2 + 1), 1);
   end loop;
end;
/
