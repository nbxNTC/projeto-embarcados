#include "WiFi.h"

void setupWifi(const char *ssid, const char *password) {
    Serial.println("Starting Wi-Fi...");
    WiFi.begin(ssid, password);
    Serial.println("Connecting to Wi-Fi...");
    while (WiFi.status() != WL_CONNECTED) {
        delay(100);
    }
    Serial.println("Connected to Wi-Fi."); 
}

void disconnectWifi() {
    Serial.println("Disconnecting to Wi-Fi..."); 
    WiFi.disconnect();    
    Serial.println("Disconnected to Wi-Fi."); 
}
