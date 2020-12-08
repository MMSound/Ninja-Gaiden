/// @description Draw the background

//apply shader for when time is frozen
if (global.timeFrozen)
{
	palette_shader_set(sprTimeFreezePalette, 1, false);
}
else
{
	if (global.backgroundBrightness > 0) //background brightness option
	{
		palette_shader_set(sprScreenPalette, global.backgroundBrightness, false);
	}
}

draw_sprite_fill(sprite_index, image_index, (drawX + x), (drawY + y), x, y, areaRight, areaBottom);

if (global.timeFrozen || global.backgroundBrightness > 0)
{
	shader_reset();
}