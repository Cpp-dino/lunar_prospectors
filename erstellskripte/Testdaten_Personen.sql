/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	   		            P E R S O N E N		  		             */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


--- temporäre Hilfstabelle mit regionalen Vornamen ---
create table TMP_VORNAMEN (
   NAME         CHAR(25 CHAR)   not null,
   NATION       CHAR(50 CHAR)   not null
)
/

alter table TMP_VORNAMEN
    add constraint TMP_VORNAMEN_PK_CONS primary key (NAME, NATION)
/



--- temporäre Hilfstabelle mit regionalen Nachnamen ---
create table TMP_NACHNAMEN(
   NAME         CHAR(25 CHAR)   not null,
   NATION       CHAR(50 CHAR)   not null
)
/

alter table TMP_NACHNAMEN
    add constraint TMP_NACHNAMEN_PK_CONS primary key (NAME, NATION)
/



--- temporäre Hilfstabelle mit regionalen Fakultäten / Betrieben ---
create global temporary table TMP_FAKULTAET (
    ID  NUMBER(38) not null,
    NAME CHAR(50 CHAR) not null
)
/

alter table TMP_FAKULTAET
    add constraint TMP_FAKULTAET_PK_CONS primary key (ID, NAME)
/



insert into  TMP_FAKULTAET(id, name) values(1, 'IHK Deutschland');
insert into  TMP_FAKULTAET(id, name) values(2,'AGF Paris');
insert into  TMP_FAKULTAET(id, name) values(3, 'Agenzia Lavaro');
insert into  TMP_FAKULTAET(id, name) values(4, 'Trabajo de Agencia Spanien');
insert into  TMP_FAKULTAET(id, name) values(5, 'Arbeitsförmedeling');
insert into  TMP_FAKULTAET(id, name) values(6, 'IAF');
insert into  TMP_FAKULTAET(id, name) values(7, 'IAF');
insert into  TMP_FAKULTAET(id, name) values(8, 'African Work Agency');
insert into  TMP_FAKULTAET(id, name) values(9,'Employment Arabia');
insert into  TMP_FAKULTAET(id, name) values(10, 'Agenzia Lavaro');
insert into  TMP_FAKULTAET(id, name) values(11, 'rojagaar egensee');
insert into  TMP_FAKULTAET(id, name) values(12, 'Shigoto Nagasaki');
insert into  TMP_FAKULTAET(id, name) values(13,  'Employment Arabia');
insert into  TMP_FAKULTAET(id, name) values(14,  'TAL Thailand');
insert into  TMP_FAKULTAET(id, name) values(15,   'NextStep Quebec');
insert into  TMP_FAKULTAET(id, name) values(16,  'HUF Teheran');
insert into  TMP_FAKULTAET(id, name) values(17,  'AVODA Tel AViv');

insert into  TMP_FAKULTAET(id, name) values(101, 'Meisterbetrieb Scheuer');
insert into  TMP_FAKULTAET(id, name) values(102,  'Artisanale Cardan');
insert into  TMP_FAKULTAET(id, name) values(103, 'Operazione Rosso');
insert into  TMP_FAKULTAET(id, name) values(104,  'Maestro Garcia');
insert into  TMP_FAKULTAET(id, name) values(105, 'Dashi Gongsi Wong');
insert into  TMP_FAKULTAET(id, name) values(106, 'Mästara Erikson');
insert into  TMP_FAKULTAET(id, name) values(107, 'Work Agency Nigeria');
insert into  TMP_FAKULTAET(id, name) values(108, 'Emplyoment Iraq');
insert into  TMP_FAKULTAET(id, name) values(109, 'Meisterbetrieb Niemeyer');
insert into  TMP_FAKULTAET(id, name) values(110, 'Meisterbetrieb Meyer');
insert into  TMP_FAKULTAET(id, name) values(111, 'Shigoto Nagasaki');
insert into  TMP_FAKULTAET(id, name) values(112, 'Alyarsia Al-Huf');
insert into  TMP_FAKULTAET(id, name) values(113, 'Meisterbetrieb Neumann');
insert into  TMP_FAKULTAET(id, name) values(114, 'NextStep Washington');
insert into  TMP_FAKULTAET(id, name) values(115, 'Trabalhar Salta');
insert into  TMP_FAKULTAET(id, name) values(116, 'Meisterbetrieb Otzen');
insert into  TMP_FAKULTAET(id, name) values(117, 'Meisterbetrieb Schröder');

insert into  TMP_FAKULTAET(id, name) values(201, 'TU München');
insert into  TMP_FAKULTAET(id, name) values(202, 'College Interantionale');
insert into  TMP_FAKULTAET(id, name) values(203, 'Universita Paris');
insert into  TMP_FAKULTAET(id, name) values(204, 'Maestro Garcia');
insert into  TMP_FAKULTAET(id, name) values(205, 'RWTH Aachen');
insert into  TMP_FAKULTAET(id, name) values(206, 'Universiät Stockholm');
insert into  TMP_FAKULTAET(id, name) values(207, 'International University Nigeria');
insert into  TMP_FAKULTAET(id, name) values(208, 'International University Iraq');
insert into  TMP_FAKULTAET(id, name) values(209, 'TU Dresden');
insert into  TMP_FAKULTAET(id, name) values(210, 'Panafrican University');
insert into  TMP_FAKULTAET(id, name) values(211, 'Hochschule Bielefeld');
insert into  TMP_FAKULTAET(id, name) values(212, 'Cambridge University');
insert into  TMP_FAKULTAET(id, name) values(213, 'MIT');
insert into  TMP_FAKULTAET(id, name) values(214, 'Caltech');
insert into  TMP_FAKULTAET(id, name) values(215, 'Universität Sydney');
insert into  TMP_FAKULTAET(id, name) values(216, 'Universität Krasnodar');
insert into  TMP_FAKULTAET(id, name) values(217, 'Hochschule Athen');



insert into TMP_VORNAMEN(name, nation) values('Max', 'Deutschland');
insert into TMP_VORNAMEN(name, nation) values('Johann', 'Deutschland');
insert into TMP_VORNAMEN(name, nation) values('Julia', 'Deutschland');
insert into TMP_VORNAMEN(name, nation) values('Sarah', 'Deutschland');
insert into TMP_VORNAMEN(name, nation) values('Christian', 'Deutschland');
insert into TMP_VORNAMEN(name, nation) values('Mair', 'Frankreich');
insert into TMP_VORNAMEN(name, nation) values('Pierre', 'Frankreich');
insert into TMP_VORNAMEN(name, nation) values('Sophie', 'Frankreich');
insert into TMP_VORNAMEN(name, nation) values('Felice', 'Italien');
insert into TMP_VORNAMEN(name, nation) values('Alessandro', 'Italien');
insert into TMP_VORNAMEN(name, nation) values('Giulia', 'Italien');
insert into TMP_VORNAMEN(name, nation) values('Matteo', 'Italien');
insert into TMP_VORNAMEN(name, nation) values('Andrea', 'Italien');
insert into TMP_VORNAMEN(name, nation) values('Lucia', 'Spanien');
insert into TMP_VORNAMEN(name, nation) values('Valeria', 'Spanien');
insert into TMP_VORNAMEN(name, nation) values('Carmen', 'Spanien');
insert into TMP_VORNAMEN(name, nation) values('Jose', 'Spanien');
insert into TMP_VORNAMEN(name, nation) values('Erik', 'Schweden');
insert into TMP_VORNAMEN(name, nation) values('Hugo', 'Schweden');
insert into TMP_VORNAMEN(name, nation) values('Linnea', 'Schweden');
insert into TMP_VORNAMEN(name, nation) values('Emma', 'Schweden');
insert into TMP_VORNAMEN(name, nation) values('Efik', 'Nigeria');
insert into TMP_VORNAMEN(name, nation) values('Amina', 'Nigeria');
insert into TMP_VORNAMEN(name, nation) values('Chidi', 'Nigeria');
insert into TMP_VORNAMEN(name, nation) values('Ngozo', 'Nigeria');
insert into TMP_VORNAMEN(name, nation) values('Haias', 'Irak');
insert into TMP_VORNAMEN(name, nation) values('Omar', 'Irak');
insert into TMP_VORNAMEN(name, nation) values('Layla', 'Irak');
insert into TMP_VORNAMEN(name, nation) values('Ahmed', 'Irak');
insert into TMP_VORNAMEN(name, nation) values('Saguia', 'Westsahara');
insert into TMP_VORNAMEN(name, nation) values('Zanele', 'Westsahara');
insert into TMP_VORNAMEN(name, nation) values('Thando', 'Westsahara');
insert into TMP_VORNAMEN(name, nation) values('Sipho', 'Westsahara');
insert into TMP_VORNAMEN(name, nation) values('Luo', 'Kenia');
insert into TMP_VORNAMEN(name, nation) values('Kamba', 'Kenia');
insert into TMP_VORNAMEN(name, nation) values('Mwangi', 'Kenia');
insert into TMP_VORNAMEN(name, nation) values('Wafula', 'Kenia');
insert into TMP_VORNAMEN(name, nation) values('Ibrahim', 'Marokko');
insert into TMP_VORNAMEN(name, nation) values('Njoroge', 'Marokko');
insert into TMP_VORNAMEN(name, nation) values('Fatima', 'Marokko');
insert into TMP_VORNAMEN(name, nation) values('Mohammed', 'Marokko');
insert into TMP_VORNAMEN(name, nation) values('Zhao', 'China');
insert into TMP_VORNAMEN(name, nation) values('Chen', 'China');
insert into TMP_VORNAMEN(name, nation) values('Wu', 'China');
insert into TMP_VORNAMEN(name, nation) values('Xi', 'China');
insert into TMP_VORNAMEN(name, nation) values('Zedong', 'China');
insert into TMP_VORNAMEN(name, nation) values('Ning', 'China');
insert into TMP_VORNAMEN(name, nation) values('Jun', 'China');
insert into TMP_VORNAMEN(name, nation) values('Li', 'China');
insert into TMP_VORNAMEN(name, nation) values('Haruto', 'Japan');
insert into TMP_VORNAMEN(name, nation) values('Sana', 'Japan');
insert into TMP_VORNAMEN(name, nation) values('Tsumugi', 'Japan');
insert into TMP_VORNAMEN(name, nation) values('Haruki', 'Japan');
insert into TMP_VORNAMEN(name, nation) values('Yumi', 'Japan');
insert into TMP_VORNAMEN(name, nation) values('Akira', 'Japan');
insert into TMP_VORNAMEN(name, nation) values('Arav', 'Indien');
insert into TMP_VORNAMEN(name, nation) values('Priya', 'Indien');
insert into TMP_VORNAMEN(name, nation) values('Rohan', 'Indien');
insert into TMP_VORNAMEN(name, nation) values('Amal', 'Indien');
insert into TMP_VORNAMEN(name, nation) values('Dinesh', 'Indien');
insert into TMP_VORNAMEN(name, nation) values('Nilay', 'Indien');
insert into TMP_VORNAMEN(name, nation) values('Nayan', 'Indien');
insert into TMP_VORNAMEN(name, nation) values('Abdullah', 'Saudi Arabien');
insert into TMP_VORNAMEN(name, nation) values('Khalid', 'Saudi Arabien');
insert into TMP_VORNAMEN(name, nation) values('Faisal', 'Saudi Arabien');
insert into TMP_VORNAMEN(name, nation) values('Apichat', 'Thailand');
insert into TMP_VORNAMEN(name, nation) values('Supansa', 'Thailand');
insert into TMP_VORNAMEN(name, nation) values('Somchai', 'Thailand');
insert into TMP_VORNAMEN(name, nation) values('Thomas', 'USA');
insert into TMP_VORNAMEN(name, nation) values('Rose', 'USA');
insert into TMP_VORNAMEN(name, nation) values('John', 'USA');
insert into TMP_VORNAMEN(name, nation) values('Emily', 'USA');
insert into TMP_VORNAMEN(name, nation) values('Michael', 'USA');
insert into TMP_VORNAMEN(name, nation) values('George', 'USA');
insert into TMP_VORNAMEN(name, nation) values('Steve', 'USA');
insert into TMP_VORNAMEN(name, nation) values('Sarah', 'USA');
insert into TMP_VORNAMEN(name, nation) values('Julia', 'USA');
insert into TMP_VORNAMEN(name, nation) values('Peter', 'USA');
insert into TMP_VORNAMEN(name, nation) values('Logan', 'Kanada');
insert into TMP_VORNAMEN(name, nation) values('Jack', 'Kanada');
insert into TMP_VORNAMEN(name, nation) values('Liam', 'Kanada');
insert into TMP_VORNAMEN(name, nation) values('Ethan', 'Kanada');
insert into TMP_VORNAMEN(name, nation) values('Ignacio', 'Mexiko');
insert into TMP_VORNAMEN(name, nation) values('Tortuga', 'Mexiko');
insert into TMP_VORNAMEN(name, nation) values('Alejandro', 'Mexiko');
insert into TMP_VORNAMEN(name, nation) values('Fernando', 'Mexiko');
insert into TMP_VORNAMEN(name, nation) values('Diego', 'Mexiko');
insert into TMP_VORNAMEN(name, nation) values('Ana', 'Brasilien');
insert into TMP_VORNAMEN(name, nation) values('Lucas', 'Brasilien');
insert into TMP_VORNAMEN(name, nation) values('Mariana', 'Brasilien');
insert into TMP_VORNAMEN(name, nation) values('Rafael', 'Brasilien');
insert into TMP_VORNAMEN(name, nation) values('Valentina', 'Argentinien');
insert into TMP_VORNAMEN(name, nation) values('Santiago', 'Argentinien');
insert into TMP_VORNAMEN(name, nation) values('Camila', 'Argentinien');
insert into TMP_VORNAMEN(name, nation) values('Lucas', 'Australien');
insert into TMP_VORNAMEN(name, nation) values('Jack', 'Australien');
insert into TMP_VORNAMEN(name, nation) values('Chloe', 'Australien');
insert into TMP_VORNAMEN(name, nation) values('Liam', 'Australien');
insert into TMP_VORNAMEN(name, nation) values('Naemi', 'Neuseeland');
insert into TMP_VORNAMEN(name, nation) values('Ethan', 'Neuseeland');
insert into TMP_VORNAMEN(name, nation) values('Sophie', 'Neuseeland');
insert into TMP_VORNAMEN(name, nation) values('Oliver', 'Neuseeland');
insert into TMP_VORNAMEN(name, nation) values('Kaipo', 'Fidschi');
insert into TMP_VORNAMEN(name, nation) values('Jone', 'Fidschi');
insert into TMP_VORNAMEN(name, nation) values('Semi', 'Fidschi');
insert into TMP_VORNAMEN(name, nation) values('Mere', 'Fidschi');
insert into TMP_VORNAMEN(name, nation) values('Mohammed', 'Iran');
insert into TMP_VORNAMEN(name, nation) values('Ali', 'Iran');
insert into TMP_VORNAMEN(name, nation) values('Sara', 'Iran');
insert into TMP_VORNAMEN(name, nation) values('Mehdi', 'Iran');
insert into TMP_VORNAMEN(name, nation) values('Aabid', 'Syrien');
insert into TMP_VORNAMEN(name, nation) values('Mehmet', 'Syrien');
insert into TMP_VORNAMEN(name, nation) values('Aycse', 'Syrien');
insert into TMP_VORNAMEN(name, nation) values('Emre', 'Syrien');
insert into TMP_VORNAMEN(name, nation) values('Naemi', 'Syrien');
insert into TMP_VORNAMEN(name, nation) values('David', 'Israel');
insert into TMP_VORNAMEN(name, nation) values('Yaakov', 'Israel');
insert into TMP_VORNAMEN(name, nation) values('Avraham', 'Israel');
insert into TMP_VORNAMEN(name, nation) values('Yosef', 'Israel');
insert into TMP_VORNAMEN(name, nation) values('Yael', 'Israel');
insert into TMP_VORNAMEN(name, nation) values('Yumi', 'Israel');
insert into TMP_VORNAMEN(name, nation) values('Noemi', 'Israel');
insert into TMP_VORNAMEN(name, nation) values('Miriam', 'Israel');
insert into TMP_VORNAMEN(name, nation) values('Oleksandr', 'Russland');
insert into TMP_VORNAMEN(name, nation) values('Alexander', 'Russland');
insert into TMP_VORNAMEN(name, nation) values('Nikita', 'Russland');
insert into TMP_VORNAMEN(name, nation) values('Ivan', 'Russland');
insert into TMP_VORNAMEN(name, nation) values('Irina', 'Russland');
insert into TMP_VORNAMEN(name, nation) values('Igor', 'Russland');
insert into TMP_VORNAMEN(name, nation) values('Dimitry', 'Russland');
insert into TMP_VORNAMEN(name, nation) values('Anatasia', 'Russland');
insert into TMP_VORNAMEN(name, nation) values('Nikos', 'Griechenland');
insert into TMP_VORNAMEN(name, nation) values('Georgios', 'Griechenland');
insert into TMP_VORNAMEN(name, nation) values('Maria', 'Griechenland');
insert into TMP_VORNAMEN(name, nation) values('Alikki', 'Griechenland');
insert into TMP_VORNAMEN(name, nation) values('Emmah', 'Norwegen');
insert into TMP_VORNAMEN(name, nation) values('Leah', 'Norwegen');
insert into TMP_VORNAMEN(name, nation) values('Magnus', 'Norwegen');
insert into TMP_VORNAMEN(name, nation) values('Ingrid', 'Norwegen');
insert into TMP_VORNAMEN(name, nation) values('Sigrid', 'Norwegen');
insert into TMP_VORNAMEN(name, nation) values('Duong', 'Vietnam');
insert into TMP_VORNAMEN(name, nation) values('Nguyen Van', 'Vietnam');
insert into TMP_VORNAMEN(name, nation) values('Le Minh', 'Vietnam');



insert into TMP_NACHNAMEN(name, nation) values('Schröder', 'Deutschland');
insert into TMP_NACHNAMEN(name, nation) values('Stuke', 'Deutschland');
insert into TMP_NACHNAMEN(name, nation) values('Petersen', 'Deutschland');
insert into TMP_NACHNAMEN(name, nation) values('Müller', 'Deutschland');
insert into TMP_NACHNAMEN(name, nation) values('Fischer', 'Deutschland');
insert into TMP_NACHNAMEN(name, nation) values('Neumann', 'Deutschland');
insert into TMP_NACHNAMEN(name, nation) values('Bernard', 'Frankreich');
insert into TMP_NACHNAMEN(name, nation) values('De Gaule', 'Frankreich');
insert into TMP_NACHNAMEN(name, nation) values('Dupont', 'Frankreich');
insert into TMP_NACHNAMEN(name, nation) values('Martin', 'Frankreich');
insert into TMP_NACHNAMEN(name, nation) values('Moroue', 'Frankreich');
insert into TMP_NACHNAMEN(name, nation) values('Espositi', 'Italien');
insert into TMP_NACHNAMEN(name, nation) values('Rossi', 'Italien');
insert into TMP_NACHNAMEN(name, nation) values('Bianchi', 'Italien');
insert into TMP_NACHNAMEN(name, nation) values('Conti', 'Italien');
insert into TMP_NACHNAMEN(name, nation) values('Sanchez', 'Spanien');
insert into TMP_NACHNAMEN(name, nation) values('Gomez', 'Spanien');
insert into TMP_NACHNAMEN(name, nation) values('Garcia', 'Spanien');
insert into TMP_NACHNAMEN(name, nation) values('Lopez', 'Spanien');
insert into TMP_NACHNAMEN(name, nation) values('Nilsson',  'Schweden');
insert into TMP_NACHNAMEN(name, nation) values('Karlsson',  'Schweden');
insert into TMP_NACHNAMEN(name, nation) values('Johannsson', 'Schweden');
insert into TMP_NACHNAMEN(name, nation) values('Larrsson',  'Schweden');
insert into TMP_NACHNAMEN(name, nation) values('Andersson', 'Schweden');
insert into TMP_NACHNAMEN(name, nation) values('Adebayo', 'Nigeria');
insert into TMP_NACHNAMEN(name, nation) values('Adamu', 'Nigeria');
insert into TMP_NACHNAMEN(name, nation) values('Okuru', 'Nigeria');
insert into TMP_NACHNAMEN(name, nation) values('Nwosu', 'Nigeria');
insert into TMP_NACHNAMEN(name, nation) values('Abad', 'Irak');
insert into TMP_NACHNAMEN(name, nation) values('Hassan', 'Irak');
insert into TMP_NACHNAMEN(name, nation) values('Youssef', 'Irak');
insert into TMP_NACHNAMEN(name, nation) values('Mahmoud', 'Irak');
insert into TMP_NACHNAMEN(name, nation) values('Sahrais', 'Westsahara');
insert into TMP_NACHNAMEN(name, nation) values('Mhtembu', 'Westsahara');
insert into TMP_NACHNAMEN(name, nation) values('Nkosi', 'Westsahara');
insert into TMP_NACHNAMEN(name, nation) values('Dlamini', 'Westsahara');
insert into TMP_NACHNAMEN(name, nation) values('Wangari', 'Kenia');
insert into TMP_NACHNAMEN(name, nation) values('Jume', 'Kenia');
insert into TMP_NACHNAMEN(name, nation) values('Njoroge', 'Kenia');
insert into TMP_NACHNAMEN(name, nation) values('Otieno', 'Kenia');
insert into TMP_NACHNAMEN(name, nation) values('Alaui', 'Marokko');
insert into TMP_NACHNAMEN(name, nation) values('Idrissi', 'Marokko');
insert into TMP_NACHNAMEN(name, nation) values('Benali', 'Marokko');
insert into TMP_NACHNAMEN(name, nation) values('El-Amin', 'Marokko');
insert into TMP_NACHNAMEN(name, nation) values('Adrissi', 'Marokko');
insert into TMP_NACHNAMEN(name, nation) values('Zuo', 'China');
insert into TMP_NACHNAMEN(name, nation) values('Dan', 'China');
insert into TMP_NACHNAMEN(name, nation) values('Jinping', 'China');
insert into TMP_NACHNAMEN(name, nation) values('Ning', 'China');
insert into TMP_NACHNAMEN(name, nation) values('Jun', 'China');
insert into TMP_NACHNAMEN(name, nation) values('Mao', 'China');
insert into TMP_NACHNAMEN(name, nation) values('Sung', 'China');
insert into TMP_NACHNAMEN(name, nation) values('Noe', 'China');
insert into TMP_NACHNAMEN(name, nation) values('Sato', 'Japan');
insert into TMP_NACHNAMEN(name, nation) values('Takahashi', 'Japan');
insert into TMP_NACHNAMEN(name, nation) values('Tanaka', 'Japan');
insert into TMP_NACHNAMEN(name, nation) values('Nakamaru', 'Japan');
insert into TMP_NACHNAMEN(name, nation) values('Yamamoto', 'Japan');
insert into TMP_NACHNAMEN(name, nation) values('Kumar', 'Indien');
insert into TMP_NACHNAMEN(name, nation) values('Sharma', 'Indien');
insert into TMP_NACHNAMEN(name, nation) values('Patel', 'Indien');
insert into TMP_NACHNAMEN(name, nation) values('Gupta', 'Indien');
insert into TMP_NACHNAMEN(name, nation) values('Singhi', 'Indien');
insert into TMP_NACHNAMEN(name, nation) values('Khan', 'Saudi Arabien');
insert into TMP_NACHNAMEN(name, nation) values('Saleh', 'Saudi Arabien');
insert into TMP_NACHNAMEN(name, nation) values('Al-Fahad', 'Saudi Arabien');
insert into TMP_NACHNAMEN(name, nation) values('Al-Saadi', 'Saudi Arabien');
insert into TMP_NACHNAMEN(name, nation) values('Al-Jabar', 'Saudi Arabien');
insert into TMP_NACHNAMEN(name, nation) values('Saetang', 'Thailand');
insert into TMP_NACHNAMEN(name, nation) values('Sukchai', 'Thailand');
insert into TMP_NACHNAMEN(name, nation) values('Chaiyapres', 'Thailand');
insert into TMP_NACHNAMEN(name, nation) values('Prasert', 'Thailand');
insert into TMP_NACHNAMEN(name, nation) values('Davis', 'USA');
insert into TMP_NACHNAMEN(name, nation) values('Williams', 'USA');
insert into TMP_NACHNAMEN(name, nation) values('Jones', 'USA');
insert into TMP_NACHNAMEN(name, nation) values('Rothenberg', 'USA');
insert into TMP_NACHNAMEN(name, nation) values('Adams', 'USA');
insert into TMP_NACHNAMEN(name, nation) values('Smith', 'USA');
insert into TMP_NACHNAMEN(name, nation) values('Brown', 'USA');
insert into TMP_NACHNAMEN(name, nation) values('Johnson', 'USA');
insert into TMP_NACHNAMEN(name, nation) values('King', 'USA');
insert into TMP_NACHNAMEN(name, nation) values('Martin', 'Kanada');
insert into TMP_NACHNAMEN(name, nation) values('Lam', 'Kanada');
insert into TMP_NACHNAMEN(name, nation) values('Wilson', 'Kanada');
insert into TMP_NACHNAMEN(name, nation) values('Taylor', 'Kanada');
insert into TMP_NACHNAMEN(name, nation) values('Thompson', 'Kanada');
insert into TMP_NACHNAMEN(name, nation) values('Salamanca', 'Mexiko');
insert into TMP_NACHNAMEN(name, nation) values('Hermandez', 'Mexiko');
insert into TMP_NACHNAMEN(name, nation) values('Gomez', 'Mexiko');
insert into TMP_NACHNAMEN(name, nation) values('Rodriguez', 'Mexiko');
insert into TMP_NACHNAMEN(name, nation) values('Perez', 'Mexiko');
insert into TMP_NACHNAMEN(name, nation) values('Oliviere', 'Brasilien');
insert into TMP_NACHNAMEN(name, nation) values('Silva', 'Brasilien');
insert into TMP_NACHNAMEN(name, nation) values('Costa', 'Brasilien');
insert into TMP_NACHNAMEN(name, nation) values('Santos', 'Brasilien');
insert into TMP_NACHNAMEN(name, nation) values('Gonzales', 'Argentinien');
insert into TMP_NACHNAMEN(name, nation) values('Gomez', 'Argentinien');
insert into TMP_NACHNAMEN(name, nation) values('Martinez', 'Argentinien');
insert into TMP_NACHNAMEN(name, nation) values('Lopez', 'Argentinien');
insert into TMP_NACHNAMEN(name, nation) values('Borwn', 'Australien');
insert into TMP_NACHNAMEN(name, nation) values('Taylor', 'Australien');
insert into TMP_NACHNAMEN(name, nation) values('Wilson', 'Australien');
insert into TMP_NACHNAMEN(name, nation) values('Harris', 'Australien');
insert into TMP_NACHNAMEN(name, nation) values('Robinson', 'Australien');
insert into TMP_NACHNAMEN(name, nation) values('Scott', 'Neuseeland');
insert into TMP_NACHNAMEN(name, nation) values('Baker', 'Neuseeland');
insert into TMP_NACHNAMEN(name, nation) values('Mitchel', 'Neuseeland');
insert into TMP_NACHNAMEN(name, nation) values('Carter', 'Neuseeland');
insert into TMP_NACHNAMEN(name, nation) values('Qalu', 'Fidschi');
insert into TMP_NACHNAMEN(name, nation) values('Ravulu', 'Fidschi');
insert into TMP_NACHNAMEN(name, nation) values('Tavaga', 'Fidschi');
insert into TMP_NACHNAMEN(name, nation) values('Cakau', 'Fidschi');
insert into TMP_NACHNAMEN(name, nation) values('Mohammadi', 'Iran');
insert into TMP_NACHNAMEN(name, nation) values('Ahadi', 'Iran');
insert into TMP_NACHNAMEN(name, nation) values('Razaei', 'Iran');
insert into TMP_NACHNAMEN(name, nation) values('Hossein', 'Iran');
insert into TMP_NACHNAMEN(name, nation) values('Ahmadi', 'Iran');
insert into TMP_NACHNAMEN(name, nation) values('Alzuhur', 'Syrien');
insert into TMP_NACHNAMEN(name, nation) values('Assad', 'Syrien');
insert into TMP_NACHNAMEN(name, nation) values('Kaya', 'Syrien');
insert into TMP_NACHNAMEN(name, nation) values('Yilmaz', 'Syrien');
insert into TMP_NACHNAMEN(name, nation) values('Demir', 'Syrien');
insert into TMP_NACHNAMEN(name, nation) values('Özdemir', 'Syrien');
insert into TMP_NACHNAMEN(name, nation) values('Netanjahu', 'Israel');
insert into TMP_NACHNAMEN(name, nation) values('Berritz', 'Israel');
insert into TMP_NACHNAMEN(name, nation) values('Rohtschild', 'Israel');
insert into TMP_NACHNAMEN(name, nation) values('Lehmann', 'Israel');
insert into TMP_NACHNAMEN(name, nation) values('Baumgartner', 'Israel');
insert into TMP_NACHNAMEN(name, nation) values('Smirnov', 'Russland');
insert into TMP_NACHNAMEN(name, nation) values('Petrow', 'Russland');
insert into TMP_NACHNAMEN(name, nation) values('Ivanov', 'Russland');
insert into TMP_NACHNAMEN(name, nation) values('Petrova', 'Russland');
insert into TMP_NACHNAMEN(name, nation) values('Sokolov', 'Russland');
insert into TMP_NACHNAMEN(name, nation) values('Chrutschew', 'Russland');
insert into TMP_NACHNAMEN(name, nation) values('Radezkyi', 'Russland');
insert into TMP_NACHNAMEN(name, nation) values('Resnikow', 'Russland');
insert into TMP_NACHNAMEN(name, nation) values('Drimaskis', 'Griechenland');
insert into TMP_NACHNAMEN(name, nation) values('Petris', 'Griechenland');
insert into TMP_NACHNAMEN(name, nation) values('Papadopoulos', 'Griechenland');
insert into TMP_NACHNAMEN(name, nation) values('Gogos', 'Griechenland');
insert into TMP_NACHNAMEN(name, nation) values('Ioannou', 'Griechenland');
insert into TMP_NACHNAMEN(name, nation) values('Nikolaou', 'Griechenland');
insert into TMP_NACHNAMEN(name, nation) values('Carlsen', 'Norwegen');
insert into TMP_NACHNAMEN(name, nation) values('Larsen', 'Norwegen');
insert into TMP_NACHNAMEN(name, nation) values('Johansen', 'Norwegen');
insert into TMP_NACHNAMEN(name, nation) values('Olsen', 'Norwegen');
insert into TMP_NACHNAMEN(name, nation) values('Tran', 'Vietnam');
insert into TMP_NACHNAMEN(name, nation) values('Van Nam', 'Vietnam');
insert into TMP_NACHNAMEN(name, nation) values('Thi Mai', 'Vietnam');
insert into TMP_NACHNAMEN(name, nation) values('Hoang', 'Vietnam');



--- Personen hinzufügen ---
declare
    anreise_index       NUMBER(38)  := 0;
    anreise_datum       DATE        := to_date('2022-01-04', 'YYYY-MM-DD');
    per_gewicht         NUMBER(6,3) := 65.230;
    per_geburtsdatum    DATE        := to_date('1970-01-01', 'YYYY-MM-DD');

begin
    --- über alle Nachnamen iterieren
    for nname in (select * from TMP_NACHNAMEN) loop
        --- jeweils alle Vornamen für die entsprechende Herkunft (des Nachnamen) durchgehen
        for vname in (select * from TMP_VORNAMEN where nation = nname.nation) loop
            --- Person erstellen
            insert into PERSON(name, geburtsdatum, anreise_datum, nationalitaet, gewicht)
            values(
                (rtrim(vname.name) || ' ' || rtrim(nname.name)),
                per_geburtsdatum,
                anreise_datum,
                vname.nation,
                per_gewicht
            );

            --- als Geburtsdatum wird ab dem 01.01.1970 pro Person 11 Tage fortgegangen
            --- (damit liegen alle Geburtstage ca. zwischen 1970 und 1980)
            per_geburtsdatum    := per_geburtsdatum + 11;
            --- als Körpergewicht werden 65.230 kg verwendet, jeweils 0.100 kg fortlaufend
            --- (damit liegt das Körpergewicht aller Personen ca. zwischen 65 kg und 95 kg)
            per_gewicht         := per_gewicht + 0.100;
            --- als Anreise wird reihum einer von 5 Terminen verwendet, daher 
            --- (ab dem 01.04.2022 liegen die 4 anderen Termine jeweils 37 Tage verschoben)
            anreise_index       := mod((anreise_index + 1), 5);
            anreise_datum       := to_date('2022-01-04', 'YYYY-MM-DD') + (anreise_index * 37);
        end loop;
    end loop;
end;
/



--- QUALIFIKATIONEN der PERSONEN hinzufügen ---
declare
    personid        	NUMBER(38);
    person_geburtsdatum DATE;

    quali_level         NUMBER(2);
    nachweisid      	NUMBER(38)      := 1;
    nachweisnote    	NUMBER(1)       := 1;
    fakultaet_name    	CHAR(50 CHAR);

begin
    --- ID der ersten PERSON aus der Liste holen
    select min(id)
    into personid
    from PERSON;

    --- über alle JOBS iterieren
    for job in (select * from JOB) loop
        --- alle Anforderungen des JOBS durchgehen
        for jobquali in (select * from JOBQUALIFIKATION where JOB_id = job.id) loop
            --- Geburtsdatum der PERSON ermitteln
            select geburtsdatum
            into person_geburtsdatum
            from PERSON
            where id = personid;

            --- Qualifikations-Level der Qualifikation dieser Anforderung ermitteln
            select "LEVEL"
            into quali_level
            from QUALIFIKATION
            where bezeichnung = jobquali.QUALI_bezeichnung;

            --- passende Fakultät, entsprechend des Qualfikations-Levels, für den NACHWEIS heraussuchen
            select nvl(rtrim(fakultaet.name), 'unbekannt')
            into fakultaet_name
            from TMP_FAKULTAET fakultaet
            where fakultaet.id = (
                select case
                    when (quali_level = 1 or quali_level = 3)
                        then mod(nachweisid, 17) + 1
                    when (quali_level = 2 or quali_level = 5)
                        then mod(nachweisid, 17) + 101
                    else
                        mod(nachweisid, 17) + 201
                end
                from dual
            );
            
            --- NACHWEIS für diese für diese PERSON, für diese Anforderung hinzufügen
            insert into NACHWEIS(PERSON_id, datum, fakultaet, note)
            values(
                personid,
                person_geburtsdatum + (25 * 365),
                fakultaet_name,
                nachweisnote
            );
            select NACHWEIS_seq.currval into nachweisid from dual;

            --- QUALIFIKATIONSNACHWEIS für diese für diese Person, für diese Anforderung hinzufügen
            insert into QUALIFIKATIONSNACHWEIS(NACHWEIS_id, QUALI_bezeichnung)
            values(nachweisid, jobquali.QUALI_bezeichnung);

            --- Note für den nächsten NACHWEIS generieren (nur Noten von 1 bis 4 vergeben)
            nachweisnote := mod((nachweisnote + 1), 4) + 1;
        end loop;

        --- zur nächste PERSON gehen (nächstgrößere ID)
        select min(id)
        into personid
        from PERSON
        where id > personid;
    end loop;
end;
/



--- BEWERBUNGEN und JOBVERGABEN für die JOBS hinzufügen ---
declare
    anforderung_erfuellt    NUMBER(1);
    person_passend          NUMBER(1);
    bewerber_anzahl         NUMBER(38);
    vergabe_anzahl          NUMBER(38);
    job_vergeben            NUMBER(1);

begin
    --- alle JOB durchgehen
    for job in (select * from JOB) loop
        --- der JOB ist zunächst noch nicht vergeben
        job_vergeben := 0;

        --- jeweils alle PERSONEN durchgehen
        for person in (select * from PERSON) loop
            --- Variable zeigt die Eignung der PERSON an (entsprechend der QUALIFIKATIONEN)
            person_passend := 1;

            --- für jede Anforderung des referenzierten JOBS prüfen,
            --- ob die PERSON die entsprechende QUALIFIKATION aufweist
            for anforderung in (select * from JOBQUALIFIKATION where JOB_id = job.id) loop
                --- QUALIFIKATION dieser Anforderung in NACHWEISEN der PERSON suchen
                select nvl(count(qualinachweis.QUALI_bezeichnung), 0)
                into anforderung_erfuellt
                from QUALIFIKATIONSNACHWEIS qualinachweis
                join NACHWEIS nachweis on nachweis.id = qualinachweis.NACHWEIS_id
                where nachweis.PERSON_id = person.id
                and qualinachweis.QUALI_bezeichnung = anforderung.QUALI_bezeichnung;

                --- wurde eine Anforderung ohne entsprechende QUALIFIKATION gefunden,
                --- ist die PERSON für den JOB nicht geeignet - keine BEWERBUNG möglich 
                if (anforderung_erfuellt != 1) then
                    person_passend := 0;
                end if;
            end loop;

            if (person_passend = 1) then
                --- wieviel BEWERBUNGEN gibt es bisher für den JOB ?
                select nvl(count(id), 0)
                into bewerber_anzahl
                from BEWERBUNG
                where JOB_id = job.id;

                --- falls nicht, Anzahl der JOBS dieser PERSON ermitteln
                select nvl(count(*), 0)
                into vergabe_anzahl
                from JOBVERGABE
                where PERSON_id = person.id;

                --- mur max. 5 BEWERBUNGEN pro JOB erstellen, gibt es für diesen JOB bereits 5 ?
                if ((bewerber_anzahl < 5) or ((job_vergeben = 0) and (vergabe_anzahl = 0))) then
                    --- falls nicht, BEWERBUNG für diese PERSON, für diesen JOB hinzufügen
                    insert into BEWERBUNG(PERSON_id, JOB_id, datum)
                    values(person.id, job.id, to_date('2023-06-01', 'YYYY-MM-DD') + job.id);
                end if;

                --- ist der JOB schon vergeben, und hat die PERSON noch keine weiteren JOBS ?
                --- (in dem Testdaten-Szenario hat zunächst jede PERSON nur einen JOB)
                if ((job_vergeben = 0) and (vergabe_anzahl = 0)) then
                    --- JOBVERGABE hinzufügen
                    --- (willkürliches Datum aus Person-ID generieren, vergeben
                    --- wurde alle Jobs der Einfachheit halber im Dezember 2024)
                    insert into JOBVERGABE(PERSON_id, datum)
                    values(person.id, to_date('2023-06-01', 'YYYY-MM-DD') + job.id + 15);

                    --- Job als vergeben markieren
                    job_vergeben := 1;
                end if;
            end if;
        end loop;
    end loop;
end;
/



--- JOBVERGABEN in den entsprechenden JOBS eintragen
declare
	vergabeid NUMBER(38);
    jobid NUMBER(38);

begin
    for job in (select * from JOB) loop
        --- ID des Jobs ermitteln
        select job.id into jobid from dual;
    
        --- BEWERBUNGEN für einen JOB haben jeweils das gleiche Datum, JOBVERGABE des JOBS ist jeweils 15 Tage versetzt
        --- da jeder JOB ein anderes Datum hat, kann so die PERSON (und dessen JOBVERGABE) ermittelt werden
        select (
            select vergabe.id
            from JOBVERGABE vergabe
            where (vergabe.datum - (
                select datum
                from BEWERBUNG
                where JOB_id = jobid
                fetch first 1 rows only
            ) = 15)
        )
        into vergabeid
        from dual;

        ---  JOBVERGABE im entsprechenden JOB eintragen
        if (vergabeid is not null) then
            update JOB
            set VERGABE_id = vergabeid
            where id = jobid;
        end if;
    end loop;
end;
/



--- einige Vergaben wieder entfernen, wegen Option 'ON DELETE SET NULL' nur
--- Löschen der JOBVERGABEN nötig, nicht das NULL-setzten der 'VERGABE_id'-FKs
--- (Jobs der letzten 6 Wochen des 12 Wochen Zeitraums in dem die Jobs liegen,
--- Führungspositionen ausgenommen, somit kann bei der Anzeige frier Stellen
--- bereits ein Chef angegebn werden, statt nur 'noch nicht vergeben' -)
delete from JOBVERGABE
where id in (
    select VERGABE_id
    from JOB job
    where (to_date('2025-02-15', 'YYYY-MM-DD') < (
        select min(zeit.datum)
        from ARBEITSZEIT zeit
        where zeit.JOB_id = job.id
    ))
    and job.CHEF_id is not null
);



--- temporäre Hilfstabellen wieder entfernen
drop table TMP_VORNAMEN;
drop table TMP_NACHNAMEN;
drop table TMP_FAKULTAET;