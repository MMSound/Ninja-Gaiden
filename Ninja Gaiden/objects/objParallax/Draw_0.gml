/// @description Draw the background

//apply shader for when time is frozen
if (global.timeFrozen)
{
	palette_shader_set(sprTimeFreezePalette, 1, false);
}

draw_sprite_fill(sprite_index, image_index, (drawX + x), (drawY + y), x, y, areaRight, areaBottom);

if (global.timeFrozen)
{
	shader_reset();
}