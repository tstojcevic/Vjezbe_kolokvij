# xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < D:\Vjezbe_kolokvij\kolokvij_vjezba1.sql

drop database if exists kolokvij_vjezba1;
create database kolokvij_vjezba1;
use kolokvij_vjezba1;

# 0 zadatak

create table sestra (
    sifra int not null primary key auto_increment,
    introvertno bit,
    haljina varchar (31) not null,
    maraka decimal (16,6),
    hlace varchar (46),
    narukvica int
);

create table zena (
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar (46),
    kratkamajica varchar(31) not null,
    jmbag char (11) not null,
    bojaociju varchar (39) not null,
    haljina varchar(44),
    sestra int
);

create table sestra_svekar (
    sifra int not null primary key auto_increment,
    sestra int,
    svekar int
);

create table svekar (
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal (13,8),
    eura decimal (12,7),
    majica varchar(35)
);

create table muskarac (
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int
);

create table mladic (
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno bit,
    ekstrovertno bit not null,
    dukserica varchar(48) not null,
    muskarac int
);

create table punac (
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal (14,9),
    hlace varchar(41) not null
);

create table cura (
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal (13,10),
    ogrlica int not null,
    bojakose varchar(48),
    suknja varchar(36),
    punac int
);

alter table sestra_svekar add foreign key (sestra) references sestra (sifra);
alter table sestra_svekar add foreign key (svekar) references svekar (sifra);
alter table zena add foreign key (sestra) references sestra (sifra);
alter table muskarac add foreign key (zena) references zena (sifra);
alter table mladic add foreign key (muskarac) references muskarac (sifra);
alter table cura add foreign key (punac) references punac (sifra);


#1 zadatak
insert into sestra (introvertno,haljina,maraka,hlace,narukvica)
values (1,'crna',55.5,'crne',2), (0,'bijela',50.85,'bijele',3), (1,'plava',90.99,'plave',3);

insert into zena (treciputa, hlace, kratkamajica, jmbag, bojaociju, haljina, sestra)
values ('2022-01-01', 'dugacke','crna','12345678910','zelene','zelena',1), ('2022-06-06','kratke','bijela','23456789102','plave','plava',2),
('2022-12-12','poderane','crvena','98765432102','plave','crvena',3);

insert into muskarac (bojaociju, hlace, modelnaocala, maraka, zena)
values ('zelena','zelene','police',100.99,1), ('plave','plave','rayban',105.99,2),
('plave','crne','guess',99.99,3);

insert into svekar (bojaociju)
values ('zelene'), ('plave'), ('smeđe');

insert into sestra_svekar (sestra, svekar)
values (1,1), (1,2),(2,2);

#2 zadatak

insert into cura (novcica,gustoca,ogrlica)
values (115.59,85.13,2);

update cura set gustoca= 15.77 where sifra is not null;

#3 zadatak

insert into mladic (suknja, kuna,ekstrovertno,dukserica)
values ('kratka',150.99,1,'zelena');

delete from mladic where kuna >15.78;

#4 zadatak

select kratkamajica from zena 
where hlace like '%ana%';

#5 zadatak

select f.dukserica, a.asocijalno, b.hlace
from mladic a
inner join muskarac b on a.muskarac=b.sifra
inner join zena c on b.zena=c.sifra
inner join sestra d on c.sestra=d.sifra
inner join sestra_svekar e on d.sifra=e.sestra
inner join svekar f on  f.sifra=e.svekar
where c.hlace like 'a%' and d.haljina like '%ba%'
order by b.hlace desc;

#6 zadatak

select a.haljina, a.maraka
from sestra a
left join sestra_svekar b on b.sestra=a.sifra
where b.sestra is null;

