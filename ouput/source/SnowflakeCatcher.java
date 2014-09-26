import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SnowflakeCatcher extends PApplet {

SnowFlake[] flakeHolder =  new SnowFlake[500];
int flakeCount = 0;
public void setup(){
	size(500,500);
	noStroke();
	fill(0);
	rect(-100, -100, 1000, 1000);
	frameRate(60);
}

public void draw(){
	//background(0);
	if(flakeCount >= flakeHolder.length - 1){
		flakeCount = 0;
	}
	if(flakeHolder[flakeCount] != null){
		fill(0);
		ellipse(flakeHolder[flakeCount].x, flakeHolder[flakeCount].y-1, flakeHolder[flakeCount].flakeSize+flakeHolder[flakeCount].flakeSize/2.5f, flakeHolder[flakeCount].flakeSize+flakeHolder[flakeCount].flakeSize/1.7f);
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
			ellipse(flakeHolder[i].x, flakeHolder[i].y-1, flakeHolder[i].flakeSize+flakeHolder[i].flakeSize/2.5f, flakeHolder[i].flakeSize+flakeHolder[i].flakeSize/1.7f);

            		fill(255,255,255);
			ellipse(flakeHolder[i].x, flakeHolder[i].y, flakeHolder[i].flakeSize, flakeHolder[i].flakeSize);
		}
	}

	for(int i = 0; i<flakeHolder.length; i++){
		if(flakeHolder[i] != null){
			flakeHolder[i].move();
		}
	}
	
	//println(frameRate);
	if(mousePressed){
		if(mouseX<500 && mouseX>0 && mouseY>0 && mouseY<500){
		  if (mouseButton == LEFT) {
			fill(0xffa0522d);
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
	public void move(){
		checker();
		if(moveAble){
			y++;	
		}

	}
	public void checker(){
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


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SnowflakeCatcher" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
