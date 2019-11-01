/******************************************************************************
 * Copyright 2018 Google
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *****************************************************************************/
// This file contains your configuration used to connect to Cloud IoT Core

// Wifi newtork details.
const char *ssid = "ZenFuturo 2.4G";
const char *password = "zenfuturo777";

// Cloud iot details.
const char *project_id = "notification-mrdoorbell";
const char *location = "us-central1";
const char *registry_id = "picture-station-registry";
const char *device_id = "my-esp32-device";

// Configuration for NTP
const char* ntp_primary = "pool.ntp.org";
const char* ntp_secondary = "time.nist.gov";

#ifndef LED_BUILTIN
#define LED_BUILTIN 13
#endif

// To get the private key run (where private-key.pem is the ec private key
// used to create the certificate uploaded to google cloud iot):
// openssl ec -in <private-key.pem> -noout -text
// and copy priv: part.
// The key length should be exactly the same as the key length bellow (32 pairs
// of hex digits). If it's bigger and it starts with "00:" delete the "00:". If
// it's smaller add "00:" to the start. If it's too big or too small something
// is probably wrong with your key.
const char *private_key_str =
    "fd:bf:32:c3:9c:d7:c7:f3:0f:c0:88:53:04:3c:59:"
    "8b:a2:ac:df:ab:74:91:f5:3b:0e:67:b8:25:8f:71:"
    "bd:1a";    

// Time (seconds) to expire token += 20 minutes for drift
const int jwt_exp_secs = 3600; // Maximum 24H (3600*24)

// To get the certificate for your region run:
//   openssl s_client -showcerts -connect mqtt.googleapis.com:8883
// for standard mqtt or for LTS:
//   openssl s_client -showcerts -connect mqtt.2030.ltsapis.goog:8883
// Copy the certificate (all lines between and including ---BEGIN CERTIFICATE---
// and --END CERTIFICATE--) to root.cert and put here on the root_cert variable.

const char *root_cert =
    "-----BEGIN CERTIFICATE-----\n"
    "MIIDfDCCAmSgAwIBAgIJAJB2iRjpM5OgMA0GCSqGSIb3DQEBCwUAME4xMTAvBgNV\n"
    "BAsMKE5vIFNOSSBwcm92aWRlZDsgcGxlYXNlIGZpeCB5b3VyIGNsaWVudC4xGTAX\n"
    "BgNVBAMTEGludmFsaWQyLmludmFsaWQwHhcNMTUwMTAxMDAwMDAwWhcNMzAwMTAx\n"
    "MDAwMDAwWjBOMTEwLwYDVQQLDChObyBTTkkgcHJvdmlkZWQ7IHBsZWFzZSBmaXgg\n"
    "eW91ciBjbGllbnQuMRkwFwYDVQQDExBpbnZhbGlkMi5pbnZhbGlkMIIBIjANBgkq\n"
    "hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzWJP5cMThJgMBeTvRKKl7N6ZcZAbKDVA\n"
    "tNBNnRhIgSitXxCzKtt9rp2RHkLn76oZjdNO25EPp+QgMiWU/rkkB00Y18Oahw5f\n"
    "i8s+K9dRv6i+gSOiv2jlIeW/S0hOswUUDH0JXFkEPKILzpl5ML7wdp5kt93vHxa7\n"
    "HswOtAxEz2WtxMdezm/3CgO3sls20wl3W03iI+kCt7HyvhGy2aRPLhJfeABpQr0U\n"
    "ku3q6mtomy2cgFawekN/X/aH8KknX799MPcuWutM2q88mtUEBsuZmy2nsjK9J7/y\n"
    "hhCRDzOV/yY8c5+l/u/rWuwwkZ2lgzGp4xBBfhXdr6+m9kmwWCUm9QIDAQABo10w\n"
    "WzAOBgNVHQ8BAf8EBAMCAqQwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMC\n"
    "MA8GA1UdEwEB/wQFMAMBAf8wGQYDVR0OBBIEELsPOJZvPr5PK0bQQWrUrLUwDQYJ\n"
    "KoZIhvcNAQELBQADggEBALnZ4lRc9WHtafO4Y+0DWp4qgSdaGygzS/wtcRP+S2V+\n"
    "HFOCeYDmeZ9qs0WpNlrtyeBKzBH8hOt9y8aUbZBw2M1F2Mi23Q+dhAEUfQCOKbIT\n"
    "tunBuVfDTTbAHUuNl/eyr78v8Egi133z7zVgydVG1KA0AOSCB+B65glbpx+xMCpg\n"
    "ZLux9THydwg3tPo/LfYbRCof+Mb8I3ZCY9O6FfZGjuxJn+0ux3SDora3NX/FmJ+i\n"
    "kTCTsMtIFWhH3hoyYAamOOuITpPZHD7yP0lfbuncGDEqAQu2YWbYxRixfq2VSxgv\n"
    "gWbFcmkgBLYpE8iDWT3Kdluo1+6PHaDaLg2SacOY6Go=\n"
    "-----END CERTIFICATE-----\n";

// In case we ever need extra topics
const int ex_num_topics = 0;
const char* ex_topics[ex_num_topics];
//const int ex_num_topics = 1;
//const char* ex_topics[ex_num_topics] = {
//  "/devices/my-device/tbd/#"
//};
