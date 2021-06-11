/// @function controller(_start_with_default)

function controller() {
	if (variable_global_exists("controls")) {
		if (argument_count > 0 && argument[0]) {
			global.controls.is_disabled = false;
			global.controls.aiming_angle = 0;
		}
		return global.controls;
	}
	
	global.controls = {
		is_disabled: false,
		aiming_angle: 0,
		is_using_gamepad: false,
		is_left_held: function() {
			if (gamepad_axis_value(0, gp_axislh) < -.5) {
				is_using_gamepad = true;
				return true;
			} else {
				var result = keyboard_check(vk_left) || keyboard_check(ord("A"));
				if (result)
					is_using_gamepad = false;
				return result;
			}
		},
		is_right_held: function() {
			if (gamepad_axis_value(0, gp_axislh) > .5) {
				is_using_gamepad = true;
				return true;
			} else {
				var result = keyboard_check(vk_right) || keyboard_check(ord("D"));
				if (result)
					is_using_gamepad = false;
				return result;
			}
		},
		is_down_held: function() {
			if (gamepad_axis_value(0, gp_axislv) < -.5) {
				is_using_gamepad = true;
				return true;
			} else {
				var result = keyboard_check(vk_up) || keyboard_check(ord("W"));
				if (result)
					is_using_gamepad = false;
				return result;
			}
		},
		is_up_held: function() {
			if (gamepad_axis_value(0, gp_axislv) > .5) {
				is_using_gamepad = true;
				return true;
			} else {
				var result = keyboard_check(vk_down) || keyboard_check(ord("S"));
				if (result)
					is_using_gamepad = false;
				return result;
			}
		},
		is_jump_held: function() {
			if (gamepad_button_check(0, gp_face1)) {
				is_using_gamepad = true;
				return true;
			} else {
				var result = keyboard_check(vk_space);
				if (result)
					is_using_gamepad = false;
				return result;
			}
		},
		is_shoot_held: function() {
			if (gamepad_button_check(0, gp_shoulderr)) {
				is_using_gamepad = true;
				return true;
			} else {
				var result = mouse_check_button(mb_left);
				if (result)
					is_using_gamepad = false;
				return result;
			}
		},
		is_stab_pressed: function() {
			if (gamepad_button_check_pressed(0, gp_face3)) {
				is_using_gamepad = true;
				return true;
			} else {
				var result = mouse_check_button_pressed(mb_right);
				if (result)
					is_using_gamepad = false;
				return result;
			}
		},
		update_aiming_angle: function(_x, _y) {
			if (is_using_gamepad) {
				var horizontal_axis = gamepad_axis_value(0, gp_axisrh);
				var vertical_axis = gamepad_axis_value(0, gp_axisrv);
			
				if (abs(horizontal_axis) > .5 || abs(vertical_axis) > .5)
					aiming_angle = point_direction(0, 0, horizontal_axis, vertical_axis);
			} else {
				aiming_angle = point_direction(_x, _y, mouse_x, mouse_y);
			}
		},
		is_select_pressed: function() {
			if (gamepad_button_check_pressed(0, gp_face1)) {
				is_using_gamepad = true;
				return true;
			} else {
				var result = keyboard_check_pressed(vk_space) || 
					keyboard_check_pressed(vk_enter);
				if (result)
					is_using_gamepad = false;
				return result;
			}
		},
	};
	
	return global.controls;
}