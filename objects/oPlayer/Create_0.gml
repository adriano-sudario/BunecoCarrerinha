#macro JUMP_FORCE -7

horizontal_force = 0;
vertical_force = 0;
grv = .3;
walk_speed = 4;
hp = 1;
flash_frames = 0;
horizontal_direction = 0;
is_dead = false;
has_fallen = false;
is_jump_held = false;
has_jump = false;
is_stabbing = false;
controls = controller(true);
knife = noone;
var equipped_knife = array_find(global.game_state.weapons, function(i, w) {
	return i.weapon == oKnife;
});
if (equipped_knife != noone)
	knife = equip_weapon(self, equipped_knife.weapon, equipped_knife.depth);

gun = noone;
var equipped_gun = array_find(global.game_state.weapons, function(i, w) {
	return i.weapon == oGun;
});
if (equipped_gun != noone)
	gun = equip_weapon(self, equipped_gun.weapon, equipped_gun.depth);
	
function update_movement() {
	if (!is_dead) {
		if (!controls.is_disabled)
			horizontal_direction = controls.is_right_held() - controls.is_left_held();
		horizontal_force = horizontal_direction * walk_speed;
	}

	var was_on_floor = is_on_floor;
	is_on_floor = place_meeting(x, y + 1, oWall);
	var is_holding_jump = controls.is_jump_held();
	var has_released_jump = is_jump_held && !is_holding_jump;
	is_jump_held = is_holding_jump;

	if (!has_jump && was_on_floor && !is_on_floor)
		alarm[1] = 5;

	if (is_on_floor && !is_dead) {
		if (!controls.is_disabled && is_holding_jump && !has_jump) {
			vertical_force = JUMP_FORCE;
			has_jump = true;
		} else {
			if (has_jump && has_released_jump)
				has_jump = false;
			vertical_force = 0;
		}
	} else {
		vertical_force += grv;
		if (has_jump && has_released_jump) {
			var minimal_jump_force = -1.5;
			if (vertical_force < minimal_jump_force)
				vertical_force = minimal_jump_force;
			has_jump = false;
		}
	}
}

function update_knife() {
	if (knife == noone || controls.is_disabled)
		return;
	
	if (controls.is_stab_pressed())
		knife.stab();
}

function update_gun() {
	if (gun == noone)
		return;
	
	if (controls.is_disabled) {
		gun.image_angle = sign(horizontal_direction) > 0 ? 0 : 180;
		return;
	}
	
	controls.update_aiming_angle(x, y);
	gun.image_angle = controls.aiming_angle;
	
	if (controls.is_shoot_held() && !is_stabbing)
		gun.shoot();
}