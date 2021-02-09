/// @description Custom drawing
switch (currentOption)
{
	case 0:
		draw_text_shaded((global.viewX + (global.viewW / 2)), (global.viewY + 80), (6 - global.backgroundBrightness), global.uiColorIndex, sprFontPalette, global.gameFont);
		break;
	case 1:
		draw_text_shaded((global.viewX + (global.viewW / 2)), (global.viewY + 80), optionsOnOff[global.sfxSubtitles], global.uiColorIndex, sprFontPalette, global.gameFont);
		break;
	case 2:
		draw_text_shaded((global.viewX + (global.viewW / 2)), (global.viewY + 80), optionsOnOff[global.upFireEnabled], global.uiColorIndex, sprFontPalette, global.gameFont);
		break;
	case 3:
		var _font;
		switch (global.cutsceneLanguage)
		{
			default:
				_font = global.gameFont;
				break;
			case RUS:
			case SRB:
				_font = global.gameFontCyrillic;
				break;
		}
		
		var _langName = ["ENGLISH", "JAPANESE", "ESPAÑOL", "ITALIANO", "ROMÂNĂ", "РУСКИЙ", "СРПСКИ"];
		
		draw_text_shaded((global.viewX + (global.viewW / 2)), (global.viewY + 80), _langName[global.cutsceneLanguage], global.uiColorIndex, sprFontPalette, _font);
		draw_sprite_wave(sprFlags, global.cutsceneLanguage, (global.viewX + (global.viewW / 2)), (global.viewY + 96), 0, 12, 1, wavePhase);
		break;
}