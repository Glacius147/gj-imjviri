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
	JEU,
	PAUSE,
	FADE,
	INTRO,
	MENU,
	CONSTRUCTION,
	UP,
	DOWN,
	CHANGEMENT_SALLE
}




mode = MENU_MODE.MENU;

percent = 0;

menu[3] = "Chargement d'un donjon";
menu[2] = "Création d'un donjon";
menu[1] = "Exploration d'un donjon";
menu[0] = "Quitter";

menu_item = array_length_1d(menu);
menu_curseur = 2;



// Table correspondance id objet/id sauvegarde

global.list_item[0] = string(obj_mur_salle);
global.list_item[1] = string(obj_joueur);
global.list_item[2] = string(obj_bloc);
global.list_item[3] = string(obj_blop);
global.list_item[4] = string(obj_mur);
global.list_item[5] = string(obj_porte);
global.list_item[6] = string(obj_porte_bloquee);
global.list_item[7] = string(obj_porte_fermee);
global.list_item[8] = string(obj_porte);
global.list_item[9] = string(obj_clef);
global.list_item[10] = string(obj_bombe_loot);
global.list_item[11] = string(obj_coeur);
global.list_item[12] = string(obj_moblin);
global.list_item[13] = string(obj_bloc_explosable);
global.list_item[14] = string(obj_mur_explosable);
global.list_item[15] = string(obj_dependance);
global.list_item[16] = string(obj_fantome);


global.map_item_index = ds_map_create()
var i;
nb_item = array_length_1d(global.list_item);
for (i = 0; i<nb_item; i+=1)
{
	coress = global.list_item[i]
	ds_map_add(global.map_item_index,coress,i)
}