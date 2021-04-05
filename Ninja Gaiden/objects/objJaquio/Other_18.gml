/// @description Drawing
switch (phase)
{
	case 0:
		event_inherited();
		if (drawFire && global.bossPhase != 2)
		{
			draw_sprite_ext(sprBasaquerFlameDown, 0, (x - 27), (y - 30), 1.00, 1.00, 0, c_white, (phaseTimer % 2 == 0));
			draw_sprite_ext(sprBasaquerFlameDown, 0, (x + 27), (y - 30), 1.00, 1.00, 0, c_white, (phaseTimer % 2 == 0));
		}
		break;
	case 1:
		event_inherited();
		break;
	case 2:
		draw_sprite_wave(sprite_index, image_index, x, y, (phaseTimer % 2 == 0), waveLength, amplitude, wavePhase);
		break;
}