/// @description Switch sprite
switch (room)
{
	case rmAct1Scene1:
	case rmAct3Scene2:
		sprite_index = sprLanternAct1;
		imgSpd = (1 / 6);
		break;
	case rmAct2Scene1:
		sprite_index = sprLanternAct21;
		imgSpd = (1 / 6);
		break;
	case rmAct2Scene2:
		sprite_index = sprLanternAct22;
		imgSpd = (1 / 6);
		break;
	case rmAct3Scene1:
		sprite_index = sprLanternAct31;
		imgSpd = (1 / 6);
		break;
	case rmAct4Scene1:
		if (x < 2400)
		{
			sprite_index = sprLanternAct41;
		}
		else
		{
			sprite_index = sprLanternAct31;
		}
		imgSpd = (1 / 6);
		break;
	case rmAct4Scene2:
		sprite_index = sprLanternAct42;
		imgSpd = (1 / 6);
		break;
}