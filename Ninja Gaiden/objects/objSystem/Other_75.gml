/// @description Gamepad
global.currentGamepad = gamepad_get_connected();
gamepad_set_axis_deadzone(global.currentGamepad, 0.2);