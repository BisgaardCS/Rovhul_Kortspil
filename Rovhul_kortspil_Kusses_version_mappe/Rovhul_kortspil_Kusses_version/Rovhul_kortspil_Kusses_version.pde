String[] kort = new String[54];
PImage[] kortBillede = new PImage[54];
int k = 0;
int l = 0;
String[] Spiller1;
String[] BOT_Wilhelm;
String[] BOT_Sandra;
int KortIMG = 0;
PImage vistBillede;
int index = 0;
int x = 0;
int Spiller1StartpladsX = 195;
float Spiller1StartpladsY = 745;
import processing.sound.*;
SoundFile Musik;

void setup() {
  fullScreen();
  frameRate(1);

  String[] kulor = {"C", "D", "H", "S"};
  String[] vardi = {"3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A", "2"};
  String[] sortjoker = {"Sort_Joker"};
  String[] rodjoker= {"Rød_Joker"};

  int sted=0;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 13; j++) {
      kort[sted]=vardi[j]+ kulor[i];
      sted++;
    }
  }
  kort[sted]=sortjoker[k];
  kort[sted+1]=rodjoker[l];

  for (int m=0; m<1000; m++) {
    int index0 = 0;
    for (int n=0; n<54; n++) {

      int index2=int(random(1, 52));
      String kort1=kort[index0];
      String kort2=kort[index2];
      kort [index0]=kort2;
      kort[index2]=kort1;
      index0++;
    }
  }
  println(kort);
    
  BOT_Wilhelm = subset(kort,18,18);
  println("");
  println("Wilhelm");
  for(String k:BOT_Wilhelm)print(k+ "  ");
  
  println(" ");
  
  BOT_Sandra = subset(kort,36,18);
  println("");
  println("Sandra");
  for(String k:BOT_Sandra)print(k+ "  ");
  
   println(" ");
  
  Spiller1 = subset(kort,0,18);
  println("");
  println("Spiller 1");
  for(String kortSpiller1:Spiller1)print(kortSpiller1+ "  ");
  
  println(" ");

Musik = new SoundFile(this, "BaggrundsMusik.mp3");
Musik.play();
Musik.amp(1);
  
}

PImage kortBillede(String k){
//klog programmering
  k = k + ".png";
  return loadImage(k);
}


void draw(){
  vistBillede = kortBillede(Spiller1[index]);
  index = index + 1;
  if(index > 18){index--;}
  x = x + 50;
  
  image(vistBillede, Spiller1StartpladsX+x, Spiller1StartpladsY, 75*1.5, 100*1.5);
  println(index);
  
}
