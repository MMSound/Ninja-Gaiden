/// @description Follow Ryu
if (instance_exists(objPlayer))
{
	var _middleY = (global.viewY + (global.viewH / 2));
	
	x = objPlayer.x;
	y = (_middleY + ((_middleY - objPlayer.y) / 2));
	sprite_index = objPlayer.sprite_index;
	image_index = objPlayer.image_index;
	image_xscale = objPlayer.image_xscale;
}