/// @desc utilisation des objets

switch objet_b
{
	case OBJET_HOLD.BOMBE :
	{
		if bombes > 0
		{
			bombes --;
			instance_create_layer(x,y,"items",obj_bombe_posee);		
		}
	}
}