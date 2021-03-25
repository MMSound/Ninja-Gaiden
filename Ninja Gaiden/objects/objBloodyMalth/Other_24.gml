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

//so basically we want an easy system for all the blurs and stuff that isn't in_range abuse
//we're gonna make a function that automatically switches to a given frame and sets a timer to
//like 4 or 5, then in event user 15 we'll make it so if he's at a particular frame
//(i.e. the blur ones), he'll automatically image_index++ when the timer reaches 0
//this should make animating things easier as we can just call this function when we shoot a bullet
//or something

//additionally, malth should be able to summon lightning
//this will be another function that just creates the lightning object (with the necessary frames in it)
//and puts malth in the right frame for however many frames we need
//that should also be simple to make

//for the frames where he has lightning on his hand we can make a function or list or something
//to be able to easily reference where the lightning ball should be in relation to malth's x and y
//this should only apply to the summon frame and the throwing frames, so 5 frames in total

//for projectile sprites we need a lot of different kinds of lightning:
//- big 32x32 aimed shot
//- big 48x144 lightning bolt for behind him
//- screenwide 16px tall bolt for the bottom/top lightning attacks
//- small 16x16 general purpose lightning ball (can be a resized 32x32 one)

//when he summons lightning we could use the shader to make him flash, should be fairly simple

//ofc all this is just for animating so it only applies when i finish the sprites