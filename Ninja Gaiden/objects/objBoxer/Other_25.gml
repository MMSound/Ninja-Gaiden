/// @description Movement
function move_normal()
{
	if (objPlayer.x > x)
	{
		xspeed = choose(moveSpeed, moveSpeed, -moveSpeed);
		image_xscale = 1.00;
		spriteTo = sprBoxer;
		imgTo = frameNum;
	}
	else
	{
		xspeed = choose(-moveSpeed, -moveSpeed, moveSpeed);
		image_xscale = -1.00;
		spriteTo = sprBoxer;
		imgTo = frameNum;
	}		
}

//choose the direction to go
if (grounded())
{
	frameNum = !frameNum;
	sprite_index = sprBoxer;
	image_index = 2;
	animTimer = 0;
	yspeed = -2;
	if (lungedCounter > 0) //decrement the times we have until we can lunge again
	{
		lungedCounter--;
	}
	if (instance_exists(objPlayer)) //determine whether to move towards the player
	{
		if (lungedCounter == 0)
		{
			if (distance_to_object(objPlayer) < 16) //lunge at you (only every 4 jumps though)
			{
				xspeed = (moveSpeedBoost * sign(objPlayer.x - x));
				spriteTo = sprBoxerPunch;
				lungedCounter = 4;
			}
			else
			{
				move_normal();
			}
		}
		else
		{
			move_normal();
		}
	}
}
else //animation
{
	if (animTimer > 4)
	{
		sprite_index = spriteTo;
		image_index = imgTo;
	}
}

//animate
animTimer++;