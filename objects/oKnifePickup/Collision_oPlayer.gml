if (other.knife == noone || other.knife.object_index != oKnife)
	other.knife = equip_weapon(other, oKnife);

instance_destroy();

oGame.play_soundtrack(stkBodiadinho);