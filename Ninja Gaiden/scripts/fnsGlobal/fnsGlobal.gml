//contains miscellaneous global scripts

/// @description update the controls
function update_controls()
{
	global.inputLeftPressed = keyboard_check_pressed(global.keyLeft);
	global.inputRightPressed = keyboard_check_pressed(global.keyRight);
	global.inputUpPressed = keyboard_check_pressed(global.keyUp);
	global.inputDownPressed = keyboard_check_pressed(global.keyDown);
	global.inputJumpPressed = keyboard_check_pressed(global.keyJump);
	global.inputAttackPressed = keyboard_check_pressed(global.keyAttack);
	global.inputWeaponPressed = keyboard_check_pressed(global.keyWeapon);
	global.inputPausePressed = keyboard_check_pressed(global.keyPause);

	global.inputLeft = keyboard_check(global.keyLeft);
	global.inputRight = keyboard_check(global.keyRight);
	global.inputUp = keyboard_check(global.keyUp);
	global.inputDown = keyboard_check(global.keyDown);
	global.inputJump = keyboard_check(global.keyJump);
	global.inputAttack = keyboard_check(global.keyAttack);
	global.inputWeapon = keyboard_check(global.keyWeapon);
	global.inputPause = keyboard_check(global.keyPause);
}

/// @description check if the game is in a state of pause
function game_paused()
{
	return global.paused;
}

/// @description checks if inside view
function inside_view()
{
	if (in_range(x, (global.viewX - 8), ((global.viewX + global.viewW) + 8)))
	{
		if (in_range(y, (global.viewY - 8), ((global.viewY + global.viewH) + 8)))
		{
			return true;
		}
	}
	return false;
}

/// @description updates the current act (i am lazy lmao)
function set_act(_act, _scene)
{
	global.currentAct = _act;
	global.currentScene = _scene;
}

/// @description transition to a room
function room_transition(_room)
{
	var _trans = instance_create_depth(x, y, -200, objRoomTransition);
	if (!is_undefined(_room))
	{
		_trans.roomTo = _room;
	}
}