/// @desc affiche le niveau de PV du joueur
if instance_exists(obj_joueur) pv = obj_joueur.pv else pv = 0;

if pv >= pv_cible image_index = 0;
if pv = pv_cible - 0.5 image_index = 1;
if pv < pv_cible - 0.5 image_index = 2;