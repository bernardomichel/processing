/**
/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

int HEIGHT = 400;
int WITDH = 600;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
float inByte;

void setup() 
{
  size(600 , 400);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    fill(204);
    val = myPort.read();         // read it and store it in val
    text(val + " m", WITDH/2, 10);
  }
  background(255);             // Set background to white
  if (val == 0) {              // If the serial value is 0,
    fill(0);                   // set fill to black
  } 
  else {                       // If the serial value is not 0,
    fill(204);                 // set fill to light gray
  }
  float r1 = 1.38 * 100;
  fill(127, 0, 0, 175);
  ellipseMode(CENTER);
  //ellipse(WITDH/2, WITDH/2, WITDH/2, WITDH/2);
  //stroke(WITDH/2);
  //fill(0);
  //rectMode(CENTER);
  //rect(WITDH/2 - 10, 10, 10, 10);
 
  
  fill(127, 127, 0, 175);
  ellipseMode(CENTER);
  ellipse(WITDH/2, HEIGHT/2, val, val);
  stroke(20);
  fill(0);
  rectMode(CENTER);
  rect(WITDH/2, HEIGHT/2, 10, 10);
  
}

/*

// Wiring / Arduino Code
// Code for sensing a switch status and writing the value to the serial port.

int switchPin = 4;                       // Switch connected to pin 4

void setup() {
  pinMode(switchPin, INPUT);             // Set pin 0 as an input
  Serial.begin(9600);                    // Start serial communication at 9600 bps
}

void loop() {
  if (digitalRead(switchPin) == HIGH) {  // If switch is ON,
    Serial.write(1);               // send 1 to Processing
  } else {                               // If the switch is not ON,
    Serial.write(0);               // send 0 to Processing
  }
  delay(100);                            // Wait 100 milliseconds
}

*/
