/// @description Custom drawing
if (currentOption == 0)
{
	draw_text_shaded(200, 64, (6 - global.backgroundBrightness), global.uiColorIndex, sprFontPalette, global.gameFont);
}
else if (currentOption == 1)
{
	draw_text_shaded(200, 64, global.sfxSubtitles, global.uiColorIndex, sprFontPalette, global.gameFont);
}