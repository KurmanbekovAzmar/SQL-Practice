create type Gender as enum ('Male', 'Female');
create type Genre as enum ('DETECTIVE','DRAMA','HISTORY','ROMANS','BIOGRAPHY','FANTASY');
CREATE TABLE publishers (
                            id serial primary key,
                            name VARCHAR
);
CREATE TABLE languages (
                           id serial primary key,
                           language VARCHAR
);
create table authors (
                         id serial primary key,
                         first_name VARCHAR,
                         last_name VARCHAR,
                         email varchar,
                         date_of_birth date,
                         country varchar,
                         gender Gender
);
create table books (
                       id serial primary key,
                       name varchar,
                       country varchar,
                       published_year date,
                       price numeric,
                       genre Genre
);
alter table books add column language_id int references languages(id);
alter table books add column publisher_id int references publishers(id);
alter table books add column author_id int references authors(id);

insert into publishers(name)
values ('RELX Group'),
       ('Thomson Reuters'),
       ('Holtzbrinck Publishing Group'),
       ('Shanghai Jiao Tong University Press'),
       ('Wolters Kluwer'),
       ('Hachette Livre'),
       ('Aufbau-Verlag'),
       ('Macmillan'),
       ('Harper Collins'),
       ('China Publishing Group'),
       ('Springer Nature'),
       ('Grupo Planeta'),
       ('Books.Ru Ltd.St Petersburg'),
       ('The Moscow Times'),
       ('Zhonghua Book Company');
insert into authors(first_name, last_name, email, date_of_birth, country, gender)
values ('Sybilla', 'Toderbrugge', 'stoderbrugge0@jugem.jp', '1968-9-25', 'France', 'Female'),
       ('Patti', 'Walster', 'pwalster1@addtoany.com', '1965-10-31', 'China', 'Female'),
       ('Sonnie', 'Emmens', 'semmens2@upenn.edu', '1980-5-16', 'Germany', 'Male'),
       ('Brand', 'Burel', 'bburel3@ovh.net', '1964-4-24', 'United States', 'Male'),
       ('Silvan', 'Smartman', 'ssmartman4@spiegel.de', '1967-7-3', 'France', 'Male'),
       ('Alexey', 'Arnov', 'larnoldi5@writer.com', '1964-2-29', 'Russia', 'Male'),
       ('Bunni', 'Aggio', 'baggio6@yahoo.co.jp', '1983-12-14', 'China', 'Female'),
       ('Viole', 'Sarath', 'vsarath7@elegantthemes.com', '1960-1-29', 'United States', 'Female'),
       ('Boigie', 'Etridge', 'betridge8@ed.gov', '1978-11-17', 'France', 'Male'),
       ('Hilliard', 'Burnsyde', 'hburnsyde9@omniture.com', '1962-9-8', 'Germany', 'Male'),
       ('Margarita', 'Bartova', 'mbartova@example.com', '1984-12-3', 'Russia', 'Female'),
       ('Innis', 'Hugh', 'ihughb@marriott.com', '1983-3-15', 'Germany', 'Male'),
       ('Lera', 'Trimnella', 'ltrimnellc@msn.com', '1980-3-28', 'Russia', 'Female'),
       ('Jakob', 'Bransby', 'jbransbyd@nasa.gov', '1966-8-5', 'Spain', 'Male'),
       ('Loretta', 'Gronaver', 'lgronavere@technorati.com', '1962-11-17', 'United States', 'Female');

insert into languages(language)
values ('English'),
       ('French'),
       ('German'),
       ('Chinese'),
       ('Russian'),
       ('Spanish');
alter type genre rename value 'ROMANCE' to 'ROMANS';

insert into books(name, country, published_year, price, genre, language_id, publisher_id, author_id)
values('Taina', 'Russia', '2021-11-12', '568','DETECTIVE', '5', '12', '6'),
      ('Zvezdopad', 'Russia', '1004-12-9', '446', 'ROMANS', '5', '13', '11'),
      ('Homo Faber', 'Germany', '2022-4-10', '772','FANTASY', '3', '5', '3'),
      ('Der Richter und Sein Henker', 'Germany', '2011-2-1', '780','DETECTIVE', '3', '3', '10'),
      ('Lord of the Flies', 'United States', '2015-7-9', '900','FANTASY', '1', '2', '4'),
      ('Un soir au club', 'France', '2018-1-12', '480','DRAMA', '2', '1', '1'),
      ('Voina', 'Russia', '2004-12-6', '880',  'HISTORY', '5', '4', '13'),
      ('Sun Tzu', 'China', '2022-4-9', '349',  'HISTORY', '4', '4', '2'),


      ('Emil und die Detektive', 'Germany', '2010-11-11', '228','DETECTIVE','3', '5', '10'),
      ('Coule la Seine', 'France', '2015-1-3', '732','FANTASY', '2', '6', '1'),
      ('Love and hatred', 'Russia', '2002-3-22', '763', 'ROMANS', '5', '14', '13'),
      ('Fantastic Mr Fox', 'United States', '2018-10-3', '309','FANTASY', '1', '9', '8'),
      ('Contes de la Bécasse', 'France', '2019-10-11', '378', 'ROMANS', '2', '6', '9'),
      ('“The Death of Ivan Ilyich', 'Russia', '2000-3-24', '814','DRAMA', '5', '6', '6'),
      ('Bonjour Tristesse', 'France', '2018-2-20', '502', 'ROMANS', '2', '8', '5'),
      ('Die Verwandlung', 'Germany', '2009-1-19', '305', 'DETECTIVE','3','7', '12'),
      ('Emma', 'United States', '2021-11-21', '599', 'BIOGRAPHY','1', '2', '15');

--1.Китептердин атын, чыккан жылын, жанрын чыгарыныз.
select name,published_year,genre from books;
--2.Авторлордун мамлекеттери уникалдуу чыксын.
select distinct country from authors ;
--3.2020-2023 жылдардын арасындагы китептер чыксын.
select * from books where published_year>'2020-1-1' and published_year<'2023-1-1';
--4.Детектив китептер жана алардын аттары чыксын.
select genre,name from books where genre='DETECTIVE';
--5.Автордун аты-жону author деген бир колонкага чыксын.
select (first_name,last_name) as full_name from authors;
--6.Германия жана Франциядан болгон авторлорду толук аты-жону менен сорттоп чыгарыныз.
select first_name,last_name from authors where country='German' and country='French' order by first_name;
--7.Романдан башка жана баасы 500 дон кичине болгон китептердин аты, олкосу, чыккан жылы, баасы жанры чыксын..
select name,country,published_year,price,genre from books where genre<>'ROMANS' and price<500;
--8.Бардык кыз авторлордун биринчи 3 ну чыгарыныз.
select * from authors where gender='Female' limit 3;
--9.Почтасы .com мн буткон, аты 4 тамгадан турган, кыз авторлорду чыгарыныз.
select * from authors where email ilike '%.com' and length(first_name)=4 and gender='Female';
--10.Бардык олколорду жана ар бир олкодо канчадан автор бар экенин чыгаргыла.
select country,count(*) from authors group by country ;
--11.Уч автор бар болгон олколорду аты мн сорттоп чыгарыныз.
select country,count(*) from authors group by country having count(*) = 3 order by country;
--12. Ар бир жанрдагы китептердин жалпы суммасын чыгарыныз
select genre,count(*) from books group by genre ;
--13. Роман жана Детектив китептеринин эн арзан бааларын чыгарыныз
select genre,min(price) from books where genre='DETECTIVE' or genre='ROMANS' group by genre;
--14.История жана Биографиялык китептердин сандарын чыгарыныз
select genre,count(*) from books where genre='HISTORY' or genre = 'BIOGRAPHY' group by genre;
--15.Китептердин , издательстволордун аттары жана тили чыксын
select name,published_year,country from books;
--15 6 Авторлордун бардык маалыматтары жана издательстволору чыксын, издательство болбосо null чыксын
select (first_name,last_name) as full_name,date_of_birth,name,published_year from authors left join public.books b on authors.id = b.author_id;
--17.Авторлордун толук аты-жону жана китептери чыксын, китеби жок болсо null чыксын.
select (first_name,last_name) as author_full_name,b.name as book_name,b.country from authors left join books b on authors.country = b.country;
--18.Кайсы тилде канча китеп бар экендиги ылдыйдан ойлдого сорттолуп чыксын.
select country,count(*) from books group by country order by country desc;
--19.Издательствонун аттары жана алардын тапкан акчасынын оточо суммасы тегеректелип чыгарылсын.
select name,avg(price) from books group by name ;
--20.2010-2015 жылдардын арасындагы китептер жана автордун аты-фамилиясы чыксын.
select published_year,name,(first_name,last_name) as author_full_name from authors join books b on authors.id = b.author_id where published_year between '2010-1-1' and '2015-1-1';
--21.2010-2015 жылдардын арасындагы китептердин авторлорунун толук аты-жону жана алардын тапкан акчаларынын жалпы суммасы чыксын.
--?
