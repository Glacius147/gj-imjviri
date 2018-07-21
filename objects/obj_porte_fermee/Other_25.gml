/// @desc tentative d'ouverture de la porte

if collision = obj_joueur.id && obj_joueur.clef > 0
{
	obj_joueur.clef --;
	instance_change(obj_porte,false);	
}
