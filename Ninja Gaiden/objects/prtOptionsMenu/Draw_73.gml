/// @description Drawing text
if (!isDormant)
{
	for (var i = 0; i < array_length(optionsText); i++)
	{
		var _drawX = ((global.viewX + (global.viewW / 2)) - ((string_length(optionsText[i]) * 8) / 2));
		var _drawY = ((ystart + (i * optionSeparation)) - (2 * (i == currentOption)));
		draw_text_shaded(_drawX, _drawY, optionsText[i], global.uiColorIndex, sprFontPalette, global.gameFont);
		if (i == currentOption) //cursor
		{
			draw_sprite(sprMenuCursor, 0, (_drawX - 16), (ystart + (i * optionSeparation)));
		}
	}
}

event_user(0);