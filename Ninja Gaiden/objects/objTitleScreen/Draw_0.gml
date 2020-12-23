/// @description Drawing
switch (drawPhase)
{
	case 0: //logo moving up
		palette_shader_set(sprScreenPalette, logoColorIndex, false);
		draw_sprite_part(sprTitleScreen, 0, 0, 0, sprite_width, 120, 0, logoY);
		shader_reset();
		break;
	case 1: //normal
		palette_shader_set(sprFontPalette, global.uiColorIndex, false);
		draw_self();
		draw_set_font(global.gameFont);
		draw_text(144, 208, "1989-2020");
		draw_text(120, 224, "2020 MINIMACRO SOUND");
		draw_text(0, 232, "DEMO ACT 4-2");
		if (drawText)
		{
			draw_text(156, 128, "PRESS START");
		}
		draw_text(8, 144, "CTRL-SELECT FOR LEVEL SELECT, SELECT FOR OPTIONS");
		if (isLevelSelect)
		{
			draw_text(32, 160, string("LEVEL: " + string(selectedLevel) + " [LEFT AND RIGHT TO CHANGE]"));
		}
		shader_reset();
		break;
}