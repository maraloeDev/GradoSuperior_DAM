---------ENUNCIADOS CONSULTAS (join)---------------

-- 1 Qué taquillas se han dado con un número de acceso a Carlos.
select distinct acceso.numero_taquilla, usuario.nombre_usuario
from acceso, usuario
where acceso.dni_usuario = usuario.dni_usuario
and usuario.nombre_usuario like '%Carlos%';

-- 2 Qué usuarios han hecho una reserva y qué día.
select distinct usuario.nombre_usuario, to_char(reserva.fecha_reserva, 'dd') "Dia"
from usuario,reserva
where usuario.dni_usuario = reserva.dni_usuario;

-- 3 Sacar del animador Paco en qué eventos ha participado y la fecha cuando tuvo lugar.
select distinct animacion.nombre_animador, evento.nombre_evento,evento.fecha_evento
from animacion,evento, acceso
where evento.fecha_evento = acceso.fecha_acceso
and animacion.nombre_animador like 'Paco%';

-- 4 Qué usuarios han escogido un menú específico en un mes.
select distinct usuario.nombre_usuario, menu.nombre_menu, to_char (acceso.fecha_acceso, 'dd') "Dia"
from usuario, menu, acceso
where usuario.dni_usuario =  acceso.dni_usuario 
and menu.nombre_menu like 'Menu Rojo'
and to_char(acceso.fecha_acceso,'MM') like '05';

-- 6 Mostrar los usuarios que han tenido un evento en un fecha determinada.
select usuario.nombre_usuario, evento.nombre_evento, evento.fecha_evento 
from usuario, evento, asiste
where usuario.dni_usuario = asiste.dni_usuario and asiste.id_evento = evento.id_evento
and evento.fecha_evento like '15-FEB-22';

-- 7 Mostrar la informacion de los monitores que trabajen en la zona de juego denominada 'VOLCAN'.
select distinct personal.nombre_personal, personal.telefono_personal, personal.correo_personal, 
personal.direccion_personal, zona_juegos.nombre_zonajuego
from zona_juegos, personal, trabaja
where zona_juegos.id_zonajuego = trabaja.id_zonajuego
and trabaja.dni_personal = personal.dni_personal
and personal.puesto_personal like 'MONITOR'
and zona_juegos.nombre_zonajuego like 'VOLCAN';

--8 Mostrar los usuarios del evento 'Cumpleaños Juan'
select distinct usuario.nombre_usuario,evento.nombre_evento
from usuario, evento, asiste
where usuario.dni_usuario = asiste.dni_usuario
and asiste.id_evento = evento.id_evento
and evento.nombre_evento like 'Cumpleaños Juan';


-------ENUNCIADOS CONSULTAS (agrupadas)---------------

--9 Saca cuantas taquillas han sido seleccionadas a personas que no han ido a un evento.
select taquilla.numero_taquilla "Taquilla", count(usuario.dni_usuario) "Veces que se utilizo"
from taquilla, usuario, acceso
where usuario.dni_usuario = acceso.dni_usuario
and acceso.numero_taquilla = taquilla.numero_taquilla
group by taquilla.numero_taquilla;

--10 Saca cuantas personas han escogido cada menu, mediante agrupacion (group by). (enunciado modificado)
select menu.nombre_menu "Menús", count(usuario.dni_usuario) "Veces seleccionado"  
from usuario, menu, acceso
where usuario.dni_usuario = acceso.dni_usuario
and acceso.id_menu = menu.id_menu
group by menu.nombre_menu;

--11 Cuanto ha sido la suma total de dinero pagado, por cada evento. (enunciado modificado)
select evento.nombre_evento "Eventos", menu.precio_menu*count(usuario.dni_usuario) "Suma total de dinero"
from evento, usuario, asiste, menu
where usuario.dni_usuario = asiste.dni_usuario
and asiste.id_evento = evento.id_evento
and evento.id_menu = menu.id_menu
group by evento.id_evento,evento.nombre_evento, menu.precio_menu;

--12 Muestra cuántos tutores tiene un usuario.
select us_tutor.nombre_usuario "Tutor", count(us_normal.dni_usuario) "Personas que tiene a cargo"
from usuario us_tutor, usuario us_normal, tiene
where us_tutor.dni_usuario = tiene.dni_usuario
and us_normal.dni_usuario = tiene.dni_usuario
group by us_tutor.dni_usuario, us_tutor.nombre_usuario;

--13 ¿Y al revés? Muestra cuantos tutores tienen cada usuario. (enunciado modificado)
select us_normal.nombre_usuario "Usuario", count(us_tutor.dni_usuario) "Personas que tiene de tutor"
from usuario us_normal, usuario us_tutor, tiene
where us_normal.dni_usuario = tiene.usu_dni_usuario
and us_tutor.dni_usuario = tiene.dni_usuario
group by us_normal.dni_usuario, us_normal.nombre_usuario;

--14 Saca el numero de participantes que haya en cada evento con el nombre del evento.
select evento.nombre_evento "Eventos", count(usuario.dni_usuario) "Usuarios asistentes"
from evento, usuario, asiste
where usuario.dni_usuario = asiste.dni_usuario
and asiste.id_evento = evento.id_evento
group by evento.id_evento, evento.nombre_evento;

--15 En cuantos eventos en total han participado cada animador (agrupada).
select animacion.nombre_animador "Animadores", count(evento.id_evento) "Eventos en los que participa"
from animacion, evento, incluye
where animacion.dni_animador = incluye.dni_animador
and evento.id_evento = incluye.id_evento 
group by animacion.dni_animador, animacion.nombre_animador;

--16 Saca, descendentemente, los menus junto a las veces que han sido escogidos.
select menu.nombre_menu "Menús", count(usuario.dni_usuario) "Veces seleccionado"  
from usuario, menu, asiste, evento
where usuario.dni_usuario = asiste.dni_usuario
and asiste.id_evento = evento.id_evento
and evento.id_menu = menu.id_menu
group by menu.nombre_menu
order by count(usuario.dni_usuario) desc;	

--17 Ahora, saca ascendentemente, las taquillas junto a su uso. (enunciado modificado)
select taquilla.numero_taquilla "Taquillas", count(usuario.nombre_usuario) "Veces que se utilizo"
from taquilla, usuario, acceso
where usuario.dni_usuario = acceso.dni_usuario
and acceso.numero_taquilla = taquilla.numero_taquilla
group by taquilla.numero_taquilla
order by taquilla.numero_taquilla asc;

--18 Mostrar las alergias de los usuarios que hay en un evento, es decir, mostrar (agrupadas) los tipos de alergia que hay. 
select evento.nombre_evento "Eventos", usuario.alergias_usuario 
from evento, usuario, asiste
where usuario.dni_usuario = asiste.dni_usuario
and asiste.id_evento = evento.id_evento
group by evento.id_evento, evento.nombre_evento, usuario.alergias_usuario
order by evento.id_evento;

--19 Mostrar el precio medio de todos los eventos realizados.
select round(avg(menu.precio_menu*count(usuario.dni_usuario)),2) "Media de precios"
from evento, usuario, asiste, menu
where usuario.dni_usuario = asiste.dni_usuario
and asiste.id_evento = evento.id_evento
and evento.id_menu = menu.id_menu
group by evento.id_evento, menu.precio_menu;

--20 Mostrar el precio total de los eventos realizados.
select sum(menu.precio_menu*count(usuario.dni_usuario)) "Total eventos"
from evento, usuario, asiste, menu
where usuario.dni_usuario = asiste.dni_usuario
and asiste.id_evento = evento.id_evento
and evento.id_menu = menu.id_menu
group by evento.id_evento, menu.precio_menu;

--21 Mostrar la media de precio de las personas que acceden a cada zona de juego (juego libre).
select zona_juegos.nombre_zonajuego "Zonas", avg(acceso.precio_acceso) "Media"
from zona_juegos, acceso
where zona_juegos.id_zonaJuego = acceso.id_zonajuego
group by zona_juegos.id_zonajuego, zona_juegos.nombre_zonajuego;

--22 Muestra la taquilla más usada.
select taquilla.numero_taquilla, count(*) "Veces usada" from taquilla, acceso 
where taquilla.numero_taquilla = acceso.numero_taquilla 
group by taquilla.numero_taquilla
having count(*) = (select max(count(*)) from taquilla, acceso 
where taquilla.numero_taquilla = acceso.numero_taquilla 
group by taquilla.numero_taquilla);

--23 Mostrar los eventos junto a toda la gente que participo y asistio, incluido animadores y personal. (enunciado modificado)
select evento.nombre_evento "Eventos", (count(usuario.dni_usuario) + count(animacion.dni_animador) + count(personal.dni_personal)) "Gente que asistió"
from evento, usuario, asiste, animacion, incluye, acceso, zona_juegos, personal, trabaja
where usuario.dni_usuario = asiste.dni_usuario
and asiste.id_evento = evento.id_evento
and animacion.dni_animador = incluye.dni_animador
and evento.id_evento = incluye.id_evento
and acceso.id_zonajuego = zona_juegos.id_zonajuego 
and zona_juegos.id_zonajuego = trabaja.id_zonajuego
and personal.dni_personal = trabaja.dni_personal
group by evento.nombre_evento;

-------ENUNCIADOS CONSULTAS (subconsultas)---------------

--24 Mostrar los eventos de un usuario especifico por nombre que no hayan contratado un menu especifico.
select evento.* from usuario, reserva, evento where usuario.nombre_usuario like '%Carlos%' 
and usuario.dni_usuario = reserva.dni_usuario and reserva.id_evento = evento.id_evento 
and evento.id_evento in (select evento.id_evento from evento where evento.id_menu = 0);

--25 Mostrar los usuarios que no han reservado ningún evento.
select usuario.* from usuario where usuario.dni_usuario 
not in (select reserva.dni_usuario from reserva);

--26 Mostrar el usuario con mayor numero de eventos organizados.
select usuario.nombre_usuario from usuario,reserva 
where usuario.dni_usuario = reserva.dni_usuario 
group by reserva.dni_usuario, usuario.nombre_usuario 
having count(*) = (select max(count(*)) from reserva group by reserva.dni_usuario);

--27 Mostrar al animador en el que más eventos ha animado.
select animacion.nombre_animador from animacion,incluye
where incluye.dni_animador = animacion.dni_animador
group by incluye.dni_animador, animacion.nombre_animador 
having count(*) = (select max(count(*)) from incluye group by incluye.dni_animador);

--28 Mostrar el numero de taquilla de un usuario específico en una fecha determinada.
select numero_taquilla from acceso 
where dni_usuario = (select dni_usuario from usuario where nombre_usuario like 'Belen Villa') 
and fecha_acceso = '07/MAY/2022';

--29 Mostrar los usuarios que no han accedido, ni reservado, ningún evento
select dni_usuario, nombre_usuario from usuario where dni_usuario not in (select dni_usuario from reserva) 
and dni_usuario not in (select dni_usuario from asiste);

--30 Mostrar de los usuarios el nombre y sus tutores (nombre) que hayan tenido una taquilla en específico y hayan accedido por juego libre.
select usu.nombre_usuario "Usuario", tut.nombre_usuario "Tutor", acceso.numero_taquilla 
from usuario usu,tiene,usuario tut,acceso where tut.dni_usuario = tiene.dni_usuario 
and usu.dni_usuario = tiene.usu_dni_usuario and acceso.dni_usuario = usu.dni_usuario
and acceso.numero_taquilla = 2;

--31 Mostrar la información del menú que más se haya pedido en los eventos.
select menu.*, count(*) "Numero de veces pedido" from menu,evento 
where evento.id_menu = menu.id_menu group by menu.id_menu, menu.nombre_menu, menu.precio_menu 
having count(*) = (select max(count(*)) from evento group by evento.id_menu);

--32 Mostrar el menú que más se escogió en una fecha determinada, entrando por juego libre. 
select menu.*, count(*) "Veces escogido" from acceso,menu where acceso.id_menu=menu.id_menu
and acceso.fecha_acceso = '07/MAY/2022'
group by menu.id_menu, menu.nombre_menu, menu.precio_menu
having count(*) in (select max(count(*)) from acceso 
where acceso.fecha_acceso = '07/MAY/2022' group by id_menu);

--33 Mostrar los menus que han escogido los usuarios menores de edad y que están tutorizados por 2 personas.
select menu.id_menu, menu.nombre_menu 
from acceso,usuario,menu
where acceso.dni_usuario = usuario.dni_usuario 
and usuario.dni_usuario in (select usu.dni_usuario 
from usuario usu, tiene, usuario tut where usu.dni_usuario = tiene.usu_dni_usuario 
and tiene.dni_usuario = tut.dni_usuario group by usu.dni_usuario having count(*) = 2)
and acceso.id_menu = menu.id_menu;

------ENUNCIADOS CONSULTAS (Outer Join)---------------

--34 Mostrar todos los usuarios junto al nombre de los que tienen a su cargo, mostrando también los que no tienen ninguno a su cargo.
select usu.*, tut.nombre_usuario "TUTOR" from usuario usu, usuario tut, tiene 
where usu.dni_usuario (+) = tiene.usu_dni_usuario and tut.dni_usuario = tiene.dni_usuario (+);

--35 Mostrar la informacion sobre el menu y los animadores junto a cada evento, mostrando 'Sin animador' si no ha habido animación.
select evento.nombre_evento, menu.nombre_menu, nvl(animacion.nombre_animador,'Sin animador') 
from menu, animacion, evento, incluye where evento.id_menu = menu.id_menu 
and evento.id_evento = incluye.id_evento (+) and incluye.dni_animador = animacion.dni_animador (+);

-------ENUNCIADOS CONSULTAS (Inserciones)---------------

--36 Insertar en una nueva tabla ALERGIAS, las alergias de los usuarios sin repetir.
drop table alergias;
create table alergias (
  alergia	varchar2(50)
);

insert into alergias (alergia) 
select nvl(usuario.alergias_usuario, 'Sin alergia')
    from usuario
	group by usuario.alergias_usuario;

select * from alergias;

--37 Insertar un nuevo monitor con el nombre Julián Álvarez que viva en la misma calle que Juan Garcia.
insert into animacion 
values ('22944295R', 'Julián Álvarez', '655766877', (select direccion_animador from animacion where nombre_animador like 'Juan Garcia'));

-------ENUNCIADOS CONSULTAS (Updates)---------------

--38 Todos los usuarios que no tengan ninguna alergia, actualizan su valor a ‘Sin Alergia’.
update usuario
set alergias_usuario = nvl(alergias_usuario, 'Sin Alergia');

--39 Subir el precio del menú menos vendido en los eventos un 5 %.
update menu
    set precio_menu = precio_menu*1.05
    where id_menu in (select menu.id_menu from menu, evento
						where evento.id_menu = menu.id_menu
    					group by menu.id_menu, menu.nombre_menu
    					having count(*) = (select min(count(*)) from evento group by id_menu));

--40 Aplazar la fecha de un evento especificado 1 semana.
update evento
set fecha_evento = fecha_evento + 7
where id_evento = 7;