//@desc On sort du sous-terrain
with obj_escalier if destination = other.destination other.copine = id


obj_joueur.x = copine.x;
obj_joueur.y = copine.y;

if view_current == 0
{
	camera_set_view_pos(view_camera[0], 256*copine.room_origine_x ,176 * copine.room_origine_y)
}

