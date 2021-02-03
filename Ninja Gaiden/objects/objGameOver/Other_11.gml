/// @description Custom start input
switch (currentOption)
{
	case 0:
		room_transition(roomTo[global.currentAct][global.currentScene]);
		break;
	case 1:
		room_transition(rmTitleScreen);
		break;
}
global.currentLives = 2;