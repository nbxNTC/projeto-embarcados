#include "wifi_config.h"
#include <BluetoothSerial.h>

#define LED 2
#define BUTTON 0

// WIFI VARIABLES
String ssid = "";
String password = "";

// BLUETOOTH VARIABLES
BluetoothSerial bluetooth;
String bt_buffer = "";
bool isNotEmpty = false;

void setup() {
    // SERIAL DEBUG
    Serial.begin(9600);    
    // BLUE LED
    pinMode(LED, OUTPUT);
    digitalWrite(LED, LOW);
    // BUTTON
    pinMode(BUTTON, INPUT);
    // STARTING BLUETOOTH
    bluetooth.begin("MRDoorbell");
}

void loop() {
    // BLUETOOTH CONNECTION
    if (bluetooth.available() > 0)
      connectBluetooth();
    else {
      if(isNotEmpty && WiFi.status() != WL_CONNECTED) {        
        disconnectWifi();
        setupWifi(ssid.c_str(), password.c_str());
        delay(1000);      
      }
    }    
    // WIFI STATUS
    if (WiFi.status() == WL_CONNECTED)
        digitalWrite(LED, HIGH);     
    else  
        digitalWrite(LED, LOW);         
    if (digitalRead(BUTTON) == LOW)
        disconnectWifi();
}

void connectBluetooth() {
  // READING FROM SERIAL BLUETOOTH
  bt_buffer += static_cast<char>(bluetooth.read());
  // FLAG TO CHECK THE INPUT MODEL
  int end_flag = bt_buffer.indexOf("EFLAG");  
  if (end_flag != -1) {    
    String token = ";;";
    String str = bt_buffer.substring(0, end_flag);
    bt_buffer = "";   
    if (str.startsWith("WIFI")) {
      ssid = str.substring(String("WIFI").length(), str.indexOf(token));    
      password = str.substring(str.indexOf(token) + token.length());       
    }     
  }
  if (ssid.length() > 0 && password.length() > 0)
    isNotEmpty = true;    
  else
    isNotEmpty = false;
}
