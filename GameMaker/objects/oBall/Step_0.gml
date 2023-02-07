/// @description Insert description here
// You can write your code in this editor
if(!go){
	x = oBat.x;
	image_speed = 0;
}
else{
	part_particles_create(global.partSystem, x, y, global.ptBasic, 1);	
}

if(!addToBallCount){
	if(global.ball_count <= 0){
		global.ball_count = 1;
	}
	else{
		global.ball_count += 1;
	}
	addToBallCount = true;
}

if(isPhantom){
	image_alpha = .5;
}
else{
	image_alpha = 1;	
}
