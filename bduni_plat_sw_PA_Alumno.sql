-- ACTIVIDAD: Implementar "Agregar", "Eliminar", "Actualizar", "Listar" y "Buscar"
-- PROCEDURE AGREGAR ALUMNO

use BDUniversidad
go

if OBJECT_ID('spAgregarAlumno') is not null
	drop proc spAgregarAlumno
go

create proc spAgregarAlumno
	@CodAlumno char(5),
	@Apellidos varchar(50),
	@Nombres varchar(50),
	@LugarNac varchar(50),
	@FechaNac datetime,
	@CodEscuela char(3)
as
	begin
		if not exists(select CodAlumno from TAlumno where CodAlumno = @CodAlumno)
			if exists(select CodEscuela from TEscuela where CodEscuela = @CodEscuela)
				begin
					insert into TAlumno values(@CodAlumno,@Apellidos,@Nombres,@LugarNac,@FechaNac,@CodEscuela)
					select CodError = 0, Mensaje = 'Aviso: Alumno agregado Correctamente'
				end
			else select CodError = 4, Mensaje = 'Error: Codigo de escuela no existe'
		else select CodError = 3, Mensaje='Error: Codigo de alumno existente'
	end
go


-- PROCEDURE ELIMINAR ALUMNO
if OBJECT_ID('spEliminarAlumno') is not null
	drop proc spEliminarAlumno
go

create proc spEliminarAlumno
	@CodAlumno char(5)
as
	begin
		if exists(select CodAlumno from TAlumno where CodAlumno = @CodAlumno)
			begin
				delete from TAlumno where CodAlumno = @CodAlumno
				select CodError = 0, Mensaje = 'Aviso: Alumno eliminado correctamente'
			end
		else select CodError = 5, Mensaje = 'Error: El alumno no existe'
	end
go


-- PROCEDURE ACTUALIZAR ALUMNO
if OBJECT_ID('spActualizarAlumno') is not null
	drop proc spActualizarAlumno
go

create proc spActualizarAlumno
	@CodAlumno char(5),
	@Apellidos varchar(50) = NULL,
	@Nombres varchar(50) = NULL,
	@LugarNac varchar(50) = NULL,
	@FechaNac datetime = NULL,
	@CodEscuela char(3) = NULL
as
	begin
		if exists(select CodAlumno from TAlumno where CodAlumno = @CodAlumno)
			begin
				update TAlumno set Apellidos = isnull(@Apellidos,Apellidos) where CodAlumno = @CodAlumno
				update TAlumno set Nombres = isnull(@Nombres,Nombres) where CodAlumno = @CodAlumno
				update TAlumno set LugarNac = isnull(@LugarNac,LugarNac) where CodAlumno = @CodAlumno
				update TAlumno set FechaNac = isnull(@FechaNac,FechaNac) where CodAlumno = @CodAlumno
				update TAlumno set CodEscuela = isnull(@CodEscuela,CodEscuela) where CodAlumno = @CodAlumno
				select CodError = 0, Mensaje = 'Aviso: Alumno actualizado'
			end
		else select CodError = 7, Mensaje = 'Error: El alumno no existe'
	end
go


-- PROCEDURE LISTAR ALUMNO
if OBJECT_ID('spListarAlumno') is not null
	drop proc spListarAlumno
go

create proc spListarAlumno
as
	begin
		select * from TAlumno
	end
go


-- PROCEDURE BUSCAR ALUMNO
if OBJECT_ID('spBuscarAlumno') is not null
	drop proc spBuscarAlumno
go

create proc spBuscarAlumno @stringfind VARCHAR(max)
AS
BEGIN 
   SELECT * FROM TAlumno
    WHERE TAlumno.CodAlumno LIKE '%'+@stringfind+'%'
		OR TAlumno.Nombres LIKE '%'+@stringfind+'%'
		OR TAlumno.Apellidos LIKE '%'+@stringfind+'%'
END
go

-- EJECUCIONES
-- agregar
exec spAgregarAlumno 51, 'Flores Cardenas', 'Diego', 'HH Vallejos Santoni', '06-03-2000', 'E03'
go
-- eliminar
exec spEliminarAlumno 51
go
-- actualizar
select * from TAlumno where CodAlumno = 51
go

exec spActualizarAlumno @CodAlumno = 51, @Nombres = 'Diego Sebastian'
go
exec spActualizarAlumno @CodAlumno = 51, @LugarNac = 'Urb Luis Vallejos Sant'
go

-- listar
exec spListarAlumno
go

-- buscar
exec spBuscarAlumno 'di'
go
