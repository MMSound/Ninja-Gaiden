/// @description Custom drawing
switch (currentOption)
{
	case 0:	//music volume
		draw_text_shaded((global.viewX + (global.viewW / 2)), (global.viewY + 80), round(global.musicVolume * 10), global.uiColorIndex, sprFontPalette, global.gameFont);
		break;
	case 1:	//sound effect volume
		draw_text_shaded((global.viewX + (global.viewW / 2)), (global.viewY + 80), round(global.sfxVolume * 10), global.uiColorIndex, sprFontPalette, global.gameFont);
		break;
}