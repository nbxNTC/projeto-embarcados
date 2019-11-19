#include <WiFi.h>
#include <BluetoothSerial.h>
#include "FirebaseESP32.h"

#define LED 2
#define BUTTON 0


FirebaseData firebaseData;
int icount = 0;
unsigned long int ticks = millis();
BluetoothSerial bluetooth;
String wifi_ssid ,wifi_password;
String bt_buffer = "";
bool is_ready = false;

void setup() {
  Serial.begin(115200);
  pinMode(BUTTON, OUTPUT);
  digitalWrite(BUTTON, LOW);
  pinMode(LED, OUTPUT);
  digitalWrite(LED, LOW);
  bluetooth.begin("MRDoorbell");  
}

void loop() {
  
  if (bluetooth.available() > 0 && WiFi.status() != WL_CONNECTED) {
    WiFi.disconnect();
    bluetooth_routine();
  }
  else {
    if(WiFi.status() == WL_CONNECTED) {
      digitalWrite(LED, HIGH);
      main_routine();
    }
    else {
      digitalWrite(LED, LOW);
      Serial.println("wifi not connected!");
    }
    if (is_ready && WiFi.status() != WL_CONNECTED) {
      Serial.println("Should only execute once");
      WiFi.begin(wifi_ssid.c_str(), wifi_password.c_str());
      delay(3000);
      Firebase.begin("notification-mrdoorbell.firebaseio.com", "cWYqpQUaFyKHfCBhlrD2ofPvByUDurFawFGgEBJQ");
      Firebase.reconnectWiFi(true);
      Firebase.setMaxRetry(firebaseData, 3);
      Firebase.setMaxErrorQueue(firebaseData, 30);
      Firebase.enableClassicRequest(firebaseData, true);
      wifi_ssid.remove(0, wifi_ssid.length());
      wifi_password.remove(0, wifi_password.length());
      is_ready = false;
      pinMode(BUTTON, INPUT_PULLUP);
    }
  }
}

void main_routine() {
  String str;
  if (millis() - ticks >= 250) {
    if (digitalRead(BUTTON) == LOW && bluetooth.isReady() && bluetooth.connected()) {
      Serial.println("CLICK");
      ticks = millis();
      String msg = String(++icount) + String("\r\n");
      bluetooth.write(reinterpret_cast<const uint8_t*>(msg.c_str()), msg.length() - 1);
      str = "Image " + String(icount);
      FirebaseJson j;
      j.set(String(icount), str);
      Serial.println("Begin");
//      Firebase.pushJSON(firebaseData, "/pictures", j);
      Serial.println("End");      
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
    if (str.startsWith("EMAIL")) {
      //email stuff
    }    
  }
  if (wifi_ssid.length() > 0 && wifi_password.length() > 0){
    is_ready = true;
  }
  else {
    is_ready = false;
  }
  delay(1);
}
