/// @desc tentative d'ouverture de la porte

if collision = obj_joueur.id && obj_joueur.clef > 0
{
	obj_joueur.clef --;
	mask_index = spr_masque_test;
	with instance_place(x,y,obj_porte_fermee) 	instance_change(obj_porte,false);	
	instance_change(obj_porte,false);	
}
