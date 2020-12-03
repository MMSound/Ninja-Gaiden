/// @description Variables
lifeTimer = 0;
lifeTime = 60;
myText = "";
drawY = (global.viewY + 224);

with (objSubtitle)
{
	if (id != other.id)
	{
		drawY -= 8;
	}
}