//Snakes
//Brendan Leder

float boxSize;
int total = 4;
int[] x = new int[int(total)];
int[] y = new int[int(total)];
float[] xshift = new float[total];
float[] yshift = new float[total];
int move=0;
int player=0;
float w;
int rollnum = int(random(1, 7));
boolean canmove;

void setup() {
  frameRate(30);
  size(750, 750);
  w = width;
  boxSize = (w/10)-7;
  int loop = 0;
  while (loop < total) {
    xshift[loop] = random(-boxSize/4, boxSize/4);
    yshift[loop] = random(-boxSize/4, boxSize/4);
    x[loop] = 0;
    y[loop] = 0;
    loop += 1;
  }
}

void draw() {
  //Draw Board

  background(100);

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
    if (move > 0) {
      move-=1;
      x[player] += boxSize;
      if (x[player] > boxSize * 9) {
        x[player] = int(boxSize);
        y[player] += boxSize;
      }
    }
  }

  roller();

  fill(0, 0);
  stroke(0);
  ellipse(51 + (144 * player), height-39, 50, 50);

  for (int m = 0; m < total; m++) {
    textSize(36);
    fill(255);
    text(m+1, 40 + (144 * m), height-26);
    textSize(16);
    pushMatrix();
    translate(xshift[m], yshift[m]);
    display(x[m], y[m], m);
    popMatrix();
  }
}


void display(float tempx, float tempy, int which) {
  translate(tempx, tempy); 
  if (which%8==0) {
    fill(255, 255, 255, 100);
  } else if (which%7==0) {
    fill(255, 255, 0, 100);
  } else if (which%6==0) {
    fill(255, 0, 0, 100);
  } else if (which%5==0) {
    fill(0, 255, 255, 100);
  } else if (which%4==0) {
    fill(0, 255, 0, 100);
  } else if (which%3==0) {
    fill(255, 0, 255, 100);
  } else if (which%2==0) {
    fill(0, 0, 0, 100);
  } else {
    fill(0, 0, 255, 100);
  }

  stroke(0);
  ellipse(boxSize/2, boxSize/2, boxSize/2, boxSize/2);
}

void roller() {
  fill(255);
  textSize(16);
  textAlign(RIGHT);
  text("Click ", width-10, height/2-40);
  text("to roll", width-10, height/2-20);
  fill(0);
  textSize(36);
  text(rollnum, width-20, height/2+10);
  textSize(16);
  textAlign(LEFT);
  if (mousePressed && mouseX > width-50&&mouseX<width-10&&mouseY>height/2-20&&mouseY<height/2 + 20) {
    rollnum = int(random(1, 7)); 
    canmove = true;
  }
}

void mouseReleased() {
  if (canmove == true) {
    canmove = false; 
    move = rollnum;
    player++;
    if (player == total) {
      player = 0;
    }
  }
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
