/// @description Drawing
var _drawX = (global.viewW / 2);
draw_set_halign(fa_middle);

draw_set_font(global.gameFontLarge);
draw_set_color(c_black);
draw_text((_drawX + 1), (global.viewY + 17), "SOUND TEST");
draw_set_color(c_white);
draw_text(_drawX, (global.viewY + 16), "SOUND TEST");

draw_set_font(global.gameFont);
palette_shader_set(sprFontPalette, global.uiColorIndex, false);
draw_set_color(c_black);
draw_text((_drawX + 1), (global.viewY + 49), "^\n\n*");
draw_text((_drawX + 1), (global.viewY + 57), soundtrackName[soundtrackType]);
draw_text((_drawX + 1), (global.viewY + 81), string("< " + soundTest[currentSong][1] + " >"));
draw_set_color(c_white);
draw_text(_drawX, (global.viewY + 48), "^\n\n*");
draw_text(_drawX, (global.viewY + 56), soundtrackName[soundtrackType]);
draw_text(_drawX, (global.viewY + 80), string("< " + soundTest[currentSong][1] + " >"));

draw_sprite(sprSoundTestButton, global.musicPlaying, _drawX, (global.viewY + 96))

//progress bar
draw_sprite(sprSoundTestProgressBar, 0, (global.viewX + 160), (global.viewY + 136));
if (global.musicPlaying)
{
	var _trackProgressReal = (audio_sound_get_track_position(global.musicSound) / global.musicLength);
	var _trackProgress = (80 * _trackProgressReal);
	draw_sprite_ext(sprSoundTestProgressBarMiddle, 0, (global.viewX + 160), (global.viewY + 136), _trackProgress, 1.00, 0, c_white, 1.0);
}

draw_set_color(c_black);
draw_text((_drawX + 1), (global.viewY + 201), "PRESS ATTACK TO EXIT");
draw_set_color(c_white);
draw_text(_drawX, (global.viewY + 200), "PRESS ATTACK TO EXIT");

palette_shader_reset();
draw_set_halign(fa_left);