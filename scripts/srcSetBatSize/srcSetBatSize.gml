// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function srcSetBatSize(batSize){
	if(oBat.image_index != batSize){
		if(oBat.image_index < batSize){
			oBat.image_speed = 1;
		}
		else if(oBat.image_index > batSize){
			oBat.image_speed = -1;
		}
	}
	else {
		oBat.image_speed = 0;
	}
}