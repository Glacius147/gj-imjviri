
switch obj_menu.t_deco
{
	case TYPE_DECO.BOTW : 	
	{
	i_index = 0;
	break;
	}
	
	case TYPE_DECO.DESERT : 	
	{
	i_index = 1;
	break;
	}
	
	case TYPE_DECO.GLACE : 	
	{
	i_index = 2;
	break;
	}
}

if image_number < 4 
{
	image_index = i_index;
}
else
{
	image_index = scr_wrap(image_index,0,3) + 4 * i_index;
}
