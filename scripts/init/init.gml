gml_pragma("global", "init()");

#region Partical Types

// Basic Partical
var _p = part_type_create();

part_type_shape(_p, pt_shape_flare);
part_type_life(_p, 15, 20);
part_type_alpha3(_p, 0, 1, 0);
part_type_color2(_p, c_blue, c_white);
part_type_size(_p, .1, .3, 0, .1);

global.ptBasic = _p;

#endregion