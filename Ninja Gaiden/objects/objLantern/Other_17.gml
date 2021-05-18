/// @description Creating the item
var _item = instance_create_depth(x, y, (depth - 5), objItems);
	_item.image_index = itemDrop;
particle_create(x, (y - (sprite_height div 2)), sprBulletExplosion, (1 / 2), false, (depth - 5));
if (inside_view())
{
	play_sfx(sfxMinorExplosion);
}
instance_destroy(id);