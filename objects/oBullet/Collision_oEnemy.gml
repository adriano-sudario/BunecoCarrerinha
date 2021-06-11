if (other.is_dead || gun.owner.object_index == oEnemy)
	return;

hit(other, gun);
instance_destroy();