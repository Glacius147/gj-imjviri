/// @desc Changement de salle !
if obj_menu.mode = MENU_MODE.JEU
{

	var x_to = 0;
	var y_to = 0;

	if image_angle = 0 y_to = -1;
	if image_angle = 90 x_to = -1;
	if image_angle = 180 y_to = 1;
	if image_angle = -90 x_to = 1;



	scr_changement_salle(x_to,y_to) 
}