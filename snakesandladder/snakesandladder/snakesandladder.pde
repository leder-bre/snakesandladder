//Snakes
//Brendan Leder

float boxSize;
int total = 3;
int[] x = new int[total];
int[] y = new int[total];
int move=0;
int player=0;

void setup() {
  size(750, 750);
  float w = width;
  boxSize = w/10;
  int loop = 0;
  while (loop < total) {
    x[loop] = 0;
    y[loop] = 0;
    loop += 1;
  }
}

void draw() {
  //Draw Board
  for (int i = 0; i<10; i++) {
    for (int q = 0; q<10; q++) {
      fill(255);
      rect(i*boxSize, q*boxSize, boxSize, boxSize);
    }
  }

  int counter = 0;
  int up = 0;
  for (int i = 0; i < 100; i++) {
    counter += 1;
    fill(0);
    text(i, counter * boxSize - boxSize + boxSize/10, up * boxSize + boxSize/4);
    if (counter % 10 == 0) {
      counter = 0;
      up += 1;
    }
  }
  for (int m = 0; m < total; m++) {
    display(x[m], y[m], m);
    println(m+"|"+x[m]);
  }
}


void display(float tempx, float tempy, int which) {
  translate(tempx, tempy); 
  if (which%8==0) {
    fill(255, 255, 255);
  } else if (which%7==0) {
    fill(255, 255, 0);
  } else if (which%6==0) {
    fill(255, 0, 0);
  } else if (which%5==0) {
    fill(0, 255, 255);
  } else if (which%4==0) {
    fill(0, 255, 0);
  } else if (which%3==0) {
    fill(255, 0, 255);
  } else if (which%2==0) {
    fill(0, 0, 0);
  } else {
    fill(0, 0, 255);
  }

  stroke(0);
  ellipse(boxSize/2, boxSize/2, boxSize/2, boxSize/2);
}

void movement() {
  
  
  
  
}

/*
Rules for Snakes and Ladders
 ----------------------------
 Draw a board
 Make 'Players'
 Have a dice roller
 Player moves (diceroll) times up board
 If you hit a 'snake' move down the board
 If you hit a 'ladder' move up the board
 */
