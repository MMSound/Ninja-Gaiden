/// @description Generate explosions
if (timer % explosionInterval == 0)
{
	for (var i = 0; i < explosionNumber; i++) //generate random explosions
	{
		var _x = irandom_range(0, ((image_xscale * 16) / 8));
		var _y = irandom_range(0, ((image_yscale * 16) / 8));
		particle_create((bbox_left + (_x * 8)), (bbox_top + (_y * 8)), (explosionType ? sprCastleExplosion : sprCastleExplosionSmall), 0.25, false, depth);
	}
	play_sfx(sfxMalthSummon);
}
timer++;