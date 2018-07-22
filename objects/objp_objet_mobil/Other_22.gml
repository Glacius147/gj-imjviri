///@desc torche

if !invulnerable
{
	invulnerable = true;
	alarm[1] = frames_invulnerable;
	pv -= 1;
	blink = 6;
	
	alarm[11] = 120;
	
	event_user(0);
}