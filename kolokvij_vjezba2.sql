# xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < D:\Vjezbe_kolokvij\kolokvij_vjezba2.sql

drop database if exists kolokvij_vjezba2;
create database kolokvij_vjezba2;
use kolokvij_vjezba2;

#0 zadatak

create table prijatelj (
    sifra int not null primary key auto_increment,
    modelnaocala varchar (37),
    treciputa datetime,
    ekstroventno bit,
    prviputa datetime,
    svekar int
);

create table svekar (
    sifra int not null primary key  auto_increment,
    stilfrizura varchar (48),
    ogrlica int,
    asocijalno bit
);

create table decko (
    sifra int not null primary key  auto_increment,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit
);

create table decko_zarucnica (
    sifra int not null primary key  auto_increment,
    decko int,
    zarucnica int
);

create table zarucnica (
    sifra int not null primary key  auto_increment,
    narukvica int,
    bojakose varchar(37),
    novcica decimal (15,9),
    lipa decimal (15,8),
    indiferentno bit
);

create table cura (
    sifra int not null primary key  auto_increment,
    haljina varchar(33),
    drugiputa datetime,
    suknja varchar(38),
    narukvica int,
    introvertno bit,
    majica varchar(40),
    decko int
);

create table neprijatelj (
    sifra int not null primary key  auto_increment,
    majica varchar(32),
    haljina varchar(43),
    lipa decimal(16,8),
    modelnaocala varchar(49),
    kuna decimal (12,6),
    jmbag char (11),
    cura int
);

create table brat (
    sifra int not null primary key  auto_increment,
    suknja varchar(47),
    ogrlica int,
    asocijalno bit,
    neprijatelj int
);

alter table prijatelj add foreign key (svekar) references svekar (sifra);
alter table cura add foreign key (decko) references decko (sifra);
alter table decko_zarucnica add foreign key (decko) references decko (sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table neprijatelj add foreign key (cura) references cura (sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj (sifra);
