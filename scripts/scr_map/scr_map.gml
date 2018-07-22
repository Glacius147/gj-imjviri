
//contour map

	
	draw_set_color(c_navy);
	draw_rectangle(x_b + 50, y_b -110, x_b + 230, y_b -10, false);
	
	draw_set_color(c_black);

with obj_mur_salle if vu 
{
	x1_t = other.x_b + 68 + room_origine_x * 9;
	x2_t = other.x_b + 68 + room_origine_x * 9 + 7;
	y1_t = other.y_b -100 + room_origine_y * 5 ;
	y2_t = other.y_b -100 + room_origine_y * 5 +3;
	
	draw_rectangle(x1_t , y1_t , x2_t , y2_t , false);
}
