/// @description Drawing
var _phase = phaseMod ? (1.0 - wavePhase) : wavePhase;
draw_sprite_wave(sprite_index, image_index, x, y, 1, waveLength, amplitude,	_phase);