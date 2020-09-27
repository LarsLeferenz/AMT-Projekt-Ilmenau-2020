byte start = 255;
char startChar;
byte ziel = 255;
char zielChar;
byte direction      = 255;
String directions[] = {"Von oben", "Von rechts", "Von unten", "Von links"};
char orteChar[]     = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                   'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's'};
byte ortelength     = 19;
byte weg[10];  // Streckenplan, 0 = Geradeaus ; 1 = Links ; 2 = Rechts
byte size =
    10;  // Größe des Arrays, size() hat irgendwie nicht richtig funktioniert
byte index = 0;

// 1 nach oben, 2 nach rechts, ....

byte cross = 18;
// Die Map: Jede Kreuzung eine Spalte; nullte Zeile Name der Kreuzung; erste bis
// vierte Zeile Name der Nachbar Kreuzung, Reihenfolge oben, rechts, unten,
// links; fünfte Zeile Distanz zum Ziel
char maps[19][7] = {"a!bc!9", "b!gca9", "cb!ga9", "def!!9", "echfd9",
                    "fei!d9", "g!khb9", "hgkie9", "ih!jf9", "jno!i9",
                    "k!mhg9", "lp!m!9", "mlqnk9", "n!moj9", "onr!j9",
                    "p!!ql9", "qpsrm9", "rqs!o9", "sq!r!9"};

void setup() {
    Serial.begin(9600);
    start     = 'h' - 97;
    ziel      = 'p' - 97;
    direction = 2;
    startChar = orteChar[start];
    zielChar  = orteChar[ziel];
    Serial.println((char)toupper(orteChar[start]));
    Serial.println(directions[direction - 1]);
    Serial.println((char)toupper(orteChar[ziel]));
    maps[ziel][5] = 0;
    fill2(ziel);
    rout();

    for (byte i = 0; i < 10; i++) {
        Serial.println((int)weg[i]);
    }
}

void fill2(byte node) {
    for (byte i = 1; i < 5; i++) {
        if (maps[node][i] != '!' &
            maps[maps[node][i] - 97][5] > maps[node][5] + 1) {
            maps[maps[node][i] - 97][5] = maps[node][5] + 1;
            fill2(maps[node][i] - 97);
        }
    }
}

void rout() {
    byte pointer = startChar - 97;  // setze Anfangspunkt
    index        = 0;
    while (maps[pointer][5] > 0) {  // solange Ziel nicht erreicht
        if (direction != 1) {
            byte min = maps[pointer][1] - 97;
            byte aim = 1;
        } else {
            byte min = maps[pointer][2] - 97;
            byte aim = 2;
        }
        for (byte i = 1; i < 5; i++) {
            if (maps[pointer][i] != '!') {
                if (maps[min][5] > maps[maps[pointer][i] - 97][5] && (direction != i)) {
                    min = maps[pointer][i] - 97;  // suche Nachbar mit niedrigster Entfernung zum Ziel
                    aim = i;
                }
            }
        }
        Serial.println((char)(min + 97));
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
                direction = i;
            }
        }
    }
    size  = index + 1;  // size gibt jetzt Anzahl Anweisungen an
    index = 0;
}

void loop() {}

/*Arduino: 1.8.12 (Windows Store 1.8.33.0) (Windows 10), Board: "Arduino Uno"

  C:\Users\Admin\AppData\Local\Temp\ccXvWWS7.ltrans0.ltrans.o: In function
  `main':

  C:\Program
  Files\WindowsApps\ArduinoLLC.ArduinoIDE_1.8.33.0_x86__mdqgnx93n4wtt\hardware\arduino\avr\cores\arduino/main.cpp:46:
  undefined reference to `loop'

  collect2.exe: error: ld returned 1 exit status

  exit status 1
  Fehler beim Kompilieren für das Board Arduino Uno.

  Dieser Bericht wäre detaillierter, wenn die Option
  "Ausführliche Ausgabe während der Kompilierung"
  in Datei -> Voreinstellungen aktiviert wäre.
*/
