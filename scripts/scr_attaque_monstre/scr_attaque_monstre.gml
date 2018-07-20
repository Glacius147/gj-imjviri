/// @desc scr_attaque_monstre();
	
//vérifie si il y a qq dans la direction de l'épée


with instance_place(x,y,obj_joueur)
{
	if !invulnerable
	{
		invulnerable = true;
		alarm[1] = frames_invulnerable;
		pv -= other.degats;
		blink = 6;
		event_user(0);
	}
}