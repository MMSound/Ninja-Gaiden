/// @description Variables
event_inherited();

currentControl = 0;

controlName[0] = "UP";
controlName[1] = "DOWN";
controlName[2] = "LEFT";
controlName[3] = "RIGHT";
controlName[4] = "JUMP";
controlName[5] = "SLASH";
controlName[6] = "WEAPON";
controlName[7] = "START";
controlName[8] = "SELECT";
controlName[9] = "";

controlVar[0] = "gpUp";
controlVar[1] = "gpDown";
controlVar[2] = "gpLeft";
controlVar[3] = "gpRight";
controlVar[4] = "gpJump";
controlVar[5] = "gpAttack";
controlVar[6] = "gpWeapon";
controlVar[7] = "gpPause";
controlVar[8] = "gpSelect";

function gamepad_pressed() //thanks bucket
{
	for (var i = gp_face1; i <= gp_axisrv; i++)
	{
		if (gamepad_button_check_pressed(global.currentGamepad, i)) //check if the button is being pressed
		{
			return i;
		}
	}
	return 0;
}