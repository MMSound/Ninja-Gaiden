/// @description Return game to normal
global.timeFrozen = false;
play_sfx(sfxTickTockShatter);

//create shards
for (var i = 0; i < 2; i++)
{
	var _shard = instance_create_depth(drawX, drawY, depth, objTimeFreezeClockShard);
		_shard.side = i;
}