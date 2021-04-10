/// @description Custom drawing
var _drawY = (global.viewY + 120);
var _text = "";
switch (currentOption)
{
	case 0: //resolution
		_text = global.screenRes;
		break;
	case 1: //shader
		_text = global.isShader ? "ON" : "OFF";
		break;
}
var _drawX = ((global.viewX + (global.viewW / 2)) - ((string_length(_text) * 8) / 2));
draw_text_shaded(_drawX, _drawY, _text, global.uiColorIndex, sprFontPalette, global.gameFont);