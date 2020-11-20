/// @description Movement

//a circle but horizontally
theta -= (2 * image_xscale);
if (theta >= 360)
{
	theta -= 360;
}
x = ((centerX + radius * cos(degtorad(theta))));

//aim vertically
if (instance_exists(objPlayer))
{
	var _targetY = ((objPlayer.y - 16) + (8 * objPlayer.isDuck));
	if (y < _targetY)
	{
		y += 0.5;
	}
	else if (y > _targetY)
	{
		y -= 0.5;
	}
	
	//sfx playing
	if (distance_to_object(objPlayer) < 48)
	{
		if (!hasPlayedSFX)
		{
			play_sfx(sfxWindmillShuriken);
			hasPlayedSFX = true;
		}
	}
	else
	{
		hasPlayedSFX = false;
	}
	
	//if we're not in the right section
	if (place_meeting(x, y, objSection))
	{
		var _section = instance_place(x, y, objSection);
		if (global.currentSection != _section)
		{
			destroy_self();
		}
	}
}

if (++canCatchTimer == 60)
{
	canCatch = true;
}