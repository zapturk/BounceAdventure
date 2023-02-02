/// @description Insert description here
// You can write your code in this editor

//Extends the Bat

audio_play_sound(snd_PowerUp, 1, false);

with(oBat){
	if(currentBattsize < 5){
		++currentBattsize;
		alarm[2] = 10 * room_speed;
	}
}

instance_destroy();