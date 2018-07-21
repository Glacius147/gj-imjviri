/// @desc Bloc poussé par le joueur

if collision == obj_joueur.id && actif && deplacement_effectue < sprite_height
{
//deplacement horizontal
while (place_meeting(x+hsp,y,obj_master) && hsp != 0)
{
	hsp = scr_approche(hsp,0,1);
}
x = x + hsp;


//deplacement vertical
while (place_meeting(x,y+vsp,objp_solide) && vsp != 0)
{
	vsp = scr_approche(vsp,0,1);
}
y = y + vsp;

deplacement_effectue += abs(hsp) + abs(vsp);

}