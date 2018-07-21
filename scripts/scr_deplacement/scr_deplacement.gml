/// @description scr_deplacement()
//deplacement horizontal
while (place_meeting(x+hsp,y,objp_solide) && hsp != 0)
{
	hsp = scr_approche(hsp,0,1);
	other.collision = id;
	
}
x = x + hsp;

//deplacement vertical
while (place_meeting(x,y+vsp,objp_solide) && vsp != 0)
{
	vsp = scr_approche(vsp,0,1);
}
y = y + vsp;
