/// @desc utilisation des objets

switch objet_b
{
	case spr_bombe :
	{
		if bombes > 0
		{
			bombes --;
			instance_create_layer(x,y,"items",obj_bombe_posee);		
		}
	}
}