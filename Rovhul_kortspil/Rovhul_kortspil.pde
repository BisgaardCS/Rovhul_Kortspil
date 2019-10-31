String[] kort = new String[52];


void setup() {
  size(10, 10);
  String[] kulor = {"❤", "♠", "♦", "♣", };
  String[] vardi = {"3", "4", "5", "6", "7", "8", "9", "10", "Knægt", "Dronning", "Konge", "Es", "2"};

  int sted=0;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 13; j++) {
      kort[sted]=kulor[i]+" "+ vardi[j] + " | ";
      sted++;
      //println(kort);
    }
  }
  for (int n = 0; n < 1000; n++) {
    int index = 0;
    for (int m = 0; m < 52; m++) {
      int index1 = int(random(0, 52));
      String kort1 = kort[index];
      String kort2 = kort[index1];
      kort[index] = kort2;
      kort[index1] = kort1;
      index++;
    }
  }
  println(kort);
}
