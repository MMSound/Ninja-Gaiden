/// @description Drawing
var _index = (instance_number(objKelbeross) == 1) ? 2 : ((phase == 0) ? 1 : 0);
palette_shader_set(sprKelberossPalette, _index, false);
draw_self();
palette_shader_reset();