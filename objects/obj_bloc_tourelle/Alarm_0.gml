/// @desc tir une boule de feu

alarm[0] = irandom_range(120,240);

with instance_create_layer(x,y-5,"mob",obj_boule_feu)
{
	direction = point_direction(x,y,obj_joueur.x,obj_joueur.y);
	speed = 2;
	
	
}