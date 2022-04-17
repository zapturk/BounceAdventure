/// @description Insert description here
// You can write your code in this editor
audio_play_sound(snd_PowerUp, 1, false);
//instance_create_layer(other.x, other.y - 16, "Instances", oBall);

var i;
var currentBallCount = global.ball_count;

for(i = 0; i < currentBallCount; i += 1){
	if(global.ball_count < global.clone_ball_limit){
		var newBall = instance_create_layer(
			instance_find(oBall, i).x, 
			instance_find(oBall, i).y,
			"Instances", 
			oBall);
		
		newBall.go = true;
		if(instance_find(oBall, i).go)
		{
			newBall.direction = instance_find(oBall, i).direction + irandom_range(-10, 10);
			newBall.speed = instance_find(oBall, i).speed;
		}
		else{
			newBall.direction = random_range(45, 135);
			newBall.speed = 3;
		}
	}
}

instance_destroy();