/// @description Drawing background
if (room != rmOptionsMenu)
{
	draw_set_color(c_black);
	draw_rectangle(global.viewX, global.viewY, (global.viewX + global.viewW), (global.viewY + global.viewH), false);
	draw_set_color(c_white);
}