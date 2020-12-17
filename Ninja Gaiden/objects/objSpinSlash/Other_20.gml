/// @description Stick to player
if (instance_exists(objPlayer))
{
	if (objPlayer.onGround || objPlayer.isWallClimb || objPlayer.isHang) //be destroyed when on ground
	{
		instance_destroy();
	}
	else
	{
		x = objPlayer.x;
		y = (objPlayer.y - 16);
	}
}