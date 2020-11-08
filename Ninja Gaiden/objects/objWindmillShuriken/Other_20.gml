/// @description Collide with Ryu and update center
if (instance_exists(objPlayer))
{
	centerX = objPlayer.x;
}
if (place_meeting_player(x, y))
{
	if (canCatch)
	{
		instance_destroy();
		combo = 0;
		global.ninpo += 2;
		if (audio_is_playing(sfxWindmillShuriken))
		{
			audio_stop_sound(sfxWindmillShuriken);
			play_sfx(sfxShuriken);
		}
	}
}