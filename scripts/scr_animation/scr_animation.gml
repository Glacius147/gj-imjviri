	/// @desc scr_animation();
	
	//annime le perso dans la direction de son déplacement
if attaque
{
	if k_right dir_precedente = DIR.RIGHT;
	if k_left dir_precedente = DIR.LEFT;
	if k_up dir_precedente = DIR.UP;
	if k_down dir_precedente = DIR.DOWN;
	
	sprite_index = spr_attaque;
	switch dir_precedente
	{
		case DIR.LEFT :
		{
			image_index = 0;
			image_xscale = -1;
			break;
		}		
		
		case DIR.RIGHT :
		{
			image_index = 0;
			image_xscale = 1;
			break;
		}
				
				
		case DIR.UP :
		{
			image_index = 1;
			image_xscale = 1;
			break;
		}
		
		case DIR.DOWN :
		{
			image_index = 2;
			image_xscale = 1;
			break;
		}
		
	}
}
else
{
	immobile = true;
	if hsp < 0 || k_left
	{
		immobile = false;
		sprite_index = spr_right;
		image_xscale = -1;
		image_speed = 1;
	}

	if hsp > 0 || k_right
	{
		immobile = false;
		sprite_index = spr_right;
		image_xscale = 1;
		image_speed = 1;
	}
	
	if vsp < 0 || k_up
	{
		immobile = false;
		sprite_index = spr_up;
		image_xscale = 1;
		image_speed = 1;
	}
	
	if vsp > 0 || k_down
	{
		immobile = false;
		sprite_index = spr_down;
		image_xscale = 1;
		image_speed = 1;
	}
	
	if immobile 
	{
		if sprite_index = spr_attaque
		{
			switch dir_precedente
			{
				case DIR.LEFT :
				{
					sprite_index = spr_right;
					image_xscale = -1;
					break;
				}		
		
				case DIR.RIGHT :
				{
					sprite_index = spr_right;
					image_xscale = 1;
					break;
				}
				
				
				case DIR.UP :
				{
					sprite_index = spr_up;
					image_xscale = 1;
					break;
				}
		
				case DIR.DOWN :
				{
					sprite_index = spr_down;
					image_xscale = 1;
					break;
				}
		
			}					
		}
		image_speed = 0;
		image_index = 1;
	}
}	