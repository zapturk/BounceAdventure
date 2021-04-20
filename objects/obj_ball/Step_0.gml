/// @description Insert description here
// You can write your code in this editor
if(!go){
	x = obj_bat.x;	
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