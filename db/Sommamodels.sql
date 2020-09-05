DROP DATABASE IF EXISTS SommaModels;
CREATE DATABASE SommaModels;
use SommaModels;

drop user if exists 'tsw'@'localhost';
create user 'tsw'@'localhost' identified by 'adminadmin';
grant all on Sommamodels.* to 'tsw'@'localhost';


CREATE TABLE utente (
	idUtente  int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome	varchar(30)	NOT NULL,
    cognome	varchar(30)	NOT NULL,
    sesso	varchar(30)	NOT NULL,
    regione	varchar(30) NOT NULL,
    citta	varchar(30) NOT NULL,
    provincia	varchar(30)	NOT NULL,
    via		varchar(30) NOT NULL,
    numCivico	int NOT NULL,
    cellulare	varchar(30) NOT NULL,
    email		varchar(30) NOT NULL,
    psswrd		varchar(30) NOT NULL,
    isAdmin		varchar(14)	DEFAULT 'false'  
);

CREATE TABLE tessera(
	idUtenteT int NOT NULL references utente(idUtente),
	sconto double NOT NULL,
    numAcquisti int NOT NULL,
    numPunti int NOT NULL
);

CREATE TABLE prodotto (
	idProdotto int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomeProdotto 	varchar(30) NOT NULL,
    marcaProdotto  varchar(30) NOT NULL,
    tipoCategoria	varchar(30) NOT NULL,
    tipoProdotto	varchar(30) NOT NULL,
    descrizioneProdotto	varchar(200) NOT NULL,
    prezzoProdotto	double NOT NULL,
    immagine mediumblob DEFAULT NULL,
    numPezziDisponibili int NOT NULL
);	

CREATE TABLE ordine(
	idOrdine int PRIMARY KEY NOT NULL auto_increment,
    dataOrdine date NOT NULL,
    regione	varchar(30) NOT NULL,
    citta	varchar(30) NOT NULL,
    provincia	varchar(30)	NOT NULL,
    via		varchar(30) NOT NULL,
    numCivico	int NOT NULL,
	statoOrdine varchar(14) NOT NULL,
    idOrdineCliente int REFERENCES ordine (idOrdine) ON UPDATE CASCADE ON DELETE RESTRICT
);  

CREATE TABLE contiene(
	idOrdineC int NOT NULL REFERENCES ordine(idOrdine) ON UPDATE CASCADE ON DELETE RESTRICT,
    idProdottoC int NOT NULL REFERENCES prodotto(idProdotto) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY(idOrdineC,idProdottoC)
);

create table richiede(
idClienteR int NOT NULL REFERENCES utente(idUtente) ON UPDATE CASCADE ON DELETE RESTRICT,
idAssistenzaR int NOT NULL REFERENCES assistenza(idAssistenza) ON UPDATE CASCADE ON DELETE RESTRICT,
PRIMARY KEY (idClienteR,idAssistenzaR )
);



create table assistenza(
idAssistenza int PRIMARY KEY NOT NULL AUTO_INCREMENT,
categoria varchar(40) ,
orario  varchar(40),
problema varchar(150),
email varchar(50)
);

insert into utente (nome, cognome, sesso, regione, citta, provincia, via, numCivico, cellulare, email, psswrd) values('Giovanni','Di Mauro','M','Campania','Marigliano','Napoli','Via Clemente Matrisciano',54,3773,'dimy1996@live.it','password');
insert into ordine (dataOrdine,regione,citta,provincia,via,numCivico,statoOrdine,idOrdineCliente) values('2020-03-09','Campania','Marigliano','Napoli','Via Clemente Matrisciano',54,'In spedizione',1);
insert into contiene(idOrdineC,idProdottoC) values (1,1);
insert into contiene(idOrdineC,idProdottoC) values (1,3);
insert into utente (nome, cognome, sesso, regione, citta, provincia, via, numCivico, cellulare, email, psswrd, isAdmin) values ('marianna', 'vujko', 'femmina', 'toscana', 'lucca', 'lucca', 'di patrizio', 3, 3456789876, 'admin@admin', 'admin', 'true');
insert into prodotto(nomeProdotto,marcaProdotto,tipoCategoria,tipoProdotto,descrizioneProdotto,prezzoProdotto,numPezziDisponibili) values ('BUGGY RAPTOR 5XB 1/5 HYMOTO', 'HYMOTO', 'Radiocomandato', 'Modello a scoppio', '4x4, motore 32cc, 2.4GHz', 865.00, 3) ; 
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('TRUGGY DESERT KING HIMOTO 1/5','HIMOTO','Radiocomandato','Scoppio','4wd-telecomando con sistema 2.4GHz con ricerca automatica della frequenza.',940.00,3);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('Rock Crawler 1/10', 'HYMOTO', 'Radiocomandato', 'Elettrico', '-',490.00, 1);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('Motoscafo Brushless Fountain', 'HYMOTO', 'Radiocomandato', 'Elettrico. Barca','880BP RTR telecomando con display	HIMOTO	radiocomandato	elettrico	barca radiocomandata in vetroresina, dipinta a mano, con batterie LIPO e caricabatterie.',540.00, 2);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('OUTRAGE 2.4G RTR PERFORMANCE', 'NAVICRAFT','Radiocomandato', 'Scoppio-barca','Barca telecomandata, RDR tutto incluso. Alimentazione termica e radiocomando incluso.',870.00,3);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('G LOCOMOTIVA ELETTRICA BR103','PIKO','Radiocomandato', 'elettrico. Ferroviario','-',730.00, 1);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('FERRARI 308 GBT RED', 'FERRARI', 'statico','automodello', 'automodello Ferrari giÃƒÂ  assemblato. Pezzo da collezione',114.00,	7);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('JAPANESE BATTLESHIP ','TAMIYA','statico', 'navale', 'Modello in scala 1/350',260.00,80);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('Titanic Centenary 1:700','R.M.S','statico', 'scatola montaggio','scala 1:700',27.80,3);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('JAMARA COLLA CIANOACRILICA ','JAMARA','accessori','colla','EXTRA LIQUIDA 20mL',6.00,20);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('COLORE LUCIDO NERO X01','TAMIYA','accessori','colori','-',2.50,50);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('PICCO MOTORE P3X Off-Road'	,'PICCO','accessori', 'motori','Engine.21 3,5cc Cuscinetto Ceramico',189.00,3);
insert into prodotto (nomeProdotto, marcaProdotto, tipoCategoria, tipoProdotto, descrizioneProdotto, prezzoProdotto, numPezziDisponibili) values('DYNAMITE BATTERIA LI-PO ','DYNAMITE','accessori','batterie','Batteria 74V 2000mAh 2S 5C JST',34.00,10);