//*********************************************************
//AMT Zielfuhrendes-fahren
//Autoren: Lars Leferenz, Tobias Scholz, Sebastian Adler
//Stand: 21.09.2020 14:05
//*********************************************************

#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include "Adafruit_MCP23008.h"
#include <Adafruit_BusIO_Register.h>
#include <Adafruit_I2CDevice.h>
#include <Adafruit_I2CRegister.h>
#include <Adafruit_SPIDevice.h>

LiquidCrystal_I2C lcd(0x27,20,4);
Adafruit_MCP23008 mcp;
const uint8_t BT0 = 0; // LED an GPIO_A0
const uint8_t BT1 = 1; // Taster an GPIO_B0
const uint8_t ADDRESS = 0; // Adresse des MCP, Einstellen mit A0, A1, A2


byte linksvor = 9;                           //AMT Konfiguration
byte rechtsvor = 7;
byte linksruck= 8;
byte rechtsruck = 6;
                                               
#define ML A1
#define MR A2
#define AL A0
#define AR A3

byte MLWert ;
byte MRWert ;
byte ALWert ;
byte ARWert ;

bool knopfrechts = 1;
bool knopflinks = 1 ;

int blinkerFreq = 200;
int currentBlinker = 0;
byte blinkerSign = 1;
byte blinkerOn; // 0 = aus, 1 = links, an 2= rechts an

byte start = 255;
char startChar;
byte ziel = 255;
char zielChar;
byte direction = 255;  
String directions[] = {"Von unten","Von links","Von oben","Von rechts"};
char orteChar[] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s'};
byte ortelength = 19;
byte weg[10];      //Streckenplan, 0 = Geradeaus ; 1 = Links ; 2 = Rechts
byte size = 10;                              //Größe des Arrays, size() hat irgendwie nicht richtig funktioniert
byte index = 0;

     //1 nach oben, 2 nach rechts, ....  

byte cross = 18;
              //Die Map: Jede Kreuzung eine Spalte; nullte Zeile Name der Kreuzung; erste bis vierte Zeile Name der Nachbar Kreuzung, Reihenfolge oben, rechts, unten, links; fünfte Zeile Distanz zum Ziel
char maps[19][7] = {"a!bc!9","b!gca9","cb!ga9","def!!9","echfd9","fei!d","g!khb9","hgkie9","ih!jf9","jno!i",
                    "k!mhg","lp!m!9","mlqnk9","n!moj9","onr!j9","p!!ql9","qpsrm9","rqs!o","sq!r!9"};


void setup() {
    lcd.init();
    lcd.backlight();


    pinMode(linksvor,OUTPUT);
    pinMode(rechtsvor,OUTPUT);
    pinMode(linksruck,OUTPUT);
    pinMode(rechtsruck,OUTPUT);

    pinMode(ML,INPUT);
    pinMode(MR,INPUT);
    pinMode(AL,INPUT);
    pinMode(AR,INPUT);

    mcp.begin(ADDRESS);      // use default address 0
    mcp.pinMode(BT0, INPUT);
    mcp.pinMode(BT1, INPUT);
    mcp.pullUp(0, HIGH);
    Serial.begin(9600);

    //  while(true){
    //          //updateButtons();
    //          //Serial.print(mcp.digitalRead(BT0));  
    //          Serial.print(mcp.digitalRead(BT1));  
    //    }

    
    

    getDestUI();
    startChar = orteChar[start];
    zielChar = orteChar[ziel];
    fill2(ziel);
    rout();

    lcd.clear();
    lcd.setCursor(0,1);
    lcd.print(F("   ---       ---   "));
    lcd.setCursor(0,2);
    lcd.print(F("  | o |     | o | "));
    lcd.setCursor(0,3);
    lcd.print(F("   ---       ---   "));
}

void getDestUI(){                       //"UI" zum eingeben des Start/Ziel
    
    
    lcd.setCursor(0,0);
    lcd.print(F("-----Wilkommen------"));
    lcd.setCursor(0,1);
    lcd.print(F("Wandere mit Links <"));
    lcd.setCursor(0,2);
    lcd.print(F("Waehle mit Rechts >"));
    lcd.setCursor(0,3);
    lcd.print(F("Bestaetige..."));
    while(knopfrechts == 1){
        updateButtons();
        //Serial.println(knopfrechts);
        //Serial.println(knopflinks);
    }
    while(start == 255){
        start = getOrt(0,true);
    }
    while(ziel == 255){
        ziel = getOrt(0,false);
    }
    while(direction == 255){
        direction = getDirection(0);
    }
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print(F("Abbruch/Bestaetige:"));
    lcd.setCursor(0,1);
    lcd.print(F("Kreuzung-"));
    lcd.setCursor(9,1);
    lcd.print((char) toupper(orteChar[start]));
    lcd.setCursor(0,2);
    lcd.print(directions[direction-1]+" --->");
    lcd.setCursor(0,3);
    lcd.print(F("Kreuzung-"));
    lcd.setCursor(9,3);
    lcd.print((char) toupper(orteChar[ziel]));

    while(knopfrechts==0 || knopflinks == 0){
        updateButtons();
    }
    while(knopflinks == 1 && knopfrechts== 1){
        updateButtons();
    }
    if(knopflinks==0){
        getDestUI();
    }else{
        lcd.clear();
    }
}

void updateButtons(){
    knopfrechts = updateButtonsDebounce(BT0,255);
    knopflinks = updateButtonsDebounce(BT1,255);
}
bool updateButtonsDebounce(uint8_t BT,byte debounce){
    //Serial.println(BT);
    //Serial.println(mcp.digitalRead(BT)==1);
    bool high = false;
    for(byte i = 0; i<debounce;i++){
        if (mcp.digitalRead(BT)==1){
            high = true;
            break;
        }
    }
    return high;
}
byte getOrt(byte lowestOrt,bool start){                      //Rekusive Funktion zur Auswahl des Ortes
    updateButtons();
    while(knopfrechts==0 || knopflinks == 0){
        updateButtons();
    }
    lcd.clear();
    lcd.setCursor(0,0);
    if(start){
        lcd.print(F("Waehle den Start:"));
    }else{
        lcd.print(F("Waehle das Ziel:"));
    }
    lcd.setCursor(0,2);
    lcd.print(F("-> Kreuzung-"));
    lcd.setCursor(12,2);
    lcd.print((char) toupper(orteChar[lowestOrt]));
    
    while(knopflinks == 1 && knopfrechts== 1){
        updateButtons();
        
    }
    if(knopflinks==0){
        if (lowestOrt >= ortelength-1){
            return 255;
        }else{
        return getOrt(lowestOrt+1,start);
        }
    }else{
        return lowestOrt;
    }
}

byte getDirection(byte currentDir){
    updateButtons();
    while(knopfrechts==0 || knopflinks == 0){
        updateButtons();
    }
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print(F("Aus welcher "));
    lcd.setCursor(0,1);
    lcd.print(F("Richtung kommst du?"));
    lcd.setCursor(0,3);
    lcd.print("-> "+directions[currentDir]);

    while(knopflinks == 1 && knopfrechts== 1){
        updateButtons();
    }
    if(knopflinks==0){
        if (currentDir >= 3){
            return 255;
        }else{
            return getDirection(currentDir+1);
        }
    }else{
        return currentDir+1;
    }

}

void fill2(byte node) {
  for(byte i = 1; i < 5; i++) {
    if(maps[node][i] != '!' & maps[maps[node][i]-97][5] > maps[node][5]+1) {
      maps[maps[node][i]-97][5] = maps[node][5] + 1;
      fill2(maps[node][i]-97);
    }
  }
}

void rout() {
  byte pointer = startChar - 97;    //setze Anfagspunkt
  index = 0;
  while(maps[pointer][5] > 0){       //solange Ziel nicht erreicht
    byte min = maps[pointer][1]-97;    
    byte aim = 1;
    for(byte i = 2; i < 5; i++){
      if (maps[min][5] > maps[maps[pointer][i] -97][5]){
        min = maps[pointer][i];          //suche NAchpar mit niedrigster Entfernung zum Ziel 
        aim = i;
      }
    }
    if (((direction - aim) == 2) || ((direction - aim) == -2)){   //Ermittle Fahrbefehl aus Ankommmrichtung und Weiterfahrrichtung
      weg[index] = 0;
    }
    if (((direction - aim) == 1) || ((direction - aim) == -3)){
      weg[index] = 1;
    }
    if (((direction - aim) == 3) || ((direction - aim) == -1)){
      weg[index] = 2;
    }
    index++;                            //Vorbereitung nächster Durchlauf
    for(byte i = 1; i < 5; i++){          //pointer auf nächste Kreuzung
      if (maps[min][i]-97 == pointer) {
        pointer = min;
        direction = i;
      }
    }
  }
  size = index + 1;   //size gibt jetzt Anzahl Anweisungen an
  index = 0;
}

void sensoren(){                    //Updated Senson VAriablen
    MLWert = digitalRead(ML);
    MRWert = digitalRead(MR);
    ALWert = digitalRead(AL);
    ARWert = digitalRead(AR);
}

void reset(){                       //Setzt AMT auf Vorwärts
    digitalWrite(linksvor,HIGH);
    digitalWrite(rechtsvor,HIGH);
    digitalWrite(linksruck,LOW);
    digitalWrite(rechtsruck,LOW);
    sensoren();
}
void scharfrechts(){                //Bei Abkommen von Strecke links
    digitalWrite(linksvor,HIGH);
    digitalWrite(rechtsvor,LOW);
    digitalWrite(linksruck,LOW);
    digitalWrite(rechtsruck,HIGH);
    while(MLWert == 0 && MRWert == 0){
        sensoren();
    }
    reset();
}
void scharflinks(){                 //Bei Abkommen von Strecke rechts
    digitalWrite(linksvor,LOW);
    digitalWrite(rechtsvor,HIGH);
    digitalWrite(linksruck,HIGH);
    digitalWrite(rechtsruck,LOW);
    while(MLWert == 0 && MRWert == 0){
        sensoren();
    }
    reset();
}

void kreuzungKorrektur(){                           //Richtet AMT vor Kreuzung gerade aus
    Serial.println("Korrigiere Ausrichtung...");
    reset();
    switch(ARWert) {
        case 0:
            while (ARWert == 0 ){           
                digitalWrite(linksvor,LOW);                                            
                sensoren(); 
            }
            
            break;
        case 1: 
            while (ALWert == 0 ){
                digitalWrite(rechtsvor,LOW);
                sensoren();
            }
            
            break;
        default:
            break;
    }
    
    reset();
    Serial.println("Korrektur Erfolgreich!");
}

void blinker(){
    if(weg[index]!=0){
        currentBlinker += blinkerSign;
        if(currentBlinker==blinkerFreq ||currentBlinker == 0){
            blinkerSign *= -1;
            blinkerOn = !blinkerOn;
            if(weg[index]==1){
                digitalWrite(PINNNNNN,blinkerOn);
            }else{
                digitalWrite(PINNNNNN,blinkerOn);
            }
        }
    }else{
        digitalWrite(PINNNNNN,LOW);
        digitalWrite(PINNNNNN,LOW);
    }
}

void loop() {

    reset();
    scharfrechts(); 
    scharflinks();
    	
    blinker();

    while (MLWert == 0 && MRWert == 1)            //RECHTS Korrektur/Kurve fahren
    {
        digitalWrite(rechtsvor,LOW);
        digitalWrite(rechtsruck,HIGH);
        sensoren();
        scharfrechts();    
    }

    reset();
    
    while (MLWert == 1 && MRWert == 0)            //LINKS Korrektur/Kurve fahren
    {                           
        digitalWrite(linksvor,LOW);
        digitalWrite(linksruck,HIGH);
        sensoren();   
        scharflinks();         
    }

    reset();                              
    
    if ((ALWert == 1 || ARWert == 1) && MLWert == 1 && MRWert == 1){  //KREUZUNG

        delay(100);
        sensoren();

        if (((ALWert == 1 || ARWert == 1) && MLWert == 1 && MRWert == 1)){  
            switch (weg[index])
            {
            case 0:                             //Geradeaus
                kreuzungKorrektur();
                while (ALWert == 1 || ARWert == 1) {
                    reset();
                    sensoren();
                }
                break;
            case 1:                           //LINKS an ner  KReuzung
                kreuzungKorrektur();                      
                while((MRWert == 1 && MLWert == 1)){  
                    sensoren();
                    digitalWrite(linksvor,LOW);       
                }
                while (!(MRWert == 1 && MLWert == 1)){
                    sensoren();
                    delay(100);
                }
                break;
            case 2 :                              //RECCHTS an ner Kreuzung
                kreuzungKorrektur();
                while ((MRWert == 1 && MLWert == 1)){
                    sensoren();
                    digitalWrite(rechtsvor,LOW);
                }
                while(!(MRWert == 1 && MLWert == 1)){
                    sensoren();
                    delay(100);
                }
                break;
            default:
                break;
            } //Switch off
            //Hier kann das Verhalten nach dem Abfahren aller Kreuzungen festgelegt werden. Aktuell: Neustarten bei index 0    
            if (index < size-1){
                Serial.print("Kreuzung: ");
                Serial.println(index+1);
                index++;
            } else{
                //index = 0;     //von vorne beginnen, durch while(true) ersetzen fur abbruch
                Serial.println("Strecke abgefahren!");
                while(true){}
            }
        
        }
        delay(200);
    }

    reset();
    
    
    if(ARWert == 0 && ALWert == 0 &&MRWert == 0 && MLWert == 0)   {         //Beim Abkommen an einer geraden
        delay(500);
        Serial.println("Von Streck abgekommen, setze zuruck...");
        while(ARWert == 0 && ALWert == 0 &&MRWert == 0 && MLWert == 0){                                                             
            digitalWrite(linksvor,LOW);
            digitalWrite(rechtsvor,LOW);
            digitalWrite(linksruck,HIGH);
            digitalWrite(rechtsruck,HIGH);
            sensoren();
        }
    }
}
