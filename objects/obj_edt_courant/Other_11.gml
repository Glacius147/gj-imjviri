/// @description load lvl
// You can write your code in this editor


file = obj_select.file

var buff = buffer_load(file);
map = json_decode(buffer_read(buff, buffer_text));
buffer_delete(buff);

//table des salles crées
var i;
var j;
for (i = 0; i < 16; i += 1)
{
	for (j = 0; j < 16; j += 1)
	{
		created_room[i , j] = false
	}
}


var origines;
var destinations;

origines[0]=noone;
destinations[0] = noone;
var count=1;
var list_obj;

var size;
size = ds_map_size(map);
for (i = 0; i < size; i++;)
	{
	item = map[? "item"+string(i)];
	item_type = global.list_item[item[? "type"]];
	item_x = item[? "x"];
	item_y = item[? "y"];
	item_px = item[? "piece x"];
	item_py = item[? "piece y"];
	item_sprite = item[? "sprite"];
	item_angle = item[? "angle"];
	if item_type == string(obj_mur_salle){
		var new_item = instance_create_layer(item_x,item_y,"salles",item_type)
		salle_x = round(item_x/256)
		salle_y = round(item_y/176)
		created_room[salle_x,salle_y] = true
	} else if object_is_ancestor(item_type, objp_objet_mobil)
	{
		var new_item = instance_create_layer(item_x,item_y,"Instances",item_type)
	} else if item_type == string(obj_dependance)
	{
		origines[count] = item[? "origine"];
		destinations[count] = item[? "destination"];
		count++
		var new_item = instance_create_layer(item_x,item_y,"Instances",item_type);
		new_item.origine = item[? "origine"];
		new_item.destination = item[? "destination"];
		new_item.origine_id = list_obj[new_item.origine];
		new_item.destination_id = list_obj[new_item.destination];
	} else
	{
		var new_item = instance_create_layer(item_x,item_y,"Instances",item_type)
	}
	if item_type == string(obj_escalier)
	{
		new_item.destination = item[? "destination"];	
	}
	if new_item != noone
	{
	new_item.image_index = item_sprite;
	new_item.image_angle = item_angle;
	new_item.room_origine_x = item_px;
	new_item.room_origine_y = item_py;
	}
	list_obj[i] = new_item
	if item_type == string(obj_joueur){	
		current_player = new_item
	}
}



with obj_joueur
{
	event_user(1);
}