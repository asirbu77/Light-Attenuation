int pwmPin0 = 11;
int pwmPin1 = 10;
int pwmPin2 = 9;
int pwmPin3 = 6;
int sensorValue;
float divide;
float values[100];
void setup() {
  Serial.begin(9600);
  pinMode(pwmPin0, OUTPUT);
  pinMode(pwmPin1, OUTPUT);
  pinMode(pwmPin2, OUTPUT);
  pinMode(pwmPin3, OUTPUT);
  int value = 5;
  analogWrite(pwmPin0, value);
  analogWrite(pwmPin1, value);
  analogWrite(pwmPin2, value);
  analogWrite(pwmPin3, value);
}

void loop() {
  for(int i=0; i<100;i++){
    sensorValue = analogRead(A0);
    values[i]=sensorValue;
  }
  for(int i=0; i<100;i++){
    divide = divide + values[i];
  }
  float outValue = divide / 1000;
  Serial.println(outValue);
  divide = 0;
  delay(100);
}
