/// @description Blinking
if (global.inputPausePressed)
{
	room_transition(rmAct2Scene1);
}

if (blinkTimer % 20 == 0)
{
	drawText = !drawText;
}

blinkTimer++;