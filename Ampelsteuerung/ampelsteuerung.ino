

//*********************************************************
//AMT Ampelsteuerung                                        
//Autoren: Lars Leferenz, Tobias Scholz, Sebastian Adler
//Stand: 29.06.2020 18:21
//*********************************************************


#include "FastLED.h" //getestet für v3.3


//Einstellungen:------------------------------------------------------------------------------------------
#define DATA_PIN 0  //Pin für Steuerkabel 
#define BRIGHTNESS 255 //Helligkeit
const byte numberIntersections = 1; // Anzahl der Kreuzungen
const int gelbPhase = 2000; //Dauer der Gelb-Phase in ms
const int gruenPhase = 5000; //Dauer der Grün-Phase in ms
const byte maxRotDauer = 6; //Maximale Anzahl die eine Kreuzung hintereinander Rot sein darf. Größer als 4 pls.
//--------------------------------------------------------------------------------------------------------


//Nicht verändern
const byte NUM_LEDS = 4 * numberIntersections; //Anzahl LED
CRGB leds[NUM_LEDS]; //Speicherblock(Array) zum speichern/aendern der LED Daten. MUSS VIELFACHES VON 4 SEIN (4 Ampeln pro Kreuzung)
byte lastGreen[NUM_LEDS];
byte activeLED[numberIntersections];
byte oldLED[numberIntersections];
boolean tooLongRed = false;


void setup() {
  FastLED.addLeds < NEOPIXEL, DATA_PIN > (leds, NUM_LEDS); //LED Typ (WS2812B), Signalpin, Speicherarray, Anzahl LED
  Serial.begin(9600);
}


void loop() {
  
  for (byte i = 0; i < numberIntersections; i++) {//Iteriere durch Kreuzungen
  
    Serial.print("Kreuzung:");
    Serial.println(i);
    for (byte k = 4 * i; k < 4 * i + 4; k++){ //Überprüfe jede Ampel ob sie 6x hintereinander rot war
    
      if (lastGreen[k] >= maxRotDauer && !tooLongRed) {
       
        activeLED[i] = k - 4 * i;
        tooLongRed = true;
        Serial.print("Too Long Red:");
        Serial.println(k); 
      }
    }
    if (!tooLongRed) {//Wenn nicht zu lange Rot, würfeln
    
      while (oldLED[i] == activeLED[i]){ //würfel bis neue Ampel (Nicht 2x hintereinander grün)
      
        activeLED[i] = random(4);
        Serial.print("Neue Active:");
        Serial.println(activeLED[i]);

      }
    }
    for (byte j = 4 * i; j < 4 * i + 4; j++) {
      
      if (j == oldLED[i] + 4 * i || j == activeLED[i] + 4 * i) {//Setze alte und neue Ampel auf Gelb, Rest auf Rot
        
        Serial.print("Gelb:");
        Serial.println(j);
        leds[j] = CRGB::Yellow;

      } else {

        Serial.print("Rot:");
        Serial.println(j);
        leds[j] = CRGB::Red;

      }
    }
  }

  Serial.println("Show");
  FastLED.show();
  delay(gelbPhase);

  for (byte i = 0; i < numberIntersections; i++){ //Iteriere durch Kreuzungen
  
    for (byte j = 4 * i; j < 4 * i + 4; j++) {//Setze neue auf Grün und verändere lastGreen[]
    
      if (j == activeLED[i] + 4 * i) {
        
        leds[j] = CRGB::Green;
        lastGreen[j] = 0;

      } else {
        
        leds[j] = CRGB::Red;
        lastGreen[j]++;
      }
    }
  }
  for (byte i = 0; i < numberIntersections; i++) {
    oldLED[i] = activeLED[i];
  }
  
  tooLongRed = false;
  FastLED.show();
  delay(gruenPhase);
}