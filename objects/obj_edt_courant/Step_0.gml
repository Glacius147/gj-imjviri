/// @description Insert description here
// You can write your code in this editor


c_x = mouse_x
c_y = mouse_y



var current_room_x = floor(c_x/256)
var current_room_y = floor(c_y/176)

//Mode d'édition normal
if mode_edition == EDITEUR_MODE.NORMAL
{
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
	c_y = mouse_y - camera_get_view_y(view_camera[1]) - 6
	c_x = mouse_x - camera_get_view_x(view_camera[1]) - 15
	col = floor(c_x/4)
	row = floor(c_y/3)
	camera_set_view_pos(view_camera[0],col*256 ,row*176);
	
}
else // On clique pour poser l'objet
{
	//Détermination du type d'objet
	if current_type == obj_mur_salle
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
			obj_list[nb_obj].image_index = 1;
			nb_obj ++;
			obj_list[nb_obj] = instance_create_layer(x+29*8,y+11*8,"Instances",obj_mur);
			obj_list[nb_obj].image_index = 3;
			nb_obj ++;
			obj_list[nb_obj] = instance_create_layer(x+16*8,y+3*8,"Instances",obj_mur);
			obj_list[nb_obj].image_index = 0;
			nb_obj ++;
			obj_list[nb_obj] = instance_create_layer(x+16*8,y+19*8,"Instances",obj_mur);
			obj_list[nb_obj].image_index = 2;
			nb_obj ++;
			
		}
	} else if current_type == obj_joueur and current_player !=noone
	{
		x = round((mouse_x-8) / 16)*16+8;
		y = round((mouse_y-8) / 16)*16+8;
		item = instance_position(x,y,obj_master);
		if item == noone and created_room[current_room_x,current_room_y]
		{
			new_item = instance_create_layer(x,y,"Instances",current_type);
			obj_list = scr_array_replace(obj_list,current_player,new_item)
			instance_destroy(current_player)
			current_player = new_item
		}
	}
	else // par défaut
	{
		x = round((mouse_x-8) / 16)*16+8;
		y = round((mouse_y-8) / 16)*16+8;
		item = instance_position(x,y,obj_master);
		if item == noone and created_room[current_room_x,current_room_y]
		{
			obj_list[nb_obj] = instance_create_layer(x,y,"Instances",current_type);
			
			if current_type == obj_joueur
			{
				current_player = obj_list[nb_obj]
			}
			nb_obj ++;
		}
	}
	
	
	
}
}

if mouse_check_button_released(mb_right)
{
	x = round((mouse_x-8) / 16)*16+8;
	y = round((mouse_y-8) / 16)*16+8;
	item = instance_position(mouse_x,mouse_y,obj_master);
	if item != noone
	{
	test = item.object_index
	test2 = obj_mur
	test3 = obj_porte
	nextroom = scr_is_room_adj(x,y)
	has_nextroom = nextroom[0];
	var flag_cycle = false
	var flag_change_mirror = true
	if has_nextroom and item.object_index == obj_mur
	{
		flag_cycle = true
		var next_type = obj_porte
	} else if has_nextroom and item.object_index == obj_porte
	{
		flag_cycle = true
		flag_change_mirror = false
		var next_type = obj_porte_bloquee
	} else if has_nextroom and item.object_index == obj_porte_bloquee
	{
		flag_cycle = true
		var next_type = obj_porte_fermee
	} else if has_nextroom and item.object_index == obj_porte_fermee
	{
		flag_cycle = true
		var next_type = obj_mur_explosable
	} else if has_nextroom and item.object_index == obj_mur_explosable
	{
		flag_cycle = true
		var next_type = obj_mur
	} 
	if flag_cycle
	{
	
		new_x = item.x
		new_y = item.y
		new_item =  instance_create_layer(new_x,new_y,"Instances",next_type);
		if next_type == obj_mur_explosable
		{
			new_item.image_index = round(item.image_angle/90)
		} else if next_type == obj_mur
		{
			new_item.image_index = item.image_index	
		} else if next_type == obj_porte
			new_item.image_angle = 90*item.image_index
		else {
			new_item.image_angle = item.image_angle
		}
		new_item.mask_index = spr_mur
		obj_list = scr_array_replace(obj_list,item,new_item)
		instance_destroy(item)
		if flag_change_mirror
		{
		item = nextroom[1]
		new_x = item.x
		new_y = item.y
		new_item =  instance_create_layer(new_x,new_y,"Instances",next_type);
		if next_type == obj_mur_explosable
		{
			new_item.image_index = round(item.image_angle/90)
		} else if next_type == obj_mur
		{
			new_item.image_index = item.image_index	
		} else if next_type == obj_porte
			new_item.image_angle = 90*item.image_index
		else {
			new_item.image_angle = item.image_angle
		}
		new_item.mask_index = spr_mur
		obj_list = scr_array_replace(obj_list,item,new_item)
		instance_destroy(item)	
		}
	}
	}
	
	
}
}


if mode_edition = EDITEUR_MODE.DEPENDANCE{
	
	
	
	
	
}