/// @description Custom variables
event_inherited();

nextRoom = rmCutscene13;

contactDamage = 0;
canHit = false;
canBeHitManual = false;
hasGravity = false;
hasCollision = false;

myDevil = noone;

shieldCount = 0;
shieldTotal = 7;
initialShield = false;

hitsLeft = 0;

colorIndex = 0;
shellFrame = 0;

//i decided to keep track of the shield parts this way because it means we can more easily check which
//ones are missing instead of having to do instance_find bs
for (var i = 0; i < shieldTotal; i++)
{
	shieldID[i] = noone;
}

depth = 25;