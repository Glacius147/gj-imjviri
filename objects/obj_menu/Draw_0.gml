/// @descr interface en jeu

if mode = MENU_MODE.JEU || mode = MENU_MODE.UP || mode = MENU_MODE.DOWN || mode = MENU_MODE.PAUSE
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



//gestion caméras
if mode = MENU_MODE.JEU || mode = MENU_MODE.UP || mode = MENU_MODE.DOWN || mode = MENU_MODE.PAUSE
{
//	view_set_camera(0, view_camera[0]);
//	camera_set_view_pos(view_camera[0], 0,0);
//	camera_set_view_size(view_camera[0], zone_jeu_w,zone_jeu_h*(1-percent));
if view_current == 0
{
	view_hport[0] =  zone_jeu_h*(1-percent);
	camera_set_view_size(view_camera[0], zone_jeu_w, zone_jeu_h*(1-percent));
}

}