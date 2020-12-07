/// @description Generate splashes
if (!game_paused())
{
	if (inside_view())
	{
		for (var i = 0; i < 3; i++)
		{
			var _drop = instance_create_depth(x, irandom_range(bbox_top, bbox_bottom), 0, objWaterSplash);
				_drop.xspeed = ((choose(0.5, 1) * force) * -image_xscale);
				_drop.yspeed = choose(-1, -2);
		}
	}
}