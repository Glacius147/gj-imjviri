/// @description Gestion affichage du cadre


if mode = MENU_MODE.MENU
{
	//arrivée progressive du menu à l ecran
	menu_x += (menu_x_target - menu_x)/menu_speed;

	//controls clavier
	if menu_control
	{
		scr_input();
		if k_up && !touche_enfoncee
		{
			menu_curseur = scr_wrap(menu_curseur + 1, 0 , menu_item - 1); 
			touche_enfoncee = true;
		}
		
		if k_down && !touche_enfoncee
		{
			menu_curseur = scr_wrap(menu_curseur - 1, 0 , menu_item - 1);
			touche_enfoncee = true;

		}
		
		if !k_down && !k_up 			touche_enfoncee = false;
		
		if k_attaque || k_start
		{
			menu_x_target = w + 200;
			menu_selection = menu_curseur;
			menu_control = false;	
		}
	}
	
	if (menu_x > w + 150) && (menu_selection != -1)
	{
		switch menu_selection
		{
			case 2 : default: scr_transition(TRANS_MODE.GOTO,room_editeur); break;
			case 0 : game_end(); break;
			case 1 : scr_transition(TRANS_MODE.GOTO,room_jeu); break;
		}
		menu_selection = -1;
		mode = MENU_MODE.OFF;
	}	
}




if mode != MENU_MODE.OFF
{
	if mode = MENU_MODE.FADE
	{
		percent = max(0,percent*0.9-0.01);		
	}
	
	if mode = MENU_MODE.INTRO
	{
		percent = min(1,percent+(1-percent)*0.1+0.01);		
	}
	
	if (percent = 0) or (percent = 1)
	{
		switch mode
		{
			case MENU_MODE.INTRO:
			{
				mode = MENU_MODE.PAUSE
				break;
			}
			case MENU_MODE.FADE:
			{
				mode = MENU_MODE.OFF;
				with obj_tir speed = 12;
				break;
			}		
		}
	}
}


x1 = (0.5 - 3/8*percent)*w;
x2 = (0.5 + 3/8*percent)*w;

y1 = (0.5 - 3/8*percent)*h;
y2 = (0.5 + 3/8*percent)*h;
