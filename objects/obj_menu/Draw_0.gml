/// @descr interface en jeu

if mode = MENU_MODE.JEU
{
	draw_set_color(c_blue);
	draw_rectangle(x_b + 15,y_b + 6,x_b + 84,y_b + 59,false);
	scr_9box(spr_9box,x_b + 95, y_b + 22, x_b + 95 + 30, y_b + 22 + 38);
	scr_9box(spr_9box,x_b + 129, y_b + 22, x_b + 129 + 30, y_b + 22 + 38);

	//placement des coeurs
	/// @desc affiche le niveau de PV du joueur
	if instance_exists(obj_joueur) 
	{
		pv = obj_joueur.pv;
		pv_max = obj_joueur.pv_max;
	}
	else 
	{
		pv = 0;
		pv_max = 0;
	}

	for (i = 1; i <= min(pv_max,5); i++)
	{
		if pv >= i im_coeur = 0;
		if pv = i - 0.5 im_coeur = 1;
		if pv < i - 0.5 im_coeur = 2;
		draw_sprite(spr_coeur,im_coeur,x_b + 175 + 13*(i-1),y_b + 18);
	}
}