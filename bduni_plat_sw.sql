-- BASE DE DATOS EJEMPLO
-- Hugo Espetia
-- 8/8/2022

use master
go

if DB_ID('BDUniversidad') is not null
	drop database BDUniversidad
go
create database BDUniversidad
go

use BDUniversidad
go

-- crear tablas
if OBJECT_ID('TEscuela') is not null
	drop table TEscuela
go
create table TEscuela
(
	CodEscuela char (3) primary key,
	Escuela varchar(50),
	Facultad varchar(50)
)
go

if OBJECT_ID('TAlumno') is not null
	drop table TAlumno
go
create table TAlumno
(
	CodAlumno char(5) primary key,
	Apellidos varchar(50),
	Nombres varchar(50),
	LugarNac varchar(50),
	FechaNac date,
	CodEscuela char(3),
	constraint fk_talumno foreign key (CodEscuela) references TEscuela
)
go

-- Inserción de datos
insert into TEscuela values('E01', 'Sistemas', 'Ingenieria')
insert into TEscuela values('E02', 'Civil', 'Ingenieria')
insert into TEscuela values('E03', 'Industrial', 'Ingenieria')
insert into TEscuela values('E04', 'Ambiental', 'Ingenieria')
insert into TEscuela values('E05', 'Arquitectura', 'Ingenieria')
go

insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (1, 'Berriball', 'Ashely', '16079 Anderson Circle', '2000-06-30T20:55:20Z', 'E01');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (2, 'Betancourt', 'Hirsch', '52 Hauk Parkway', '2000-10-10T07:55:31Z', 'E01');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (3, 'Abelson', 'Rowan', '60941 Arapahoe Junction', '2000-03-05T00:07:24Z', 'E01');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (4, 'Yakobowitch', 'Genvieve', '0886 New Castle Road', '2000-05-27T20:23:31Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (5, 'Rickardsson', 'Regan', '40 Warbler Crossing', '2000-11-08T15:57:52Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (6, 'Dagwell', 'Meier', '80862 Barby Lane', '2000-04-18T06:25:18Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (7, 'Dinis', 'Correy', '037 Fordem Street', '2000-05-17T12:02:00Z', 'E02');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (8, 'Caldero', 'Codi', '2 Mayer Lane', '2000-04-09T15:03:05Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (9, 'Rabbitt', 'Shalom', '51397 Cordelia Pass', '2000-02-21T11:13:54Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (10, 'Evreux', 'Allene', '34 Warbler Plaza', '2000-01-29T08:55:14Z', 'E03');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (11, 'Clitheroe', 'Elita', '2 Atwood Pass', '2000-10-20T10:38:40Z', 'E01');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (12, 'Pettiward', 'Anjela', '969 Atwood Way', '2000-12-28T09:07:51Z', 'E02');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (13, 'Alstead', 'Horton', '30 Killdeer Way', '2000-08-10T07:21:38Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (14, 'Egginton', 'Trueman', '1051 Hazelcrest Avenue', '2000-05-30T18:33:59Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (15, 'Jirka', 'Sisile', '63 Marquette Plaza', '2000-10-16T18:05:37Z', 'E03');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (16, 'Tow', 'Drucy', '2 Bay Alley', '2000-04-23T20:19:26Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (17, 'De Mattei', 'Dinny', '95 Sachtjen Parkway', '2000-10-12T00:28:27Z', 'E02');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (18, 'Stokoe', 'Brook', '0 Sullivan Circle', '2000-07-08T12:11:31Z', 'E01');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (19, 'Nollet', 'Loren', '45 Cascade Road', '2000-11-01T04:59:53Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (20, 'Arundale', 'Jerrome', '006 Del Mar Street', '2000-10-20T16:37:47Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (21, 'Dillingham', 'Bank', '1 Spaight Point', '2000-08-16T06:03:23Z', 'E01');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (22, 'Sperry', 'Caro', '67 Transport Crossing', '2000-10-21T13:34:25Z', 'E01');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (23, 'Winsborrow', 'Egon', '8 Debra Center', '2000-01-16T09:16:23Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (24, 'Guerreru', 'Early', '97 Lien Court', '2000-11-13T12:03:07Z', 'E01');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (25, 'Stoney', 'Klarrisa', '84 Oakridge Terrace', '2000-07-29T12:09:25Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (26, 'Jerrolt', 'Clerc', '70185 Jenna Crossing', '2000-02-25T08:58:59Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (27, 'Kleeborn', 'Philippine', '082 Rutledge Drive', '2000-10-14T05:21:33Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (28, 'Arnaldi', 'Niels', '36 Brentwood Way', '2000-01-17T11:10:06Z', 'E03');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (29, 'Jarrel', 'Ediva', '5603 Rockefeller Circle', '2000-03-13T17:30:56Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (30, 'Ecclestone', 'Cherlyn', '2171 Susan Hill', '2000-07-02T19:50:59Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (31, 'Kubyszek', 'Rowan', '90245 Nova Junction', '2000-06-19T18:24:26Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (32, 'Montez', 'Nicolai', '09 Arkansas Terrace', '2000-04-18T04:24:15Z', 'E02');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (33, 'Cridland', 'Iseabal', '47148 Tomscot Court', '2000-08-15T00:55:17Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (34, 'Tillyer', 'Robbin', '00 Springs Crossing', '2000-09-08T05:45:10Z', 'E02');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (35, 'Norkett', 'Pall', '2 Northfield Alley', '2000-01-28T12:53:55Z', 'E01');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (36, 'Welton', 'Tommy', '977 Killdeer Park', '2000-01-15T02:16:54Z', 'E03');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (37, 'O''Malley', 'Jenine', '28 Crownhardt Alley', '2000-07-21T23:17:14Z', 'E03');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (38, 'Knotte', 'Renee', '1 Carioca Terrace', '2000-02-16T18:25:23Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (39, 'Louder', 'Linnie', '1115 Sutteridge Court', '2000-12-19T12:39:02Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (40, 'Leith', 'Eugenie', '23 Welch Avenue', '2000-12-07T02:10:26Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (41, 'Kirwan', 'Olag', '79065 Carberry Hill', '2000-04-30T07:48:47Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (42, 'Smallcomb', 'Christophorus', '75352 Springview Drive', '2000-07-19T10:17:36Z', 'E03');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (43, 'Swoffer', 'Linn', '8199 Dixon Road', '2000-04-02T19:32:14Z', 'E02');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (44, 'Taw', 'Tommy', '62388 Tennyson Avenue', '2000-10-14T05:37:29Z', 'E05');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (45, 'Hobden', 'Barrie', '009 Jackson Pass', '2000-08-10T07:47:44Z', 'E02');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (46, 'Nowakowski', 'Lydon', '976 Barnett Pass', '2000-02-02T19:59:07Z', 'E04');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (47, 'Peake', 'Clay', '11 Cottonwood Park', '2000-11-14T07:57:52Z', 'E01');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (48, 'Sunner', 'Kayle', '20 Heath Alley', '2000-09-23T18:39:50Z', 'E03');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (49, 'Robjant', 'Fritz', '6679 Center Pass', '2000-09-08T05:04:47Z', 'E03');
insert into TAlumno (CodAlumno, Apellidos, Nombres, LugarNac, FechaNac, CodEscuela) values (50, 'Tredwell', 'Willabella', '1 Derek Point', '2000-04-15T01:54:25Z', 'E05');