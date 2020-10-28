/// @description Custom variables
hasGravity = false;
hasCollision = false;

healthPoints = 1;
contactDamage = 0;

canHit = false;

if (!variable_instance_exists(self, "itemDrop"))
{
	itemDrop = 5;
}