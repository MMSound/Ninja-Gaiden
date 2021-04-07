/// @description Custom variables
event_inherited();

canBeHitManual = true;
canHit = true;
hasGravity = false;
hasCollision = false;

contactDamage = 3;

depth = 5;

imgSpd = (1 / 4);

phase = 0;
phaseTimer = 0;
hitCounter = 2;
bodyFrame = 2;
switchSidesCounter = 0;
mySolid = noone;

//switch sides
function switch_sides()
{
	x = (image_xscale == 1.00) ? (global.viewX + 112) : xstart;
	image_xscale *= -1;
	if (!instance_exists(objPixelation))
	{
		instance_create_depth(0, 0, 0, objPixelation);
	}
	if (instance_exists(objPlayer))
	{
		with (objPlayer)
		{
			var _xOffset = (x - (global.viewW / 2));
			x = ((global.viewX + (global.viewW / 2)) - _xOffset);
			image_xscale *= -1;
		}
	}
	play_sfx(sfxJashinHeadWarp);
	
	//adjust the solid
	if (mySolid != noone)
	{
		if (image_xscale == 1.00)
		{
			mySolid.x = (global.viewX + 272);
			mySolid.image_xscale = 5.00;
		}
		else
		{
			mySolid.x = (global.viewX + (global.viewW - 272));
			mySolid.image_xscale = -5.00;
		}
	}
}

//shrimp
function shrimp()
{
	var _shootTime = instance_exists(objJashinTail) ? 120 : 50;
	if (phaseTimer % _shootTime == 0 && instance_exists(objPlayer)) //projectiles
	{
		var _shrimp = instance_create_depth((x - (30 * image_xscale)), (y - 84), (depth - 1), objGenericBullet);
			_shrimp.doesGravity = true;
			if (image_xscale == 1.00)
			{
				_shrimp.xspeed = round(-clamp(((_shrimp.x - objPlayer.x) / 32), -1, 128));
			}
			else
			{
				_shrimp.xspeed = round(clamp(((objPlayer.x - _shrimp.x) / 32), -1, 128));
			}
			_shrimp.yspeed = -4;
			_shrimp.contactDamage = 3;
			_shrimp.sprite_index = sprJashinShrimp;
			_shrimp.imgSpd = 1;
		animTimer = 5;
		play_sfx(sfxJashinShrimp);
	}	
}