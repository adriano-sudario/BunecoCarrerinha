var is_on_range = point_in_circle(player.x, player.y, x, y, collision_radius);
text_object.is_backwards = !is_on_range;