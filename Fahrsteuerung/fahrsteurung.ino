//*********************************************************
// AMT Zielfuhrendes-fahren
// Autoren: Lars Leferenz, Tobias Scholz, Sebastian Adler
// Stand: 21.09.2020 14:05
//*********************************************************

//****Dependencies
#include <Adafruit_BusIO_Register.h>
#include <Adafruit_I2CDevice.h>
#include <Adafruit_I2CRegister.h>
#include <Adafruit_SPIDevice.h>
#include <LiquidCrystal_I2C.h>
#include <Wire.h>

#include "Adafruit_MCP23008.h"
//****

LiquidCrystal_I2C lcd(0x27, 20, 4);  //LCD Display auf Adresse 0x27
Adafruit_MCP23008 mcp;               //IO Expander
const uint8_t BT0     = 0;           //S1
const uint8_t BT1     = 1;           //S2
const uint8_t ADDRESS = 0;           // Adresse des MCP, Einstellen mit A0, A1, A2

byte linksvor   = 5;  // AMT Konfiguration
byte rechtsvor  = 7;
byte linksruck  = 9;
byte rechtsruck = 11;

#define LL A1  //Sensoren
#define LR A2
#define KL A0
#define KR A3

byte LLWert;  //Digitaler Wert der Senoren
byte LRWert;
byte KLWert;
byte KRWert;

bool knopfrechts = 1;  //Wert der Knöpfe, 1 = Aus
bool knopflinks  = 1;

bool blinkerEnable = true;  //Nutze Blinkerfunktion

//****Zielfindung
char startChar;
char zielChar;
byte start          = 255;
byte ziel           = 255;
byte direction      = 255;  // 1 nach oben, 2 nach rechts, 3 nach unten, 4 nach links
String directions[] = {"Von unten", "Von links", "Von oben", "Von rechts"};
char orteChar[]     = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                   'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's'};
byte ortelength     = 19;
byte weg[10];     // Streckenplan, 0 = Geradeaus ; 1 = Links ; 2 = Rechts
byte size  = 10;  // Größe des Arrays, size() hat irgendwie nicht richtig funktioniert
byte index = 0;

byte cross = 18;
// Die Map: Jede Kreuzung eine Spalte; nullte Zeile Name der Kreuzung; erste bis
// vierte Zeile Name der Nachbar Kreuzung, Reihenfolge oben, rechts, unten,
// links; fünfte Zeile Distanz zum Ziel
char maps[19][7] = {"a!bc!9", "b!gca9", "cb!ga9", "def!!9", "echfd9",
                    "fei!d9", "g!khb9", "hgkie9", "ih!jf9", "jno!i9",
                    "k!mhg9", "lp!m!9", "mlqnk9", "n!moj9", "onr!j9",
                    "p!!ql9", "qpsrm9", "rqs!o9", "sq!r!9"};

void setup() {
    lcd.init();  // Starten des LCD
    lcd.backlight();

    pinMode(linksvor, OUTPUT);  //Arduino PIN Config
    pinMode(rechtsvor, OUTPUT);
    pinMode(linksruck, OUTPUT);
    pinMode(rechtsruck, OUTPUT);

    pinMode(LL, INPUT);
    pinMode(LR, INPUT);
    pinMode(KL, INPUT);
    pinMode(KR, INPUT);

    mcp.begin(ADDRESS);  //Setup des IO Expander
    mcp.pinMode(BT0, INPUT);
    mcp.pinMode(BT1, INPUT);
    mcp.pullUp(0, HIGH);

    Serial.begin(9600);

    //  while(true){
    //          //updateButtons();
    //          //Serial.print(mcp.digitalRead(BT0));
    //          Serial.print(mcp.digitalRead(BT1));
    //    }

    getDestUI();                      //Starten des UI
    startChar     = orteChar[start];  //Starten der Zielfindung
    zielChar      = orteChar[ziel];
    maps[ziel][5] = 0;
    fill2(ziel);
    rout();

    // Serial.println((char)toupper(orteChar[start]));
    // Serial.println(directions[direction - 1]);
    // Serial.println((char)toupper(orteChar[ziel]));
    // for (byte i = 0; i < 10; i++) {
    // Serial.println((int)weg[i]);
    // }

    lcd.clear();
    lcd.setCursor(0, 1);
    lcd.print(F("   ---       ---   "));
    lcd.setCursor(0, 2);
    lcd.print(F("  | o |     | o | "));
    lcd.setCursor(0, 3);
    lcd.print(F("   ---       ---   "));
}

void getDestUI() {  //"UI" zum eingeben des Start/Ziel

    lcd.setCursor(0, 0);
    lcd.print(F("-----Willkommen-----"));
    lcd.setCursor(0, 1);
    lcd.print(F("Wandere mit Links <"));
    lcd.setCursor(0, 2);
    lcd.print(F("Waehle mit Rechts >"));
    lcd.setCursor(0, 3);
    lcd.print(F("Bestaetige..."));
    while (knopfrechts == 1) {
        updateButtons();
        // Serial.println(knopfrechts);
        // Serial.println(knopflinks);
    }
    while (start == 255) {  //While() um zu tiefe Rekursion zu verhindern
        start = getOrt(0, true);
    }
    while (ziel == 255) {
        ziel = getOrt(0, false);
    }
    while (direction == 255) {
        direction = getDirection(0);
    }

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print(F("Abbruch/Bestaetige:"));
    lcd.setCursor(0, 1);
    lcd.print(F("Kreuzung-"));
    lcd.setCursor(9, 1);
    lcd.print((char)toupper(orteChar[start]));
    lcd.setCursor(0, 2);
    lcd.print(directions[direction - 1] + " --->");
    lcd.setCursor(0, 3);
    lcd.print(F("Kreuzung-"));
    lcd.setCursor(9, 3);
    lcd.print((char)toupper(orteChar[ziel]));

    while (knopfrechts == 0 || knopflinks == 0) {
        updateButtons();
    }
    while (knopflinks == 1 && knopfrechts == 1) {
        updateButtons();
    }
    if (knopflinks == 0) {
        start     = 255;
        ziel      = 255;
        direction = 255;
        getDestUI();
    } else {
        lcd.clear();
    }
}

void updateButtons() {
    knopfrechts = updateButtonsDebounce(BT0, 255);
    knopflinks  = updateButtonsDebounce(BT1, 255);
}
bool updateButtonsDebounce(uint8_t BT, byte debounce) {  //Button Debouncer #debounce = wie viele Messzyklen LOW sein muss
    bool high = false;
    for (byte i = 0; i < debounce; i++) {
        if (mcp.digitalRead(BT) == 1) {
            high = true;
            break;
        }
    }
    return high;
}
byte getOrt(byte lowestOrt, bool start) {  // Rekusive Funktion zur Auswahl des Ortes
    updateButtons();
    while (knopfrechts == 0 || knopflinks == 0) {   //Warte bis Taste wieder losgelassen 
        updateButtons();
    }
    lcd.clear();
    lcd.setCursor(0, 0);
    if (start) {
        lcd.print(F("Waehle den Start:"));
    } else {
        lcd.print(F("Waehle das Ziel:"));
    }
    lcd.setCursor(0, 2);
    lcd.print(F("-> Kreuzung-"));
    lcd.setCursor(12, 2);
    lcd.print((char)toupper(orteChar[lowestOrt]));

    while (knopflinks == 1 && knopfrechts == 1) {   
        updateButtons();
    }
    if (knopflinks == 0) {                          //Rekursion je nach Knopfdruck
        if (lowestOrt >= ortelength - 1) {
            return 255;                             //Starte "Rekursionsbaum" neu
        } else {
            return getOrt(lowestOrt + 1, start);    //Erneuter Aufruf mit nächster Kreuzung
        }
    } else {
        return lowestOrt;                           //return Auswahl
    }
}

byte getDirection(byte currentDir) {                //wie getOrt() nur mit der Richtung
    updateButtons();
    while (knopfrechts == 0 || knopflinks == 0) {
        updateButtons();
    }
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print(F("Aus welcher "));
    lcd.setCursor(0, 1);
    lcd.print(F("Richtung kommst du?"));
    lcd.setCursor(0, 3);
    lcd.print("-> " + directions[currentDir]);

    while (knopflinks == 1 && knopfrechts == 1) {
        updateButtons();
    }
    if (knopflinks == 0) {
        if (currentDir >= 3) {
            return 255;
        } else {
            return getDirection(currentDir + 1);
        }
    } else {
        return currentDir + 1;                      //rout() verwendet alle Directions von 1-4 nicht 0-3
    }
}

void fill2(byte node) {
    for (byte i = 1; i < 5; i++) {      //Gehe alle Nachbarn durch
        if (maps[node][i] != '!' & maps[maps[node][i] - 97][5] > maps[node][5] + 1) {  //Existiert dieser Nachbar und hat er eine höhere Entfernung?
            maps[maps[node][i] - 97][5] = maps[node][5] + 1;                           //Setzte sie zu deiner +1
            //Serial.println((int)freeMemory);
            fill2(maps[node][i] - 97);      //Rekursion mit diesem Nachbarn, als neuer "Ast"
        }
    }
}

void rout() {   //Nicht Rekursiv da langsam der RAM ausgeht 
    byte pointer = startChar - 97;  // setze Anfangspunkt
    index        = 0;               //aktueller Positon in weg[] Array
    while (maps[pointer][5] > 0) {  // solange Ziel nicht erreicht
        if (direction != 1) {                   //Wahl willkürlich auf 1, wenn diese nicht die Direction ist
            byte min = maps[pointer][1] - 97;
            byte aim = 1;
        } else {
            byte min = maps[pointer][2] - 97;
            byte aim = 2;
        }
        for (byte i = 1; i < 5; i++) {      //jeden Nachbarn checken
            if (maps[pointer][i] != '!') {  //exisitert dieser Nachbar?
                if (maps[min][5] > maps[maps[pointer][i] - 97][5] && (direction != i)) {    //Hat dieser Nachbar eine kürzere Entfernung zum Ziel als aktuelle beste Wahl
                    min = maps[pointer][i] - 97;  //setze Beste Wahl und Index
                    aim = i;
                }
            }
        }
        Serial.println((char)(min + 97));   //Debug
        if (((direction - aim) == 2) || ((direction - aim) == -2)) {  // Ermittle Fahrbefehl aus Ankommmrichtung und Weiterfahrrichtung
            weg[index] = 0;
        }
        if (((direction - aim) == -1) || ((direction - aim) == 3)) {
            weg[index] = 1;
        }
        if (((direction - aim) == -3) || ((direction - aim) == 1)) {
            weg[index] = 2;
        }
        index++;                        // Vorbereitung nächster Durchlauf
        for (byte i = 1; i < 5; i++) {  // pointer auf nächste Kreuzung
            if (maps[min][i] - 97 == pointer) {
                pointer   = min;
                direction = i;          //Von wo komme ich
            }
        }
    }
    size  = index + 1;  // size gibt jetzt Anzahl Anweisungen an
    index = 0;
}

void sensoren() {  // Updated Sensoren Variablen
    LLWert = digitalRead(LL);
    LRWert = digitalRead(LR);
    KLWert = digitalRead(KL);
    KRWert = digitalRead(KR);
}

void reset() {  // Setzt AMT auf Vorwärts
    digitalWrite(linksvor, HIGH);
    digitalWrite(rechtsvor, HIGH);
    digitalWrite(linksruck, LOW);
    digitalWrite(rechtsruck, LOW);
    sensoren();
}
void scharfrechts() {  // Bei Abkommen von Strecke links
    digitalWrite(linksvor, HIGH);
    digitalWrite(rechtsvor, LOW);
    digitalWrite(linksruck, LOW);
    digitalWrite(rechtsruck, HIGH);
    while (LLWert == 0 && LRWert == 0) {
        sensoren();
    }
    reset();
}
void scharflinks() {  // Bei Abkommen von Strecke rechts
    digitalWrite(linksvor, LOW);
    digitalWrite(rechtsvor, HIGH);
    digitalWrite(linksruck, HIGH);
    digitalWrite(rechtsruck, LOW);
    while (LLWert == 0 && LRWert == 0) {
        sensoren();
    }
    reset();
}

void kreuzungKorrektur() {  // Richtet AMT vor Kreuzung gerade aus
    Serial.println("Korrigiere Ausrichtung...");
    reset();
    switch (KRWert) {
        case 0:
            while (KRWert == 0) {
                digitalWrite(linksvor, LOW);
                sensoren();
            }

            break;
        case 1:
            while (KLWert == 0) {
                digitalWrite(rechtsvor, LOW);
                sensoren();
            }

            break;
        default:
            break;
    }

    reset();
    Serial.println("Korrektur Erfolgreich!");
}

void blinker() {
    if (weg[index] != 0 && blinkerEnable) {
        if (weg[index] == 1) {
            // digitalWrite(PINNNNNN,HIGH);
        } else {
            // digitalWrite(PINNNNNN,HIGH);
        }
    } else {
        // digitalWrite(PINNNNNN,LOW);
        // digitalWrite(PINNNNNN,LOW);
    }
}

void loop() {
    reset();
    scharfrechts();
    scharflinks();

    blinker();

    while (LLWert == 0 && LRWert == 1)  // RECHTS Korrektur/Kurve fahren
    {
        digitalWrite(rechtsvor, LOW);
        digitalWrite(rechtsruck, HIGH);
        sensoren();
        scharfrechts();
    }

    reset();

    while (LLWert == 1 && LRWert == 0)  // LINKS Korrektur/Kurve fahren
    {
        digitalWrite(linksvor, LOW);
        digitalWrite(linksruck, HIGH);
        sensoren();
        scharflinks();
    }

    reset();

    if ((KLWert == 1 || KRWert == 1) && LLWert == 1 &&
        LRWert == 1) {  // KREUZUNG

        // delay(100);
        sensoren();

        if (((KLWert == 1 || KRWert == 1) && LLWert == 1 && LRWert == 1)) {
            switch (weg[index]) {
                case 0:  // Geradeaus
                    kreuzungKorrektur();
                    while (KLWert == 1 || KRWert == 1) {
                        reset();
                        sensoren();
                    }
                    break;
                case 1:  // LINKS an ner  KReuzung
                    kreuzungKorrektur();
                    while ((LRWert == 1 && LLWert == 1)) {
                        sensoren();
                        digitalWrite(linksvor, LOW);
                    }
                    while (!(LRWert == 1 && LLWert == 1)) {
                        sensoren();
                        delay(100);
                    }
                    break;
                case 2:  // RECCHTS an ner Kreuzung
                    kreuzungKorrektur();
                    while ((LRWert == 1 && LLWert == 1)) {
                        sensoren();
                        digitalWrite(rechtsvor, LOW);
                    }
                    while (!(LRWert == 1 && LLWert == 1)) {
                        sensoren();
                        delay(100);
                    }
                    break;
                default:
                    break;
            }  // Switch off
            // Hier kann das Verhalten nach dem Abfahren aller Kreuzungen
            // festgelegt werden. Aktuell: Neustarten bei index 0
            if (index < size - 1) {
                Serial.print("Kreuzung: ");
                Serial.println(index + 1);
                index++;
            } else {
                // index = 0;     //von vorne beginnen, durch while(true)
                // ersetzen fur abbruch
                Serial.println("Strecke abgefahren!");
                while (true) {
                }
            }
        }
        delay(200);
    }

    reset();

    if (KRWert == 0 && KLWert == 0 && LRWert == 0 &&
        LLWert == 0) {  // Beim Abkommen an einer geraden
        delay(500);
        Serial.println("Von Streck abgekommen, setze zuruck...");
        while (KRWert == 0 && KLWert == 0 && LRWert == 0 && LLWert == 0) {
            digitalWrite(linksvor, LOW);
            digitalWrite(rechtsvor, LOW);
            digitalWrite(linksruck, HIGH);
            digitalWrite(rechtsruck, HIGH);
            sensoren();
        }
    }
}
