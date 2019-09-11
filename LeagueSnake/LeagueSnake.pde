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




//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500,500);
  noStroke();
  head = new Segment(5,5);
  frameRate(20);
  dropFood();
  drawFood();
  drawSnake();
  eat();
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
  dropFood();
  drawFood();
}

void drawFood() {
  //Draw the food
  fill(255,0,0);
  rect(foodX,foodY,10,10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  background(255,255,255);
  fill(0,255,0);
  rect(head.x,head.y,10,10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
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
      println(head.x,head.y);
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
 if (head.x <= 0) {
   head.x = 499;
   direction = LEFT;
 } else if (head.x >= 500) {
  head.x = 1;
  direction = RIGHT;
 } else if (head.y <= 0) {
  head.y = 499;
  direction = UP;
 } else if (head.y >= 500) {
  head.y = 0;
  direction = DOWN;
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if (head.x == X && head.y == Y) {
    drawFood();
    food += 1;
  }
}
