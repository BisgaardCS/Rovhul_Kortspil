int k = 0;
int l = 0;
int x = 0;
int index = 0;

//Spiller1 kortplads start
int Spiller1StartpladsX = 195;
int Spiller1StartpladsY = 745;

//Strings for vores spillere og bots
String[] Spiller1;
String[] BOT_Wilhelm;
String[] BOT_Sandra;

//Billedere
PImage[] kortBillede = new PImage[54];
PImage VistBillede;
PImage KortBack;
PImage ReglerBaggrund;
PImage Baggrund;

//Musik
import processing.sound.*;
SoundFile Musik;

//Knap variabler
int knapX = 550, knapY = 610, knapW = 300, knapH = 80;
int knapX2 = 550, knapY2 = 430, knapW2 = 300, knapH2 = 80;
int knapX4 = 550, knapY4 = 700, knapW4 = 300, knapH4 = 80;
int knapBackX = 15, knapBackY = 15, knapBackW = 52, knapBackH = 16;
int background = 100;

boolean KnapRegler = false;
boolean KnapSinglePlayer = false;
boolean KnapExit = false;
boolean startscreen = true;

//viste billeder array
PImage[] visteBilleder = new PImage[54];

void setup() {
  fullScreen();
  frameRate(30);
  Baggrund = loadImage("Røvhul_Baggrund.png");

  //Strings til oprettelse af kort
  String[] kort = new String[54];
  String[] kulor = {"C", "D", "H", "S"};
  String[] vardi = {"3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A", "2"};
  String[] sortjoker = {"Sort_Joker"};
  String[] rodjoker= {"Rød_Joker"};

  //Sammensætning af kulør og værdien på kortet.
  int sted=0;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 13; j++) {
      kort[sted]=vardi[j]+ kulor[i];
      sted++;
    }
  }
  //Tilføjelse af Jokerne
  kort[sted]=sortjoker[k];
  kort[sted+1]=rodjoker[l];

  //Blanding af kortne.
  for (int m=0; m<1000; m++) {
    int index0 = 0;
    for (int n=0; n<54; n++) {


      int index2=int(random(0, 54));
      String kort1=kort[index0];
      String kort2=kort[index2];
      kort [index0]=kort2;
      kort[index2]=kort1;
      index0++;
    }
  }
  println(kort);

  BOT_Wilhelm = subset(kort, 18, 18);
  println("");
  println("Wilhelm");
  for (String k : BOT_Wilhelm) {
    print(k+ "  ");
  }

  println("");

  BOT_Sandra = subset(kort, 36, 18);
  println("");
  println("Sandra");
  for (String k : BOT_Sandra)print(k+ "  ");

  println("");

  Spiller1 = subset(kort, 0, 18);
  println("");
  println("Spiller 1");
  for (String kortSpiller1 : Spiller1)print(kortSpiller1+ "  ");

  println("");

  //Musik = new SoundFile(this, "BaggrundsMusik.mp3");
  //Musik.play();
  //Musik.amp(1);
  //Musik.loop();

  KortBack = loadImage("Kort_Bagside.png");
}
PImage kortBillede(String k) {
  //klog programmering
  k = k + ".png";
  return loadImage(k);
}

void draw() {
  clear();
  background(background);
  stroke(background);

  if (KnapSinglePlayer) {
    image(Baggrund, 0, 0, width, height);
    fill(0);
    text("<---", knapBackX, knapBackY*1.5);
    fill(255);

    //SinglePlayer spillet
    if (index < 18) {
      VistBillede = kortBillede(Spiller1[index]);
      visteBilleder[index] = kortBillede(Spiller1[index]);
      image(VistBillede, Spiller1StartpladsX+x, Spiller1StartpladsY, 112.5, 150);
      index = index + 1;
      x = x + 50;
    }

    int xb = 0;
    float xc = 0;
    for (PImage billede : visteBilleder) {

      if (billede != null) {

        int yPus = 0;
        if (mouseX > Spiller1StartpladsX+xb && mouseX < Spiller1StartpladsX+xb+50 && mouseY<900 && mouseY>900-150) {
          yPus = -30;
        }

        image(billede, Spiller1StartpladsX+xb, Spiller1StartpladsY +yPus, 112.5, 150);
        xb = xb + 50;

        image(KortBack, 10+xc, 40, 75, 100);
        image(KortBack, 790+xc, 40, 75, 100);
        xc = xc + 50/1.5;
      }
    }

    if (mousePressed) {
      if (mouseX>knapBackX && mouseX <knapBackX+knapBackW && mouseY>knapBackY && mouseY <knapBackY+knapBackH) {
        KnapSinglePlayer = false;
        startscreen = true;
      }
    }
  }

  if (KnapRegler) {
    background = 255;
    fill(0);
    text("<---", knapBackX, knapBackY*1.5);
    fill(255);
    ReglerBaggrund = loadImage("Regler_Røvhul.png");
    image(ReglerBaggrund, 0, 0, width, height);
    if (mousePressed) {
      if (mouseX>knapBackX && mouseX <knapBackX+knapBackW && mouseY>knapBackY && mouseY <knapBackY+knapBackH) {
        KnapRegler = false;
        startscreen = true;
      }
    }
  }

  if (startscreen) {
    image(Baggrund, 0, 0, width, height);

    rect(550, 520, 300, 80);
    rect(knapX4, knapY4, knapW4, knapH4);
    rect(knapX, knapY, knapW, knapH);
    rect(knapX2, knapY2, knapW2, knapH2);

    fill(0);
    textSize(20);
    text("Singleplayer", 640, 475);
    text("Multiplayer", 640, 570);
    text("Regler", 665, 655);
    text("Slut Spil", 655, 745);
    fill(255);

    background = 100;

    if (mousePressed) {
      if (mouseX>knapX && mouseX <knapX+knapW && mouseY>knapY && mouseY <knapY+knapH) {
        KnapRegler = true;
        startscreen = false;
      }
    }

    if (mousePressed) {
      if (mouseX>knapX2 && mouseX <knapX2+knapW2 && mouseY>knapY2 && mouseY <knapY2+knapH2) {
        KnapSinglePlayer = true;
        startscreen = false;
      }
    } 

    if (mousePressed) {
      if (mouseX>knapX4 && mouseX <knapX4+knapW4 && mouseY>knapY4 && mouseY <knapY4+knapH4) {
        exit();
      }
    }
  }
}
