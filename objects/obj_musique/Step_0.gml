/// @description ?

if obj_menu.mode != mode
{
	mode = obj_menu.mode
	
	switch mode
	{
		case MENU_MODE.JEU :
		{
			audio_pause_all();
			if t_salle = TYPE_SALLE.SURFACE	audio_play_sound(son_musique,1,true);
			if t_salle = TYPE_SALLE.SOUS_TERRE	audio_play_sound(son_musique_under,1,true);
			break;	
		}	
	}
	
}

if instance_exists(obj_joueur)
{
	if obj_joueur.t_salle != t_salle
	{
		t_salle = obj_joueur.t_salle
	
		switch t_salle
		{
			case TYPE_SALLE.SURFACE :
			{
				audio_pause_all();
				audio_play_sound(son_musique,1,true);
				break;	
			}	
			case TYPE_SALLE.SOUS_TERRE :
			{
				audio_pause_all();
				audio_play_sound(son_musique_under,1,true);
				break;	
			}	
		}
	}	
}

