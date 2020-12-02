//this script contains various functions for math

/// @description adds zeroes to a string
function string_zeros(_string, _length) 
{
	if !is_string(_string) 
	{
		_string = string(_string);
	}

	//add zeroes to start
	for (var i = string_length(_string); i < _length; i++) 
	{
		_string = ("0" + _string);
	}
	return _string;
}

/// @description check if a number is in a range
function in_range(_num, _min, _max)
{
	return ((_num > _min) && (_num < _max));
}

/// @description rounds a number to the nearest multiple of x
function round_to_nearest(_num, _mult)
{
	if (_mult == 0)
	{
	    return _num;
	}
	return round(_num / _mult) * _mult;
}