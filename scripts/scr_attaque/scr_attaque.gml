/// @desc scr_attaque();
	
//vérifie si il y a qq dans la direction de l'épée

var x_t = x;
var y_t = y;

	
//Coordonnées du bout de l'épée
switch dir_attaque
{
	case DIR.RIGHT :
	{
		x_t += portee
		break;
	}
	case DIR.LEFT :
	{
		x_t -= portee
		break;
	}
	case DIR.UP :
	{
		y_t -= portee
		break;
	}
	case DIR.DOWN :
	{
		y_t += portee
		break;
	}
}

with instance_position(x_t,y_t,objp_enemy)
{
	if !invulnerable
	{
		invulnerable = true;
		alarm[1] = frames_invulnerable;
		pv -= other.degats;
		blink = 6;
		event_user(0);
	}
}