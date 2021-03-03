/// @description Move
if (!game_paused())
{
	if (place_meeting(x, (y - 1), objPlayer))
	{
		if (!activated)
		{
			play_sfx(sfxFallingPillar);
		}
		activated = true;
	}

	if (activated)
	{
		if (fallTimer % 2 == 0) //shake back and forth
		{
			drawX = !drawX;
		}
		
		if (fallTimer % 6 == 0) //dust particles
		{
			if (y < (global.viewY + (global.viewH + 32)))
			{
				var _side = choose(bbox_left, bbox_right);
				var _dust = instance_create_depth(_side, (global.viewY + global.viewH), depth, objFallingPillarDust);
				if (_side == bbox_right)
				{
					_dust.xDir = 1;
				}
			}
		}
	
		if (fallTimer > 20) //wait 20 frames
		{
			if (fallTimer < 30)
			{
				yspeed = (fallTimer % 2 == 0);
			}
			else
			{
				/*if (fallTimer % 30 == 0)
				{
					yspeed++;
				}*/
				yspeed += 0.1;
			}
		}
	
		fallTimer++;
	}

	round_velocity();

	move_platform_y(yspeedInt);
}

//adjust depth
if (instance_exists(objPlayer))
{
	depth = (objPlayer.depth + 5);
}

//die if offscreen
if (global.currentSection == mySection)
{
	if (y > (global.viewY + (global.viewH + 32)))
	{
		var _respawn = instance_create_depth(xstart, ystart, depth, objFallingPillarRespawner);
			_respawn.image_xscale = image_xscale;
			_respawn.image_yscale = image_yscale;
		instance_destroy(id);
	}
}