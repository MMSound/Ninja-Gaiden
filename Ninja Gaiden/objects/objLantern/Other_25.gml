/// @description Stop animation
if (itemDrop == SHURIKEN || itemDrop == WINDMILL_SHURIKEN || itemDrop == FLAME_WHEEL || itemDrop == FLAME_SHIELD || itemDrop == SPIN_SLASH)
{
	imgSpd = 0;
}

if (instance_exists(objPlayer))
{
	depth = (objPlayer.depth + 5);
}