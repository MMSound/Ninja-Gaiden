/// @description Drawing
palette_shader_set(sprFontPalette, global.uiColorIndex, false);
draw_self();
draw_set_font(global.gameFont);
draw_text(144, 208, "1989-2020");
draw_text(120, 224, "2020 MINIMACRO SOUND");
draw_text(0, 232, "DEMO ACT 3-1");
if (drawText)
{
	draw_text(156, 128, "PRESS START");
}
draw_text(8, 144, "CTRL-SELECT FOR LEVEL SELECT, SELECT FOR OPTIONS");
if (isLevelSelect)
{
	draw_text(32, 160, string("LEVEL: " + string(selectedLevel) + " [LEFT AND RIGHT TO CHANGE]"));
}
shader_reset();