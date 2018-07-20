/// @description Tracer du texte du menu

//draw menu

if mode = MENU_MODE.MENU
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_set_font(font_menu);
	for (i=0; i < menu_item; i++)
	{
		var offset = 2;
		var txt = menu[i];
		if (menu_curseur == i)
		{
			txt = string_insert("> ", txt,0);
			var col = c_white;
		}
		else
		{
			var col = c_gray;
		}
		

		draw_set_color(c_black);
		draw_text(menu_x - offset,menu_y - menu_itemheight * i * 1.5 + offset,txt);	
		draw_text(menu_x - offset,menu_y - menu_itemheight * i * 1.5 - offset,txt);	
		draw_text(menu_x + offset,menu_y - menu_itemheight * i * 1.5 + offset,txt);	
		draw_text(menu_x + offset,menu_y - menu_itemheight * i * 1.5 - offset,txt);	


		draw_set_color(col);
		draw_text(menu_x,menu_y - menu_itemheight * i * 1.5,txt);		
	}	
}
