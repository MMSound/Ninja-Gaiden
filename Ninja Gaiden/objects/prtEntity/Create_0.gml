/// @description Variables
xspeed = 0;
yspeed = 0;

hasGravity = true;
grav = 0.25;

hasCollision = true;
isSolid = false;
doSlope = true;

healthPoints = 1;
contactDamage = 0;
canHit = true;
canBeHit = true;

imgSpd = 0;
drawBlink = false;

event_user(14);

if (hasCollision)
{
	init_movement();
}