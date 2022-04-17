/// @description Insert description here
// You can write your code in this editor

//Kills bat aka lose a life

audio_play_sound(snd_PowerUp, 1, false);

global.player_lives -= 1;
	
if(global.player_lives <= 0){	
	var i;
	var currentBallCount = global.ball_count;

	for(i = 0; i < currentBallCount; i += 1){
		instance_destroy(instance_find(oBall, i));
	}
	
	oControl.gameover = true;
	if(global.player_score > global.high_score){
		global.high_score = global.player_score;
	}
}

instance_destroy();