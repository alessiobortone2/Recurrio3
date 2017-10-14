/* FSR simple testing sketch.  <br>Connect one end of FSR to power, the other end to Analog 0.
Then connect one end of a 10K resistor from Analog 0 to ground 
*/
int fsrPin = 0;     // the FSR and 10K pulldown are connected to a0
int fsrReading;     // the analog reading from the FSR resistor divider
int ledPin = 13;

const int numReadings = 10;

int readings[numReadings];
int readIndex = 0;
int total = 0;
int average = 0;
int flag = 0;

String readString;

void setup(void) {
  Serial.begin(9600);   
  pinMode(ledPin, OUTPUT);
  for (int thisReading = 0; thisReading < numReadings; thisReading++) {
    readings[thisReading] = 0;
  }
}
 
void loop(void) {

  if (fsrReading == 0 && flag == 0) {
    Serial.print("Please add a product");
    flag = 1;
  }
  fsrReading = analogRead(fsrPin);  

  total = total - readings[readIndex];

  readings[readIndex] = fsrReading;

  total = total + readings[readIndex];
  readIndex = readIndex + 1;

  if (readIndex >= numReadings) {
    readIndex = 0;
  }

  if (fsrReading != 0) {
  average = total / numReadings;
  }
//  Serial.print(fsrReading);

  if(average > 0 && average <= 100 && fsrReading != 0) {
  Serial.println(100);
  delay(1000);
  flag = 0;
  }
   if(average > 100 && average <= 200 && fsrReading != 0) {
  Serial.println(200);
  delay(1000);
  flag = 0;
  }
    if(average > 200 && average <= 300 && fsrReading != 0) {
  Serial.println(300);
  delay(1000);
  flag = 0;
  }
  if(average > 300 && average <= 400 && fsrReading != 0) {
  Serial.println(400);
  delay(1000);
  flag = 0;
  }
  if(average > 400 && average <= 500 && fsrReading != 0) {
  Serial.println(500);
  delay(1000);
  flag = 0;
  }
  if(average > 500 && average <= 600 && fsrReading != 0) {
  Serial.println(600);
  delay(1000);
  flag = 0;
  }
  if(average > 600 && average <= 700 && fsrReading != 0) {
  Serial.println(700);
  delay(1000);
  flag = 0;
  }
  if(average > 700 && average <= 800 && fsrReading != 0) {
  Serial.println(800);
  delay(1000);
  flag = 0;
  }
  if(average > 800 && average <= 900 && fsrReading != 0) {
  Serial.println(900);
  delay(1000);
  flag = 0;
  }
    if(average > 900 && average <= 1000 && fsrReading != 0) {
  Serial.println(1000);
  delay(1000);
  flag = 0;
  }
}

/*
  if(Serial.available()>0) {
    delay(3);
    char c = Serial.read();
    readString+= c;
  }
  if (readString.length() >0) {
    Serial.println(readString);
    if (readString == "1")
    {
      digitalWrite(ledPin, HIGH); 
    }
    if (readString == "0")
    {
      digitalWrite(ledPin, LOW);
    }
  readString="";
  }
*/

/*
  Serial.print("Analog reading = ");
  Serial.print(fsrReading);     // the raw analog reading
 
  if (fsrReading == 0) {
    Serial.println(" - No pressure");
  } else if (fsrReading < 10) {
    Serial.println(" - Light touch");
  } else if (fsrReading < 50) {
    Serial.println(" - Light squeeze");
  } else if (fsrReading < 150) {
    Serial.println(" - Medium squeeze");
  } else {
    Serial.println(" - Big squeeze");
  }
  delay(1000);
*/


/* FSR testing sketch.
Connect one end of FSR to 5V, the other end to Analog 0.
Then connect one end of a 10K resistor from Analog 0 to ground
Connect LED from pin 13 through a resistor to ground 


int fsrAnalogPin = 0; // FSR is connected to analog 0
int LEDpin = 13;      // connect Red LED to pin 11 (PWM pin)
int fsrReading;      // the analog reading from the FSR resistor divider
int LEDbrightness;
 
void setup(void) {
  Serial.begin(9600);   // We'll send debugging information via the Serial monitor
  pinMode(LEDpin, OUTPUT);
}
 
void loop(void) {
  fsrReading = analogRead(fsrAnalogPin);
  Serial.print("Analog reading = ");
  Serial.println(fsrReading);
 
  // we'll need to change the range from the analog reading (0-1023) down to the range
  // used by analogWrite (0-255) with map!
  LEDbrightness = map(fsrReading, 0, 1023, 0, 255);
  // LED gets brighter the harder you press
  analogWrite(LEDpin, LEDbrightness);
 
  delay(100);
}
*/
