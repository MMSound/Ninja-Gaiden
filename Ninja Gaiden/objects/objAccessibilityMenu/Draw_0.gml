/// @description Draw nothing
if (room == rmOptionsMenu)
{
	if (currentOption == 0)
	{
		if (global.isShader)
		{
			if (instance_exists(objOptionsRyu))
			{
				var _drawX = objOptionsRyu.x;
				var _drawY = objOptionsRyu.y;
				var _frame = objOptionsRyu.image_index;
				
				palette_shader_set(sprScreenPalette, global.backgroundBrightness, false);
				draw_sprite_wave(sprBGBrightness, 0, _drawX, _drawY, 1, 16, 1, wavePhase);
				palette_shader_reset();
				draw_sprite(sprRyuRun, _frame, _drawX, _drawY);
			}
		}
	}
}