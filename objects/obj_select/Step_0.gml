/// @description Detecte clic slot
// You can write your code in this editor


if obj_menu.mode == MENU_MODE.SELECT_SAVE or  obj_menu.mode == MENU_MODE.SELECT_LOAD or  obj_menu.mode == MENU_MODE.SELECT_SAVENLAUNCH or obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT
{

	scr_input();
	//controls clavier
	if menu_control
	{
		//deplacement dans le menu
		if k_down && !touche_enfoncee
		{
			menu_curseur = scr_wrap(menu_curseur + 1, 0 , menu_item - 1); 
			touche_enfoncee = true;
		}
		
		if k_up && !touche_enfoncee
		{
			menu_curseur = scr_wrap(menu_curseur - 1, 0 , menu_item - 1);
			touche_enfoncee = true;

		}
		
		//pour eviter un deplacement par frame quand on laisse appuyé sur haut/bas
		if !k_down && !k_up 			touche_enfoncee = false;
		
		//validation d'un item
		if k_attaque || k_start
		{
			menu_selection = menu_curseur;
			menu_control = false;	
		}
	}
	
		//changement de room
		/*
	if (menu_x > w + 150) && (menu_selection != -1)
	{
		switch menu_selection
		{
			case 2 : default: scr_transition(TRANS_MODE.GOTO,room_editeur); break;
			case 0 : game_end(); break;
			case 1 : scr_transition(TRANS_MODE.GOTO,room_jeu);
			mode = MENU_MODE.JEU;
			break;
			case 3 : default: scr_transition(TRANS_MODE.GOTO,room_select);
			mode = MENU_MODE.SELECT_LOAD;
			break;
		}
		menu_selection = -1;
	}*/	
}

if menu_selection!=-1 and menu_selection!=6 and obj_menu.mode == MENU_MODE.SELECT_SAVE or  obj_menu.mode == MENU_MODE.SELECT_LOAD or  obj_menu.mode == MENU_MODE.SELECT_SAVENLAUNCH or obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT
{
	//if mouse_check_button_released(mb_left)
	{
		//slot = floor(mouse_x/256)+3*floor(mouse_y/360)	
		slot = menu_selection 
		
		
		if obj_menu.mode == MENU_MODE.SELECT_LOAD and file_exists("svg_slot"+string(slot)+".json")
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
		if obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT and file_exists("svg_slot"+string(slot)+".json")
		{
	
			file =  "svg_slot"+string(other.slot)+".json";
			room_goto(room_editeur)

		}
		
	
	}
}


