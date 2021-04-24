/// @description Insert description here
// You can write your code in this editor
audio_play_sound(snd_PowerUp, 1, false);

with(obj_bat){
	if(currentBattsize > 1){
		image_xscale = (.25 * (currentBattsize - 1)) + .25;
		 
		--currentBattsize;
		alarm[currentBattsize] = 2 * room_speed;
	}
}

instance_destroy();