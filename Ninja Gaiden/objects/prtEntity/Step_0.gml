/// @description Control entity behavior
if (!game_paused())
{
	image_speed = imgSpd;
	
	if (object_index != objPlayer)
	{
		if (hasGravity)
		{	
			if (!grounded())
			{
				yspeed += grav;
			}
			else
			{
				yspeed = 0;
			}
		}
	}
	
	//execute child step
	event_user(15);
	
	if (object_index != objPlayer)
	{
		move_y(yspeed);
		move_x(xspeed, doSlope);
	}
	
	//child post-step
	event_user(10);
	
	//falling into pits
	if (y > (global.viewY + (global.viewH + 60)) && !place_meeting(x, y, objSection))
	{
		entity_damage(id, 69);
	}
}
else
{
	image_speed = 0;
}