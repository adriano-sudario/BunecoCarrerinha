if (has_fallen)
	return;

if (!is_dead && gun != noone && instance_exists(oPlayer) && !oPlayer.is_dead) {
	if (point_distance(oPlayer.x, oPlayer.y, x, y) < aiming_radius) {
		gun.image_angle = point_direction(x, y, oPlayer.x, oPlayer.y);
		shooting_countdown++;
		if (shooting_countdown >= shooting_delay) {
			shooting_countdown = 0;
			if (!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, false))
				gun.shoot();
		}
	} else {
		gun.image_angle = sign(image_xscale) > 0 ? 0 : 180;
	}
}

is_on_floor = place_meeting(x, y + 1, oWall);

if (!is_dead) {
	horizontal_force = horizontal_direction * walk_speed;
	if (!should_fall && is_on_floor &&
		!place_meeting(x + horizontal_force, y + 1, oWall)) {
		horizontal_direction = -horizontal_direction;
		horizontal_force = -horizontal_force;
	}
}

if (is_on_floor && !is_dead && vertical_force >= 0) {
	vertical_force = 0;
} else {
	vertical_force += grv * mass;
}

var wall = instance_place(x + horizontal_force, y, oWall);
var levelChange = instance_place(x + horizontal_force, y, oLevelChange);
if (wall != noone || levelChange != noone) {
	var collided = wall == noone ? levelChange : wall;
	
	if (horizontal_direction < 0)
		x = collided.bbox_right + (x - bbox_left) + 1;
	else if (horizontal_direction > 0)
		x = collided.bbox_left - (bbox_right - x) - 1;
	
	horizontal_force = 0;
	
	if (!is_dead && is_on_floor)
		horizontal_direction = -horizontal_direction;
}

wall = instance_place(x, y + vertical_force, oWall);
	
if (wall != noone) {
	var vertical_direction = sign(vertical_force);
	if (vertical_direction < 0)
		y = wall.bbox_bottom - (bbox_top - y) + 1;
	else if (vertical_direction > 0)
		y = wall.bbox_top + (y - bbox_bottom) - 1;
	
	vertical_force = 0;
	is_on_floor = true;
}

x += horizontal_force;
y += vertical_force;

if (is_dead && is_on_floor)
	has_fallen = true;

if (is_dead) {
	sprite_index = sEnemyD;
	image_speed = 0;
	image_index = has_fallen ? 1 : 0;
} else if (!is_on_floor) {
	sprite_index = sEnemyA;
	image_speed = 0;
	image_index = vertical_force > 0 ? 1 : 0;
} else {
	image_speed = 1;
	
	if (horizontal_direction != 0)
		sprite_index = sEnemyR;
	else
		sprite_index = sEnemy;
}

if (horizontal_direction != 0)
	image_xscale = horizontal_direction * size;
image_yscale = size;