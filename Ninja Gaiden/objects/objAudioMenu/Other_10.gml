/// @description Custom drawing
var _drawY = (global.viewY + 120);
var _text = "";
switch (currentOption)
{
	case 0:	//music volume
		_text = (string(round(global.musicVolume * 100)) + "%");
		break;
	case 1:	//sound effect volume
		_text = (string(round(global.sfxVolume * 100)) + "%");
		break;
	case 2:	//soundtrack
		_text = (global.beatenGame ? (global.soundtrackOption ? "PC ENGINE" : "NES") : "BEAT GAME TO UNLOCK");
		break;
}
var _drawX = ((global.viewX + (global.viewW / 2)) - ((string_length(_text) * 8) / 2));		
draw_text_shaded(_drawX, _drawY, _text, global.uiColorIndex, sprFontPalette, global.gameFont);