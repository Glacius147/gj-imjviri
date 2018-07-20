/// @desc scr_attaque();
	
//vérifie si il y a qq dans la direction de l'épée

var x_t1 = x;
var y_t1 = y;
var x_t2 = x;
var y_t2 = y;
	
//Coordonnées du bout de l'épée
switch dir_attaque
{
	case DIR.RIGHT :
	{
		x_t1 += portee;
		x_t2 += portee/2;
		break;
	}
	case DIR.LEFT :
	{
		x_t1 -= portee;		
		x_t2 -= portee/2;		
		break;
	}
	case DIR.UP :
	{
		y_t1 -= portee;
		y_t2 -= portee/2;
		break;
	}
	case DIR.DOWN :
	{
		y_t1 += portee;
		y_t2 += portee/2;
		break;
	}
}

with instance_position(x_t1,y_t1,objp_enemy)
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

with instance_position(x_t2,y_t2,objp_enemy)
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