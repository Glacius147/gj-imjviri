//appuyé ?

if place_meeting(x,y,obj_joueur) || place_meeting(x,y,obj_bloc_metal)
{
	image_index = 1;
	event_user(5);
}
else
{
	image_index = 0;
	event_user(6);
}