/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_game);
gameover = false;

randomize();
global.partSystem = part_system_create();
part_system_depth(global.partSystem, -100);