/// @description Custom left input
if (currentOption == 0)
{
	if (global.screenRes > 1)
	{
		global.screenRes--;
	}
	else
	{
		global.screenRes = 5;
	}
	play_sfx(sfxShuriken);
	window_set_size((global.viewW * global.screenRes), (global.viewH * global.screenRes));
}
else if (currentOption == 1)
{
	if (!global.isShader)
	{
		if (shader_is_compiled(shdColorSwap))
		{
			global.isShader = true;
		}
	}
	else
	{
		global.isShader = false;
	}
}