/// @description Custom right input
if (currentOption == 0)
{
	if (global.screenRes < 5)
	{
		global.screenRes++;
	}
	else
	{
		if (global.screenRes == 6)
		{
			global.screenRes = 1;
			window_set_fullscreen(false);
		}
		else
		{
			global.screenRes = 6;
			window_set_fullscreen(true);
		}
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