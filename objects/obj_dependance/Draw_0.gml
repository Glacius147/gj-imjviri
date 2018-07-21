/// @description Insert description here
// You can write your code in this editor

if obj_menu.mode == MENU_MODE.CONSTRUCTION
{
image_angle = point_direction(origine_id.x, origine_id.y, destination_id.x, destination_id.y);

with origine_id{
	other.image_xscale = distance_to_point(other.destination_id.x,other.destination_id.y)/32
}
draw_self()
}