/// @description Insert description here
// You can write your code in this editor

//Debug test 1 power up
//instance_create_layer(x,y, "Instances", oPowerP);


// 10% chance of spawing something
if(irandom_range(1,4) <= 1){
	//powerUpLetter = choose("C", "D", "E", "M", "N", "P")
	
	//Debug 
	powerUpLetter = choose("N");

	switch(powerUpLetter){
		case "C":
			instance_create_layer(x,y, "Instances", oPowerC);
			break;
		case "D":
			instance_create_layer(x,y, "Instances", oPowerD);
			break;
		case "E":
			instance_create_layer(x,y, "Instances", oPowerE);
			break;
		case "M":
			instance_create_layer(x,y, "Instances", oPowerM);
			break;
		case "N":
			instance_create_layer(x,y, "Instances", oPowerN);
			break;
		case "P":
			instance_create_layer(x,y, "Instances", oPowerP);
			break;
		default:
			break;
	}
}

