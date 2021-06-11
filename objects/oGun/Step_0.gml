if (image_angle > 90 && image_angle <= 270)
	image_yscale = -1;
else
	image_yscale = 1;
	
firing_delay = max(-1, firing_delay - 1);
recoil = max(0, recoil -1);

x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);