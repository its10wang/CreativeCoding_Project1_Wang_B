Plane plane;
color[]colors = {
color(255,0,255),
color(0),
color(0,153,0),
color(175, 100, 220)};
Bullet[]bullets={
new Bullet(401,601),
new Bullet(401,601),
new Bullet(401,601),
new Bullet(401,601),
new Bullet(401,601),
new Bullet(401,601),
new Bullet(401,601),
new Bullet(401,601),
new Bullet(401,601)
};
int fps = 0;
int count = 0;

void setup(){
  size(400,600);
  plane = new Plane();
  noCursor();
  frameRate(30);
}



void draw(){
  background(0);
   
   if(++fps>30){
     star(true);
     fps=0;
   }else
     star(false);
     
  for (int i =1;i<bullets.length;i++){
    bullets[i].draw(bullets[i].x,bullets[i].y+bullets[i].len,colors[i%4]);
  }
  
  plane.drawPlane();
    
  fill(255);
  textSize(32);
  text(count, 15, 30);
 
}
  
  
void star(boolean flag){
 

    float star;
   stroke(255);
   fill(255);
   star=random(7);
   ellipse(random(width),random(height),star,star);
   ellipse(random(width),random(height),star,star);
}



void mouseMoved(){
  int planeX=mouseX<40?40:mouseX>360?360:mouseX;
  int planeY=mouseY<40?40:mouseY>560?560:mouseY;
  plane.mouseLister(planeX,planeY);
}


class Plane{
  int planeX = 160;
  int planeY = 500;
  
  void mouseLister(int x,int y){
     planeX=x;
     planeY=y;
  }
  


  void drawPlane(){
    plane(planeX,planeY);
     int count = (planeY+120)/35;
     for(int i=0;i<3;i++){
       for(int j=0;j<=count;j++){
         stroke(colors[j%4]);
         fill(colors[j%4]);
         int x=(planeX-20)+i*20;
         int y=(planeY-50)-j*25;
         ellipse(x,y,3,15);
       }
     }
  }
  
  void plane(int x,int y){
    fill(58,166,254);
    stroke(58,166,254);
    ellipse(x, y, 20, 60);
    ellipse(x, y+28, 40, 8);
    ellipse(x, y, 60, 18);
  }
  
}


class Bullet{
  
  int x;
  int y;
  int len = 5;
 
  
  Bullet(int x,int y){
    this.x=x;
    this.y=y;
  }
  
  void draw(int x,int y,color c){
    if(plane.planeX<x&&(x-plane.planeX)<50||plane.planeX>x&&(plane.planeX-x)<50){
      count++;
      y=999;
      x=999;
    }
    
    this.x = x>400?(int)(Math.random()*350)+40:this.x;
    this.y = y>600?-(int)(Math.random()*200):y;
    MiniPlane(this.x,this.y,c);
  }
  
  void MiniPlane(int x,int y,color c){
    fill(c);
    stroke(c);
    ellipse(x, y, 10, 30);
    ellipse(x, y-15, 20, 10);
    ellipse(x, y, 30, 10);
  }
}
