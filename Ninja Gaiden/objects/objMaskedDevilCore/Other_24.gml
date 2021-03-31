/// @description Custom variables
event_inherited();

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

//i decided to keep track of the shield parts this way because it means we can more easily check which
//ones are missing instead of having to do instance_find bs
shieldID[0] = noone;
shieldID[1] = noone;
shieldID[2] = noone;
shieldID[3] = noone;
shieldID[4] = noone;
shieldID[5] = noone;
shieldID[6] = noone;