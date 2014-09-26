SnowFlake[] flakeHolder =  new SnowFlake[500];
int flakeCount = 0;
void setup(){
	size(500,500);
	noStroke();
	fill(0);
	rect(-100, -100, 1000, 1000);
	frameRate(60);
}

void draw(){
	//background(0);
	if(flakeCount >= flakeHolder.length - 1){
		flakeCount = 0;
	}
	if(flakeHolder[flakeCount] != null){
		fill(0);
		ellipse(flakeHolder[flakeCount].x, flakeHolder[flakeCount].y-1, flakeHolder[flakeCount].flakeSize+flakeHolder[flakeCount].flakeSize/2.5, flakeHolder[flakeCount].flakeSize+flakeHolder[flakeCount].flakeSize/1.7);
	}
	if(flakeHolder[flakeCount]==null){
		flakeHolder[flakeCount] = new SnowFlake();
	} else {
		flakeHolder[flakeCount].x = (int) (Math.random()*490+7);
		flakeHolder[flakeCount].y = 2;
	}
	flakeCount++;


	for(int i = 0; i<flakeHolder.length; i++){
		if(flakeHolder[i] != null){
			fill(0,0,0);
			ellipse(flakeHolder[i].x, flakeHolder[i].y-1, flakeHolder[i].flakeSize+flakeHolder[i].flakeSize/2.5, flakeHolder[i].flakeSize+flakeHolder[i].flakeSize/1.7);

            		fill(255,255,255);
			ellipse(flakeHolder[i].x, flakeHolder[i].y, flakeHolder[i].flakeSize, flakeHolder[i].flakeSize);
			flakeHolder[i].move();
		}
	}

	
	if(mousePressed){
		if(mouseX<500 && mouseX>0 && mouseY>0 && mouseY<500){
		  if (mouseButton == LEFT) {
			fill(#a0522d);
			ellipse(mouseX,mouseY,20,20);
		  } else if (mouseButton == RIGHT) {
			fill(0);
			ellipse(mouseX,mouseY,40,40);
			
		  }
		}
	}


}

class SnowFlake{
	int x;
	int y;
	int speed;
	int flakeSize;
	Boolean moveAble;
	int bgColor;
	SnowFlake(){
		x = (int) (Math.random()*490+7);
		y = 2;
		speed = 3;
		flakeSize = (int) (Math.random()*5+5);
		moveAble=true;
		bgColor = color(0,0,0);
	}
	void move(){
		checker();
		if(moveAble){
			y++;	
		}

	}
	void checker(){
		boolean isMovable = true;
		for(int i = -flakeSize/3; i<flakeSize/3; i++){
			if(isMovable && y > 1){
				if(get(x+i,y+flakeSize/2+1)!=bgColor){
		                  moveAble=false;
		                  isMovable=false;
				} else {
		                  moveAble=true;
		        }
			}

		}

	}
}


