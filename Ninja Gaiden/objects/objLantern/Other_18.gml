/// @description Drawing
if (room == rmAct4Scene1 && x < 2400 && sprite_index != sprLanternWeapon)
{
	draw_sprite_ext(sprLanternAct41Web, 0, x, global.sectionT, 1.00, (y - global.sectionT), 0, c_white, 1.0);
}

event_inherited();