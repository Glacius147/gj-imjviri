/// @description Insert description here
// You can write your code in this editor

if obj_menu.mode == MENU_MODE.SELECT_SAVE or  obj_menu.mode == MENU_MODE.SELECT_LOAD or  obj_menu.mode == MENU_MODE.SELECT_SAVENLAUNCH or obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT
{
for (var i = 0; i < 3; ++i) {
    for (var j = 0 ; j < 2; ++j){
		if !file_exists("svg_slot"+string(i+3*j)+".json")	
		{
			draw_set_font(font_hub)
			draw_set_color(c_red)
			draw_text(128+256*i,200+360*j,"VIDE")
		}
	}
}
}