/// @desc souterain !
with obj_escalier_bis if destination = other.destination other.copine = id


obj_joueur.x = copine.x;
obj_joueur.y = copine.y + 16;

if view_current == 0
{
	camera_set_view_pos(view_camera[0], 4096,176 * floor(destination))
}

