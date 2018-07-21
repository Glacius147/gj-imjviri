/// @description Charge un lvl sauvegardé
// You can write your code in this editor

var buff = buffer_load("svg_lvl1.json");
map = json_decode(buffer_read(buff, buffer_text));
buffer_delete(buff);

var size, key, i;
size = ds_map_size(map);
for (i = 0; i < size; i++;)
   {
   item = map[? "item"+string(i)];
   item_type = item[? "type"];
   item_x = item[? "x"];
   item_y = item[? "y"];
   item_sprite = item[? "sprite"];
   var new_item = instance_create_layer(item_x,item_y,"mob",item_type)
   new_item.image_index = item_sprite;
   }