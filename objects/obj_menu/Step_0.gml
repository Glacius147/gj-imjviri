/// @description Gestion affichage du cadre

scr_input();

if mode = MENU_MODE.MENU
{
	//arrivée progressive du menu à l ecran
	menu_x += (menu_x_target - menu_x)/menu_speed;

	//controls clavier
	if menu_control
	{
		//deplacement dans le menu
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
		
		//pour eviter un deplacement par frame quand on laisse apuyé sur haut/bas
		if !k_down && !k_up 			touche_enfoncee = false;
		
		//validation d'un item
		if k_attaque || k_start
		{
			menu_x_target = w + 200;
			menu_selection = menu_curseur;
			menu_control = false;	
		}
	}
	
		//changement de room
	if (menu_x > w + 150) && (menu_selection != -1)
	{
		switch menu_selection
		{
			case 2 : default: scr_transition(TRANS_MODE.GOTO,room_editeur); break;
			case 0 : game_end(); break;
			case 1 : scr_transition(TRANS_MODE.GOTO,room_jeu); break;
			case 3 : default: scr_transition(TRANS_MODE.GOTO,room_charge); break;
		}
		menu_selection = -1;
		mode = MENU_MODE.JEU;
	}	
}

if mode = MENU_MODE.JEU && k_start mode = MENU_MODE.UP;


		//gestion des transitions
if mode != MENU_MODE.JEU
{
	if mode = MENU_MODE.FADE || mode = MENU_MODE.DOWN
	{
		percent = max(0,percent*0.9-0.01);		
	}
	
	if mode = MENU_MODE.INTRO || mode = MENU_MODE.UP
	{
		percent = min(1,percent+(1-percent)*0.1+0.01);		
	}
	
	if (percent = 0) or (percent = 1)
	{
		switch mode
		{
			//transition du menu de depart avec ecran noir
			case MENU_MODE.INTRO:
			{
				mode = MENU_MODE.PAUSE
				break;
			}
			case MENU_MODE.FADE:
			{
				mode = MENU_MODE.JEU;
				break;
			}	
			//transitions de la pause en jeu
			case MENU_MODE.UP:
			{
				mode = MENU_MODE.PAUSE;
				break;
			}
			case MENU_MODE.DOWN:
			{
				mode = MENU_MODE.JEU;
				break;
			}
		}
	}
}


