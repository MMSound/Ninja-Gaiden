/// @description Custom drawing
switch (currentOption)
{
	case 0:
		draw_text_shaded((global.viewX + (global.viewW / 2)), 64, (6 - global.backgroundBrightness), global.uiColorIndex, sprFontPalette, global.gameFont);
		break;
	case 1:
		draw_text_shaded((global.viewX + (global.viewW / 2)), 64, optionsOnOff[global.sfxSubtitles], global.uiColorIndex, sprFontPalette, global.gameFont);
		break;
	case 2:
		draw_text_shaded((global.viewX + (global.viewW / 2)), 64, optionsOnOff[global.upFireEnabled], global.uiColorIndex, sprFontPalette, global.gameFont);
		break;
}