/// @description Insert description here
// You can write your code in this editor

if view_current == 0
{
if mode_edition = EDITEUR_MODE.NORMAL{
	
//Détermination du type d'objet
if current_type == obj_mur_salle.object_index
	{
		//Si c'est une salle, placement en haut à gauche
		x = floor((mouse_x) / 256)*256
		y = floor((mouse_y) / 176)*176
	} else // par défaut, arrondi au bloc près, centré.
	{
		x = round((mouse_x-8) / 16)*16+8
		y = round((mouse_y-8) / 16)*16+8
	}



item = instance_position(x,y,obj_master);

if (x<4096 and current_type != noone)
{
draw_self()
}
else if item != noone and (item.object_index == obj_mur or item.object_index == obj_porte or item.object_index == obj_porte_bloquee or item.object_index == obj_porte_fermee)
{
	
}

}
else if mode_edition = EDITEUR_MODE.DEPENDANCE_2
	{
	if mouse_x<4096
	{
		draw_self()	
	}
	}

} 




/*else
{
	
x = round((mouse_x) / 16)*16
y = round((mouse_y) / 16)*16
	
}
*/