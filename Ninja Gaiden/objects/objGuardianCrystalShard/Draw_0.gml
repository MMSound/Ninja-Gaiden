/// @description Draw
if (drawBlink)
{
	exit;
}
palette_shader_set(sprGuardianCrystalPalette, color, false);
draw_self();
palette_shader_reset();