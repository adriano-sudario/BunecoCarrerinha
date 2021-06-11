switch (particle_type) {
	case PARTICLE_TYPE.DIRT:
		var brown = choose([53, 38, 37], [73, 50, 41], [94, 61, 45]);
		draw_with_fill_color_shader(brown[0], brown[1], brown[2]);
		break;
		
	case PARTICLE_TYPE.BLOOD:
		draw_with_fill_color_shader(209, 0, 0);
		break;
		
	case PARTICLE_TYPE.DUST:
	default:
		draw_self();
		break;
}