/// @desc gere la selection d'objet


//création liste objet possedé
if obj_joueur.cryo liste[0] = true else liste[0] = false;
if obj_joueur.bombes_possede liste[1] = true else liste[1] = false;

//num de l'item selectionné
if obj_joueur.objet_b = spr_cryo objet_b_num = 0;  
if obj_joueur.objet_b = spr_bombe objet_b_num = 1; 




//icones des objets possédés
if obj_joueur.cryo draw_sprite(spr_cryo,0,x_b + 118,y_b - 133);
if obj_joueur.bombes_possede draw_sprite(spr_bombe,0,x_b + 118 + 20 , y_b - 133);



	
//9 box sur l'item selectionné
scr_9box(spr_9box_red,x_b + 104 + 20*objet_b_num, y_b -146, x_b + 132 + 20*objet_b_num, y_b -117); 

scr_input();

if k_left && !touche_enfoncee && objet_b_num != 0 
{
	objet_b_num --;
	touche_enfoncee = true;
}

if k_right && !touche_enfoncee && objet_b_num != 1 
{
	objet_b_num ++;
	touche_enfoncee = true;
}




