/// @description Draw game with shader
palette_shader_set(global.screenPalette, global.screenColorIndex, false);
draw_surface(application_surface, 0, 0);
palette_shader_reset();

//pause screen
if (global.paused && !instance_exists(prtOptionsMenu))
{
	var _drawX = (global.viewW / 2);
	var _drawY = (global.viewH / 2);
	draw_sprite(sprPauseMenu, 0, _drawX, _drawY);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_color(c_black);
	draw_text((_drawX + 1), (_drawY + 1), "PAUSE");
	draw_text((_drawX + 1), (_drawY + 49), "PRESS SELECT FOR OPTIONS");
	draw_set_color(c_white);
	palette_shader_set(sprFontPalette, global.uiColorIndex, false);
	draw_text(_drawX, _drawY, "PAUSE");
	draw_text(_drawX, (_drawY + 48), "PRESS SELECT FOR OPTIONS");
	palette_shader_reset();
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

//this is for the NERDS whose computers don't support shaders >:(
if (!global.isShader)
{
	if (instance_exists(objRoomTransition))
	{
		draw_set_alpha(objRoomTransition.drawAlpha);
		draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1.0);
	}
}