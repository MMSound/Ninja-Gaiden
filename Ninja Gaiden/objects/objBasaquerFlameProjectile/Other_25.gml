/// @description Make waves
yspeed = 4;
if (coll_y(yspeed, objSolid))
{
	instance_destroy(id);
	make_wave((x - 4), -1.00);
	make_wave((x + 4), 1.00);
}