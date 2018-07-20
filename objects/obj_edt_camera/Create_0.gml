/// @description Création de la caméra de l'éditeur.
// You can write your code in this editor

var salle_width = 16*16;
var salle_height = 16*11;


view_camera = camera_create();


camera_set_view_pos(view_camera, salle_width/2,salle_height/2);
camera_set_view_size(view_camera, salle_width,salle_height);

 camera_set_default(view_camera);