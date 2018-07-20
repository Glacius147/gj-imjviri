/// @description TODO : poser l'élément ou selectionner element.
// You can write your code in this editor

// Et le mettre dans une master list ?



if x>(4096+4*16) // on est dans la barre de selection
{
	item = instance_position(x,y,obj_master)
	if item != noone
	{
		with item
		{
			other.sprite_index = sprite_index
			other.current_type = object_index
		}
	}
}
else if x>4096 // On est dans la minimap
{
	col = ceil((x-4096)/16)
	row = ceil(y/16)
	camera_set_view_pos(view_camera[0],col*256 ,row*176);
	
}
else // On clique pour poser l'objet
{
	instance_create_layer(x,y,"Instances",current_type)
}