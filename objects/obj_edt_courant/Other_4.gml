/// @description lance save en cas de retour
// You can write your code in this editor

if obj_select.file != ""
{
	event_user(0)	
}

if obj_menu.mode = MENU_MODE.SELECT_SAVENLAUNCH
{
	obj_menu.mode = MENU_MODE.JEU
	room_goto(room_charge)	
}
