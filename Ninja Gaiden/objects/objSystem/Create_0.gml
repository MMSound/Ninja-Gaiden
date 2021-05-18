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
global.inputSelectPressed = false;

global.inputLeft = false;
global.inputRight = false;
global.inputUp = false;
global.inputDown = false;
global.inputJump = false;
global.inputAttack = false;
global.inputWeapon = false;
global.inputPause = false;
global.inputSelect = false;

global.keyLeft = vk_left;
global.keyRight = vk_right;
global.keyUp = vk_up;
global.keyDown = vk_down;
global.keyJump = ord("Z");
global.keyAttack = ord("X");
global.keyWeapon = ord("C");
global.keyPause = vk_enter;
global.keySelect = vk_shift;

global.gpLeft = gp_padl;
global.gpRight = gp_padr;
global.gpUp = gp_padu;
global.gpDown = gp_padd;
global.gpJump = gp_face1;
global.gpAttack = gp_face3;
global.gpWeapon = gp_face4;
global.gpPause = gp_start;
global.gpSelect = gp_select;
global.currentGamepad = 0;

global.upFireEnabled = true;

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
global.beatenGame = false;

global.levelArray[1][1] = rmAct1Scene1;
global.levelArray[1][2] = rmAct1Scene1;

global.levelArray[2][1] = rmAct2Scene1;
global.levelArray[2][2] = rmAct2Scene2;
global.levelArray[2][3] = rmAct2Scene2;

global.levelArray[3][1] = rmAct3Scene1;
global.levelArray[3][2] = rmAct3Scene2;
global.levelArray[3][3] = rmAct3Scene2;

global.levelArray[4][1] = rmAct4Scene1;
global.levelArray[4][2] = rmAct4Scene2;
global.levelArray[4][3] = rmAct4Scene3;
global.levelArray[4][4] = rmAct4Scene3;

global.levelArray[5][1] = rmAct5Scene1;
global.levelArray[5][2] = rmAct5Scene2;
global.levelArray[5][3] = rmAct5Scene3;
global.levelArray[5][4] = rmAct5Scene3;

global.levelArray[6][1] = rmAct6Scene1;
global.levelArray[6][2] = rmAct6Scene2;
global.levelArray[6][3] = rmAct6Scene3;
global.levelArray[6][4] = rmAct6Segue1;
global.levelArray[6][5] = rmAct6Segue1;

global.livesOption = false;

global.bossHealth = 16;
global.bossPhase = 0;

global.timeFrozen = false;
global.lifeLanternAppear = true;
global.transition = false;
global.displayUI = false;

global.isShader = shader_is_compiled(shdColorSwap);

global.deathRespawnTimer = 0;
global.deathRespawnTime = 200;
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
global.previousWeapon = 0;

global.checkpointX = 0;
global.checkpointY = 0;

global.frozen = false;

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
global.weaponNinpo[WEAPON_FLAMES] = 10;

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
global.gameFont = font_add_sprite_ext(sprFont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890.,!?{'/-[]ßȘȚÀĂÁÂÃÄÉÊĒËÈÍÎĪÏÌÓÔÕÖÒÚÛŪÜÙÑçÇțàăáâãäéêēëèíîīïìóôõöòúûūüùñБбВвГгДдЕеЁёЖжЗзИиЙйКкЛлМмНнОоПпРpСсТтУуФфХхЦцЧчШшЩщЪъЫыЬьЭэЮюЯяІіЛлМмJjЏџЋћЂђЉљЊњČčŠšŽž¿¡%ЄєРрАа^*<>ș", false, 0);
global.gameFontLarge = font_add_sprite_ext(sprFontLarge, "ABCDEFGHIJKLMNOPQRSTUVWXYZÉ", false, 0);
global.gameFontJapanese = font_add_sprite_ext(sprFontJapanese, "あいうえおかきくけこさしすせそたちつてとなにぬねのはむふへほまみむめもやゆよらりるれろわをんっやゆょアイウエニカキ千{ロサシス合ンタ支百テ世別夜気目ノハヒフ子明マミムメ七ヤ『』ラリル人チワぁソッャュョ}、。ー…!?「」父ァィエオ邪神像帰決闘何者光影時龍剣女家正体行手伝心配今死霊日鬼王大待古学忍名力針月年国呪考一地代X.CIA", false, 0);
global.screenRes = 3;
global.screenPalette = sprScreenPalette;
global.backgroundBrightness = 0;
surface_resize(application_surface, global.viewW, global.viewH);

//sound control
global.sfxVolume = 1.0;
global.musicVolume = 1.0;
global.soundtrackOption = 0; //0 for nes, 1 for pce
global.musicFadeVolume = 1.0;
global.queuedSong = noone;

initialize_music();

global.sfxSubtitles = false;
global.subtitle[sfxJump] = "[Jump]";
global.subtitle[sfxSwordSlash] = "[Sword Slash]";
global.subtitle[sfxPlayerHit] = "[Getting Hurt]";
global.subtitle[sfxMinorExplosion] = "[Explosion]";
global.subtitle[sfxPause] = "[Pause]";
global.subtitle[sfxItemAcquisition] = "[New Item]";
global.subtitle[sfxShuriken] = "[Shuriken]";
global.subtitle[sfxTickTock] = "[Clock Tick]";
global.subtitle[sfxTickTockShatter] = "[Shatter]";
global.subtitle[sfxWindmillShuriken] = "[Windmill Shuriken]";
global.subtitle[sfxSpinSlash] = "[Spin Slash]";
global.subtitle[sfxFlameWeapon] = "[Flames]";
global.subtitle[sfxFlameShieldCountdown] = "[Flame Shield Tick]";
global.subtitle[sfxLand] = "[Land]";
global.subtitle[sfxFallingPillar] = "[Pillar Falling]";
global.subtitle[sfxHo] = "Ryu: {Ho!{";
global.subtitle[sfxWindBlow] = "[Wind Blowing]";
global.subtitle[sfxLongSwordSlash] = "[Sword Slash]";
global.subtitle[sfxScoreCountdown] = "[Bloop]";
global.subtitle[sfxBossHit] = "[Boss Getting Hurt]";
global.subtitle[sfxBarbarianSlash] = "[Barbarian Slash]";
global.subtitle[sfxBomberheadThrow] = "[Sickle Throw]";
global.subtitle[sfxBomberheadSickleBounce] = "[Sickle Bounce]";
global.subtitle[sfxMalthSummon] = "[Lightning Strike]";
global.subtitle[sfxMalthZapSmall] = "[Small Zap]";
global.subtitle[sfxMalthZapLarge] = "[Large Zap]";
global.subtitle[sfxKelberossRoar] = "[Roar]";
global.subtitle[sfxJashinShrimp] = "[Fireball]";
global.subtitle[sfxIreneGun] = "[Gunshot]";
global.subtitle[sfxNinjaRun] = "[Running]";
global.subtitle[sfxParachuteOpen] = "[Parachute Open]";
global.subtitle[sfxHelicopter] = "[Helicopter]";
global.subtitle[sfxFloorOpen] = "[Floor Hole]";

//miscellaneous bullshit
global.pceParallax = false;
global.cutsceneLanguage = ENG;

if (file_exists("options.ngsav"))
{
	save_load_options(1);
}
else
{
	save_load_options(0);
}

if (global.screenRes != 6)
{
	window_set_size((global.viewW * global.screenRes), (global.viewH * global.screenRes));
}
else
{
	window_set_fullscreen(true);
}

if (room == rmInit)
{
	if (shader_is_compiled(shdColorSwap))
	{
		room_goto_next();
	}
	else
	{
		room = rmShaderWarning;
	}
}
depth = -1000;

setController = false;

//game genie stuff
global.gameGenieCode[0] = "00000000";
global.gameGenieCode[1] = "00000000";
global.gameGenieCode[2] = "00000000";

game_genie_load();

if (ggcode_get_active("SZETPGVG"))
{
	global.livesOption = false;
}
if (ggcode_get_active("AAUVLIZE"))
{
	global.currentLives = 9;
}
if (ggcode_get_active("IAUVLIZA"))
{
	global.currentLives = 6;
}
if (ggcode_get_active("AAUVLIZA"))
{
	global.currentLives = 1;
}
if (ggcode_get_active("AEXVVYIA"))
{
	global.weaponNinpo[WEAPON_WINDMILL_SHURIKEN] = 0;
}
if (ggcode_get_active("AAETUYIA"))
{
	global.weaponNinpo[WEAPON_FLAME_WHEEL] = 0;
}
if (ggcode_get_active("AAVTNYLA"))
{
	global.weaponNinpo[WEAPON_SHURIKEN] = 0;
}