#include <BluetoothSerial.h>
#include <string>
#include <WiFi.h>

using std::string;

void BluetoothRoutine();
void WifiRoutine();
bool WifiConnect(const char*,const char*);

BluetoothSerial bluetooth;
int serialreadmode = 0; //0 for none, 1 for wifi name and 2 for wifi password
string check = "00000";
string wifiname;
string wifipass;
bool tryconnection = false;

void setup() {
  Serial.begin(9600);
  bluetooth.begin("MRDoorbell"); //Bluetooth device name
}

void loop() {
  if (bluetooth.available() > 0) {
    BluetoothRoutine();
  }
  else{
    if (tryconnection == true) {
      WifiConnect(wifiname.c_str(),wifipass.c_str());
      wifiname.clear();//may crash, use another var
      wifipass.clear();//may crash, use another var
      tryconnection = false;
    }
    if(WiFi.status() == WL_CONNECTED) {
      WifiRoutine();
    }
  }
}

bool WifiConnect(const char *ssid,const char *password) {
  WiFi.begin(ssid, password);
  delay(2000);
}

void WifiRoutine() {
  Serial.println("Spamming the serial monitor");
  delay(10);
}

void BluetoothRoutine() {
  char c = static_cast<char>(bluetooth.read());
  check = check.append(1,c).substr(1, 5);
  switch (serialreadmode) {
    case 1:
      wifiname.append(1,check.at(4));
    break;
    case 2:
      wifipass.append(1,check.at(4));
    break;
    default:
    break;
  }
  if (check.compare("NFLAG") == 0){
    serialreadmode = 1;
  }
  if (check.compare("PFLAG") == 0){
    serialreadmode = 2;
    wifiname.replace(wifiname.length() - 5, 5, "");
  }
  if (check.compare("EFLAG") == 0){
    serialreadmode = 0;
    wifipass.replace(wifipass.length() - 5, 5, "");
    tryconnection = true;
  }
  delay(1);
}
