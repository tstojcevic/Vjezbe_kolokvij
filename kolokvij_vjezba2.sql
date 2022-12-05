# xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < D:\Vjezbe_kolokvij\kolokvij_vjezba2.sql

drop database if exists kolokvij_vjezba2;
create database kolokvij_vjezba2;
use kolokvij_vjezba2;

#0 zadatak

create table prijatelj (
    sifra int not null primary key auto_increment,
    modelnaocala varchar (37),
    treciputa datetime not null,
    ekstroventno bit not null,
    prviputa datetime,
    svekar int not null
);

create table svekar (
    sifra int not null primary key  auto_increment,
    stilfrizura varchar (48),
    ogrlica int not null,
    asocijalno bit not null
);

create table decko (
    sifra int not null primary key  auto_increment,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit not null
);

create table decko_zarucnica (
    sifra int not null primary key  auto_increment,
    decko int not null,
    zarucnica int not null
);

create table zarucnica (
    sifra int not null primary key  auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal (15,9),
    lipa decimal (15,8) not null,
    indiferentno bit not null
);

create table cura (
    sifra int not null primary key  auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno bit,
    majica varchar(40) not null,
    decko int
);

create table neprijatelj (
    sifra int not null primary key  auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49)not null,
    kuna decimal (12,6) not null,
    jmbag char (11),
    cura int
);

create table brat (
    sifra int not null primary key  auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

alter table prijatelj add foreign key (svekar) references svekar (sifra);
alter table cura add foreign key (decko) references decko (sifra);
alter table decko_zarucnica add foreign key (decko) references decko (sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table neprijatelj add foreign key (cura) references cura (sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj (sifra);

#1 zadatak

insert into neprijatelj (haljina,modelnaocala,kuna)
values ('zelena','police',999.99), ('plava','rayban',899.99),
('crvena','vogue',799.99);

insert into cura (haljina,drugiputa,majica)
values ('zelena',2022-12-12,'zelena'), ('plava',2022-11-11,'plava'),
('crvena',2022-10-10,'crvena');

insert into decko (asocijalno)
values (1), (1), (0);

insert into zarucnica (bojakose,lipa,indiferentno)
values ('plava',85,1), ('crna',93,2),('plava',90,1);

insert into decko_zarucnica (decko,zarucnica)
values (1,1), (1,2), (2,2);

#2 zadatak

insert into svekar (ogrlica,asocijalno)
values (1,1), (2,1), (3,1);

insert into prijatelj (treciputa,ekstroventno,svekar)
values (2022-01-01,1,1), (2022-02-02,1,2), (2022-03-03,1,3);

update prijatelj set treciputa ='2020-04-30' where sifra is not null;

#3 zadatak

insert into brat (ogrlica,asocijalno,neprijatelj)
values (1,1,1), (2,1,2), (3,1,3);

delete from brat where ogrlica !=14;

#4 zadatak

select suknja from cura where drugiputa is null;

#5 zadatak

select f.novcica, a.neprijatelj, b.haljina
from brat a
inner join neprijatelj b on a.neprijatelj=b.sifra
inner join cura c on b.cura=c.sifra
inner join decko d on c.decko=d.sifra
inner join decko_zarucnica e on e.decko=d.sifra
inner join zarucnica f on e.zarucnica=f.sifra
where c.drugiputa is not null and d.vesta like ('%ba%')
order by 3 desc; 

#6 zadatak

select a.vesta, a.asocijalno
from decko a
left join decko_zarucnica b on b.decko=a.sifra
where a.sifra != b.decko;
