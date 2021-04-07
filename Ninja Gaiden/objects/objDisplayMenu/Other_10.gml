/// @description Custom drawing
if (currentOption == 0)
{
	draw_text_shaded((global.viewX + (global.viewW / 2)), (global.viewY + 80), global.screenRes, global.uiColorIndex, sprFontPalette, global.gameFont);
}
else if (currentOption == 1)
{
	var _text = global.isShader ? "ON" : "OFF";
	draw_text_shaded((global.viewX + (global.viewW / 2)), (global.viewY + 80), _text, global.uiColorIndex, sprFontPalette, global.gameFont);
}