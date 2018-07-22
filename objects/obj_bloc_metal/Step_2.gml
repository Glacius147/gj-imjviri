/// @desc

if obj_menu.mode = MENU_MODE.JEU 
{
	if magnis_cible && !obj_joueur.magnis_actif  magnis_cible = false

	if magnis_cible 
	{
		vsp = obj_joueur.vsp;
		hsp = obj_joueur.hsp;
		
		scr_deplacement();
	}
}