/// @description Collide with player
if (place_meeting(x, y, objPlayer))
{
	if (instance_exists(windObject)) //wind
	{
		with (windObject)
		{
			image_xscale = 200;
			image_yscale = 15;
		}
	}
	
	if (instance_exists(objParallax)) //parallax
	{
		with (objParallax)
		{
			if (sprite_index == sprAct3Water)
			{
				xspeed *= 1.5;
			}
			else if (sprite_index == sprAct3FrontTrees)
			{
				sprite_index = sprAct3FrontTreesWind;
				imgSpd = (1 / 6);
			}
			else if (sprite_index == sprAct3BackTrees)
			{
				sprite_index = sprAct3BackTreesWind;
				imgSpd = (1 / 6);
			}
		}
	}
	
	play_sfx(sfxWindBlow, false, 14);
	
	instance_destroy(id);
}