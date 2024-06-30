#define FIREBASE_PROJECT_ID "smart-irrigation-v77nzz"
#define API_KEY "q7HrtzhZSlHH8vvuOhw9qrcQ10QJwD9FXA5yGevD"

#include <WiFi.h>
#include <Firebase_ESP_Client.h>
#include <LiquidCrystal.h>  // Include the library for LCD display
#include <FastLED.h>
#include <Arduino.h>
#include "DHT.h"
FirebaseAuth firebaseAuth;
FirebaseConfig firebaseConfig;
FirebaseData firebaseData;


const char *ssid = "Honor 7X"; // Wifi network name.
const char *pass = "Mo244466666";

#define LED_PIN 21
#define BRIGHTNESS 255
#define LED_TYPE WS2811
#define COLOR_ORDER GRB

const uint8_t kMatrixWidth = 16;
const uint8_t kMatrixHeight = 16;
const bool kMatrixSerpentineLayout = true;

#define NUM_LEDS (kMatrixWidth * kMatrixHeight)
#define MAX_DIMENSION ((kMatrixWidth > kMatrixHeight) ? kMatrixWidth : kMatrixHeight)

// The leds
CRGB leds[kMatrixWidth * kMatrixHeight];
bool ledStripOn = false;
// The 16 bit version of our coordinates
static uint16_t x;
static uint16_t y;
static uint16_t z;

uint16_t speed = 20;  // speed is set dynamically once we've started up
uint16_t scale = 30;  // scale is set dynamically once we've started up
uint8_t noise[MAX_DIMENSION][MAX_DIMENSION];

CRGBPalette16 currentPalette(PartyColors_p);
uint8_t colorLoop = 1;

#define DHTPIN 4
#define DHTTYPE DHT22

DHT dht(DHTPIN, DHTTYPE);
const int soilMoisturePin = 35;  // Analog pin for the soil moisture sensor
const int waterLevelPin = 34;    // Analog pin for the water level sensor
const int ledPin = 2;
bool Led_Pin = false;
// Constants for soil moisture thresholds
const int SOIL_MOISTURE_LOW = 50;   // Adjusted to match the 0-100 range
const int SOIL_MOISTURE_HIGH = 50;  // Adjusted to match the 0-100 range

const int pumpPin = 5;  // Change this to the actual pin connected to the DC pump on ESP32
int pumpState = LOW;    // Initialize pumpState to LOW (off)
int pumpMode = 0;       // 0 for automatic, 1 for manual
bool pump_on_off=true;
int waterLevel = 0;  // Water level indicator value
unsigned long previousMillis = 0;
const unsigned long interval = 1000;  // Interval in milliseconds

float mappedSoilMoisture = 0;  // Declare mappedSoilMoisture as a global variable

// Initialize the LCD object with the appropriate pins
const int rs = 12, en = 14, d4 = 27, d5 = 26, d6 = 25, d7 = 33 ; // rw=GND Define RW pin
LiquidCrystal lcd(rs, en, d4, d5, d6, d7); // Initialize LCD with RW pin

void setup() {
  Serial.begin(115200);
  Serial.print("Connecting With");
  Serial.println(ssid);
  WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("WiFi connected. IP:");
  Serial.println(WiFi.localIP());

  firebaseConfig.signer.test_mode = true;


  Firebase.reconnectWiFi(true);
  
  Firebase.begin(&firebaseConfig, &firebaseAuth);


  digitalWrite(pumpPin, LOW);
  pinMode(ledPin, OUTPUT);
  pinMode(pumpPin, OUTPUT);
  dht.begin();
  delay(3000);
  LEDS.addLeds<LED_TYPE, LED_PIN, COLOR_ORDER>(leds, 80);
  LEDS.setBrightness(BRIGHTNESS);

  // Initialize our coordinates to some random values
  x = random16();
  y = random16();
  z = random16();

  // Initialize the LCD
  lcd.begin(16, 2);
}

void loop() {
  updateLEDStrip();
  unsigned long currentMillis = millis();

  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;

    // Read soil moisture or water level based on the flag
    if (pumpMode == 0) {
      int soilSensorValue = analogRead(soilMoisturePin);
    
       Serial.print("soilSensor: ");

      Serial.println(soilSensorValue);
      mappedSoilMoisture = map(soilSensorValue, 0, 4095, 100, 0);
  
      autoControlPump(mappedSoilMoisture);  
      Serial.print("mapped_SoilMoisture: ");

      Serial.println(mappedSoilMoisture);                          // Automatically control the pump based on soil moisture if in automatic mode
    }

    // Read water level
    waterLevel = analogRead(waterLevelPin);
    Serial.print("waterLevel: ");
    Serial.println(waterLevel);
    if (waterLevel < 450) {
      waterLevel = 0;  // Set water level to 0 if below a threshold
    } else {
      waterLevel = map(waterLevel, 0, 4095, 0, 100);  // Map water level to 0-100
      Serial.print("map_waterLevel: ");
    Serial.println(waterLevel);
    }

    // Control LED
    controlLED(mappedSoilMoisture);

    // Read and send sensor data
    readAndSendSensorData();
    
    // Display sensor readings on LCD

  }
}

void displaySensorReadingsOnLCD(float temperature, float humidity) {
  lcd.clear();
  
  // Display temperature
  lcd.setCursor(0, 0);
  lcd.print("Temp: ");
  lcd.print(temperature);
  lcd.print(" C");

  // Display humidity
  lcd.setCursor(0, 1);
  lcd.print("Humidity: ");
  lcd.print(humidity);
  lcd.print(" %");
  delay(2500);

  // Display soil moisture
  lcd.clear(); // Clear the screen to display new data
  lcd.setCursor(0, 0);
  lcd.print("Soil: ");
  lcd.print(mappedSoilMoisture);
  lcd.print(" %");

  // Display water level
  lcd.setCursor(0, 1);
  lcd.print("Wat.Lev: ");
  lcd.print(waterLevel);
  lcd.print(" %");
  delay(2500);
}

void autoControlPump(float mappedSoilMoisture) {
  if (waterLevel < 30 || waterLevel < 20) {
    // Water level is too low, do not turn on the pump
    pumpState = LOW;
    digitalWrite(ledPin, LOW);
      pump_on_off=false;
  } else if (mappedSoilMoisture <= SOIL_MOISTURE_LOW) {
    // If soil moisture is below the threshold and water level is okay, turn the pump ON
    pumpState = HIGH;
     pump_on_off=true;
  } else if (mappedSoilMoisture >= SOIL_MOISTURE_HIGH) {
    // If soil moisture is above the threshold, turn the pump OFF
    pumpState = LOW;
     pump_on_off=false;

  }

  digitalWrite(pumpPin, pumpState);  // Update the pump state
}

void controlLED(float mappedSoilMoisture) {
  if (mappedSoilMoisture <= SOIL_MOISTURE_LOW) {
    digitalWrite(ledPin, HIGH);
    Serial.print("LED IS HIGH (TRUE)");
       Led_Pin = true;
  } else if (mappedSoilMoisture >= SOIL_MOISTURE_HIGH) {
    digitalWrite(ledPin, LOW);
    Serial.print("LED IS LOW (FALSE)");
       Led_Pin = false;
  }
}

void readAndSendSensorData() {
  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature();

  if (!isnan(humidity) && !isnan(temperature)) {
    Serial.print("temperature: ");
    Serial.println(temperature);
    Serial.print("humidity: ");
    Serial.println(humidity);
  } else {
    Serial.println(F("Failed to read from DHT sensor!"));
  }

  updateFirebase(temperature, humidity);
      displaySensorReadingsOnLCD( temperature, humidity);
}

void updateFirebase(float temperature, float humidity) {
  // booleanValue, doubleValue, integerValue, stringValue
  FirebaseJson content;
  String documentPath = "sensors/esp32";  // This collection/document must exist in firestore in order for `patchDocument` to work.
  content.clear();
  content.set("fields/temperature/doubleValue", temperature);
  content.set("fields/humidity/doubleValue", humidity);
  content.set("fields/soil_moisture/doubleValue", mappedSoilMoisture);
  content.set("fields/water_level/integerValue", waterLevel);
  content.set("fields/ledPin/booleanValue", Led_Pin);
  content.set("fields/pumpState/booleanValue", pump_on_off);
  content.set("fields/ledStripState/booleanValue", ledStripOn);

  if (Firebase.Firestore.patchDocument(&firebaseData, FIREBASE_PROJECT_ID, "(default)", documentPath.c_str(), content.raw(), "", "", "true")) {
    Serial.printf("ok\n%s\n\n", firebaseData.payload().c_str());
  } else {
    Serial.println(firebaseData.errorReason());
  }
}

void updateLEDStrip() {
  if (ledStripOn) {
    ChangePaletteAndSettingsPeriodically();
    fillnoise8();                  // Call the noise generation function
    mapNoiseToLEDsUsingPalette();  // Map the noise data to LEDs
    LEDS.show();                   // Show the LEDs
    // You may need to adjust the animation speed based on your preference
    delay(10);  // Delay between frames (adjust as needed)
  } else {
    // Turn off the LED strip
    fill_solid(leds, NUM_LEDS, CRGB::Black);
    LEDS.show();
  }
}

void fillnoise8() {
  uint8_t dataSmoothing = 0;
  if (speed < 50) {
    dataSmoothing = 200 - (speed * 4);
  }

  for (int i = 0; i < MAX_DIMENSION; i++) {
    int ioffset = scale * i;
    for (int j = 0; j < MAX_DIMENSION; j++) {
      int joffset = scale * j;

      uint8_t data = inoise8(x + ioffset, y + joffset, z);

      data = qsub8(data, 16);
      data = qadd8(data, scale8(data, 39));

      if (dataSmoothing) {
        uint8_t olddata = noise[i][j];
        uint8_t newdata = scale8(olddata, dataSmoothing) + scale8(data, 256 - dataSmoothing);
        data = newdata;
      }

      noise[i][j] = data;
    }
  }

  z += speed;

  x += speed / 8;
  y -= speed / 16;
}

void mapNoiseToLEDsUsingPalette() {
  static uint8_t ihue = 0;

  for (int i = 0; i < kMatrixWidth; i++) {
    for (int j = 0; j < kMatrixHeight; j++) {
      uint8_t index = noise[j][i];
      uint8_t bri = noise[i][j];

      if (colorLoop) {
        index += ihue;
      }

      if (bri > 127) {
        bri = 255;
      } else {
        bri = dim8_raw(bri * 2);
      }

      CRGB color = ColorFromPalette(currentPalette, index, bri);
      leds[XY(i, j)] = color;
    }
  }

  ihue += 1;
}

uint16_t XY(uint8_t x, uint8_t y) {
  uint16_t i;
  if (kMatrixSerpentineLayout == false) {
    i = (y * kMatrixWidth) + x;
  }
  if (kMatrixSerpentineLayout == true) {
    if (y & 0x01) {
      uint8_t reverseX = (kMatrixWidth - 1) - x;
      i = (y * kMatrixWidth) + reverseX;
    } else {
      i = (y * kMatrixWidth) + x;
    }
  }
  return i;
}

#define HOLD_PALETTES_X_TIMES_AS_LONG 1

void ChangePaletteAndSettingsPeriodically() {
  uint8_t secondHand = ((millis() / 1000) / HOLD_PALETTES_X_TIMES_AS_LONG) % 60;
  static uint8_t lastSecond = 99;

  if (lastSecond != secondHand) {
    lastSecond = secondHand;
    if (secondHand == 0) {
      currentPalette = RainbowColors_p;
      speed = 20;
      scale = 30;
      colorLoop = 1;
    }
    if (secondHand == 5) {
      SetupPurpleAndGreenPalette();
      speed = 10;
      scale = 50;
      colorLoop = 1;
    }
    if (secondHand == 10) {
      SetupBlackAndWhiteStripedPalette();
      speed = 20;
      scale = 30;
      colorLoop = 1;
    }
    if (secondHand == 15) {
      currentPalette = ForestColors_p;
      speed = 8;
      scale = 120;
      colorLoop = 0;
    }
    if (secondHand == 20) {
      currentPalette = CloudColors_p;
      speed = 4;
      scale = 30;
      colorLoop = 0;
    }
    if (secondHand == 25) {
      currentPalette = LavaColors_p;
      speed = 8;
      scale = 50;
      colorLoop = 0;
    }
    if (secondHand == 30) {
      currentPalette = OceanColors_p;
      speed = 20;
      scale = 90;
      colorLoop = 0;
    }
    if (secondHand == 35) {
      currentPalette = PartyColors_p;
      speed = 20;
      scale = 30;
      colorLoop = 1;
    }
    if (secondHand == 40) {
      SetupRandomPalette();
      speed = 20;
      scale = 20;
      colorLoop = 1;
    }
    if (secondHand == 45) {
      SetupRandomPalette();
      speed = 50;
      scale = 50;
      colorLoop = 1;
    }
    if (secondHand == 50) {
      SetupRandomPalette();
      speed = 90;
      scale = 90;
      colorLoop = 1;
    }
    if (secondHand == 55) {
      currentPalette = RainbowStripeColors_p;
      speed = 30;
      scale = 20;
      colorLoop = 1;
    }
  }
}

void SetupRandomPalette() {
  currentPalette = CRGBPalette16(
    CHSV(random8(), 255, 32),
    CHSV(random8(), 255, 255),
    CHSV(random8(), 128, 255),
    CHSV(random8(), 255, 255));
}

void SetupBlackAndWhiteStripedPalette() {
  fill_solid(currentPalette, 16, CRGB::Black);
  currentPalette[0] = CRGB::White;
  currentPalette[4] = CRGB::White;
  currentPalette[8] = CRGB::White;
  currentPalette[12] = CRGB::White;
}

void SetupPurpleAndGreenPalette() {
  CRGB purple = CHSV(HUE_PURPLE, 255, 255);
  CRGB green = CHSV(HUE_GREEN, 255, 255);
  CRGB black = CRGB::Black;

  currentPalette = CRGBPalette16(
    green, green, black, black,
    purple, purple, black, black,
    green, green, black, black,
    purple, purple, black, black);
}
