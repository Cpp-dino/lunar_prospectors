/*===============================================================*/
/*    U M F A N G   D E R   T A B E L L E N - E I N T R Ä G E    */
/*===============================================================*/


    select 'ANGEBOT' as "Name", count(*) as "Einträge"
    from ANGEBOT
union all
    select 'ARBEITSZEIT' as "Name", count(*) as "Einträge"
    from ARBEITSZEIT
union all
    select 'AUSGABE' as "Name", count(*) as "Einträge"
    from AUSGABE
union all
    select 'BESTELLUNG' as "Name", count(*) as "Einträge"
    from BESTELLUNG
union all
    select 'BEWERBUNG' as "Name", count(*) as "Einträge"
    from BEWERBUNG
union all
    select 'GEBAEUDE' as "Name", count(*) as "Einträge"
    from GEBAEUDE
union all
    select 'GERAET' as "Name", count(*) as "Einträge"
    from GERAET
union all
    select 'JOB' as "Name", count(*) as "Einträge"
    from JOB
union all
    select 'JOBGERAET' as "Name", count(*) as "Einträge"
    from JOBGERAET
union all
    select 'JOBQUALIFIKATION' as "Name", count(*) as "Einträge"
        from JOBQUALIFIKATION
union all
    select 'JOBRESSOURCE' as "Name", count(*) as "Einträge"
    from JOBRESSOURCE
union all
    select 'JOBVERGABE' as "Name", count(*) as "Einträge"
        from JOBVERGABE
union all
    select 'LAGER' as "Name", count(*) as "Einträge"
    from LAGER
union all
    select 'LAGERPOSITION' as "Name", count(*) as "Einträge"
    from LAGERPOSITION
union all
    select 'LAGERTRANSPORT' as "Name", count(*) as "Einträge"
    from LAGERTRANSPORT
union all
    select 'LIEFERANGEBOT' as "Name", count(*) as "Einträge"
    from LIEFERANGEBOT
union all
    select 'LIEFERANT' as "Name", count(*) as "Einträge"
    from LIEFERANT
union all
    select 'LIEFERBUCHUNG' as "Name", count(*) as "Einträge"
    from LIEFERBUCHUNG
union all
    select 'MAENGEL' as "Name", count(*) as "Einträge"
    from MAENGEL
union all
    select 'MISSION' as "Name", count(*) as "Einträge"
    from MISSION
union all
    select 'MISSIONSGRUPPE' as "Name", count(*) as "Einträge"
    from MISSIONSGRUPPE
union all
    select 'NACHWEIS' as "Name", count(*) as "Einträge"
    from NACHWEIS
union all
    select 'PERSON' as "Name", count(*) as "Einträge"
    from PERSON
union all
    select 'PERSONENBEFOERDERUNG' as "Name", count(*) as "Einträge"
    from PERSONENBEFOERDERUNG
union all
    select 'POSTEN' as "Name", count(*) as "Einträge"
    from POSTEN
union all
    select 'QUALIFIKATION' as "Name", count(*) as "Einträge"
    from QUALIFIKATION
union all
    select 'QUALIFIKATIONSNACHWEIS' as "Name", count(*) as "Einträge"
    from QUALIFIKATIONSNACHWEIS
union all
    select 'RAUM' as "Name", count(*) as "Einträge"
    from RAUM
union all
    select 'RESSOURCE' as "Name", count(*) as "Einträge"
    from RESSOURCE
union all
    select 'TRANSPORTPOSTEN' as "Name", count(*) as "Einträge"
    from TRANSPORTPOSTEN
/