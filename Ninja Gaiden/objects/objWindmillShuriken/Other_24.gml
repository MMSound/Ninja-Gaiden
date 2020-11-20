/// @description Custom variables
imgSpd = (1 / 2);

multiHit = true;

canDespawn = false;
lifeTime = -1;

centerX = xstart;
theta = 90;
radius = 192;

canCatch = false;
canCatchTimer = 0;

combo = 0;

play_sfx(sfxWindmillShuriken);
hasPlayedSFX = true;

function destroy_self()
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