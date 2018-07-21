/// @description Detecte clic slot
// You can write your code in this editor

if obj_menu.mode == MENU_MODE.SELECT_SAVE or  obj_menu.mode == MENU_MODE.SELECT_LOAD
{
	if mouse_check_button_released(mb_left)
	{
		slot = floor(mouse_x/256)+3*floor(mouse_y/360)	
	
	
		if obj_menu.mode == MENU_MODE.SELECT_LOAD
		{
	
			obj_menu.mode = MENU_MODE.JEU
			scr_transition(TRANS_MODE.GOTO,room_charge)

			obj_load_room.file =  "svg_slot"+string(slot)+".json";

			with obj_load_room{
				event_user(0)
			}

		}

		if obj_menu.mode == MENU_MODE.SELECT_SAVE
		{
	
			room_goto(room_editeur)
			obj_menu.mode = MENU_MODE.CONSTRUCTION

			with obj_edt_courant
			{
				file =  "svg_slot"+string(other.slot)+".json";
				event_user(0)
			}

		}
	
	
	
	}
}

