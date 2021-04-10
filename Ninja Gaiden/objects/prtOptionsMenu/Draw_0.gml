/// @description Drawing background
if (room_get_type() != ROOM_MENU)
{
	draw_set_color(c_black);
	draw_rectangle(global.viewX, global.viewY, (global.viewX + global.viewW), (global.viewY + global.viewH), false);
	draw_set_color(c_white);
}