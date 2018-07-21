/// @desc affiche une zone de menu
/// @arg sprite
/// @arg array
/// @arg to replace
/// @arg replacement


var _array = argument[0];
var _old = argument[1];
var _new = argument[2];

var i
for (i = 0; i<array_length_1d(_array);i++)
{
	if array[i] == _old
	{
		array[i] = _new;
		break;
	}
}


return _array