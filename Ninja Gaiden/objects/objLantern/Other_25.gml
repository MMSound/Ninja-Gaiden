/// @description Set depth
if (instance_exists(objPlayer))
{
	depth = (objPlayer.depth + 5);
}
if (itemDrop == SHURIKEN || itemDrop == WINDMILL_SHURIKEN || itemDrop == FLAME_WHEEL || itemDrop == FLAME_SHIELD || itemDrop == SPIN_SLASH)
{
	sprite_index = sprLanternWeapon;
	imgSpd = (1 / 3);
}