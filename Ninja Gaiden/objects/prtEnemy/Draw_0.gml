/// @description Drawing

//apply shader for when time is frozen
if (global.timeFrozen)
{
	palette_shader_set(sprTimeFreezePalette, 1, false);
}

event_user(8);

if (global.timeFrozen)
{
	shader_reset();
}