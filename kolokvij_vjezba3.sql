# xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < D:\Vjezbe_kolokvij\kolokvij_vjezba3.sql

drop database if exists kolokvij_vjezba3;
create database kolokvij_vjezba3;
use kolokvij_vjezba3;

create table svekar (
    sifra int not null primary key auto_increment,
    novcica decimal (16,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int not null
);

create table cura (
    sifra int not null primary key auto_increment,
    duskerica varchar(49),
    maraka decimal (13,7),
    drugiputa datetime,
    majica varchar (49),
    novcica decimal (15,8),
    ogrlica int not null
);

create table snasa (
    sifra int not null primary key auto_increment,
    introvertno bit,
    kuna decimal (15,6) not null,
    eura decimal (12,9) not null,
    treciputa datetime,
    ostavljena int not null
);

create table ostavljena (
    sifra int not null primary key auto_increment,
    kuna decimal (17,5),
    lipa decimal (15,6),
    majica varchar (36),
    modelnaocala varchar(31) not null,
    prijatelj int
);

create table prijatelj (
    sifra int not null primary key auto_increment,
    kuna decimal (16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    duskerica varchar(31),
    indiferentno bit not null
);

create table prijatelj_brat (
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

create table brat (
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno bit not null
);

create table punica (
    sifra int not null primary key auto_increment,
    asocijalno bit,
    kratkamajica varchar(44),
    kuna decimal (13,8) not null,
    vesta varchar (32) not null,
    snasa int
);


insert into svekar (novcica,suknja,narukvica,cura)
values (250.39,'crvena',2,1), (150.39,'zelena',5,2), (350.39,'plava',3,3);

insert into cura (ogrlica)
values (2), (5), (3);

insert into snasa (kuna,eura,ostavljena)
values (250.50,30.50,1), (150.50,19.50,2), (350.50,48.50,3);

insert into ostavljena(modelnaocala)
values ('Gucci'),('Police'), ('Vogue');

insert into prijatelj (indiferentno)
values (1), (0), (1);

insert into prijatelj_brat (prijatelj,brat)
values (1,1), (1,2), (2,2);

insert into brat (ogrlica,ekstroventno)
values (1,1), (2,2), (3,1);

insert into punica (kuna,vesta)
values (255.50, 'crvena'), (155.50, 'bijela'), (355.50, 'plava');


alter table svekar add foreign key (cura) references cura (sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table punica add foreign key (snasa) references snasa(sifra);
alter table ostavljena add foreign key(prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);



