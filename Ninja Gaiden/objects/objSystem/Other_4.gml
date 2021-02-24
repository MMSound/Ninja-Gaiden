/// @description Move all the collision and objects down 8 pixels
if (instance_exists(prtCollision))
{
	with (prtCollision)
	{
		y += 8;
	}
}
if (instance_exists(prtEntity))
{
	with (prtEntity)
	{
		y += 8;
	}
}
if (instance_exists(objCheckpoint))
{
	with (objCheckpoint)
	{
		y += 8;
	}
}

//set timer
switch (room) //this will let me add in a bit of extra time in specific instances
{
	default:
		global.levelTime = 200;
		break;
	case rmAct4Scene3:
		global.levelTime = 210;
		break;
	case rmAct6Scene2:
		global.levelTime = 220;
		break;
}
global.levelTimer = 0;

global.currentSection = noone;

global.bossPhase = (room_get_type() == ROOM_BOSS);
global.bossHealth = 16;

music_set_fade(1.0);

if (global.checkpointX != 0)
{
	if (instance_exists(objPlayer))
	{
		objPlayer.x = global.checkpointX;
		objPlayer.y = global.checkpointY;
	}
	
	//special conditions (by that i mean dumb hacky shit)
	if (room == rmAct3Scene2)
	{
		if (instance_exists(inst_7530BAF1))
		{
			instance_destroy(inst_7530BAF1);
		}
	}
}