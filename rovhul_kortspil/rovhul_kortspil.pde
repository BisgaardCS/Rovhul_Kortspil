String[] kort = new String[52];


void setup() {
  size(1000, 1000);
  String[] kulor = {"♣", "♦", "❤", "♠"};
  String[] vardi = {"3", "4", "5", "6", "7", "8", "9", "10", "Knægt", "Dronning", "Konge", "Es", "2"};

  int sted=0;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 13; j++) {
      kort[sted]=kulor[i]+" "+ vardi[j];
      sted++;
      println(kort);
    }
  }
}
