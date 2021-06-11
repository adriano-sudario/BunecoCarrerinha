gun = noone;
var equipped_gun = array_find(global.game_state.weapons, function(i, w) {
	return i.weapon == oGun;
});
if (equipped_gun == noone)
	level_target = EndingGood;
else
	level_target = EndingBad;
level_direction = 1;