	/// @desc scr_animation();
	
	//annime le perso dans la direction de son déplacement
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
		image_speed = 0;
		image_index = 1;
	}
	