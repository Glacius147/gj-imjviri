/// @description Charge un lvl sauvegardé
// You can write your code in this editor

//


var buff = buffer_load("svg_lvl1.json");
map = json_decode(buffer_read(buff, buffer_text));
buffer_delete(buff);

//table des salles crées
var i;
var j;
for (i = 0; i < 16; i += 1)
{
	for (j = 0; j < 16; j += 1)
	{
		obj_menu.created_room[i , j] = false
	}
}

var size, key;
size = ds_map_size(map);
for (i = 0; i < size; i++;)
	{
	item = map[? "item"+string(i)];
	item_type = global.list_item[item[? "type"]];
	item_x = item[? "x"];
	item_y = item[? "y"];
	item_sprite = item[? "sprite"];
	if item_type == obj_mur_salle{
		var new_item = instance_create_layer(item_x,item_y,"salles",item_type)
		salle_x = round(item_x/256)
		salle_y = round(item_y/176)
		obj_menu.created_room[salle_x,salle_y] = true
	}
	else if object_is_ancestor(item_type, objp_objet_mobil)
	{
		var new_item = instance_create_layer(item_x,item_y,"mob",item_type)
	}
	else
	{
		var new_item = instance_create_layer(item_x,item_y,"items",item_type)
	}
	new_item.image_index = item_sprite;
}