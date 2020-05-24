#include <Wire.h>
#include <Servo.h>
#include <LiquidCrystal_I2C.h>
//-----Hardware Adressierung-----
//Bei falscher Funktion bitte obere Zeile auskommentieren,
//und untere Zeile freigeben
LiquidCrystal_I2C lcd(0x27,20,4);
//LiquidCrystal_I2C lcd(0x3F,20,4);
Servo motor; // erstellt ein Servo-Objekt um einen Servomotor zu steuern
int val = 0;

void setup(){
  motor.attach(8); // verknüpft den Servomotor an Pin 9 mit dem Servo-Objekt
  lcd.init();
}

void loop(){
  val = val + 30; //Incrementierung um gewünschten Winkel (30°) btw. Warum eigentlich in 30° Schritten, dieses Ruckeln nerft ein bisschen.
  if(val == 180) {
    val = -1 * val; //Negation, damit der Betrag in Folge sinkt
  }
  motor.write(abs(val)); // überträgt die Zielposition an den Servomotors
  lcd.backlight();
  //Nachricht ausgeben
  lcd.setCursor(0,0);
  lcd.print("Der aktuelle Wert");
  lcd.setCursor(0,1);
  lcd.print("ist :");
  lcd.setCursor(0,2);
  lcd.print("   ");
  lcd.setCursor(0,2);
  lcd.print(abs(val));
  delay(500);
}
