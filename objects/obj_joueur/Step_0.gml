/// @desc Déplacement et action du perso

if obj_menu.mode = MENU_MODE.OFF
{
	scr_input();
	
	// On ne prend en compte que la direction la plus recente (l autre est dans dir_precedente)
	switch dir_precedente
	{
		case DIR.LEFT :
		{
		//si la touche est tjs apuyée mais qu'une autre direction est aussi demandée, on ne prend en compte que la nouvelle
			if k_left
			{
				if (k_up || k_down)
				{
					k_left = false;
					break;
				}
			}
		//sinon on prend en compte la seule touche enclenchée.
			else
			{
				scr_direction_actuelle();
				break;
			}
			
		}
		
		case DIR.RIGHT :
		{
			if k_right
			{
				if (k_up || k_down)
				{
					k_right = false;
					break;
				}
			}
			else
			{
				scr_direction_actuelle();
				break;
			}
			
		}
		
		case DIR.UP :
		{
			if k_up
			{
				if (k_right || k_left)
				{
					k_up = false;
					break;
				}
			}
			else
			{
				scr_direction_actuelle();
				break;
			}
			
		}			
		case DIR.DOWN :
		{
			if k_down
			{
				if (k_right || k_left)
				{
					k_down = false;
					break;
				}
			}
			else
			{
				scr_direction_actuelle();
				break;
			}
			
		}
		case DIR.REPOS :
		{
			scr_direction_actuelle();
			break;
		}
	}
	
	// application du mouvement
	hsp = (k_right - k_left)*vitesse_marche;
	vsp = (k_down - k_up)*vitesse_marche;


	//déplacement
	scr_deplacement();
	
	//animation
	scr_animation();
	
	if k_left image_xscale = -1;
	if k_right image_xscale = 1;
	
}
