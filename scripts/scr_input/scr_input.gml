/// @desc scr_input()
// Récupére les input et les place dans les variables de l objet
k_left = keyboard_check(vk_left) || (gamepad_axis_value(0,gp_axislh) < -0.3);
k_right = keyboard_check(vk_right) || (gamepad_axis_value(0,gp_axislh) > 0.3);  ;
k_up = keyboard_check(vk_up) || (gamepad_axis_value(0,gp_axislv) < -0.3);
k_down = keyboard_check(vk_down) || (gamepad_axis_value(0,gp_axislv) > 0.3);
k_sword = keyboard_check_pressed(ord("B")) || gamepad_button_check(0,gp_face1);
k_objet = keyboard_check_pressed(ord("N")) || gamepad_button_check(0,gp_face2);

