#include <FastLED.h>
#define NUM_LEDS 5 //Anzahl LED
#define DATA_PIN 6 //Signal Pin
CRGB leds[NUM_LEDS]; //Speicherblock(Array) zum speichern/aendern der LED Daten. MUSS VIELFACHES VON 4 SEIN (4 Ampeln pro Kreuzung)
byte numberIntersections = sizeof(leds)/4; //Eventuell nicht mit liste oben kompatible, muss man sonst manuell machen
byte activeLED[numberIntersections];
byte oldLED[numberIntersections];



void setup() {
    FastLED.addLeds<WS2812B, DATA_PIN>(leds, NUM_LEDS); //LED Typ (WS2812B), Signalpin, Speicherarray, Anzahl LED
    for (byte i = 0; i< numberIntersections; i++){
        oldLED[i] = 0;
    }
}


void loop() {
    for(byte i = 0; i< numberIntersections; i++){
        activeLED[i] = random(4);
    
        if (oldLED[i] != activeLED[i]) {
            for(byte j = i; j < 4*i+4; j++){
                if(j == oldLED[i]+4*i || j == activeLED[i]+4*i){
                    leds[j] = CRGB::Yellow;
                }
                else{
                    leds[j] = CRGB::Red;
                }
            }
                
        }
    }
    FastLED.show();
    delay(1500);
    for(byte i = 0; i< numberIntersections; i++){ {
        for(byte j = i; j < 4*i+4; j++){
            if(j == activeLED[i]+4*i){
                leds[j] = CRGB::Green;
            } else{
                leds[j] = CRGB::Red;
            }
        }
    }    
    FastLED.show();
    oldLED[] = activeLED[];
    delay(10000);
}
