/// @desc Déplacement et action du perso

if obj_menu.mode = MENU_MODE.JEU
{
		

	// application du mouvement
	hsp = (k_right - k_left)*vitesse_marche;
	vsp = (k_down - k_up)*vitesse_marche;


	//déplacement
	scr_deplacement();
	
	
	
	//animation
	scr_animation();
	
	//attaque
	scr_attaque_monstre();
}
