/// @description draw minimap
// You can write your code in this editor

if obj_menu.mode == MENU_MODE.CONSTRUCTION
{
c_x = camera_get_view_x(view_camera[0])
c_y = camera_get_view_y(view_camera[0])

var current_room_x = floor(c_x/256)
var current_room_y = floor(c_y/176)


//draw minimap
var offset_x = 15*3
var offset_y = 6*3
var i;
var j;
for (i = 0; i < 16; i += 1)
	{
		for (j = 0; j < 16; j += 1)
		{
			
			x1 = 3*4*i + offset_x
			y1 = 3*3*j + offset_y
			if i == current_room_x and j == current_room_y
			{
				draw_set_color(c_red);
				draw_rectangle(x1, y1, x1+12, y1+9, false);
			}
			else if created_room[i,j] 
			{
				draw_set_color(c_yellow);
				draw_rectangle(x1, y1, x1+12, y1+9, false);
			}
			
			draw_set_color(c_black);
			draw_rectangle(x1, y1, x1+12, y1+9, true);
		}
	}
} else if obj_menu.mode == MENU_MODE.PAUSE
{
	x1 = floor(768/2*(1-percent_error)+50*percent_error)
	y1 = floor(720/2*(1-percent_error)+50*percent_error)
	x2 = ceil(768/2*(1-percent_error)+718*percent_error)
	y2 = ceil(720/2*(1-percent_error)+670*percent_error)
	
	draw_set_color(c_maroon);
	draw_rectangle(x1, y1, x2, y2, false);
	scr_9box(spr_9box_red,x1,y1,x2,y2)
	if percent_error == 1{
		
		draw_set_color(c_black);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(font_hub);
		draw_text(768/2,360,error_message)	
	}
	
	
}
