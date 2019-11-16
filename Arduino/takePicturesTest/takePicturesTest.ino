#include <BluetoothSerial.h>

#define BUTTON 0

BluetoothSerial bluetooth;
unsigned long int ticks = millis();
uint8_t p[] = "";
int icount = 0;
char caracter;

BluetoothSerial SerialBT;

void setup() {  
  pinMode(BUTTON, INPUT_PULLUP);  
  digitalWrite(BUTTON, LOW);
  Serial.begin(9600);
  bluetooth.begin("tantofaz"); //Bluetooth device name
}

void loop() {
  if (millis() - ticks >= 1000) {
    if (digitalRead(BUTTON) == LOW) {
      ticks = millis();
      caracter = '0' + icount;
      p[0] = caracter;
      p[1] = '\r';
      p[2] = '\n';
      SerialBT.write(p[0]);
      SerialBT.write(p[1]);
      SerialBT.write(p[2]);      
      icount++;
      delay(1000);      
    }
  }
}
