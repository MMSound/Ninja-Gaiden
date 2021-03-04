/// @description Draw
if (in_range(y, global.viewY, (global.viewY + global.viewH)))
{
	draw_sprite(sprButtonPillar, (room == rmAct6Scene3), x, y);
}