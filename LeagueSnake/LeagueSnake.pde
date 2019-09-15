int gameSpeed = 10;
color backgroundColor = color(31, 27, 36);
color snakeColor = color(  3, 218, 197);
color foodColor = color(176, 0, 32);

//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

  //Add x and y member variables. They will hold the corner location of each segment of the snake.
  int x;
  int y;

  // Add a constructor with parameters to initialize each variable.
  Segment(int xVal,int yVal) {
    x = xVal;
    y = yVal;
  }
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head;
int foodX, foodY;
int direction = UP;
int food = 0;
ArrayList<Segment> snakeTail = new ArrayList<Segment>();




//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500,500);
  noStroke();
  head = new Segment(10,10);
  frameRate(gameSpeed);
  dropFood();
  drawFood();
  drawSnake();
}

void dropFood() {
  //Set the food in a new random location
  foodX = ((int)random(50)*10);
  foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  move();
  drawSnake();
  drawFood();
  eat();
}

void drawFood() {
  //Draw the food
  fill(foodColor);
  rect(foodX,foodY,10,10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  background(backgroundColor);
  fill(snakeColor);
  rect(head.x,head.y,10,10);
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
  for (int i = 0; i < snakeTail.size(); i++) {
    rect(snakeTail.get(i).x,snakeTail.get(i).y,10,10);
  }
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  //checkTailCollision();
  drawTail();
  snakeTail.add(new Segment(head.x,head.y));
  snakeTail.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for (int i = 0; i < snakeTail.size(); i++) {
    Segment snakey = snakeTail.get(i);
    if (snakey.x == head.x && snakey.y == head.y) {
      food = 0;
      snakeTail = new ArrayList<Segment>();
      snakeTail.add(new Segment(head.x,head.y));
    }
  }
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if (key == CODED) {
    if (keyCode == UP) {
      direction = UP;
    } else if (keyCode == DOWN) {
      direction = DOWN;
    } else if (keyCode == LEFT) {
      direction = LEFT;
    } else if (keyCode == RIGHT) {
      direction = RIGHT;
    } 
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
    // move head up here 
    head.y -= 10;
    break;
  case DOWN:
    // move head down here 
    head.y += 10;
    break;
  case LEFT:
   // figure it out 
   head.x -= 10;
    break;
  case RIGHT:
    // mystery code goes here
    head.x += 10;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if (head.x <= -1) {
   head.x = 490;
   direction = LEFT;
 } else if (head.x >= 501) {
  head.x = 10;
  direction = RIGHT;
 } else if (head.y <= -1) {
  head.y = 490;
  direction = UP;
 } else if (head.y >= 501) {
  head.y = 10;
  direction = DOWN;
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  //println("Head X: " + head.x + "Head Y: " + head.y + "foodX: " + foodX + "foodY: " + foodY);
  if (head.x == foodX && head.y == foodY) {
    dropFood();
    snakeTail.add(new Segment(head.x,head.y));
    food += 1;
  }
}
