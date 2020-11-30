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
	return global.paused || global.transition;
}

/// @description checks if inside view
function inside_view(_offset)
{
	if (is_undefined(_offset))
	{
		_offset = 8;
	}
	
	if (in_range(x, (global.viewX - _offset), ((global.viewX + global.viewW) + _offset)))
	{
		if (in_range(y, (global.viewY - _offset), ((global.viewY + global.viewH) + _offset)))
		{
			return true;
		}
	}
	return false;
}

/// @description updates the current act
function set_act(_act, _scene)
{
	//extra act-specific stuff
	if (_act != global.currentAct && _scene != global.currentScene)
	{
		global.lifeLanternAppear = true;
	}
	
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