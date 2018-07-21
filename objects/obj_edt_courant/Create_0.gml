/// @description Insert description here
// You can write your code in this editor


sprite_index = spr_joueur_down
current_type = obj_joueur


current_player = noone




//Pour que les objets ne bougent pas.
obj_menu.mode = MENU_MODE.CONSTRUCTION

//Création du tableau des salles créées
var i;
var j;
for (i = 0; i < 16; i += 1)
{
	for (j = 0; j < 16; j += 1)
	{
		created_room[i , j] = false
	}
}

nb_obj = 0
