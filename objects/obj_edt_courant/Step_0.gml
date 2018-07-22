/// @description 
// You can write your code in this editor


nb_obj = ds_list_size(obj_list)

if obj_menu.mode == MENU_MODE.CONSTRUCTION
{
c_x = mouse_x
c_y = mouse_y



current_room_x = floor(c_x/256)
current_room_y = floor(c_y/176)

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
		if current_type == obj_escalier
		{
			dest = item.destination	
		}
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
else  // On clique pour poser l'objet
{
	//Si la salle est vide on la crée
	if !created_room[current_room_x,current_room_y]//current_type == obj_mur_salle
	{
		x = current_room_x*256
		y = current_room_y*176
		//if !created_room[current_room_x,current_room_y]
		{
			nb_obj = ds_list_size(obj_list)
			ds_list_add(obj_list,instance_create_layer(x,y,"salles",obj_mur_salle));
			created_room[current_room_x,current_room_y] = true;
			nb_obj ++;
			//Ajout de 4 murs
			ds_list_add(obj_list,instance_create_layer(x+3*8,y+11*8,"Instances",obj_mur));
			obj_list[| nb_obj].image_index = 1;
			nb_obj ++;
			ds_list_add(obj_list,instance_create_layer(x+29*8,y+11*8,"Instances",obj_mur));
			obj_list[| nb_obj].image_index = 3;
			nb_obj ++;
			ds_list_add(obj_list,instance_create_layer(x+16*8,y+3*8,"Instances",obj_mur));
			obj_list[| nb_obj].image_index = 0;
			nb_obj ++;
			ds_list_add(obj_list,instance_create_layer(x+16*8,y+19*8,"Instances",obj_mur));
			obj_list[| nb_obj].image_index = 2;
			nb_obj ++;
			ds_list_add(obj_list,instance_create_layer(x+8,y+8,"Instances",obj_fantome));
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
			old_position = ds_list_find_index(obj_list,current_player)
			ds_list_replace(obj_list,old_position,new_item)
			//obj_list = scr_array_replace(obj_list,current_player,new_item)
			instance_destroy(current_player)
			current_player = new_item
		}
	}
	else if current_type != noone // par défaut (si il y a un truc à peindre)
	{
		x = round((mouse_x-8) / 16)*16+8;
		y = round((mouse_y-8) / 16)*16+8;
		item = instance_position(x,y,obj_master);
		if item == noone and created_room[current_room_x,current_room_y]
		{
			ds_list_add(obj_list,instance_create_layer(x,y,"Instances",current_type));
			
			nb_obj ++;
			if current_type == obj_joueur
			{
				current_player = obj_list[| nb_obj]
			} else if current_type == obj_escalier
			{
				obj_list[| nb_obj].destination = dest;
				obj_list[| nb_obj].mask_index = spr_bloc;
			}
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
		old_position = ds_list_find_index(obj_list,item)
		ds_list_replace(obj_list,old_position,new_item)
		//obj_list = scr_array_replace(obj_list,item,new_item)
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
		old_position = ds_list_find_index(obj_list,item)
		ds_list_replace(obj_list,old_position,new_item)
		//obj_list = scr_array_replace(obj_list,item,new_item)
		instance_destroy(item)
		}
	}
	}
	
	
}
}


if mode_edition = EDITEUR_MODE.DEPENDANCE_1{
	//1er pression :

	if mouse_check_button_pressed(mb_left)
	{
		//On vérifie qu'on a bien cliqué sur un activant
		x = round((mouse_x-8) / 16)*16+8;
		y = round((mouse_y-8) / 16)*16+8;
		item = instance_position(mouse_x,mouse_y,obj_master);
		if item != noone and item.object_index = obj_mur_salle
		{
			item = instance_position(mouse_x,mouse_y,obj_fantome);
		}
		if item != noone and item.activant
		{	//Changement de mode & d'opacité.
			mode_edition = EDITEUR_MODE.DEPENDANCE_2
			with obj_master
			{
				if activant{
					image_alpha = 0.5
				} else if activable
				{
					image_alpha = 1	
				}
			}
		sprite_index = spr_fleche1
		begin_arrow = item
		
		}
	}
}

if mode_edition = EDITEUR_MODE.DEPENDANCE_2{
	//Relachement sur l'item suivant
	image_angle =  point_direction(begin_arrow.x, begin_arrow.y, mouse_x, mouse_y);
	image_xscale = point_distance(begin_arrow.x, begin_arrow.y, mouse_x, mouse_y)/16
	if mouse_check_button_released(mb_left)
	{
		//Dans tous les cas on revient en mode 1
		mode_edition = EDITEUR_MODE.DEPENDANCE_1
		with obj_master
			{
				if !activant{
					image_alpha = .5
				} else
				{
					image_alpha = 1	
				}
			}
		
		x = round((mouse_x-8) / 16)*16+8;
		y = round((mouse_y-8) / 16)*16+8;
		image_angle =0
		image_xscale = 1
		item = instance_position(mouse_x,mouse_y,obj_master);
		if item != noone and item.activable and item.id != begin_arrow.id
		{
			new_item =  instance_create_layer(begin_arrow.x,begin_arrow.y,"Instances_dep",obj_dependance);
			//new_item.origine = scr_get_index(obj_list,begin_arrow)
			//new_item.destination = scr_get_index(obj_list,item)
			new_item.origine_id = begin_arrow
			new_item.destination_id = item
			/*new_item.image_angle = point_direction(begin_arrow.x, begin_arrow.y, item.x, item.y);
			image_xscale=point_distance(origine_id.x, origine_id.y, destination_id.x, destination_id.y)/16

			draw_self()
			draw_sprite(spr_fleche_pointe,0,destination_id.x,destination_id.y)
			with begin_arrow
			{
				other.new_item.image_xscale = distance_to_point(other.item.x,other.item.y)/32
			}*/
			//image_xscale = distance_to_point(mouse_x,mouse_y)/32;
			ds_list_add(obj_list,new_item)
			nb_obj++
		}
		
	}
	
}

if  mode_edition = EDITEUR_MODE.ERASER
{
	if mouse_check_button_released(mb_left)
	{
		item = instance_position(mouse_x,mouse_y,obj_master);
		if item != noone and item.object_index != obj_fantome and !object_is_ancestor(item.object_index,objp_contour_salle)
		{
			pos = ds_list_find_index(obj_list,item)
			ds_list_delete(obj_list,pos)
			with (obj_dependance)
			{
				if origine_id == other.item or destination_id == other.item{
					pos = ds_list_find_index(other.obj_list,id);
					ds_list_delete(other.obj_list,pos);
					other.nb_obj--
					instance_destroy(id);
				}
			}
			if item.object_index == obj_joueur
			{
				current_player = noone	
			}
			nb_obj--
			instance_destroy(item)
		} else if  item != noone and item.object_index == obj_mur_salle
		{
			var flag = true
			//On checke que la salle est vide.
			for(var i = 0; i < nb_obj; i++) 
			{
				var c_item = obj_list[| i];
				if c_item.room_origine_x == current_room_x and c_item.room_origine_y == current_room_y and item.object_index != obj_mur_salle and item.object_index != obj_mur and item.object_index != obj_fantome
				{
					flag = false;
					break;
				}
			}
			if flag // On détruit les trucs qui sont restés dans la salle
			{
				pos = ds_list_find_index(obj_list,item)
				ds_list_delete(obj_list,pos)
				with (obj_master)
				{
					if room_origine_x == other.current_room_x and room_origine_y == other.current_room_y
					{
						pos = ds_list_find_index(other.obj_list,id);
						ds_list_delete(other.obj_list,pos);
						other.nb_obj--
						instance_destroy(id);
					}
				}
				//et finalement on détruit la salle
				nb_obj--
				created_room[current_room_x,current_room_y] = false
				instance_destroy(item)
			}	
		}
	}
} else if mode_edition = EDITEUR_MODE.ERASER_DEP
{
	if mouse_check_button_released(mb_left)
	{
		item = instance_position(mouse_x,mouse_y,obj_dependance);
		if item != noone 
		{
			pos = ds_list_find_index(obj_list,item)
			ds_list_delete(obj_list,pos)
			nb_obj--
			instance_destroy(item)
		}
	}
	
}

} else if obj_menu.mode == MENU_MODE.PAUSE
{
	scr_input()
	if k_start
	{
		obj_menu.mode = MENU_MODE.CONSTRUCTION
	} else{
		percent_error = min(percent_error+0.02,1)	
	}
	
	
}