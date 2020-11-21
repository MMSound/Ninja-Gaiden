/// @description Draw game with shader
palette_shader_set(global.screenPalette, global.screenColorIndex, false);
draw_surface(application_surface, 0, 0);
shader_reset();

//pause screen
if (global.paused)
{
	var _drawX = (global.viewW / 2);
	var _drawY = (global.viewH / 2);
	draw_sprite(sprPauseMenu, 0, _drawX, _drawY);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_color(c_black);
	draw_text((_drawX + 1), (_drawY + 1), "PAUSE");
	draw_set_color(c_white);
	draw_text_shaded(_drawX, _drawY, "PAUSE", global.uiColorIndex, sprFontPalette);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}