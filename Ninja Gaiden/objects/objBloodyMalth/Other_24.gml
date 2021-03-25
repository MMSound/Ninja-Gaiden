/// @description Custom variables
event_inherited();

contactDamage = 8;

phase = 0;
phaseTimer = 0;
nextPhase = 0;

attackCount = 0;

myLightning = noone;

nextRoom = rmAct6Scene1;

animTimer = 0;
goToNextFrame = false;

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
	//make sure to add code for setting the animation timer and shit
	//and also the flashing
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

//so basically we want an easy system for all the blurs and stuff that isn't in_range abuse
//we're gonna make a function that automatically switches to a given frame and sets a timer to
//like 4 or 5, then in event user 15 we'll make it so if he's at a particular frame
//(i.e. the blur ones), he'll automatically image_index++ when the timer reaches 0
//this should make animating things easier as we can just call this function when we shoot a bullet
//or something

//for the frames where he has lightning on his hand we can make a function or list or something
//to be able to easily reference where the lightning ball should be in relation to malth's x and y
//this should only apply to the summon frame and the throwing frames, so 5 frames in total

//when he summons lightning we could use the shader to make him flash, should be fairly simple

//ofc all this is just for animating so it only applies when i finish the sprites