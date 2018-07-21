/// @description Insert description here
// You can write your code in this editor


c_x = mouse_x
c_y = mouse_y



var current_room_x = floor(c_x/256)
var current_room_y = floor(c_y/176)


if mouse_check_button_released(mb_left)
{
if c_x>(4096+5*16) // on est dans la barre de selection
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
	//Position de la souris dans la caméra de l'interface
	c_y = mouse_y - camera_get_view_y(view_camera[1]) - 6*3
	c_x = mouse_x - camera_get_view_x(view_camera[1]) - 15*3
	col = floor(c_x/4)
	row = floor(c_y/3)
	camera_set_view_pos(view_camera[0],col*256 ,row*176);
	
}
else // On clique pour poser l'objet
{
	//Détermination du type d'objet
	if current_type == obj_mur_salle.object_index
	{
		x = current_room_x*256
		y = current_room_y*176
		if !created_room[current_room_x,current_room_y]
		{
			obj_list[nb_obj] = instance_create_layer(x,y,"salles",current_type);
			created_room[current_room_x,current_room_y] = true;
			nb_obj ++;
			//Ajout de 4 murs
			obj_list[nb_obj] = instance_create_layer(x+3*8,y+11*8,"Instances",obj_mur);
			obj_list[nb_obj].image_index = 3;
			nb_obj ++;
			obj_list[nb_obj] = instance_create_layer(x+29*8,y+11*8,"Instances",obj_mur);
			obj_list[nb_obj].image_index = 1;
			nb_obj ++;
			obj_list[nb_obj] = instance_create_layer(x+16*8,y+3*8,"Instances",obj_mur);
			obj_list[nb_obj].image_index = 0;
			nb_obj ++;
			obj_list[nb_obj] = instance_create_layer(x+16*8,y+19*8,"Instances",obj_mur);
			obj_list[nb_obj].image_index = 2;
			nb_obj ++;
			
		}
	} else // par défaut
	{
		x = round((mouse_x-8) / 16)*16+8;
		y = round((mouse_y-8) / 16)*16+8;
		item = instance_position(x,y,obj_master);
		if item == noone and created_room[current_room_x,current_room_y]
		{
			obj_list[nb_obj] = instance_create_layer(x,y,"Instances",current_type);
			nb_obj ++;
		}
	}
	
	
	
}
}

if mouse_check_button_released(mb_right)
{
	x = round((mouse_x-8) / 16)*16+8;
	y = round((mouse_y-8) / 16)*16+8;
	item = instance_position(x,y,obj_master);
	if item.object_index == obj_mur
	{
		new_x = item.x
		new_y = item.y
		new_item =  instance_create_layer(new_x,new_y,"Instances",obj_porte);
		new_item.image_angle = -90*item.image_index
		obj_list = scr_array_replace(obj_list,item,new_item)
		instance_destroy(item)
	}
	
	
}