/// @description Insert description here
// You can write your code in this editor



c_x = mouse_x
c_y = mouse_y

if mouse_check_button_released(mb_left)
{
if c_x>(4096+4*16) // on est dans la barre de selection
{
	item = instance_position(c_x,c_y,obj_master)
	if item != noone
	{
		
		sprite_index = item.sprite_index
		current_type = item.object_index

	}
}
else if c_x>4096 // On est dans la minimap
{
	col = ceil((c_x-4096)/16)
	row = ceil(c_y/16)
	camera_set_view_pos(view_camera[0],col*256 ,row*176);
	
}
else // On clique pour poser l'objet
{
	//Détermination du type d'objet
	if current_type == obj_mur_salle.object_index
	{
		x = floor((mouse_x) / 256)*256
		y = floor((mouse_y) / 176)*176
	} else // par défaut
	{
		x = round((mouse_x-8) / 16)*16+8
		y = round((mouse_y-8) / 16)*16+8
	}
	item = instance_position(x,y,obj_master)
	if item == noone
	{
		instance_create_layer(x,y,"Instances",current_type)
	}
	
}
}