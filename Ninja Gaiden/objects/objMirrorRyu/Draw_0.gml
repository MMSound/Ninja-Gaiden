/// @description Draw Ryu
if (global.isShader)
{
	if (in_range(x, leftBound, rightBound))
	{
		palette_shader_set(sprRyuPalette, 1, false);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, -0.75, 0, c_white, 1.0);
		palette_shader_reset();
	}
}