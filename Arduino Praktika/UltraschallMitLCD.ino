#include <Wire.h>
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27,20,4);

void setup() {
  lcd.backlight();
  lcd.init();
  lcd.setCursor(0,0);
  lcd.print("Das naechste Objekt");   //Text einmal hinschreiben, damit das nicht jeden Durchlauf gemacht werden muss.
  lcd.setCursor(0,1);
  lcd.print("befindet sich in");
  #define trigger 3                   //Ein- & Augang für Ultraschall als Konstanten
  #define echo 2
  digitalWrite(trigger, LOW);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  float entfernung = 0;
  long zeit = 0;
  noInterrupts();                   //Da der Ultraschallsensor zeitkritisch ist, werden interupts deaktiviert
  digitalWrite(trigger, LOW);
  delayMicroseconds(5);             //erst sichergehen dass der Ultraschallsensor stumm ist, dann einen 10msec Impuls aussenden.
  digitalWrite(trigger, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigger, LOW);
  zeit = pulseIn(echo, HIGH);       //einen Moment warten in der Hoffnung, dass die Wellen irgendwo reflektiert wurden
  entfernung = (zeit/2) * 0.03435;  //aus Wartezeit Entfernung berechnen 
  interrupts();                         // durch 2, da der Schall den Weg hin und zurück läuft; mal 0.034535 da etwa Schallgeschwindigkeit
  lcd.backlight();
  lcd.setCursor(0,2);
  lcd.print("                    ");
  lcd.setCursor(0,2);
  lcd.print(int(entfernung));
  lcd.print("cm");
  Serial.print(zeit);
  Serial.print("    ");
  Serial.println(entfernung);
  delay(1000);

}
