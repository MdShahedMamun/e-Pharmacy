create table supplier(
email varchar(30),
password varchar(30)
);
create table admin_info(
email varchar(30),
password varchar(30)
);
insert into admin_info values('admin@gmail.com','admin');

insert into supplier values('beximco@gmail.com','square');
insert into supplier values('aristopharma@gmail.com','aristopharma');
insert into supplier values('orion@gmail.com','orion');
insert into supplier values('incepta@gmail.com','incepta');
insert into supplier values('aci@gmail.com','aci');
insert into supplier values('aci@gmail.com','aci');




create table category_(
  category_id int,
  category_name varchar(30),
  primary key(category_id);
  );
  
insert into category_ values(1,'Fever');
insert into category_ values(2,'Pain killer');
insert into category_ values(3,'Blood Pressure');
insert into category_ values(4,'Blood cholesterol');
insert into category_ values(5,'Gastric Ulcer');
insert into category_ values(6,'Antibiotic(Infection)');
insert into category_ values(7,'Antispasmotic');
insert into category_ values(8,'Diuretics');
insert into category_ values(9,'Antihistamin');
insert into category_ values(10,'Calcium Preparation');
insert into category_ values(11,'Anti Asthmetic');
insert into category_ values(12,'Sedative');
insert into category_ values(13,'Antihelminthic');
insert into category_ values(14,'Antifungal');
insert into category_ values(15,'Antiemetic');

create table subcategory(
  subcategory_id int,
  subcategory_name varchar(40),
  category_id int,
  );

insert into subcategory values(1,'Paracetamol',1);

insert into subcategory values(2,'Diclofenac',2);
insert into subcategory values(3,'Aceclofenac',2);
insert into subcategory values(4,'Naproxen',2);

insert into subcategory values(5,'Losartan Potassium',3);
insert into subcategory values(6,'Ramipril',3);
insert into subcategory values(7,'Amlodipin',3);

insert into subcategory values(8,'Atrovastatin',4);
insert into subcategory values(9,'Rosuvastatin',4);
insert into subcategory values(10,'Antacid',5);
insert into subcategory values(11,'Omeprazole',5);
insert into subcategory values(12,'Pantoprazole',5);
insert into subcategory values(13,'Cephradine',6);
insert into subcategory values(14,'Cefuroxime',6);
insert into subcategory values(15,'Cefixime',6);
insert into subcategory values(16,'Tymonium Methyle Sulphate',7);
insert into subcategory values(17,'Furosemide',8);
insert into subcategory values(18,'Loratadine',9);
insert into subcategory values(19,'Fexofenadine',9);
insert into subcategory values(20,'Calcium+Vit D3',10);
insert into subcategory values(21,'Montelukast',11);
insert into subcategory values(22,'Midazolam',12);
insert into subcategory values(23,'Albendazole',13);
insert into subcategory values(24,'Fluconazole',14);
insert into subcategory values(25,'Ondansetron',15);

create  table product(
  product_id integer,
  product_company varchar(30),
  product_description varchar(100),
  unit varchar(30),
  product_sell_price double,
  product_purchase_price double,
  product_exp_date varchar(30),
  product_offer int,
  product_initial_stock int,
  product_stock_remaining integer,
  subcategory_id int,
  );
  
  insert into product values(1,'Beximco','Napa(500 mg)','/Piece',1,.80,'15-04-2017',0,15000,15000,1);
  insert into product values(2,'Square','Ace(500 mg)','/Piece',1,.80,'15-04-2017',0,15000,15000,1);
  insert into product values(3,'Aristopharma','Xpa(500 mg)','/Piece',1,.80,'15-04-2017',0,15000,15000,1);
  insert into product values(4,'Square','Ace plus(500 mg)','/Piece',1,.80,'15-04-2017',0,15000,15000,1);
  insert into product values(5,'Orion','Renova(500 mg)','/Piece',1,.80,'15-04-2017',0,15000,15000,1);
  
  insert into product values(6,'Opsonin','Olfen(50 mg)','/Piece',1.50,1,'15-04-2017',0,15000,15000,2);
  insert into product values(7,'Acme','A-FENAC(50 mg)','/Piece',1.50,1,'15-04-2017',0,15000,15000,2);
  insert into product values(8,'Incepta','Voltaren(50 mg)','/Piece',1.50,1,'15-04-2017',0,15000,15000,2);
  insert into product values(9,'A.C.I.','Diclofenac(50 mg)','/Piece',1.50,1,'15-04-2017',0,15000,15000,2);
  insert into product values(10,'Beximco','Ultrafen plus(50 mg)','/Piece',1.50,1,'15-04-2017',0,15000,15000,2);
  
  insert into product values(11,'Incepta','Safenac-P(100 mg)','/Piece',4,3.50,'15-04-2017',0,15000,15000,3);
  insert into product values(12,'Beximco','Zolfin(100 mg)','/Piece',4,3.50,'15-04-2017',0,15000,15000,3);
  insert into product values(13,'Incepta','Safenac-XP(100 mg)','/Piece',4,3.50,'15-04-2017',0,15000,15000,3);
  insert into product values(14,'Orion','Noak(100 mg)','/Piece',4,3.50,'15-04-2017',0,15000,15000,3);
  insert into product values(15,'Square','Flexi(100 mg)','/Piece',4,3.50,'15-04-2017',0,15000,15000,3);
  
  insert into product values(16,'Aristopharma','Napro(500 mg)','/Piece',5,4.50,'15-04-2017',0,15000,15000,4);
  insert into product values(17,'Acme','Naprosyn(500 mg)','/Piece',5,4.50,'15-04-2017',0,15000,15000,4);
  insert into product values(18,'Square','Sonap(500 mg)','/Piece',5,4.50,'15-04-2017',0,15000,15000,4);
  insert into product values(19,'Beximco','Dinovo(500 mg)','/Piece',5,4.50,'15-04-2017',0,15000,15000,4);
  insert into product values(20,'Opsonin','Anaprox(500 mg)','/Piece',5,4.50,'15-04-2017',0,15000,15000,4);
  
  insert into product values(21,'Incepta','Osartil(100 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,5);
  insert into product values(22,'A.C.I.','Losartan(100 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,5);
  insert into product values(23,'Square','Angilock(100 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,5);
  insert into product values(24,'Beximco','Prosan(50 mg)','/Piece',6,5.50,'15-04-2017',0,15000,15000,5);
  insert into product values(25,'Opsonin','cozaar(50 mg)','/Piece',6,5.50,'15-04-2017',0,15000,15000,5);
  
  insert into product values(26,'Orion','Tritace(10 mg)','/Piece',12,11.50,'15-04-2017',0,15000,15000,6);
  insert into product values(27,'A.C.I.','Ramipril(10 mg)','/Piece',12,11.50,'15-04-2017',0,15000,15000,6);
  insert into product values(28,'Acme','Cardace(10 mg)','/Piece',12,11.50,'15-04-2017',0,15000,15000,6);
  insert into product values(29,'Opsonin','Ampril(5 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,6);
  insert into product values(30,'Incepta','Ramoril plus(5 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,6);
  
  insert into product values(31,'Beximco','Amdocal(10 mg)','/Piece',6,5.50,'15-04-2017',0,15000,15000,7);
  insert into product values(32,'Orion','Amlocard(10 mg)','/Piece',6,5.50,'15-04-2017',0,15000,15000,7);
  insert into product values(33,'Square','Camlodin(10 mg)','/Piece',6,5.50,'15-04-2017',0,15000,15000,7);
  insert into product values(34,'Incepta','Amlosartan(10 mg)','/Piece',6,5.50,'15-04-2017',0,15000,15000,7);
  insert into product values(35,'Acme','Amlopin(10 mg)','/Piece',6,5.50,'15-04-2017',0,15000,15000,7);
  
  insert into product values(36,'Orion','Atorva(10 mg)','/Piece',10,9.60,'15-04-2017',0,15000,15000,8);
  insert into product values(37,'Square','Anzitor(10 mg)','/Piece',10,9.60,'15-04-2017',0,15000,15000,8);
  insert into product values(38,'A.C.I.','Lipitin(10 mg)','/Piece',10,9.60,'15-04-2017',0,15000,15000,8);
  insert into product values(39,'Opsonin','Lipitor(10 mg)','/Piece',10,9.60,'15-04-2017',0,15000,15000,8);
  insert into product values(40,'Beximco','Taven(10 mg)','/Piece',10,9.60,'15-04-2017',0,15000,15000,8);
  
  insert into product values(41,'Aristopharma','Rosucard(10 mg)','/Piece',10,9.60,'15-04-2017',0,15000,15000,9);
  insert into product values(42,'Orion','Rosuvas(10 mg)','/Piece',10,9.60,'15-04-2017',0,15000,15000,9);
  insert into product values(43,'Aristopharma','Crestor(10 mg)','/Piece',10,9.60,'15-04-2017',0,15000,15000,9);
  insert into product values(44,'Acme','Rostab(10 mg)','/Piece',10,9.60,'15-04-2017',0,15000,15000,9);
  insert into product values(45,'Incepta','Rocovas(10 mg)','/Piece',10,9.60,'15-04-2017',0,15000,15000,9);
  
  insert into product values(46,'A.C.I.','Gaviscon(200 ml)','/Piece',100,95,'15-04-2017',0,15000,15000,10);
  insert into product values(47,'Square','Entacyd plus(200 ml)','/Piece',100,95,'15-04-2017',0,15000,15000,10);
  insert into product values(48,'Opsonin','Alox(200 ml)','/Piece',100,95,'15-04-2017',0,15000,15000,10);
  insert into product values(49,'Orion','Gascol(200 ml)','/Piece',100,95,'15-04-2017',0,15000,15000,10);
  insert into product values(50,'Incepta','Gelusil(200 ml)','/Piece',100,95,'15-04-2017',0,15000,15000,10);
  
  insert into product values(51,'Acme','Omeprazole(20 mg)','/Piece',5,4.60,'15-04-2017',0,15000,15000,11);
  insert into product values(52,'Square','Seclo(20 mg)','/Piece',5,4.60,'15-04-2017',0,15000,15000,11);
  insert into product values(53,'Beximco','Proceptin(20 mg)','/Piece',5,4.60,'15-04-2017',0,15000,15000,11);
  insert into product values(54,'A.C.I.','OPmax(20 mg)','/Piece',5,4.60,'15-04-2017',0,15000,15000,11);
  insert into product values(55,'Aristopharma','Losec(20 mg)','/Piece',5,4.60,'15-04-2017',0,15000,15000,11);
  
  insert into product values(56,'Orion','Pramax(20 mg)','/Piece',5,4.70,'15-04-2017',0,15000,15000,12);
  insert into product values(57,'Incepta','Pantonix(20 mg)','/Piece',5,4.70,'15-04-2017',0,15000,15000,12);
  insert into product values(58,'Opsonin','Pantocid(20 mg)','/Piece',5,4.70,'15-04-2017',0,15000,15000,12);
  insert into product values(59,'Acme','Protocid(20 mg)','/Piece',5,4.70,'15-04-2017',0,15000,15000,12);
  insert into product values(60,'A.C.I.','Somac(20 mg)','/Piece',5,4.70,'15-04-2017',0,15000,15000,12);
  
  insert into product values(61,'Square','Lebac(500 mg)','/Piece',12,11.60,'15-04-2017',0,15000,15000,13);
  insert into product values(62,'Square','Velosef(500 mg)','/Piece',12,11.60,'15-04-2017',0,15000,15000,13);
  insert into product values(63,'Opsonin','Oracefal(500 mg)','/Piece',12,11.60,'15-04-2017',0,15000,15000,13);
  insert into product values(64,'Aristopharma','Extracef(500 mg)','/Piece',12,11.60,'15-04-2017',0,15000,15000,13);
  insert into product values(65,'Orion','Vericef(500 mg)','/Piece',12,11.60,'15-04-2017',0,15000,15000,13);
  
  insert into product values(66,'A.C.I.','Zinnat(250 mg)','/Piece',25,24.50,'15-04-2017',0,15000,15000,14);
  insert into product values(67,'Aristopharma','Pulmocef(250 mg)','/Piece',25,24.50,'15-04-2017',0,15000,15000,14);
  insert into product values(68,'Opsonin','Zocef(250 mg)','/Piece',25,24.50,'15-04-2017',0,15000,15000,14);
  insert into product values(69,'Square','cefotil(250 mg)','/Piece',25,24.50,'15-04-2017',0,15000,15000,14);
  insert into product values(70,'Beximco','Hitum(250 mg)','/Piece',25,24.50,'15-04-2017',0,15000,15000,14);
  
  insert into product values(71,'Incepta','Cefixime(200 mg)','/Piece',30,29.50,'15-04-2017',0,15000,15000,15);
  insert into product values(72,'A.C.I.','Hicef-AZ(200 mg)','/Piece',30,29.50,'15-04-2017',0,15000,15000,15);
  insert into product values(73,'Square','Cef-3(200 mg)','/Piece',30,29.50,'15-04-2017',0,15000,15000,15);
  insert into product values(74,'Aristopharma','DCEFI(200 mg)','/Piece',30,29.50,'15-04-2017',0,15000,15000,15);
  insert into product values(75,'Opsonin','Ceftid(200 mg)','/Piece',30,29.50,'15-04-2017',0,15000,15000,15);
  
  insert into product values(76,'Square','Norvis(50 mg)','/Piece',5,4.50,'15-04-2017',0,15000,15000,16);
  insert into product values(77,'Orion','Algin(50 mg)','/Piece',5,4.50,'15-04-2017',0,15000,15000,16);
  insert into product values(78,'Aristopharma','Veralgin(50 mg)','/Piece',5,4.50,'15-04-2017',0,15000,15000,16);
  insert into product values(79,'Incepta','Timozin(50 mg)','/Piece',5,4.50,'15-04-2017',0,15000,15000,16);
  insert into product values(80,'Beximco','Emonium(50 mg)','/Piece',5,4.50,'15-04-2017',0,15000,15000,16);
  
  insert into product values(81,'Acme','Fusid(40 mg)','/Piece',.50,.30,'15-04-2017',0,15000,15000,17);
  insert into product values(82,'Opsonin','Furosemide Sandoz(40 mg)','/Piece',.50,.30,'15-04-2017',0,15000,15000,17);
  insert into product values(83,'A.C.I.','Lasix(40 mg)','/Piece',.50,.30,'15-04-2017',0,15000,15000,17);
  insert into product values(84,'Aristopharma','Frunemide stada(40 mg)','/Piece',.50,.30,'15-04-2017',0,15000,15000,17);
  
  insert into product values(85,'Orion','Lorastad(10 mg)','/Piece',2.50,2,'15-04-2017',0,15000,15000,18);
  insert into product values(86,'Acme','Loratin(10 mg)','/Piece',2.50,2,'15-04-2017',0,15000,15000,18);
  insert into product values(87,'Beximco','Loratidine Stada(10 mg)','/Piece',2.50,2,'15-04-2017',0,15000,15000,18);
  insert into product values(88,'Square','Loratin fast(10 mg)','/Piece',2.50,2,'15-04-2017',0,15000,15000,18);
  insert into product values(89,'A.C.I.','Itchlor(10 mg)','/Piece',2.50,2,'15-04-2017',0,15000,15000,18);
  
  insert into product values(90,'Opsonin','Allegra(180 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,19);
  insert into product values(91,'Square','Fexo(180 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,19);
  insert into product values(92,'Square','Fexo plus(180 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,19);
  insert into product values(93,'Incepta','Fexon(180 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,19);
  insert into product values(94,'Acme','Fext(180 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,19);
  
  insert into product values(95,'Beximco','Aristocal D','/Piece',4,3.50,'15-04-2017',0,15000,15000,20);
  insert into product values(96,'Square','Calbo D','/Piece',4,3.50,'15-04-2017',0,15000,15000,20);
  insert into product values(97,'Acme','Ostocal D','/Piece',4,3.50,'15-04-2017',0,15000,15000,20);
  insert into product values(98,'Square','Calbo-D vita','/Piece',4,3.50,'15-04-2017',0,15000,15000,20);
  insert into product values(99,'Square','Calboral-D','/Piece',4,3.50,'15-04-2017',0,15000,15000,20);
  
  insert into product values(100,'Acme','Monas(10 mg)','/Piece',14,13.50,'15-04-2017',0,15000,15000,21);
  insert into product values(101,'A.C.I.','Monten-FX(10 mg)','/Piece',14,13.50,'15-04-2017',0,15000,15000,21);
  insert into product values(102,'Square','Montene(10 mg)','/Piece',14,13.50,'15-04-2017',0,15000,15000,21);
  insert into product values(103,'Beximco','Monocast(10 mg)','/Piece',14,13.50,'15-04-2017',0,15000,15000,21);
  insert into product values(104,'Opsonin','Montair(10 mg)','/Piece',14,13.50,'15-04-2017',0,15000,15000,21);
  
  insert into product values(105,'Incepta','Milam(7.5 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,22);
  insert into product values(106,'Incepta','Hypnofast(7.5 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,22);
  insert into product values(107,'Orion','Dormicum(7.5 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,22);
  insert into product values(108,'Aristopharma','Anquil(7.5 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,22);
  insert into product values(109,'Square','Dormitol(7.5 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,22);
  
  insert into product values(110,'A.C.I.','Alben DS(400 mg)','/Piece',4,3.50,'15-04-2017',0,15000,15000,23);
  insert into product values(111,'Square','Almex(400 mg)','/Piece',4,3.50,'15-04-2017',0,15000,15000,23);
  insert into product values(112,'Acme','Bigben(400 mg)','/Piece',4,3.50,'15-04-2017',0,15000,15000,23);
  insert into product values(113,'Orion','Zentel(400 mg)','/Piece',4,3.50,'15-04-2017',0,15000,15000,23);
  insert into product values(114,'Aristopharma','Abentel(400 mg)','/Piece',4,3.50,'15-04-2017',0,15000,15000,23);
  
  insert into product values(115,'Opsonin','Flucamed(50 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,24);
  insert into product values(116,'Incepta','Forcan(50 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,24);
  insert into product values(117,'Beximco','Diflucan(50 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,24);
  insert into product values(118,'Square','Flugal(50 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,24);
  insert into product values(119,'A.C.I.','Canzika(50 mg)','/Piece',8,7.50,'15-04-2017',0,15000,15000,24);
  
  insert into product values(120,'Beximco','Onsat(8 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,25);
  insert into product values(121,'Acme','Emistat(8 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,25);
  insert into product values(122,'Incepta','Zofran(8 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,25);
  insert into product values(123,'Opsonin','Ondem(8 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,25);
  insert into product values(124,'A.C.I.','Emeset(8 mg)','/Piece',10,9.50,'15-04-2017',0,15000,15000,25);
  
  create table log_(
  product_name varchar(100),
  product_id int,
  quantity_sold int,
  subcategory_id int,
  sell_date_time varchar(30),
  purchase_price double,
  sell_price double,
  email varchar(50)
  );
  
  insert into log_ values('Napa(500 mg)',1,0,1,'2016-02-11T01:00',.80,1,'a@gmail.com');
  insert into log_ values('Seclo(20 mg)',52,0,11,'2016-02-11T01:00',4.50,5,'a@gmail.com');
  insert into log_ values('Zolfin(100 mg)',12,0,3,'2016-03-11T01:00',3.50,4,'a@gmail.com');
  insert into log_ values('Pantonix(20 mg)',57,0,12,'2016-03-11T01:00',4.50,5,'a@gmail.com');
  insert into log_ values('Entacyd plus(200 ml)',47,1,10,'2016-02-01T01:00',95,100,'a@gmail.com');
  insert into log_ values('Fexo(180 mg)',91,0,19,'2016-02-11T01:05',7,8,'a@gmail.com');
  insert into log_ values('Osartil(100 mg)',21,0,5,'2016-02-11T01:20',9.5,10,'a@gmail.com');
  insert into log_ values('Lipitor(10 mg)',39,0,8,'2016-02-11T01:45',9.5,10,'a@gmail.com');
  insert into log_ values('Angilock(100 mg)',23,0,5,'2016-03-11T02:00',9.5,10,'a@gmail.com');
  
  
  
  
  
  
  




	

  
  





  
 