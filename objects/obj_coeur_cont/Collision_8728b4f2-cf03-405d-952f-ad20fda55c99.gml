/// @descr HP ++
if actif
{
other.pv_max = scr_approche(other.pv_max,10,1);
other.pv = scr_approche(other.pv,10,1);
instance_destroy();
}