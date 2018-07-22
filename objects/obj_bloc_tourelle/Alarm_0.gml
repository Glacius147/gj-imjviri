/// @desc tir une boule de feu

alarm[0] = irandom_range(240,300);

if room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y && !magnis_cible
{
	with instance_create_layer(x,y-5,"mob",obj_boule_feu)
	{
		direction = point_direction(x,y,obj_joueur.x,obj_joueur.y);
		speed = 2;
	}
}

