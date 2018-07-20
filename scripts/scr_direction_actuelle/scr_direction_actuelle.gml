/// @desc scr_direction_actuelle()
// met dans dir_precedente la direction actuelle


dir_actuelle = DIR.REPOS;
if k_up dir_actuelle = DIR.UP;
if k_down dir_actuelle = DIR.DOWN;
if k_right dir_actuelle = DIR.RIGHT;
if k_left dir_actuelle = DIR.LEFT;

if !attaque
{
	if k_up dir_precedente = DIR.UP;
	if k_down dir_precedente = DIR.DOWN;
	if k_right dir_precedente = DIR.RIGHT;
	if k_left dir_precedente = DIR.LEFT;
}