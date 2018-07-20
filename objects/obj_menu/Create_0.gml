/// @description Initialisation variables

gui_margin = 64;

w = display_get_gui_width();
h = display_get_gui_height();

x1 = room_width/2;
x2 = x1;
y1 = room_height/2;
y2 = y1;

menu_x = w + 200;

menu_y = h - gui_margin;
menu_x_target = w - gui_margin;
menu_speed = 25; //lower is faster
menu_font = font_menu;
menu_itemheight = font_get_size(font_menu);
menu_selection = -1;
menu_control = true;

touche_enfoncee = false;


enum MENU_MODE
{
	OFF,
	PAUSE,
	FADE,
	INTRO,
	MENU,
	CONSTRUCTION
}

mode = MENU_MODE.MENU;

percent = 0;

menu[2] = "Création d'un donjon";
menu[1] = "Exploration d'un donjon";
menu[0] = "Quitter";

menu_item = array_length_1d(menu);
menu_curseur = 2;



