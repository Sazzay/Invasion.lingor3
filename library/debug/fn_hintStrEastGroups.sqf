[[]] params ["_array"];

{
	if (side _x == east) then {
		_array pushBack _x;
	};
} forEach allGroups;

hint str _array;