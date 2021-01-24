/// @description Drawing

//apply shader for when time is frozen
if (global.timeFrozen)
{
	palette_shader_set(sprTimeFreezePalette, 1, false);
	image_speed = 0;
}

event_user(8);

if (global.timeFrozen)
{
	palette_shader_reset();
}