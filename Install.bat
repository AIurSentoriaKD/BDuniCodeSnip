echo Instalador de la base de datos Universidad
echo Autor: Flores Diego
echo 08 de Agosto de 2022
sqlcmd -S. -E -i bduni_plat_sw.sql
sqlcmd -S. -E -i bduni_plat_sw_PA.sql
sqlcmd -S. -E -i bduni_plat_sw_PA_Alumno.sql
echo Instalación completa
pause