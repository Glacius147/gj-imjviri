/// @description Création de la caméra de l'éditeur.
// You can write your code in this editor

var salle_width = 16*16;
var salle_height = 16*11;


view_camera = camera_create();


var viewmat = matrix_build_lookat(640, 240, -10, 640, 240, 0, 0, 1, 0);