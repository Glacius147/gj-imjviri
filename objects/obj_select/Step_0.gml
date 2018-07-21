/// @description Detecte clic slot
// You can write your code in this editor

if obj_menu.mode == MENU_MODE.SELECT_SAVE or  obj_menu.mode == MENU_MODE.SELECT_LOAD or  obj_menu.mode == MENU_MODE.SELECT_SAVENLAUNCH or obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT
{
	if mouse_check_button_released(mb_left)
	{
		slot = floor(mouse_x/256)+3*floor(mouse_y/360)	
	
	
		if obj_menu.mode == MENU_MODE.SELECT_LOAD
		{
	
			obj_menu.mode = MENU_MODE.JEU
			file =  "svg_slot"+string(slot)+".json";
			scr_transition(TRANS_MODE.GOTO,room_charge)

		}

		if obj_menu.mode == MENU_MODE.SELECT_SAVE
		{
	
			file =  "svg_slot"+string(other.slot)+".json";
			room_goto(room_editeur)

		}
	
		if obj_menu.mode == MENU_MODE.SELECT_SAVENLAUNCH
		{
	
			file =  "svg_slot"+string(other.slot)+".json";
			room_goto(room_editeur)

		}
		if obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT
		{
	
			file =  "svg_slot"+string(other.slot)+".json";
			room_goto(room_editeur)

		}
	
	
	}
}

