int fsrPin = 0;     // the FSR and 10K pulldown are connected to a0
int fsrReading;     // the analog reading from the FSR resistor divider
int ledPin = 13;
int fsrReading;
int averageReadings[10];
int arrayIndex = 0;
int currentWeightReading;
int arrayTotal;
  for (int initialValues = 0; initialValues < 10; initialValues ++) {
    averageReadings[initialValues] = 0;
  }


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.begin(9600);   
  pinMode(ledPin, OUTPUT);
  
}

void loop() {
  fsrReading = analogRead(fsrPin); 
  if (fsrReading != 0 ) {
    arrayTotal -= averageReadings[arrayIndex]
    averageReadings[arrayIndex] = fsrReading;
    arrayTotal += averageReadings[arrayIndex]
    arrayIndex ++;
    currentWeightReading = arrayTotal/10;
    Serial.println(currentWeightReading)
  }
}
