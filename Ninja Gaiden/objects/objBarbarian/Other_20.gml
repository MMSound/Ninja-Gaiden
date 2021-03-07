/// @description Collision
switch (phase)
{
	case 0: //walking back and forth
		if (coll_x(image_xscale, objSolid))
		{
			image_xscale *= -1;
		}
		break;
}