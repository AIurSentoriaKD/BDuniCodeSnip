-- PROCEDIMIENTOS ALMACENADOS
-- DIEGO FLORES
-- 08/08/2022

-- p.a. para tescuela


use BDUniversidad
go

-- ACTIVIDAD: Implementar "Agregar", "Eliminar", "Listar", "Actualizar" y "Buscar"

-- PROCEDURE LISTAR ESCUELA
if OBJECT_ID('spListarEscuela') is not null
	drop proc spListarEscuela
go

create proc spListarEscuela
as
	begin
		select * from TEscuela;
	end
go

-- PROCEDURE AGREGAR ESCUELA
if OBJECT_ID('spAgregarEscuela') is not null
	drop proc spAgregarEscuela
go

create proc spAgregarEscuela
	@CodEscuela char(3),
	@Escuela varchar(50),
	@Facultad varchar(50)
as
	begin
		-- Codigo escuela debe ser unico
		if not exists(select CodEscuela from TEscuela where CodEscuela = @CodEscuela)
			-- Escuela debe ser unico
			if not exists(select Escuela from TEscuela where Escuela=@Escuela)
				begin
					insert into TEscuela values(@CodEscuela,@Escuela,@Facultad)
					select CodError=0,Mensaje='Se insertó correctamente escuela'
				end
			else select CodError = 1, Mensaje = 'Error: Escuela duplicada'
		else select CodError = 1, Mensaje = 'Error: CodEscuela duplicado'
	end
go

-- PROCEDURE ELIMINAR ESCUELA
if OBJECT_ID('spEliminarEscuela') is not null
	drop proc spEliminarEscuela
go

create proc spEliminarEscuela
	@CodEscuela char(3)
as
	begin
		if not exists(select CodEscuela from TAlumno where CodEscuela = @CodEscuela)
			begin
				delete from TEscuela where CodEscuela = @CodEscuela
			end
		else select CodError = 6, Mensaje = 'Error: No se puede borrar una escuela con alumnos en ella'
	end
go

-- PROCEDURE ACTUALIZAR ESCUELA
if OBJECT_ID('spActualizarEscuela') is not null
	drop proc spActualizarEscuela
go

create proc spActualizarEscuela
	@CodEscuela char(3),
	@Escuela varchar(50) = NULL,
	@Facultad varchar(50) = NULL
as
	begin
		if exists(select CodEscuela from TEscuela where CodEscuela = @CodEscuela)
			begin
				update TEscuela set Escuela = isnull(@Escuela,Escuela) where CodEscuela = @CodEscuela
				update TEscuela set Facultad = isnull(@Facultad,Facultad) where CodEscuela = @CodEscuela
			end
		else select CodError = 8, Mensaje = 'Error: La escuela no existe'
	end
go

-- PROCEDURE BUSCAR ESCUELA
if OBJECT_ID('spBuscarEscuela') is not null
	drop proc spBuscarEscuela
go

create proc spBuscarEscuela @stringfind varchar(max)
as
	begin
		select * from TEscuela
		where TEscuela.CodEscuela like '%'+@stringfind+'%'
		OR TEscuela.Escuela  LIKE '%'+@stringfind+'%'
		OR TEscuela.Facultad  LIKE '%'+@stringfind+'%'
	end
go

--  EJECUCIONES
-- agregar
exec spAgregarEscuela @CodEscuela = 'E06', @Escuela = 'Esc prueba', @Facultad = 'Fac Prueba'
go
select * from TEscuela
go

-- eliminar
exec spEliminarEscuela @CodEscuela = 'E06'
go
select * from TEscuela
go

--actualizar
exec spActualizarEscuela @CodEscuela = 'E06', @Escuela = 'Prueba 2'
go
select * from TEscuela
go
exec spActualizarEscuela @CodEscuela = 'E06', @Facultad = 'Prueba Facu 2'
go
select * from TEscuela
go
--listar
exec spListarEscuela
go

--buscar
exec spBuscarEscuela 'Ar'
go