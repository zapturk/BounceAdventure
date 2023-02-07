/// @description Insert description here
// You can write your code in this editor

// Creates a new ball on the bat

audio_play_sound(snd_PowerUp, 1, false);
instance_create_layer(oBat.x, oBat.y - 8, "Instances", oBall);

instance_destroy();