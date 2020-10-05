//Daniel Alsthuler
//block 1-1b
//October 3, 2020


//pallette
color red = #FF0000;
color blue = #1400FF;
color green = #0F8618;
color yellow = #EFF022;
color purple = #7C139D;
color brown = #6C4203;
color white = #FFFFFF;
color black = #000000;
color grey = #333333;
color orange = #FF7708;

color toolbarColor;
color buttonColor;
color strokeColor;

PImage rocket;
boolean RocketOn;

float sliderY;
float thickness;
float rocketX;
float rocketY;
float rocketX2;
float rocketY2;

void setup() {
  size(800, 600);
  background(255);
  toolbarColor = grey;
  rocket = loadImage("rocket.png");
  RocketOn = false;
  sliderY = 550;
  thickness = 10;
  rocketX = 100;
  rocketY = 100;
} //end setup ==============================================


//toolbar
void draw() {
  strokeWeight(1);
  stroke(black);
  fill(toolbarColor);
 toolbar(0, 500, 800, 100);
 
 //color buttons

       if (mouseX > 35 && mouseX < 65 && mouseY > 510 && mouseY < 540) {  
  buttonColor = red; 
} else if (mouseX > 35 && mouseX < 65 && mouseY > 560 && mouseY < 590) {
  buttonColor = blue; 
} else if (mouseX > 85 && mouseX < 115 && mouseY > 510 && mouseY < 540) {
  buttonColor = green;
} else if (mouseX > 85 && mouseX < 115 && mouseY > 560 && mouseY < 590) {
  buttonColor = yellow;
} else if (mouseX > 135 && mouseX < 165 && mouseY > 510 && mouseY < 540) {
  buttonColor = purple;
} else if (mouseX > 135 && mouseX < 165 && mouseY > 560 && mouseY < 590) {
  buttonColor = brown;
} else if (mouseX > 185 && mouseX < 215 && mouseY > 510 && mouseY < 540) {
  buttonColor = white;
} else if (mouseX > 185 && mouseX < 215 && mouseY > 560 && mouseY < 590) {
  buttonColor = black;
} else {
  buttonColor = grey;
}

strokeWeight(3);
tactile(50, 525, 15);
fill(red);
circle(50, 525, 30);

tactile(50, 575, 15);
fill(blue);
circle(50, 575, 30);

tactile(100, 525, 15);
fill(green);
circle(100, 525, 30);

tactile(100, 575, 15);
fill(yellow);
circle(100, 575, 30);

tactile(150, 525, 15);
fill(purple);
circle(150, 525, 30);

tactile(150, 575, 15);
fill(brown);
circle(150, 575, 30);

tactile(200, 525, 15);
fill(white);
circle(200, 525, 30);

tactile(200, 575, 15);
fill(black);
circle(200, 575, 30);

//slider
thickness = map(sliderY, 520, 580, 20, 1);
rocketX = map(sliderY, 520, 580, 150, 50);
rocketY = map(sliderY, 520, 580, 150, 50);
rocketX2 = map(sliderY, 520, 580, 60, 40);
rocketY2 = map(sliderY, 520, 580, 60, 40);
fill(orange);
strokeWeight(2);
tactile3(300, sliderY, 10);
tactile4(295, 520, 10, 60); 
line(300, 520, 300, 580);
circle(300, sliderY, 20);
strokeWeight(thickness);
stroke(strokeColor);
line(250, 520, 250, 580);




//rocket button
  tactile2(390, 550, 40);
  RocketOnOff();
  strokeWeight(1);
  circle(390, 550, 85);
  image(rocket, 360, 520, rocketX2, rocketY2);


//fill button
tactile4(565, 508, 100, 85);
fill(strokeColor);
rect(565, 508, 100, 85);
if (strokeColor == white || strokeColor == yellow) {
  fill(black);
}else{
fill(white);
}
textSize(50);
textAlign(CENTER, CENTER);
text("Fill", 615, 544);


//new, load, save
tactile4(675, 508, 100, 25);
fill(red);
rect(675, 508, 100, 25);
fill(white);
textSize(20);
textAlign(CENTER, CENTER);
text("New", 725, 518);
tactile4(675, 538, 100, 25);
fill(green);
rect(675, 538, 100, 25);
fill(white);
textSize(20);
textAlign(CENTER, CENTER);
text("Save", 725, 548);
tactile4(675, 568, 100, 25);
fill(blue);
rect(675, 568, 100, 25);
fill(white);
textSize(20);
textAlign(CENTER, CENTER);
text("Load", 725, 578);

 
 
 }// end draw ================================================

void toolbar(int x, int y, int w, int h) {
  rect(0, 500, 800, 100);
  toolbarColor = buttonColor;
} //end toolbar =============================================

void tactile (int x, int y, int r) {
if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(black);
  }
} //end tactile =============================================

void tactile2(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(black);
  }
}

void tactile3(int x, float y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(black);
  }
}

void tactile4(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(white);
  } else {
    stroke(black);
  }
}
  

void mouseDragged() {
  if (RocketOn == false) {
  //squigly line
  strokeWeight(thickness);
  stroke(strokeColor);
  line(pmouseX, pmouseY, mouseX, mouseY);
  }
  controlSlider();
}

void mousePressed() {
  if (RocketOn == false) {
  //squigly line
  strokeWeight(thickness);
  stroke(strokeColor);
  line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    //rocket drawing
    image(rocket, mouseX, mouseY, rocketX, rocketY);
  }
  
  if (mouseX > 350 && mouseX < 430 && mouseY > 500 && mouseY < 600) {
    RocketOn = !RocketOn;
  }
  //fill
 if (mouseX > 565 && mouseX < 665 && mouseY > 508 && mouseY < 594) {
    background(strokeColor);
  }
  //new
  if (mouseX > 675 && mouseX < 775 && mouseY > 508 && mouseY < 535) {
    background(white);
  }
  //save
  if (mouseX > 675 && mouseY < 775 && mouseY > 538 && mouseY < 565) {
      selectOutput("Choose a name for your new image file", "saveImage");
    }
    //load
    if (mouseX > 675 && mouseX < 775 && mouseY > 568 && mouseY < 595) {
      selectInput("pick an image to load", "openImage");
    }
  
  controlSlider();
}

void mouseReleased() {
  //line color
  if (mouseX > 35 && mouseX < 65 && mouseY > 510 && mouseY < 540) {  
  strokeColor = red;
  RocketOn = false;
} else if (mouseX > 35 && mouseX < 65 && mouseY > 560 && mouseY < 590) {
  strokeColor = blue;
  RocketOn = false;
} else if (mouseX > 85 && mouseX < 115 && mouseY > 510 && mouseY < 540) {
  strokeColor = green;
  RocketOn = false;
} else if (mouseX > 85 && mouseX < 115 && mouseY > 560 && mouseY < 590) {
  strokeColor = yellow;
  RocketOn = false;
} else if (mouseX > 135 && mouseX < 165 && mouseY > 510 && mouseY < 540) {
  strokeColor = purple;
  RocketOn = false;
} else if (mouseX > 135 && mouseX < 165 && mouseY > 560 && mouseY < 590) {
  strokeColor = brown;
  RocketOn = false;
} else if (mouseX > 185 && mouseX < 215 && mouseY > 510 && mouseY < 540) {
  strokeColor = white;
  RocketOn = false;
} else if (mouseX > 185 && mouseX < 215 && mouseY > 560 && mouseY < 590) {
  strokeColor = black;
  RocketOn = false;
}
  //rocket button
  
}

  void RocketOnOff() {
    if (RocketOn == true) {
      fill(red);
    } else {
      fill(black);
  }
  }
  
  void controlSlider() {
    if (mouseX > 295 && mouseX < 305 && mouseY > 520 && mouseY < 580) {
      sliderY = mouseY;
    }
  }

  
  void saveImage(File f) {
    if (f != null) {
      PImage canvas = get( 71, 1,  width-71, height-1);
      canvas.save(f.getAbsolutePath());
  }
  }
  
  void openImage(File f) {
    if (f != null) {
      //KLUDGE
      int n = 0;
      while (n < 10) {
        PImage pic = loadImage(f.getPath());
        image(pic, 0, 0);
        n = n + 1;
      }
    }
  }
