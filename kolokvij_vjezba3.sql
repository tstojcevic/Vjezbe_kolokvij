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


