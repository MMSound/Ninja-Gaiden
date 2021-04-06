/// @description Destruction
if (instance_exists(objJashinHeart))
{
	with (objJashinHeart)
	{
		phase = 1;
		visible = true;
		var _solid = instance_create_depth((global.viewX + 272), (global.viewY + 168), 100, objUnclimbableWall);
			_solid.image_xscale = 5.00;
			_solid.image_yscale = 2.00;
			_solid.visible = false;
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
global.levelTime = 137;