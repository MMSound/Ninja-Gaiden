//contains miscellaneous global scripts

/// @description update the controls
function update_controls()
{
	///workaround for not having a "pressed" equivalent for the axis
	var _inputLeft = global.inputLeft;
	var _inputRight = global.inputRight;
	var _inputUp = global.inputUp;
	var _inputDown = global.inputDown;
	
	global.inputLeft = (keyboard_check(global.keyLeft) || gamepad_button_check(global.currentGamepad, global.gpLeft) || (gamepad_axis_value(global.currentGamepad, gp_axislh) < 0));
	global.inputRight = (keyboard_check(global.keyRight) || gamepad_button_check(global.currentGamepad, global.gpRight) || (gamepad_axis_value(global.currentGamepad, gp_axislh) > 0));
	global.inputUp = (keyboard_check(global.keyUp) || gamepad_button_check(global.currentGamepad, global.gpUp) || (gamepad_axis_value(global.currentGamepad, gp_axislv) < 0));
	global.inputDown = (keyboard_check(global.keyDown) || gamepad_button_check(global.currentGamepad, global.gpDown) || (gamepad_axis_value(global.currentGamepad, gp_axislv) > 0));
	global.inputJump = (keyboard_check(global.keyJump) || gamepad_button_check(global.currentGamepad, global.gpJump));
	global.inputAttack = (keyboard_check(global.keyAttack) || gamepad_button_check(global.currentGamepad, global.gpAttack));
	global.inputWeapon = (keyboard_check(global.keyWeapon) || gamepad_button_check(global.currentGamepad, global.gpWeapon));
	global.inputPause = (keyboard_check(global.keyPause) || gamepad_button_check(global.currentGamepad, global.gpPause));
	global.inputSelect = (keyboard_check(global.keySelect) || gamepad_button_check(global.currentGamepad, global.gpSelect));
	
	global.inputLeftPressed = (!_inputLeft && global.inputLeft);
	global.inputRightPressed = (!_inputRight && global.inputRight);
	global.inputUpPressed = (!_inputUp && global.inputUp);
	global.inputDownPressed = (!_inputDown && global.inputDown);
	global.inputJumpPressed = (keyboard_check_pressed(global.keyJump) || gamepad_button_check_pressed(global.currentGamepad, global.gpJump));
	global.inputAttackPressed = (keyboard_check_pressed(global.keyAttack) || gamepad_button_check_pressed(global.currentGamepad, global.gpAttack));
	global.inputWeaponPressed = (keyboard_check_pressed(global.keyWeapon) || gamepad_button_check_pressed(global.currentGamepad, global.gpWeapon));
	global.inputPausePressed = (keyboard_check_pressed(global.keyPause) || gamepad_button_check_pressed(global.currentGamepad, global.gpPause));
	global.inputSelectPressed = (keyboard_check_pressed(global.keySelect) || gamepad_button_check_pressed(global.currentGamepad, global.gpSelect));
}

/// @description get a connected gamepad
function gamepad_get_connected()
{
	var _num = gamepad_get_device_count();
	
	for (var i = 0; i < _num; i++)
	{
		if (gamepad_is_connected(i))
		{
			return i;
		}
	}
	return -1;
}

/// @description check if the game is in a state of pause
function game_paused()
{
	return (global.paused || global.transition || global.frozen);
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
	if (_act != global.currentAct)
	{
		global.currentWeapon = 0;
		global.ninpo = 0;
	}
	
	//extra scene-specific stuff
	if (_scene != global.currentScene)
	{
		global.lifeLanternAppear = true;
	}
	
	//saving
	var _canSave = false;
	if (_scene < 4 && !(_act == 1 && _scene == 2) && !(_act == 2 && _scene == 3) && !(_act == 3 && _scene == 3) && !(_act == global.currentAct && _scene == global.currentScene))
	{
		_canSave = true;
	}
	
	global.currentAct = _act;
	global.currentScene = _scene;
	
	if (_canSave)
	{
		save_load_game(0);
	}
	
	global.displayUI = true;
}

/// @description transition to a room
function room_transition(_room, _time)
{
	if (is_undefined(_time))
	{
		_time = 2;
	}
	if (!instance_exists(objRoomTransition))
	{
		var _trans = instance_create_depth(x, y, -200, objRoomTransition);
		if (!is_undefined(_room))
		{
			_trans.roomTo = _room;
		}
		_trans.fadeTimer = _time;
	}
	else
	{
		exit;
	}
}

/// @description set the current weapon
function set_weapon(_weapon)
{
	global.previousWeapon = global.currentWeapon;
	global.currentWeapon = _weapon;
}

/// @description check if this is a level
function room_get_type()
{
	if (instance_exists(prtBoss))
	{
		return ROOM_BOSS;
	}	
	if (instance_exists(objPlayer))
	{
		return ROOM_LEVEL;
	}
	else if (instance_exists(objCutsceneController))
	{
		return ROOM_CUTSCENE;
	}
	else
	{
		return ROOM_MENU;
	}
}

/// @description change a tile layer visibility but with checking for its existance
function tile_layer_set_visible(_layerName, _visible)
{
	var _layerID = layer_get_id(_layerName);
	if (layer_exists(_layerID))
	{
		layer_set_visible(_layerID, _visible);
	}
}