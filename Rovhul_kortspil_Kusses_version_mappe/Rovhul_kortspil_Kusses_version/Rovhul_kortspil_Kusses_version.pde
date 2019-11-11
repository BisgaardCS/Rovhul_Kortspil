String[] kort = new String[54];
int k = 0;
int l = 0;
String[] Spiller1;
String[] BOT_Wilhelm;
String[] BOT_Sandra;
int KortIMG = 0;

void setup() {
  fullScreen();
  
  PImage[] kortBilleder = new PImage[52];
String[] KortF = {"C2", "D2", "H2", "S2", "C3", "D3", "H3", "S3",
"C4", "D4", "H4", "S4", "C5", "D5", "H5", "S5", "C6", "D6", "H6", "S6",
"C7", "D7", "H7", "S7", "C8", "D8", "H8", "S8", "C9", "D9", "H9", "S9",
"C10", "D10", "H10", "S10", "CJ", "DJ", "HJ", "SJ", "CQ", "DQ", "HQ", "SQ",
"CK", "DK", "HK", "SK", "CA", "DA", "HA", "SA"};
 KortIMG = kortBilleder + KortF;
  
  String[] kulor = {"♣", "♦", "❤", "♠"};
  String[] vardi = {"3", "4", "5", "6", "7", "8", "9", "10", "Knægt", "Dronning", "Konge", "Es", "2"};
  String[] sortjoker = {"Sort Joker"};
  String[] rodjoker= {"Rød Joker"};

  int sted=0;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 13; j++) {
      kort[sted]=kulor[i]+" "+ vardi[j];
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
  
  Spiller1 = subset(kort,0,18);
  println("");
  println("Spiller 1");
  for(String k:Spiller1)print(k+ "  ");
  
  println(" ");
  
  BOT_Wilhelm = subset(kort,18,18);
  println("");
  println("Wilhelm");
  for(String k:BOT_Wilhelm)print(k+ "  ");
  
  println(" ");
  
  BOT_Sandra = subset(kort,36,18);
  println("");
  println("Sandra");
  for(String k:BOT_Sandra)print(k+ "  ");
  
  //2erne
  KortIMG = loadImage("2C.png");
  D2 = loadImage("2D.png");
  H2 = loadImage("2H.png");
  S2 = loadImage("2S.png");
  
  //3erne
  C3 = loadImage("3C.png");
  D3 = loadImage("3D.png");
  H3 = loadImage("3H.png");
  S3 = loadImage("3S.png");

println(" ");
println(width);
}

void draw(){
  //2erne
 image(C2, 0, 0, 150, 200);
 image(D2, 150, 0, 150, 200);
 image(H2, 300, 0, 150, 200);
 image(S2, 450, 0, 150, 200);
 
 //3erne
 image(C3, 0, 200, 150, 200);
 image(D3, 150, 200, 150, 200);
 image(H3, 300, 200, 150, 200);
 image(S3, 450, 200, 150, 200);
  
}
