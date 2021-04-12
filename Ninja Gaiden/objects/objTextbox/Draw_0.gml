/// @description Draw text
var _font = (global.cutsceneLanguage == JPN) ? global.gameFontJapanese : global.gameFont;
draw_set_font(_font);
draw_text_ext(x, y, str, 16, 256);

if (isClear)
{
	draw_rectangle_color(x, y, (x + clearBoxX), (y + 128), c_black, c_black, c_black, c_black, false);
}