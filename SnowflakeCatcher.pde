
SnowFlake[] flakeHolder =  new SnowFlake[1000];
int flakeCount = 0;
void setup(){
	size(500,500);
	noStroke();
}

void draw(){
	background(0);
	if(flakeCount >= flakeHolder.length - 1){
		flakeCount = 0;
	}
	flakeHolder[flakeCount] = new SnowFlake();
	flakeCount++;

	for(int i = 0; i<flakeHolder.length; i++){
		if(flakeHolder[i] != null){
			ellipse(flakeHolder[i].x, flakeHolder[i].y, flakeHolder[i].flakeSize, flakeHolder[i].flakeSize);
			flakeHolder[i].move();
		}
	}
}


class SnowFlake{
	int x;
	int y;
	int speed;
	int flakeSize;
	SnowFlake(){
		x = (int) (Math.random()*500+1);
		y = -10;
		speed = 3;
		flakeSize = (int) (Math.random()*5+5);
	}
	void move(){
		y++;
	}
}


void drawWall(){

}
