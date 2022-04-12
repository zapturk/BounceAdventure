/// @description Insert description here
// You can write your code in this editor
if(!go){
	
	direction = random_range(45, 135);
	speed = spd;
	if(speed < 90){
		image_speed = 1;
	}
	else{
		image_speed = -1;	
	}
	
	go = true;
	audio_play_sound(snd_Click, 1, false);
}