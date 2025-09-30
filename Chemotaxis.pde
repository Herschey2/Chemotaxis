Bacteria[] bobbies;
int cols = 10;
int rows = 10;
int cell_width;
int cell_height;
int mouseSize=30;
Bacteria mice = new Bacteria(200,200);
void setup() {
  size(500, 500);
  noStroke();
  bobbies = new Bacteria[cols * rows];
  cell_width = width / cols;
  cell_height = height / rows;

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x_pos = i * cell_width + cell_width / 2;
      int y_pos = j * cell_height + cell_height / 2;
      bobbies[i + j * cols] = new Bacteria(x_pos, y_pos);
    }
  }
}

void draw() {
  background(255, 180, 180);
  for (Bacteria d : bobbies) {
    d.move();
    d.show();
    d.moveMouse(false);
    d.check();
  }
  mice.show();
  mice.moveMouse(true);
}

class Bacteria {
  int bacX;
  int bacY;
  int bacColor;
  int bacSize;
  boolean toward;
  Bacteria(int x, int y) {
    bacX = x;
    bacY = y;
    bacSize = (int)(Math.random() * 20) + 20;
    int r = (int)(Math.random() * 256);
    int g = (int)(Math.random() * 256);
    int b = (int)(Math.random() * 256);
    this.bacColor = color(r, g, b);
  }

  void move() {
    int storeX = bacX;
    int storeY = bacY;
    if(Math.random()>.1){
      bacX += (int)(Math.random() * 3) - 1;
      bacY += (int)(Math.random() * 3) - 1;
    }
    if (bacX < 0 || bacX > width) {
      bacX = storeX;
    }
    if (bacY < 0 || bacY > height) {
      bacY = storeY;
    }
  }
  void moveMouse(boolean toward){
    int storeX = bacX;
    int storeY = bacY;
    if (toward==true){
      float taco =lerp(bacX, mouseX, .1);
      float burrito =lerp(bacY, mouseY, .1);
      bacX=Math.round(taco);
      bacY=Math.round(burrito);
      if (bacX < 0 || bacX > width) {
        bacX = storeX;
      }
      if (bacY < 0 || bacY > height) {
        bacY = storeY;
      }
    }
    if (toward==false){
      double distance = Math.sqrt(Math.pow(bacX - mouseX, 2) + Math.pow(bacY - mouseY, 2));
      if(distance<100 && distance>30){
        float taco =lerp(bacX, mouseX, -.04);
        float burrito =lerp(bacY, mouseY, -.04);
        bacX=Math.round(taco);
        bacY=Math.round(burrito);
        if (bacX < 0 || bacX > width) {
          bacX = storeX;
        }
        if (bacY < 0 || bacY > height) {
          bacY = storeY;
        }
      }
      else if(distance<30){
        float taco =lerp(bacX, mouseX, -.4);
        float burrito =lerp(bacY, mouseY, -.4);
        bacX=Math.round(taco);
        bacY=Math.round(burrito);
        if (bacX < 0 || bacX > width) {
          bacX = storeX;
        }
        if (bacY < 0 || bacY > height) {
          bacY = storeY;
        }
      }
    }
  }
  void show() {
    fill(bacColor);
    ellipse(bacX, bacY, bacSize, bacSize);
  }
  void check(){
    for (Bacteria bob : bobbies){
      double distance = Math.sqrt(Math.pow(bacX - bob.bacX, 2) + Math.pow(bacY - bob.bacY, 2));
      int storeX = bacX;
      int storeY = bacY;
      if(distance<bob.bacSize && distance>bob.bacSize/2){
        float taco =lerp(bacX, bob.bacX, -.05);
        float burrito =lerp(bacY, bob.bacY, -.05);
        bacX=Math.round(taco);
        bacY=Math.round(burrito);
        if (bacX < 0 || bacX > width) {
          bacX = storeX;
        }
        if (bacY < 0 || bacY > height) {
          bacY = storeY;
        }
      }
      else if(distance<bob.bacSize/2){
        float taco =lerp(bacX, bob.bacX, -.5);
        float burrito =lerp(bacY, bob.bacY, -.5);
        bacX=Math.round(taco);
        bacY=Math.round(burrito);
        if (bacX < 0 || bacX > width) {
          bacX = storeX;
        }
        if (bacY < 0 || bacY > height) {
          bacY = storeY;
        }
      }
    }
  }
}
