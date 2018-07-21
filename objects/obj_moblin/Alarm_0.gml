/// @desc choix d'une direction

alarm[0] = irandom_range(60,120);

var i = irandom_range(1,4);

k_left = false;
k_right = false;
k_up = false;
k_down = false;
	

switch i
{
	case 1 : k_left = true; break;
	case 2 : k_right = true; break;
	case 3 : k_up = true; break;
	case 4 : k_down = true; break;
}
