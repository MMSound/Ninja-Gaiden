/// @description Custom variables
event_inherited();

contactDamage = 8;

phase = 0;
phaseTimer = 0;
nextPhase = 0;

attackCount = 0;

myLightning = noone;

nextRoom = rmAct6Scene1;

function lightning_pillar_create(_x, _y, _height)
{
	for (var i = 0; i < _height; i++)
	{
		var _shot = instance_create_depth(_x, (_y - (i * 16)), depth, objGenericBullet);
			_shot.contactDamage = 2;
			_shot.xspeed = 3;
			_shot.canBeHit = false;
			//sprite stuff here later
	}
}