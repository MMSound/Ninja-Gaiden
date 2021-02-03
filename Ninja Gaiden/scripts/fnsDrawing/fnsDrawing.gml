//this script contains miscellaneous scripts for drawing stuff

/// @description draws a font with a lot of stuff set
function draw_text_shaded(_x, _y, _string, _colorIndex, _palette, _font)
{
	//setup variables
	if (is_undefined(_palette))
	{
		_palette = sprFontPalette;
	}
	if (is_undefined(_font))
	{
		_font = global.gameFont;
	}
	
	draw_set_font(_font);
	palette_shader_set(_palette, _colorIndex, false);
	draw_text(_x, _y, _string);
	palette_shader_reset();
}

/// @description draws a repeated sprite image, tiled to fill a given region and with a given offset
//GMLscripts.com/license
//this script has been modified from "draw_sprite_tiled_area" the above website by MiniMacro Sound
function draw_sprite_fill(_sprite, _image, _offsetX, _offsetY, _x1, _y1, _x2, _y2) 
{
	var _spriteWidth, _spriteHeight, i, j, k, _left, _top, width, height, _x, _y;
	_spriteWidth = sprite_get_width(_sprite);
	_spriteHeight = sprite_get_height(_sprite);

	i = (_x1 - ((_x1 % _spriteWidth) - (_offsetX % _spriteWidth)) - (_spriteWidth * ((_x1 % _spriteWidth) < (_offsetX % _spriteWidth))));
	j = (_y1 - ((_y1 % _spriteHeight) - (_offsetY % _spriteHeight)) - (_spriteHeight * ((_y1 % _spriteHeight) < (_offsetY % _spriteHeight)))); 
	k = j;
 
	for (i = i; i <= _x2; i += _spriteWidth) 
	{
	    for (j = j; j <= _y2; j += _spriteHeight) 
		{
			//adjust the left bound
			if (i <= _x1)
			{
				_left = (_x1 - i);
			}
	        else
			{
				_left = 0;
			}
	        _x = (i + _left);
			//adjust the right bound
	        if (j <= _y1)
			{
				_top = (_y1 - j);
			}
	        else
			{
				_top = 0;
			}
	        _y = (j + _top);
	 		//adjust the width
	        if (_x2 <= (i + _spriteWidth))
			{
				width = (((_spriteWidth) - ((i + _spriteWidth) - _x2) + 1) - _left);
			}
	        else
			{
				width = (_spriteWidth - _left);
			}
	 		//adjust the height
	        if (_y2 <= (j + _spriteHeight))
			{
				height = (((_spriteHeight) - ((j + _spriteHeight) - _y2) + 1) - _top);
			}
	        else
			{
				height = (_spriteHeight - _top);
			}
	 		//finally actually draw something
	        draw_sprite_part(_sprite, _image, _left, _top, width, height, _x, _y);
	    }
	    j = k;
	}
}

/// @description create an animated effect
function particle_create(_x, _y, _sprite, _speed, _loop, _depth)
{
	var _id = instance_create_depth(_x, _y, _depth, objAnimatedEffect);
		_id.sprite_index = _sprite;
		_id.imgSpd = _speed;
		_id.loop = _loop;
}

/// @description create a score text marker
function score_text(_x, _y, _val, _time)
{
	var _text = instance_create_depth(_x, _y, (depth - 5), objScoreText);
		_text.myValue = _val;
	if (!is_undefined(_time))
	{
		_text.lifeTime = _time;
	}
}

/// @description sets a shader at a given layer
function tile_layer_set_shader(_layerName, _shader, _shaderScript)
{
	var _layerID = layer_get_id(_layerName);
	if (layer_exists(_layerID))
	{
		layer_shader(_layerID, _shader);
		if (!is_undefined(_shaderScript))
		{
			layer_script_begin(_layerID, _shaderScript);
		}
	}
}

/// @description sets a shader script at a given layer
function tile_layer_set_script(_layerName, _shaderScript)
{
	var _layerID = layer_get_id(_layerName);
	if (layer_exists(_layerID))
	{
		layer_script_begin(_layerID, _shaderScript);
	}
}

/// @description draw a sprite but wavy
//GMLscripts.com/license
//this script has been modified from "draw_sprite_wave" on the above website by MiniMacro Sound 
function draw_sprite_wave(_sprite, _image, _xPos, _yPos, _axis, _wavelength, _amplitude, _phase) 
{
	var _width, _height, _offsetX, _offsetY, _size, _shift, _sinX, _sinY;
	_width = sprite_get_width(_sprite);
	_height = sprite_get_height(_sprite);
	_offsetX = sprite_get_xoffset(_sprite);
	_offsetY = sprite_get_yoffset(_sprite);
	if (_axis)
	{
		_size = _height;
	}
	else
	{
		_size = _width;
	}

	for (var i = 0; i < _size; i++) 
	{
	    _shift = (_amplitude * sin(2 * pi * ((i / _wavelength) + _phase)));
	    if (_axis) 
		{
			_sinX = ((_shift - _offsetX) + _xPos);
			_sinY = ((i - _offsetY) + _yPos);
			draw_sprite_part(_sprite, _image, 0, i, _width, 1, _sinX, _sinY);
	    }
		else
		{
			_sinX = ((i - _offsetX) + _xPos);
			_sinY = ((_shift - _offsetY) + _yPos);
			draw_sprite_part(_sprite, _image, i, 0, 1, _height, _sinX, _sinY);
	    }
	}
	//idk how any of this shit works lmao
}