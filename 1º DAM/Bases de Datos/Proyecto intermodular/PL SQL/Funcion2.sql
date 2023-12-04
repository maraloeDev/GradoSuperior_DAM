--2. Una funcion que te muestra las medias por cada tipo de menu en un mes pasado como parametro y te devuelve la suma final de ese mes.
create or replace function medias_menus(mes char) return number
is
    cursor menus is select * from menu;
	v_media_parcial number(6,2);	-- las medias de cada menu
	v_media number(6,2) := 0;			-- la media total
begin
	for m in menus
    loop
		select nvl(round(sum(count(*)*menu.precio_menu),2),0) into v_media_parcial
    	from evento, menu, asiste where evento.id_evento = asiste.id_evento and menu.id_menu = evento.id_menu 
    	and to_char(evento.fecha_evento,'mm') = mes
    	and menu.id_menu = m.id_menu
    	group by menu.id_menu, menu.precio_menu;
		dbms_output.put_line('El menu "'||m.nombre_menu ||'" ('|| m.precio_menu ||') ha generado en '|| to_char(to_date(mes,'mm'),'Month') ||': '||v_media_parcial || '€');
		v_media:= v_media + v_media_parcial;
    end loop;
	return v_media;
end medias_menus;