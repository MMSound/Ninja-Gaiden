/// @description Shooting
if (instance_exists(objPlayer))
{
	image_xscale = sign(objPlayer.x - x);
}

if (timer == 150)
{
	var _bullet = instance_create_depth((x + (15 * image_xscale)), (y - 22), depth, objGenericBullet);
		_bullet.sprite_index = sprBazookaBullet;
		_bullet.xspeed = (3 * image_xscale);
		_bullet.image_xscale = image_xscale;
		_bullet.contactDamage = 1;
	image_index = 2;
	timer = 0;
}

//animation (done this way because game maker keeps making the image index a FUCKING DECIMAL for some reason)
if (in_range(timer, 0, 3))
{
	image_index = 2;
}
else if (in_range(timer, 4, 7))
{
	image_index = 1;
}
else
{
	image_index = 0;
}

timer++;