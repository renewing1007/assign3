                          /* please implement your assign1 code in this file. */
  PImage fighterImg;
  PImage treasureImg;
  PImage hpImg;
  PImage enemyImg;
  PImage bg1Img;
  PImage bg2Img;
  PImage bg3Img;
  PImage bg4Img;
  boolean upPressed=false;
  boolean downPressed=false;
  boolean leftPressed=false;
  boolean rightPressed=false;
  final int straight=0;
  final int slash=1;
  final int diamond=2;
  int state=0;
  int treasure_x,treasure_y,hp_x,enemy_x,enemy_y,fighterx1,fightery1,x2,y2,x3,y3;
  float spacingX,spacingY,spacingY1;
  float spacingx,spacingy,spacingy1;

void setup () {
  size(640,480) ;  // must use this size.
  // your code
//load image 
 fighterImg=loadImage("img/fighter.png");
 treasureImg=loadImage("img/treasure.png");
 hpImg=loadImage("img/hp.png");
 enemyImg=loadImage("img/enemy.png");
 bg1Img=loadImage("img/bg1.png");//bg1
 bg2Img=loadImage("img/bg2.png");//bg2
 bg3Img=loadImage("img/bg1.png");//bg1
 bg4Img=loadImage("img/bg2.png");//bg2
 treasure_x=floor(random(600));
 treasure_y=floor(random(34,440));
 //treasure_x=176;
 //treasure_y=100;


 hp_x=38;
 enemy_x=10;
 enemy_y=135;
 //enemy_y=315;
 //enemy_y=floor(random(135,315));
 
 
 x2=-640;//cordinate of bg1
 y2=0;//cordinate of bg2
 x3=-1920;
 y3=-1280;
 fighterx1=width-50;
 fightery1=height/2;
//fighterx1=176;
//fightery1=200;
}


void draw() {
  // your code
  background(0);
  image(bg1Img,x2,0);

  x2++;//bg1 move to right
  image(bg2Img,y2,0);
  y2++;//bg2 move to right
  image(bg1Img,x3,0);
  x3++;//bg1 move to right
  image(bg2Img,y3,0);
  y3++;//bg2 move to right
  
  
  //background cycle
  if(x2==0 && y2==640){
  x3=-1280;
  y3=-640;}
  if(x3==0 && y3==640){
  x2=-1280;
  y2=-640;}
 
 
 //fighter 
 image(fighterImg,fighterx1,fightery1); 
  //keypressed
  if(rightPressed){
    fighterx1+=5;
   }if(leftPressed){
    fighterx1-=5;
   }if(upPressed){
    fightery1-=5;
   }if(downPressed){
    fightery1+=5;
   }
 
 //boundary detection
 if(fighterx1>width-50){
    fighterx1=width-50;
   }
 if(fighterx1<=0){
    fighterx1=0;
   }
 if(fightery1>height-50){
    fightery1=height-50;
   }  
 if(fightery1<=0){
    fightery1=0;}
   
    
    //more fun
  /*  
  if(fightery1>enemy_y){
  enemy_y+=2;}
  if(fightery1<enemy_y)
  {enemy_y-=2;}
  
  if(fightery1==enemy_y){
  fightery1=enemy_y;
  enemy_x+=2;
  }
  */
 
  
   //if the fighter gets the treasure
  /*
  if(treasure_x-40 <= fighterx1 && fighterx1 <= treasure_x+40 ){
     if(treasure_y-50 <= fightery1 && treasure_y <= enemy_y+40){
     hp_x+=19;
     treasure_x=floor(random(600));
     treasure_y=floor(random(34,440));
   } 
   }
  
  //if the fighter is attacked by the enemy
   if(enemy_x-49 <= fighterx1 && fighterx1 <= enemy_x+40 ){
     if(enemy_y-49 <= fightery1 && fightery1 <= enemy_y+60){
     hp_x-=38;
     enemy_x=0;
     enemy_y=floor(random(35,420));
   } 
   }
*/
 
   
    
  

  
  
  
  //hp
  fill(#FF0000);
  rect(13,5,hp_x,15);
  image(hpImg,0,0);
  //treasure
  image(treasureImg,treasure_x,treasure_y);
  
  //enemy
 
switch(state){
 case straight: 
//image(enemyImg,enemy_x,enemy_y);
 enemy_x+=3;
 //enemy staright
 for(int x=enemy_x;x<=enemy_x+250; x+=60){
 image(enemyImg,x,enemy_y);
 }
 if(enemy_x>=640){
    enemy_x=0;
     enemy_y=floor(random(200,420));
 state=1;}
 break;
 
 case 1:
//image(enemyImg,enemy_x,enemy_y);

 enemy_x+=3;
 
 for(int i=0; i<5;i++){
 spacingX=enemy_x+i*50;
 spacingY=enemy_y-i*50;
 image(enemyImg,spacingX,spacingY);
 }
 if(enemy_x>=640){
    enemy_x=10;
   // enemy_y=135; 
    enemy_y=floor(random(135,315));
    state=2;}
 break;
 

 case 2:

 //image(enemyImg,enemy_x,enemy_y);
 enemy_x+=3;
 for(int i=0; i<3;i++){
 spacingX=enemy_x+i*50;
 spacingY=enemy_y-i*50;
 spacingX=enemy_x+i*50;
 spacingY1=enemy_y+i*50;
 image(enemyImg,spacingX,spacingY);
 image(enemyImg,spacingX,spacingY1);
 }
  //image(enemyImg,enemy_x+200,enemy_y);
 for(int i=0; i<2;i++){
 spacingx=enemy_x+200-i*50;
 spacingY=enemy_y-i*50;
 spacingX=enemy_x+200-i*50;
 spacingY1=enemy_y+i*50;
 image(enemyImg,spacingX,spacingY);
 image(enemyImg,spacingX,spacingY1);
 }
  
  if(enemy_x>=640){
    enemy_x=10;
    enemy_y=floor(random(35,420));
    state=0;
 }
  }
   } 
 void keyPressed(){
 if(key== CODED){
  switch(keyCode){
  case UP:
  upPressed=true;
  break;
  case DOWN:
  downPressed=true;
  break;
  case RIGHT:
  rightPressed=true;
  break;
  case LEFT:
  leftPressed=true;
  break;
    } 
   }
  } 
 
 void keyReleased(){
 if(key== CODED){
  switch(keyCode){
  case UP:
  upPressed=false;
  break;
  case DOWN:
  downPressed=false;
  break;
  case RIGHT:
  rightPressed=false;
  break;
  case LEFT:
  leftPressed=false;
  break;
    } 
   }
  }
 
 
 
 
 
 
