/// @description Custom variables
event_inherited();

contactDamage = 8;

phase = 0;
phaseTimer = 0;
nextPhase = 0;

attackCount = 0;

myLightning = noone;

nextRoom = rmCutscene11;

animTimer = 0;
goToNextFrame = false;
hasPunched = false;

colorIndex = 0;

function lightning_pillar_create(_x, _y, _height)
{
	for (var i = 0; i < _height; i++)
	{
		var _shot = instance_create_depth(_x, (_y - (i * 16)), depth, objGenericBullet);
			_shot.contactDamage = 2;
			_shot.xspeed = 3;
			_shot.canBeHit = false;
			_shot.sprite_index = sprMalthLightningBallSmall;
			_shot.imgSpd = 1;
	}
	play_sfx(sfxMalthZapSmall);
}

function summon_lightning()
{
	instance_create_depth(x, (y - 48), depth, objBloodyMalthLightningSummon);
	play_sfx(sfxMalthSummon);
	colorIndex = 3;
}

function animate_to_frame(_frame, _time)
{
	if (is_undefined(_time))
	{
		_time = 6;
	}
	
	image_index = _frame;
	animTimer = _time;
	goToNextFrame = true;
}