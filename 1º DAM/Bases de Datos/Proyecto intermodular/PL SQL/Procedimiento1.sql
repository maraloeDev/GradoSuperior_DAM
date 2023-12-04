--1. Un procedimiento que añade un usuario con los datos pasados como parametro
create or replace procedure add_user (dni usuario.dni_usuario%type, nombre usuario.nombre_usuario%type, 
    telefono usuario.telefono_usuario%type, correo usuario.correo_usuario%type, dir usuario.direccion_usuario%type,
    alergias usuario.alergias_usuario%type, f_nac usuario.fecha_nacimiento_usuario%type)
is
begin
	insert into usuario values (dni, nombre, telefono, correo, dir, alergias, f_nac);
end add_user;