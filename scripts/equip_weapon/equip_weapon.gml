/// @function equip_weapon(owner, weapon)

function equip_weapon(_owner, _weapon){
	var weapon = instance_create_layer(_owner.x, _owner.y + 10, layer, _weapon);
	weapon.owner = _owner;
	
	var weapon_depth = noone;
	
	if (argument_count > 2) {
		weapon.depth = argument[2];
		weapon_depth = weapon.depth;
	}
		
	if (_owner.object_index == oPlayer) {
		if (_weapon.object_index == oGun && !instance_exists(oTarget))
			instance_create_layer(mouse_x, mouse_y, layer, oTarget);
		var item = array_find(global.game_state.weapons, function(i, w) {
			return i.weapon == w;
		}, _weapon);
		if (item == noone)
			array_push(global.game_state.weapons, {
				weapon: _weapon,
				depth: weapon_depth
			});
	}
		
	return weapon;
}