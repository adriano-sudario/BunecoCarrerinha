if (other.gun == noone || other.gun.object_index != oGun) {
	other.gun = equip_weapon(other, oGun, -1);
	if (other.controls.is_using_gamepad && other.image_xscale < 0) {
		other.controls.aiming_angle = 180;
		other.gun.image_angle = 180;
	}
}

instance_destroy();

oGame.play_soundtrack(stkBodiadinho);