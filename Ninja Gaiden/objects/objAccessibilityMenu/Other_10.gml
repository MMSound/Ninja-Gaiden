/// @description Custom drawing
var _drawY = (global.viewY + 120);
var _text = "";
switch (currentOption)
{
	case 0: //background brightness
		_text = global.isShader ? (6 - global.backgroundBrightness) : "SHADERS MUST BE ENABLED";
		break;
	case 1: //sfx subtitles
		_text = global.sfxSubtitles ? "ON" : "OFF";
		break;
	case 2: //up fire
		_text = global.upFireEnabled ? "ON" : "OFF";
		break;
	case 3: //language
		var _langName = ["ENGLISH", "JAPANESE", "ESPAÑOL", "ITALIANO", "ROMÂNĂ", "РУСКИЙ", "СРПСКИ"];	
		_text = _langName[global.cutsceneLanguage];
		draw_sprite_wave(sprFlags, global.cutsceneLanguage, (global.viewX + ((global.viewW / 2) - 9)), (_drawY + 16), 0, 12, 1, wavePhase);
		break;
	case 4: //lives
		_text = global.livesOption ? "ON" : "OFF";
		break;
}
var _drawX = ((global.viewX + (global.viewW / 2)) - ((string_length(_text) * 8) / 2));
draw_text_shaded(_drawX, _drawY, _text, global.uiColorIndex, sprFontPalette, global.gameFont);