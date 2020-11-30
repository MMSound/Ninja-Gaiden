/// @description Global variables

//controls
global.inputLeftPressed = false;
global.inputRightPressed = false;
global.inputUpPressed = false;
global.inputDownPressed = false;
global.inputJumpPressed = false;
global.inputAttackPressed = false;
global.inputWeaponPressed = false;
global.inputPausePressed = false;

global.inputLeft = false;
global.inputRight = false;
global.inputUp = false;
global.inputDown = false;
global.inputJump = false;
global.inputAttack = false;
global.inputWeapon = false;
global.inputPause = false;

global.keyLeft = vk_left;
global.keyRight = vk_right;
global.keyUp = vk_up;
global.keyDown = vk_down;
global.keyJump = ord("Z");
global.keyAttack = ord("X");
global.keyWeapon = ord("C");
global.keyPause = vk_enter;

//game control
global.paused = false;
global.gameTimer = 0;
global.levelTime = 0;
global.levelTimer = 0;
global.gameScore = 0;
global.currentLives = 2;
global.ninpo = 0;
global.currentAct = 1;
global.currentScene = 1;

global.timeFrozen = false;
global.lifeLanternAppear = true;
global.transition = false;

global.deathRespawnTimer = 0;
global.deathRespawnTime = 240;
global.deathRespawn = false;

global.viewX = 0;
global.viewY = 0;
global.viewW = 400;
global.viewH = 240;
global.cameraOffsetX = (global.viewW / 2);
global.cameraOffsetY = (global.viewH / 2);
global.cameraFocusObject = noone;

global.currentSection = noone;
global.sectionL = 0;
global.sectionR = 0;
global.sectionT = 0;
global.sectionB = 0;

//player control
global.canControl = true;
global.playerHealth = 16;
global.currentWeapon = 0;

//weapon table
global.weaponObject[0] = noone;
global.weaponObject[WEAPON_SHURIKEN] = objShuriken;
global.weaponObject[WEAPON_WINDMILL_SHURIKEN] = objWindmillShuriken;
global.weaponObject[WEAPON_FLAME_WHEEL] = objFlameWheel;
global.weaponObject[WEAPON_SPIN_SLASH] = objSpinSlash;
global.weaponObject[WEAPON_FLAMES] = objFlameShield;

global.weaponCooldown[0] = 0;
global.weaponCooldown[WEAPON_SHURIKEN] = 10;
global.weaponCooldown[WEAPON_WINDMILL_SHURIKEN] = 0;
global.weaponCooldown[WEAPON_FLAME_WHEEL] = 5;
global.weaponCooldown[WEAPON_SPIN_SLASH] = 0;
global.weaponCooldown[WEAPON_FLAMES] = 0;

global.weaponNinpo[0] = 0;
global.weaponNinpo[WEAPON_SHURIKEN] = 3;
global.weaponNinpo[WEAPON_WINDMILL_SHURIKEN] = 5;
global.weaponNinpo[WEAPON_FLAME_WHEEL] = 5;
global.weaponNinpo[WEAPON_SPIN_SLASH] = 5;
global.weaponNinpo[WEAPON_FLAMES] = 0;

global.weaponLimit[0] = 0;
global.weaponLimit[WEAPON_SHURIKEN] = 8;
global.weaponLimit[WEAPON_WINDMILL_SHURIKEN] = 1;
global.weaponLimit[WEAPON_FLAME_WHEEL] = 1;
global.weaponLimit[WEAPON_SPIN_SLASH] = 1;
global.weaponLimit[WEAPON_FLAMES] = 1;

//shaders and surfaces
init_palette_shader(shdColorSwap);
global.screenColorIndex = 0;
global.uiColorIndex = 4;
global.gameFont = font_add_sprite_ext(sprFont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890.,!?{'/-", false, 0);
global.screenRes = 3;
global.screenPalette = sprScreenPalette;
surface_resize(application_surface, global.viewW, global.viewH);
window_set_size((global.viewW * global.screenRes), (global.viewH * global.screenRes));

//sound control
global.sfxVolume = 1.0;

if (room == rmInit)
{
	room_goto_next();
}
depth = -1000;