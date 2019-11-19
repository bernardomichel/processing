/**
 * Serial Duplex 
 * by Tom Igoe. 
 * 
 * Sends a byte out the serial port when you type a key
 * listens for bytes received, and displays their value. 
 * This is just a quick application for testing serial data
 * in both directions. 
 */


import processing.serial.*;

Serial myPort;      // The serial port
int whichKey = -1;  // Variable to hold keystoke values
String inByte = "";    // Incoming serial data
float posX2;
float posY2;
float posX3;
float posY3;
float at;
float bt;
float ct;
float XT;
float YT;

int HEIGHT = 1080;
int WITDH = 1920;

int MULTIPLIER = 200;

void setup() {
  size(1920, 1080);
  // create a font with the third font available to the system:
  PFont myFont = createFont(PFont.list()[2], 14);
  textFont(myFont);

  // List all the available serial ports:
  printArray(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // In Windows, this usually opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 115200);
}

void draw() {
  //background(0);
  //fill(255);
  //text("Last Received: " + inByte, 10, 130);
  //text("Last Sent: " + whichKey, 10, 100);

  
  if (inByte != null) {
  background(0);
  fill(255);
  text("Last Received: " + inByte, 10, 130);
  text("Last Sent: " + whichKey, 10, 100);
  fill(0, 0, 255, 50);
  stroke(0, 0, 255, 255);
  strokeWeight(2);
  ellipseMode(CENTER);
  //AZUL
    rectMode(CENTER);
    ellipse(WITDH/8, WITDH/2, 2 * at * MULTIPLIER, 2 * at * MULTIPLIER);
    fill(255, 255, 255, 255);
    rect(WITDH/8, WITDH/2, 10, 10);
    
    // ROJO
    fill(255, 0, 0, 50);
    stroke(255, 0, 0, 255);
    ellipse(WITDH/8 + posX2 * MULTIPLIER, WITDH/2 + posY2 * MULTIPLIER, 2 * bt * MULTIPLIER, 2 * bt * MULTIPLIER);
    fill(255, 0, 0, 255);
    rect(WITDH/8 + posX2 * MULTIPLIER, WITDH/2 + posY2 * MULTIPLIER, 10, 10);
    
    //VERDE
    fill(0, 255, 0, 50);
    stroke(0, 255, 0, 255);
    ellipse(WITDH/8 + posX3  * MULTIPLIER, WITDH/2 - posY3 * MULTIPLIER, 2 * ct * MULTIPLIER, 2 * ct * MULTIPLIER);
    fill(0, 255, 0, 255);
    rect(WITDH/8 + posX3  * MULTIPLIER, WITDH/2 - posY3 * MULTIPLIER, 10, 10);
    rectMode(CENTER);
    fill(100, 100, 100, 175);
    
    //AMARILLO
    fill(255,255,0, 150);
    stroke(255,255, 0, 255);
    rect(WITDH/8 + XT  * MULTIPLIER, WITDH/2 - YT * MULTIPLIER, 10, 10);
    rectMode(CENTER);
  }
  
}

void serialEvent(Serial myPort) {
  inByte = myPort.readStringUntil('\n');
  //inByte = "BX: 3.00, CX: 1.50, CY: 2.00, AT: 3.5, BT: 2.56, CT: 4.6";
  try {
    String[] token = inByte.split(",");
    posY2 = 0;
    posX2 = getPos(token[0]);
    posX3 = getPos(token[1]);
    posY3 = getPos(token[2]);
    at = getPos(token[3]);
    bt = getPos(token[4]);
    ct = getPos(token[5]);
    XT = getPos(token[6]);
    YT = getPos(token[7]);
  } catch(Exception e) {
    
  }
}

float getPos(String index) {
  float position = 0;
  position = float(index.split(":")[1]);
  return position;
}

void keyPressed() {
  // Send the keystroke out:
  //myPort.write(key);
  //whichKey = key;
}
