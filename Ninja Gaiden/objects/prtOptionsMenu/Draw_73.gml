/// @description Drawing text
if (!isDormant)
{
	for (var i = 0; i < array_length(optionsText); i++)
	{
		draw_text_shaded((x + 16), (ystart + (i * optionSeparation)), optionsText[i], global.uiColorIndex, sprFontPalette, global.gameFont);
		if (i == currentOption) //cursor
		{
			draw_sprite(sprMenuCursor, 0, x, (ystart + (i * optionSeparation)));
		}
	}
}

event_user(0);