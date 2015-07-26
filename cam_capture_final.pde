
import processing.video.*;
import processing.serial.*;
import cc.arduino.*;
Capture cam;
Arduino arduino;
int ledPin = 8;
void setup() {
    println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[8], 57600);
  arduino.pinMode(ledPin, Arduino.OUTPUT);
  size(640, 480);

  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 1024, 768);
  } if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[8]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from 10he camera
    cam.start();
  }
}

void draw() {
  if (cam.available() == true) {
arduino.digitalWrite(ledPin, Arduino.HIGH);
  delay(200);
    cam.read();
    arduino.digitalWrite(ledPin, Arduino.LOW);
 image(cam, 0, 0);
  }
  
  // The following does the same as the above image() line, but 
  // is faster when just drawing the image without any additional 
  // resizing, transformations, or tint.
 
  //set(0, 0, cam);
delay(400);
saveFrame();

}

