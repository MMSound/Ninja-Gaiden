/// @description Drawing
if (!(instance_exists(objJashinHead) && objJashinHead.phase > 0))
{
	event_inherited();
	draw_sprite_ext(sprJashinBody, bodyFrame, x, y, image_xscale, image_yscale, 0, c_white, 1.0);
}