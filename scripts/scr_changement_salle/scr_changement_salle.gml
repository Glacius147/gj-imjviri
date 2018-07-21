/// @desc scr_changement_salle(x_to,y_to)
/// @arg x_destination
/// @arg y_destination

var x_to = argument0;
var y_to = argument1;

obj_joueur.room_current_x += x_to;
obj_joueur.room_current_y += y_to;

obj_joueur.x += x_to*55;
obj_joueur.y += y_to*55;

if view_current == 0
{
camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]) + x_to* 256,camera_get_view_y(view_camera[0]) + y_to* 176)
}
