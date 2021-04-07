/// @description Custom start input
switch (currentOption)
{
	case 0:
		room_transition(global.levelArray[global.currentAct][global.currentScene]);
		break;
	case 1:
		room_transition(rmTitleScreen);
		break;
}
global.currentLives = 2;