/// @description Drawing
switch (drawPhase)
{
	case 0: //logo moving up
	case 1: //logo flashing
		var _palette = (drawPhase ? sprLogoPalette : sprScreenPalette);
		palette_shader_set(_palette, logoColorIndex, false);
		draw_sprite_part(sprTitleScreen, 0, 0, 0, sprite_width, 120, 0, logoY);
		palette_shader_reset();
		break;
	case 2: //normal
		palette_shader_set(sprFontPalette, global.uiColorIndex, false);
		draw_self();
		draw_set_font(global.gameFont);
		draw_text(144, 208, "1989-2021");
		draw_sprite(sprAsInterpretedByMiniMacroSound, 0, 200, 104);
		switch (subPhase)
		{
			case 0: //press start
				draw_set_halign(fa_middle);
				if (drawText)
				{
					draw_text((global.viewX + 200), (global.viewY + 128), "PRESS START");
				}
				draw_set_halign(fa_left);
				break;
			case 1: //main
				for (var i = 0; i < array_length(optionsText); i++)
				{
					var _drawX = ((global.viewX + 200) - ((string_length(optionsText[i]) * 8) / 2));
					var _drawY = (((global.viewY + 120) + (i * 12)) - (2 * (i == currentOption)));
					draw_text_shaded(_drawX, _drawY, optionsText[i], global.uiColorIndex, sprFontPalette, global.gameFont);
					if (i == currentOption) //cursor
					{
						draw_sprite(sprMenuCursor, 0, (_drawX - 16), ((global.viewY + 120) + (i * 12)));
					}
				}
				break;
			case 2: //new game
				draw_set_halign(fa_middle);
				draw_text((global.viewX + 200), (global.viewY + 128), "This will overwrite\nany saved games.\nPress START to\ncontinue.");
				draw_set_halign(fa_left);
				break;
		}
		palette_shader_reset();
		break;
}