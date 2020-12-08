/// @description Custom drawing
switch (currentOption)
{
	case 0:	//music volume
		draw_text_shaded(200, 64, (global.musicVolume * 10), global.uiColorIndex, sprFontPalette, global.gameFont);
		break;
	case 1:	//sound effect volume
		draw_text_shaded(200, 64, (global.sfxVolume * 10), global.uiColorIndex, sprFontPalette, global.gameFont);
		break;
}