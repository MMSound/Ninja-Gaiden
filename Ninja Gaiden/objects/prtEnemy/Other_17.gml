/// @description Getting killed
particle_create(x, (y - (sprite_height div 2)), sprGenericExplosion, (1 / 2), false, (depth - 5));
if (object_index != objLantern)
{
	global.gameScore += 100;
	score_text(x, bbox_top, 100);
}
if (inside_view())
{
	play_sfx(sfxMinorExplosion);
}
instance_destroy();