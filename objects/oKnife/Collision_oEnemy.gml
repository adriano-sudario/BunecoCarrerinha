if (other.is_dead 
	|| has_hit 
	|| !visible 
	|| owner.object_index == oEnemy 
	|| owner == noone)
	return;

var dir = sign(knife_direction) < 0 ? 180 : 0;
hit(other, self, dir);
var impact = 3;
other.x += impact * (sign(owner.image_xscale) * -1);
has_hit = true;