/// @descr HP ++
if actif
{
	other.pv = scr_approche(other.pv, other.pv_max, 5);
	instance_destroy();
}