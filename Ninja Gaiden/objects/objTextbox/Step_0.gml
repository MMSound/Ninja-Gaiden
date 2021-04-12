/// @description Increase text
if (timer % textSpeed == 0 && textIndex < string_length(myText))
{
	textIndex++;
	str = string_copy(myText, 0, textIndex);
}
if (isClear)
{
	clearBoxX += 8;
	if (clearBoxX == 176)
	{
		instance_destroy(id);
	}
}
timer++;