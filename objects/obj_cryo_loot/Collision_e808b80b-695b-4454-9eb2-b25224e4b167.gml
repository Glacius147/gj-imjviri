/// @descr HP ++
if actif
{
	audio_sound_pitch(son_pickup,random_range(0.8,1.2));
	audio_play_sound(son_pickup,2,0);
	other.cryo = true;
	instance_destroy();
}