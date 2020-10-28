/// @description Variables
event_inherited();

healthPoints = 1;
contactDamage = 1;
canHit = true;
canBeHit = true;

despawnOutsideView = false;

event_user(14);

if (hasCollision)
{
	init_movement();
}