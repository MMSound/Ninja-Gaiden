/// @description Drawing
if (!(instance_exists(objJashinHead) && objJashinHead.phase > 0))
{
	event_inherited();
	draw_sprite(sprJashinBody, bodyFrame, x, y);
}