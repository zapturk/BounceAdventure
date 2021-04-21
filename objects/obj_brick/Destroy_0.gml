/// @description Insert description here
// You can write your code in this editor
//if(irandom(2) == 0){
//	instance_create_layer(x,y, "Instances", obj_powers);
//}

if(irandom_range(1,100) <= 10){
	powerUpLetter = choose("C", "N")
	
	switch(powerUpLetter){
		case "C":
			instance_create_layer(x,y, "Instances", obj_powerC);
			break;
		case "N":
			instance_create_layer(x,y, "Instances", obj_powerN);
			break;
		default:
			break;
	}
	
}

