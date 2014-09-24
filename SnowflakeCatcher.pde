
SnowFlake[] flakeHolder =  new SnowFlake[10000];
int flakeCount = 0;
int[][] walls = new int[500][500];
void setup(){
	size(500,500);
	noStroke();
}

void draw(){
	background(0);
	drawWall();
	if(flakeCount >= flakeHolder.length - 1){
		flakeCount = 0;
	}
	flakeHolder[flakeCount] = new SnowFlake();
	flakeCount++;


	for(int i = 0; i<flakeHolder.length; i++){
		if(flakeHolder[i] != null){
            fill(255,255,255);
			ellipse(flakeHolder[i].x, flakeHolder[i].y, flakeHolder[i].flakeSize, flakeHolder[i].flakeSize);
			
			flakeHolder[i].move();
		}
	}

}
void keyPressed(){
	if(key == 32){
		for(int i = 0; i<flakeHolder.length; i++){
			flakeHolder[i] = null;
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
		x = (int) (Math.random()*480+7);
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
		for(int i = -flakeSize+2; i<flakeSize-2; i++){
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


void drawWall(){
	for(int i = 0; i<499; i++){
		for(int a=0; a<499; a++){
			if(walls[i][a]==1){
				fill((int) (Math.random()*255),(int) (Math.random()*255),(int) (Math.random()*255));
				rect(i,a,20,20);
			}
		}
	}
}

void mouseDragged() {
  if(mouseX<500 && mouseX>0 && mouseY>0 && mouseY<500){
	  if (mouseButton == LEFT) {
	    walls[mouseX][mouseY] = 1;
	  } else if (mouseButton == RIGHT) {
		for(int i = 0; i<499; i++){
			for(int a=0; a<499; a++){
				walls[i][a]=0;
			}
		}
	  }
  }
}

void mousePressed() {
  if(mouseX<500 && mouseX>0 && mouseY>0 && mouseY<500){
	  if (mouseButton == LEFT) {
	    walls[mouseX][mouseY] = 1;
	  } else if (mouseButton == RIGHT) {
		for(int i = 0; i<499; i++){
			for(int a=0; a<499; a++){
				walls[i][a]=0;
			}
		}
	  }
  }
}
