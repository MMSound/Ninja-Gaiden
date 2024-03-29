/// @description Destruction
if (instance_exists(objJashinHeart))
{
	with (objJashinHeart)
	{
		phase = 1;
		visible = true;
		if (mySolid == noone)
		{
			mySolid = instance_create_depth((global.viewX + 272), (global.viewY + 168), 100, objUnclimbableWall);
			mySolid.image_xscale = 5.00;
			mySolid.image_yscale = 2.00;
			mySolid.visible = false;
		}
	}
}
if (!instance_exists(objPixelation))
{
	instance_create_depth(0, 0, 0, objPixelation);
}
if (!global.soundtrackOption)
{
	music_play(bgmAct5Scene1);
}
else
{
	music_play(bgmAct5Scene1PCE);
}
if (instance_exists(objGenericBullet))
{
	instance_destroy(objGenericBullet);
}
if (instance_exists(objJashinTail))
{
	with (objJashinTail)
	{
		phase = 2;
		phaseTimer = 0;
		imgSpd = (1 / 3);
	}
}
if (instance_exists(objJashinWaveBG))
{
	instance_destroy(objJashinWaveBG);
}
global.levelTime = 137;