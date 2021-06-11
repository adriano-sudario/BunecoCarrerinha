if (other.is_dead || gun.owner.object_index == oPlayer)
	return;

hit_player(gun);
instance_destroy();