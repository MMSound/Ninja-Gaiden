/// @description Create shards
var _xspeed = [-1, 0.15, 1];
var _yspeed = [0, -2, -1];
for (var i = 0; i < 3; i++)
{
	var _shard = instance_create_depth(x, y, depth, objGuardianCrystalShard);
		_shard.image_index = i;
		_shard.xspeed = _xspeed[i];
		_shard.yspeed = _yspeed[i];
		_shard.color = color;
}
play_sfx(sfxTickTockShatter);

instance_destroy(id);