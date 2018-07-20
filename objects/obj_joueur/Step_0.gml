/// @desc Déplacement et action du perso

if obj_menu.mode = MENU_MODE.OFF
{
	scr_input();
	
	switch dir_precedente
	{
		case DIR.LEFT :
		{
			if k_left
			{
				if (k_up || k_down)
				{
					k_left = false;
					break;
				}
			}
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
	
	
	if k_down  y ++;
	if k_left x --;	
	if k_up  y --;
	if k_right x ++;
	
	
}
