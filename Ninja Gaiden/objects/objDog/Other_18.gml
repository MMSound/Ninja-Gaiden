/// @description Drawing
var _is31 = room == rmAct3Scene1;
if (_is31)
{
	palette_shader_set(sprDogPalette, 1, false);
}
event_inherited();
if (_is31)
{
	palette_shader_reset();
}