/// @description Variables
lifeTimer = 0;
lifeTime = 60;
myText = "";
drawY = (global.viewY + 224);
drawYOffset = 0;

with (objSubtitle)
{
	if (id != other.id)
	{
		drawYOffset -= 8;
	}
}