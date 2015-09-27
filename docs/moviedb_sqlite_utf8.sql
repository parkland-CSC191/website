-- =====================================================
-- 
--      Sample Database for SQL Success by S. Faroult
--          SQLite - character set : utf8
-- 
-- =====================================================
pragma foreign_keys = on;
-- 
-- Drop existing objects
-- 
drop table if exists credits;
drop table if exists people;
drop table if exists movies;
drop table if exists countries;
drop table if exists forum_posts;
drop table if exists forum_topics;
drop table if exists forum_members;
drop table if exists films_francais;
create table countries(country_code char(2) not null
                                 constraint "country code length"
                                   check(length(country_code)<=2),
                       country_name varchar(50) not null
                                 constraint "country name length"
                                   check(length(country_name)<=50),
                       continent    varchar(20) not null
                                 constraint "continent length"
                                   check(length(continent)<=20),
                       primary key(country_code),
                       unique(country_name));
create table movies(movieid       integer not null primary key,
                    title         varchar(100) not null
                                 constraint "title length"
                                   check(length(title)<=100),
                    country       char(2) not null
                                 constraint "country length"
                                   check(length(country)<=2),
                    year_released int not null
                                 constraint "year_released numerical"
                                   check(year_released+0=year_released),
                    unique(title, country, year_released),
                    foreign key(country) references countries(country_code));
create table people(peopleid   integer not null primary key,
                    first_name varchar(30) null
                                 constraint "first_name length"
                                   check(length(first_name)<=30),
                    surname    varchar(30) not null
                                 constraint "surname length"
                                   check(length(surname)<=30),
                    born       int not null
                                 constraint "born numerical"
                                   check(born+0=born),
                    died       int null
                                 constraint "died numerical"
                                   check(died+0=died),
                    unique(surname, first_name));
create table credits(movieid     int not null,
                     peopleid    int not null,
                     credited_as char(1) not null
                                 constraint "credited_as length"
                                   check(length(credited_as)=1),
                     primary key(movieid, peopleid, credited_as),
                     foreign key(movieid) references movies(movieid),
                     foreign key(peopleid) references people(peopleid));
create table forum_members
     (memberid     int not null primary key,
      name         varchar(30) not null,
      registered   date not null,
      unique(name));
create table forum_topics
     (topicid      int not null primary key,
      post_date    datetime not null,
      memberid     int not null,
      message      text not null,
      foreign key (memberid) references forum_members(memberid));
create table forum_posts
     (topicid      int not null,
      postid       int not null,
      post_date    datetime not null,
      memberid     int not null,
      ancestry     varchar(1000),
      message      text not null,
      primary key (postid),
      foreign key (memberid) references forum_members(memberid),
      foreign key (topicid) references forum_topics(topicid));
create table films_francais
     (titre   varchar(100) not null,
      annee   int not null,
      primary key(titre, annee));
-- -- begin transaction;
insert into countries(country_code, country_name, continent)
values('bo', 'Bolivia', 'AMERICA');
insert into countries(country_code, country_name, continent)
values('us', 'United States', 'AMERICA');
insert into countries(country_code, country_name, continent)
values('cn', 'China', 'ASIA');
insert into countries(country_code, country_name, continent)
values('hk', 'Hong Kong', 'ASIA');
insert into countries(country_code, country_name, continent)
values('in', 'India', 'ASIA');
insert into countries(country_code, country_name, continent)
values('jp', 'Japan', 'ASIA');
insert into countries(country_code, country_name, continent)
values('fr', 'France', 'EUROPE');
insert into countries(country_code, country_name, continent)
values('de', 'Germany', 'EUROPE');
insert into countries(country_code, country_name, continent)
values('it', 'Italy', 'EUROPE');
insert into countries(country_code, country_name, continent)
values('pt', 'Portugal', 'EUROPE');
insert into countries(country_code, country_name, continent)
values('ru', 'Russia', 'EUROPE');
insert into countries(country_code, country_name, continent)
values('se', 'Sweden', 'EUROPE');
insert into countries(country_code, country_name, continent)
values('gb', 'United Kingdom', 'EUROPE');
insert into countries(country_code, country_name, continent)
values('nz', 'New Zealand', 'OCEANIA');
-- commit;
-- begin transaction;
insert into people(first_name, surname, born, died)
values('Grigori', 'Aleksandrov', 1903, 1983);
insert into people(first_name, surname, born, died)
values('Woody', 'Allen', 1935, null);
insert into people(first_name, surname, born, died)
values('Julie', 'Andrews', 1935, null);
insert into people(first_name, surname, born, died)
values(null, 'Arletty', 1898, 1992);
insert into people(first_name, surname, born, died)
values('Michel', 'Auclair', 1922, 1988);
insert into people(first_name, surname, born, died)
values('Amitabh', 'Bachchan', 1942, null);
insert into people(first_name, surname, born, died)
values('Kanu', 'Bannerjee', 1905, 1985);
insert into people(first_name, surname, born, died)
values('Karuna', 'Bannerjee', 1919, 2001);
insert into people(first_name, surname, born, died)
values('Ingmar', 'Bergman', 1918, 2007);
insert into people(first_name, surname, born, died)
values('Ingrid', 'Bergman', 1915, 1982);
insert into people(first_name, surname, born, died)
values('Luc', 'Besson', 1959, null);
insert into people(first_name, surname, born, died)
values('Gunnar', 'Björnstrand', 1909, 1986);
insert into people(first_name, surname, born, died)
values('Orlando', 'Bloom', 1977, null);
insert into people(first_name, surname, born, died)
values('Humphrey', 'Bogart', 1899, 1957);
insert into people(first_name, surname, born, died)
values('Marlon', 'Brando', 1924, 2004);
insert into people(first_name, surname, born, died)
values('Marcel', 'Carné', 1909, 1996);
insert into people(first_name, surname, born, died)
values('Leslie', 'Cheung', 1956, 2003);
insert into people(first_name, surname, born, died)
values('Yun-Fat', 'Chow', 1955, null);
insert into people(first_name, surname, born, died)
values('Jean', 'Cocteau', 1889, 1963);
insert into people(first_name, surname, born, died)
values('Joseph', 'Cotten', 1905, 1994);
insert into people(first_name, surname, born, died)
values('Alain', 'Cuny', 1908, 1994);
insert into people(first_name, surname, born, died)
values('Michael', 'Curtiz', 1886, 1962);
insert into people(first_name, surname, born, died)
values('Josette', 'Day', 1914, 1978);
insert into people(first_name, surname, born, died)
values('Robert', 'De Niro', 1943, null);
insert into people(first_name, surname, born, died)
values(null, 'Dharmendra', 1935, null);
insert into people(first_name, surname, born, died)
values('Richard', 'Dreyfuss', 1947, null);
insert into people(first_name, surname, born, died)
values('Marie', 'Déa', 1912, 1992);
insert into people(first_name, surname, born, died)
values('Clint', 'Eastwood', 1930, null);
insert into people(first_name, surname, born, died)
values('Sergei', 'Eisenstein', 1898, 1948);
insert into people(first_name, surname, born, died)
values('Bengt', 'Ekerot', 1920, 1971);
insert into people(first_name, surname, born, died)
values('Harrison', 'Ford', 1942, null);
insert into people(first_name, surname, born, died)
values('Cary', 'Grant', 1904, 1986);
insert into people(first_name, surname, born, died)
values('Herbert', 'Grönemeyer', 1956, null);
insert into people(first_name, surname, born, died)
values('Alec', 'Guinness', 1914, 2000);
insert into people(first_name, surname, born, died)
values('Daryl', 'Hannah', 1960, null);
insert into people(first_name, surname, born, died)
values('Rutger', 'Hauer', 1944, null);
insert into people(first_name, surname, born, died)
values('Paul', 'Henreid', 1905, 1992);
insert into people(first_name, surname, born, died)
values('Alfred', 'Hitchcock', 1899, 1980);
insert into people(first_name, surname, born, died)
values('Trevor', 'Howard', 1913, 1988);
insert into people(first_name, surname, born, died)
values('Yoshio', 'Inaba', 1920, 1998);
insert into people(first_name, surname, born, died)
values('Peter', 'Jackson', 1961, null);
insert into people(first_name, surname, born, died)
values('Milla', 'Jovovich', 1975, null);
insert into people(first_name, surname, born, died)
values('Elia', 'Kazan', 1909, 2003);
insert into people(first_name, surname, born, died)
values('Diane', 'Keaton', 1946, null);
insert into people(first_name, surname, born, died)
values('Sanjeev', 'Kumar', 1938, 1985);
insert into people(first_name, surname, born, died)
values('Akira', 'Kurosawa', 1910, 1998);
insert into people(first_name, surname, born, died)
values('David', 'Lean', 1908, 1991);
insert into people(first_name, surname, born, died)
values('Fernand', 'Ledoux', 1897, 1993);
insert into people(first_name, surname, born, died)
values('Sergio', 'Leone', 1929, 1989);
insert into people(first_name, surname, born, died)
values('Ray', 'Liotta', 1954, null);
insert into people(first_name, surname, born, died)
values('Peter', 'Lorre', 1904, 1964);
insert into people(first_name, surname, born, died)
values('Ian', 'MacKellen', 1939, null);
insert into people(first_name, surname, born, died)
values('Karl', 'Malden', 1912, 2009);
insert into people(first_name, surname, born, died)
values('Hema', 'Malini', 1948, null);
insert into people(first_name, surname, born, died)
values('Jean', 'Marais', 1913, 1998);
insert into people(first_name, surname, born, died)
values('Toshirô', 'Mifune', 1920, 1997);
insert into people(first_name, surname, born, died)
values('Seiji', 'Miyaguchi', 1913, 1985);
insert into people(first_name, surname, born, died)
values('Viggo', 'Mortensen', 1958, null);
insert into people(first_name, surname, born, died)
values('Peter', 'O''Toole', 1932, 2013);
insert into people(first_name, surname, born, died)
values('Gary', 'Oldman', 1958, null);
insert into people(first_name, surname, born, died)
values('Mila', 'Parely', 1917, 2012);
insert into people(first_name, surname, born, died)
values('Joe', 'Pesci', 1943, null);
insert into people(first_name, surname, born, died)
values('Wolfgang', 'Petersen', 1941, null);
insert into people(first_name, surname, born, died)
values('Christopher', 'Plummer', 1929, null);
insert into people(first_name, surname, born, died)
values('Jürgen', 'Prochnow', 1941, null);
insert into people(first_name, surname, born, died)
values('Claude', 'Rains', 1889, 1967);
insert into people(first_name, surname, born, died)
values('Satyajit', 'Ray', 1921, 1992);
insert into people(first_name, surname, born, died)
values('Carol', 'Reed', 1906, 1976);
insert into people(first_name, surname, born, died)
values('Eva Marie', 'Saint', 1924, null);
insert into people(first_name, surname, born, died)
values('Roy', 'Scheider', 1932, 2008);
insert into people(first_name, surname, born, died)
values('Martin', 'Scorsese', 1942, null);
insert into people(first_name, surname, born, died)
values('Ridley', 'Scott', 1937, null);
insert into people(first_name, surname, born, died)
values('Omar', 'Sharif', 1932, 2015);
insert into people(first_name, surname, born, died)
values('Robert', 'Shaw', 1927, 1978);
insert into people(first_name, surname, born, died)
values('Takashi', 'Shimura', 1905, 1982);
insert into people(first_name, surname, born, died)
values('Ramesh', 'Sippy', 1947, null);
insert into people(first_name, surname, born, died)
values('Steven', 'Spielberg', 1946, null);
insert into people(first_name, surname, born, died)
values('Robert', 'Stevenson', 1905, 1986);
insert into people(first_name, surname, born, died)
values('Lung', 'Ti', 1946, null);
insert into people(first_name, surname, born, died)
values('Alida', 'Valli', 1921, 2006);
insert into people(first_name, surname, born, died)
values('Lee', 'Van Cleef', 1925, 1989);
insert into people(first_name, surname, born, died)
values('Dick', 'Van Dyke', 1925, null);
insert into people(first_name, surname, born, died)
values('Eli', 'Wallach', 1915, 2014);
insert into people(first_name, surname, born, died)
values('Laiming', 'Wan', 1899, 1997);
insert into people(first_name, surname, born, died)
values('Orson', 'Welles', 1915, 1985);
insert into people(first_name, surname, born, died)
values('Bruce', 'Willis', 1955, null);
insert into people(first_name, surname, born, died)
values('Robert', 'Wise', 1914, 2005);
insert into people(first_name, surname, born, died)
values('John', 'Woo', 1946, null);
insert into people(first_name, surname, born, died)
values('Elijah', 'Wood', 1981, null);
insert into people(first_name, surname, born, died)
values('Josef', 'von Sternberg', 1894, 1969);
insert into people(first_name, surname, born, died)
values('Erich', 'von Stroheim', 1885, 1957);
insert into people(first_name, surname, born, died)
values('Max', 'von Sydow', 1929, null);
insert into people(first_name, surname, born, died)
values('Lars', 'von Trier', 1956, null);
insert into people(first_name, surname, born, died)
values('Margarethe', 'von Trotta', 1942, null);
-- commit;
-- begin transaction;
insert into movies(title, country, year_released)
values('Annie Hall', 'us', 1977);
insert into movies(title, country, year_released)
values('Blade Runner', 'us', 1982);
insert into movies(title, country, year_released)
values('Bronenosets Potyomkin', 'ru', 1925);
insert into movies(title, country, year_released)
values('Casablanca', 'us', 1942);
insert into movies(title, country, year_released)
values('Citizen Kane', 'us', 1941);
insert into movies(title, country, year_released)
values('Das Boot', 'de', 1981);
insert into movies(title, country, year_released)
values('Det sjunde inseglet', 'se', 1957);
insert into movies(title, country, year_released)
values('Goodfellas', 'us', 1990);
insert into movies(title, country, year_released)
values('Il buono, il brutto, il cattivo', 'it', 1966);
insert into movies(title, country, year_released)
values('Jaws', 'us', 1975);
insert into movies(title, country, year_released)
values('Ladri di biciclette', 'it', 1948);
insert into movies(title, country, year_released)
values('Lawrence Of Arabia', 'gb', 1962);
insert into movies(title, country, year_released)
values('Le cinquième élément', 'fr', 1997);
insert into movies(title, country, year_released)
values('Les Visiteurs du Soir', 'fr', 1942);
insert into movies(title, country, year_released)
values('Mary Poppins', 'us', 1964);
insert into movies(title, country, year_released)
values('On The Waterfront', 'us', 1954);
insert into movies(title, country, year_released)
values('Pather Panchali', 'in', 1955);
insert into movies(title, country, year_released)
values('Shichinin no Samurai', 'jp', 1954);
insert into movies(title, country, year_released)
values('Sholay', 'in', 1975);
insert into movies(title, country, year_released)
values('The Lord of the Rings', 'nz', 2001);
insert into movies(title, country, year_released)
values('The Sound of Music', 'us', 1965);
insert into movies(title, country, year_released)
values('The Third Man', 'gb', 1949);
insert into movies(title, country, year_released)
values('Ying hung boon sik', 'hk', 1986);
insert into movies(title, country, year_released)
values('Notorious', 'us', 1946);
insert into movies(title, country, year_released)
values('Da Nao Tian Gong', 'cn', 1965);
insert into movies(title, country, year_released)
values('La Belle et la Bête', 'fr', 1946);
-- commit;
-- begin transaction;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Annie Hall'
        and country = 'us'
        and year_released = 1977) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Woody'
        and surname = 'Allen'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Woody'
        and surname = 'Allen'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Diane'
        and surname = 'Keaton') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Blade Runner'
        and country = 'us'
        and year_released = 1982) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Ridley'
        and surname = 'Scott'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Harrison'
        and surname = 'Ford'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Rutger'
        and surname = 'Hauer'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Daryl'
        and surname = 'Hannah') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Bronenosets Potyomkin'
        and country = 'ru'
        and year_released = 1925) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Sergei'
        and surname = 'Eisenstein'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Grigori'
        and surname = 'Aleksandrov') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Casablanca'
        and country = 'us'
        and year_released = 1942) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Michael'
        and surname = 'Curtiz'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Claude'
        and surname = 'Rains'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Humphrey'
        and surname = 'Bogart'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Peter'
        and surname = 'Lorre'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Paul'
        and surname = 'Henreid'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Ingrid'
        and surname = 'Bergman') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Citizen Kane'
        and country = 'us'
        and year_released = 1941) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Joseph'
        and surname = 'Cotten'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Orson'
        and surname = 'Welles'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Orson'
        and surname = 'Welles') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Das Boot'
        and country = 'de'
        and year_released = 1981) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Wolfgang'
        and surname = 'Petersen'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Jürgen'
        and surname = 'Prochnow'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Herbert'
        and surname = 'Grönemeyer') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Det sjunde inseglet'
        and country = 'se'
        and year_released = 1957) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Gunnar'
        and surname = 'Björnstrand'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Ingmar'
        and surname = 'Bergman'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Bengt'
        and surname = 'Ekerot') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Goodfellas'
        and country = 'us'
        and year_released = 1990) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Martin'
        and surname = 'Scorsese'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Robert'
        and surname = 'De Niro'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Joe'
        and surname = 'Pesci'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Ray'
        and surname = 'Liotta') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Il buono, il brutto, il cattivo'
        and country = 'it'
        and year_released = 1966) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Eli'
        and surname = 'Wallach'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Lee'
        and surname = 'Van Cleef'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Sergio'
        and surname = 'Leone'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Clint'
        and surname = 'Eastwood') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Jaws'
        and country = 'us'
        and year_released = 1975) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Robert'
        and surname = 'Shaw'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Roy'
        and surname = 'Scheider'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Steven'
        and surname = 'Spielberg'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Richard'
        and surname = 'Dreyfuss') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Lawrence Of Arabia'
        and country = 'gb'
        and year_released = 1962) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'David'
        and surname = 'Lean'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Alec'
        and surname = 'Guinness'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Peter'
        and surname = 'O''Toole'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Omar'
        and surname = 'Sharif') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Le cinquième élément'
        and country = 'fr'
        and year_released = 1997) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Bruce'
        and surname = 'Willis'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Gary'
        and surname = 'Oldman'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Luc'
        and surname = 'Besson'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Milla'
        and surname = 'Jovovich') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Les Visiteurs du Soir'
        and country = 'fr'
        and year_released = 1942) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Fernand'
        and surname = 'Ledoux'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = ''
        and surname = 'Arletty'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Alain'
        and surname = 'Cuny'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Marcel'
        and surname = 'Carné'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Marie'
        and surname = 'Déa') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Mary Poppins'
        and country = 'us'
        and year_released = 1964) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Robert'
        and surname = 'Stevenson'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Dick'
        and surname = 'Van Dyke'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Julie'
        and surname = 'Andrews') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'On The Waterfront'
        and country = 'us'
        and year_released = 1954) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Elia'
        and surname = 'Kazan'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Karl'
        and surname = 'Malden'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Marlon'
        and surname = 'Brando'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Eva Marie'
        and surname = 'Saint') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Pather Panchali'
        and country = 'in'
        and year_released = 1955) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Kanu'
        and surname = 'Bannerjee'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Karuna'
        and surname = 'Bannerjee'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Satyajit'
        and surname = 'Ray') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Shichinin no Samurai'
        and country = 'jp'
        and year_released = 1954) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Takashi'
        and surname = 'Shimura'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Akira'
        and surname = 'Kurosawa'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Seiji'
        and surname = 'Miyaguchi'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Yoshio'
        and surname = 'Inaba'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Toshirô'
        and surname = 'Mifune') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Sholay'
        and country = 'in'
        and year_released = 1975) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = ''
        and surname = 'Dharmendra'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Sanjeev'
        and surname = 'Kumar'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Amitabh'
        and surname = 'Bachchan'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Ramesh'
        and surname = 'Sippy'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Hema'
        and surname = 'Malini') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'The Lord of the Rings'
        and country = 'nz'
        and year_released = 2001) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Ian'
        and surname = 'MacKellen'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Viggo'
        and surname = 'Mortensen'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Peter'
        and surname = 'Jackson'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Orlando'
        and surname = 'Bloom'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Elijah'
        and surname = 'Wood') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'The Sound of Music'
        and country = 'us'
        and year_released = 1965) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Robert'
        and surname = 'Wise'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Christopher'
        and surname = 'Plummer'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Julie'
        and surname = 'Andrews') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'The Third Man'
        and country = 'gb'
        and year_released = 1949) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Joseph'
        and surname = 'Cotten'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Carol'
        and surname = 'Reed'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Trevor'
        and surname = 'Howard'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Orson'
        and surname = 'Welles'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Alida'
        and surname = 'Valli') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Ying hung boon sik'
        and country = 'hk'
        and year_released = 1986) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Lung'
        and surname = 'Ti'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'John'
        and surname = 'Woo'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Yun-Fat'
        and surname = 'Chow'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Leslie'
        and surname = 'Cheung') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Notorious'
        and country = 'us'
        and year_released = 1946) m
   cross join
     (select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Claude'
        and surname = 'Rains'
      union all
      select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Alfred'
        and surname = 'Hitchcock'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Cary'
        and surname = 'Grant'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Ingrid'
        and surname = 'Bergman') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'Da Nao Tian Gong'
        and country = 'cn'
        and year_released = 1965) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Laiming'
        and surname = 'Wan') p;
insert into credits(movieid, peopleid, credited_as)
select m.movieid, p.peopleid, p.credited_as
from (select movieid
      from movies
      where title = 'La Belle et la Bête'
        and country = 'fr'
        and year_released = 1946) m
   cross join
     (select peopleid, 'D' credited_as
      from people
      where coalesce(first_name, '') = 'Jean'
        and surname = 'Cocteau'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Jean'
        and surname = 'Marais'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Josette'
        and surname = 'Day'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Michel'
        and surname = 'Auclair'
      union all
      select peopleid, 'A' credited_as
      from people
      where coalesce(first_name, '') = 'Mila'
        and surname = 'Parely') p;
-- commit;
-- begin transaction;
insert into forum_members(memberid, name, registered)
values(1,'Harry', date('now', '-370 days'));
insert into forum_members(memberid, name, registered)
values(2,'Strangelove', date('now', '-335 days'));
insert into forum_members(memberid, name, registered)
values(3,'Lorelei', date('now', '-308 days'));
insert into forum_members(memberid, name, registered)
values(4,'Harry Lime', date('now', '-289 days'));
insert into forum_members(memberid, name, registered)
values(5,'Rick', date('now', '-249 days'));
insert into forum_members(memberid, name, registered)
values(6,'Darth Vader', date('now', '-243 days'));
insert into forum_members(memberid, name, registered)
values(7,'Jennifer', date('now', '-194 days'));
insert into forum_members(memberid, name, registered)
values(8,'Holly', date('now', '-65 days'));
insert into forum_members(memberid, name, registered)
values(9,'Vito', date('now', '-35 days'));
insert into forum_members(memberid, name, registered)
values(10,'Sally', date('now', '-20 days'));
insert into forum_topics(topicid, post_date,
                         memberid, message)
values(1,
       date('now','-1 day','10 hours','23 minutes'),
       7,
       'What do you think of 2001 A Space Odyssey?');
insert into forum_topics(topicid, post_date,
                         memberid, message)
values(2,
       date('now','-1 day','10 hours','30 minutes'),
       1,
       'Wouldn''t you in Casablanca rather be with Humphrey Bogart than the other guy??');
insert into forum_topics(topicid, post_date,
                         memberid, message)
values(3,
       date('now','-1 day','10 hours','41 minutes'),
       4,
       'Do you prefer Italian Renaissance or brotherly love and five hundred years of democracy and peace?');
insert into forum_posts(topicid, postid, post_date,
                        memberid, ancestry,
                        message)
values(1, 1723,
       date('now','-1 day','10 hours','29 minutes'),
       8, null,
       'Kubrick''s best film');
insert into forum_posts(topicid, postid, post_date,
                        memberid, ancestry,
                        message)
values(2, 1725,
       date('now','-1 day','10 hours','32 minutes'),
       10, null,
       'I don''t want to spend the rest of my life in Casablanca married to a man who runs a bar. I probably sound very snobbish to you but I don''t.');
insert into forum_posts(topicid, postid, post_date,
                        memberid, ancestry,
                        message)
values(1, 1727,
       date('now','-1 day','10 hours','31 minutes'),
       3, null,
       'I didn''t understand anything');
insert into forum_posts(topicid, postid, post_date,
                        memberid, ancestry,
                        message)
values(1, 1732,
       date('now','-1 day','10 hours','35 minutes'),
       6, '0000001723',
       'Nothing beats Star Wars');
insert into forum_posts(topicid, postid, post_date,
                        memberid, ancestry,
                        message)
values(1, 1733,
       date('now','-1 day','10 hours','36 minutes'),
       4, '00000017230000001732',
       'Are you kidding?');
insert into forum_posts(topicid, postid, post_date,
                        memberid, ancestry,
                        message)
values(2, 1734,
       date('now','-1 day','10 hours','36 minutes'),
       1, '0000001725',
       'You''d rather be in a passionless marriage.');
insert into forum_posts(topicid, postid, post_date,
                        memberid, ancestry,
                        message)
values(2, 1741,
       date('now','-1 day','10 hours','37 minutes'),
       10, '00000017250000001734',
       'And be the first lady of Czechoslovakia.');
insert into forum_posts(topicid, postid, post_date,
                        memberid, ancestry,
                        message)
values(1, 1743,
       date('now','-1 day','10 hours','38 minutes'),
       2, '0000001723',
       'I prefer another one :-)');
insert into forum_posts(topicid, postid, post_date,
                        memberid, ancestry,
                        message)
values(1, 1747,
       date('now','-1 day','10 hours','40 minutes'),
       9, '00000017230000001732',
       'Darth, you''ll stop trolling if I ask you gently.');
-- commit;
-- begin transaction;
insert into films_francais(titre, annee)
values('Les Enfants du Paradis', 1945);
insert into films_francais(titre, annee)
values('Pierrot le Fou', 1965);
insert into films_francais(titre, annee)
values('Les 400 coups', 1959);
insert into films_francais(titre, annee)
values('Le Salaire de la Peur', 1953);
insert into films_francais(titre, annee)
values('Le Fabuleux Destin d''Amélie Poulain', 2001);
-- commit;
