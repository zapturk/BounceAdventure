/// @description Insert description here
// You can write your code in this editor

//Minimizes the Bat

audio_play_sound(snd_PowerUp, 1, false);

with(oBat){
	if(currentBattsize > 1){
		--currentBattsize;
		alarm[1] = 10 * room_speed;
	}
}

instance_destroy();