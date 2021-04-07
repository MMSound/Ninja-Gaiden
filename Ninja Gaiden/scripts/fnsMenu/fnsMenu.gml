//this contains functions for menu-related stuff

/// @description saves/loads options (0 to save, 1 to load)
function save_load_options(_mode, _fileToUse)
{
	if (is_undefined(_fileToUse))
	{
		_fileToUse = "options.ngsav";
	}
	
	switch (_mode)
	{
		case 0: //save
			var _file = file_text_open_write(_fileToUse);
			file_text_write_real(_file, global.keyUp);
			file_text_write_real(_file, global.keyDown);
			file_text_write_real(_file, global.keyLeft);
			file_text_write_real(_file, global.keyRight);
			file_text_write_real(_file, global.keyJump);
			file_text_write_real(_file, global.keyAttack);
			file_text_write_real(_file, global.keyWeapon);
			file_text_write_real(_file, global.keyPause);
			file_text_write_real(_file, global.keySelect);
			file_text_write_real(_file, global.musicVolume);
			file_text_write_real(_file, global.sfxVolume);
			file_text_write_real(_file, global.soundtrackOption);
			file_text_write_real(_file, global.screenRes);
			file_text_write_real(_file, global.backgroundBrightness);
			file_text_write_real(_file, global.sfxSubtitles);
			file_text_write_real(_file, global.pceParallax);
			file_text_write_real(_file, global.upFireEnabled);
			file_text_write_real(_file, global.cutsceneLanguage);
			file_text_write_real(_file, global.gpUp);
			file_text_write_real(_file, global.gpDown);
			file_text_write_real(_file, global.gpLeft);
			file_text_write_real(_file, global.gpRight);
			file_text_write_real(_file, global.gpJump);
			file_text_write_real(_file, global.gpAttack);
			file_text_write_real(_file, global.gpWeapon);
			file_text_write_real(_file, global.gpPause);
			file_text_write_real(_file, global.gpSelect);
			file_text_write_real(_file, global.livesOption);
			file_text_write_real(_file, global.isShader);
			file_text_close(_file);
			break;
		case 1: //load
			var _file = file_text_open_read(_fileToUse);
			global.keyUp = file_text_read_real(_file);
			global.keyDown = file_text_read_real(_file);
			global.keyLeft = file_text_read_real(_file);
			global.keyRight = file_text_read_real(_file);
			global.keyJump = file_text_read_real(_file);
			global.keyAttack = file_text_read_real(_file);
			global.keyWeapon = file_text_read_real(_file);
			global.keyPause = file_text_read_real(_file);
			global.keySelect = file_text_read_real(_file);
			global.musicVolume = file_text_read_real(_file);
			global.sfxVolume = file_text_read_real(_file);
			global.soundtrackOption = file_text_read_real(_file);
			global.screenRes = file_text_read_real(_file);
			global.backgroundBrightness = file_text_read_real(_file);
			global.sfxSubtitles = file_text_read_real(_file);
			global.pceParallax = file_text_read_real(_file);
			global.upFireEnabled = file_text_read_real(_file);
			global.cutsceneLanguage = file_text_read_real(_file);
			global.gpUp = file_text_read_real(_file);
			global.gpDown = file_text_read_real(_file);
			global.gpLeft = file_text_read_real(_file);
			global.gpRight = file_text_read_real(_file);
			global.gpJump = file_text_read_real(_file);
			global.gpAttack = file_text_read_real(_file);
			global.gpWeapon = file_text_read_real(_file);
			global.gpPause = file_text_read_real(_file);
			global.gpSelect = file_text_read_real(_file);
			global.livesOption = file_text_read_real(_file);
			global.isShader = file_text_read_real(_file);
			file_text_close(_file);
			break;
	}
}

/// @description saves/loads the game (0 to save, 1 to load)
function save_load_game(_mode, _fileToUse)
{
	if (is_undefined(_fileToUse))
	{
		_fileToUse = "game.ngsav";
	}
	
	switch (_mode)
	{
		case 0: //save
			var _file = file_text_open_write(_fileToUse);
			file_text_write_real(_file, global.currentAct);
			file_text_write_real(_file, global.currentScene);
			file_text_write_real(_file, global.gameScore);
			file_text_write_real(_file, global.currentWeapon);
			file_text_write_real(_file, global.ninpo);
			file_text_write_real(_file, global.currentLives);
			file_text_close(_file);
			break;
		case 1: //load
			var _file = file_text_open_read(_fileToUse);
			global.currentAct = file_text_read_real(_file);
			global.currentScene = file_text_read_real(_file);
			global.gameScore = file_text_read_real(_file);
			global.currentWeapon = file_text_read_real(_file);
			global.ninpo = file_text_read_real(_file);
			global.currentLives = file_text_read_real(_file);
			file_text_close(_file);
			break;
	}
}

/// @description checks if the key being pressed is illegal
function check_illegal_key(_key)
{
	var _illegal = false;
	switch (_key)
	{
		case vk_escape:
		case vk_f1:
		case vk_f2:
		case vk_f3:
		case vk_f4:
		case vk_f5:
		case vk_f6:
		case vk_f7:
		case vk_f8:
		case vk_f9:
		case vk_f10:
		case vk_f11:
		case vk_f12:
		case vk_control:
		case vk_alt:
		case vk_backspace:
		case vk_tab:
		case vk_printscreen:
		case vk_delete:
		case vk_end:
		case vk_home:
		case vk_insert:
		case vk_pageup:
		case vk_pagedown:
			_illegal = true;
			break;
		default:
			_illegal = false;
			break;
	}
	return _illegal;
}