/// @description SAVE
// You can write your code in this editor

if current_player != noone
{

obj_menu.mode = MENU_MODE.SELECT_SAVE
room_goto(room_select)

}
else {
	obj_menu.mode = MENU_MODE.PAUSE_EDT
	error_message = "IL FAUT PLACER LE HERO !\n\n\n (RETOUR : ENTREE)"
	
}