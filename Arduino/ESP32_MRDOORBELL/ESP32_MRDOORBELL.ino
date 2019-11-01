#include <WiFi.h>
#include <BluetoothSerial.h>
#include "FirebaseESP32.h"

#define LED 2
#define BUTTON 0

FirebaseData firebaseData;
int icount = 0;
unsigned long int ticks = millis();
BluetoothSerial bluetooth;
String wifi_ssid, wifi_password;
String bt_buffer = "";
bool is_ready = false;

void setup() {
  bluetooth.begin("MRDoorbell");
  pinMode(LED, OUTPUT);
  pinMode(BUTTON, OUTPUT);
  digitalWrite(BUTTON, LOW);
  digitalWrite(LED, LOW);   
  pinMode(BUTTON, INPUT_PULLUP);  
}

void loop() {  
  if (bluetooth.available() > 0) {
    WiFi.disconnect();
    bluetooth_routine();
  }
  else {
    if(WiFi.status() == WL_CONNECTED) {
      digitalWrite(LED, HIGH);
      wifi_routine();
    }
    else {
      digitalWrite(LED, LOW);
    }
    if (is_ready && WiFi.status() != WL_CONNECTED) {
      WiFi.begin(wifi_ssid.c_str(), wifi_password.c_str());
      delay(3000);
      Firebase.begin("notification-mrdoorbell.firebaseio.com", "ib5XtNzqaEBlWfqfBSpx5MxjkFuwOvc8L3vin3gB");
      Firebase.reconnectWiFi(true);
      Firebase.setMaxRetry(firebaseData, 3);
      Firebase.setMaxErrorQueue(firebaseData, 30);
      Firebase.enableClassicRequest(firebaseData, true);       
    }
  }
}

void wifi_routine() {
  String str;
  if (millis() - ticks >= 1000) {
    if (digitalRead(BUTTON) == LOW) {
      ticks = millis();
      icount++;
      str = "Picture " + String(icount);      
      FirebaseJson j;
      j.set("name", str);        
      Firebase.pushJSON(firebaseData, "/pictures", j);
      delay(1000);      
    }
  }
}

void bluetooth_routine() {
  bt_buffer += static_cast<char>(bluetooth.read());
  int check = bt_buffer.indexOf("EFLAG");
  
  if (check != -1) {    
    String token = ";;";
    String str = bt_buffer.substring(0, check);
    bt_buffer = "";   
    if (str.startsWith("WIFI")) {
      wifi_ssid = str.substring(String("WIFI").length(), str.indexOf(token));       
      wifi_password = str.substring(str.indexOf(token) + token.length());      
    }
  }
  if (wifi_ssid.length() > 0 && wifi_password.length() > 0){
    is_ready = true;
  }
  delay(1);
}
