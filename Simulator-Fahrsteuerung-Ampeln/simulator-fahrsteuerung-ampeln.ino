//*********************************************************
//AMT Fahren mit Ampeln
//Autoren: Lars Leferenz, Tobias Scholz, Sebastian Adler
//Stand: 30.06.2020 17:09
//*********************************************************



byte linksvor = 9;                           //AMT Konfiguration
byte rechtsvor = 7;
byte linksrück= 8;
byte rechtsrück = 6;
                                               
byte ML = 3;
byte MR = 2;
byte AL = 4;
byte AR = 5;

//Farbsensor
byte s0;
byte s1;
byte s2;
byte s3;
byte sensorOut;

int rot;
int gruen;
int blau;
//

int MLWert ;
int MRWert ;
int ALWert ;
int ARWert ;

int weg[] = {2,0,2,0,2,1,2,0,1,2,0,0};      //Streckenplan, 0 = Geradeaus ; 1 = Links ; 2 = Rechts
int size = 12;                              //Größe des Arrays, size() hat irgendwie nicht richtig funktioniert
int index = 0;



void setup() {
    pinMode(linksvor,OUTPUT);
    pinMode(rechtsvor,OUTPUT);
    pinMode(linksrück,OUTPUT);
    pinMode(rechtsrück,OUTPUT);

    pinMode(s0, OUTPUT);
    pinMode(s1, OUTPUT);
    pinMode(s2, OUTPUT);
    pinMode(s3, OUTPUT);
    pinMode(sensorOut, INPUT);

    digitalWrite(s0,HIGH);
    digitalWrite(s1,LOW);

    pinMode(ML,INPUT);
    pinMode(MR,INPUT);
    pinMode(AL,INPUT);
    pinMode(AR,INPUT);

    Serial.begin(9600);
}

void sensoren(){                    //Updated Senson VAriablen
    MLWert = digitalRead(ML);
    MRWert = digitalRead(MR);
    ALWert = digitalRead(AL);
    ARWert = digitalRead(AR);

    digitalWrite(s2,LOW);           //Rote Farbe messen
    digitalWrite(s3,LOW);
    rot = pulseIn(sensorOut, LOW);

}
void reset(){                       //Setzt AMT auf Vorwärts
    digitalWrite(linksvor,HIGH);
    digitalWrite(rechtsvor,HIGH);
    digitalWrite(linksrück,LOW);
    digitalWrite(rechtsrück,LOW);
    sensoren();
}
void scharfrechts(){                //Bei Abkommen von Strecke links
    digitalWrite(linksvor,HIGH);
    digitalWrite(rechtsvor,LOW);
    digitalWrite(linksrück,LOW);
    digitalWrite(rechtsrück,HIGH);
    while(MLWert == 0 && MRWert == 0){
        sensoren();
    }
    reset();
}
void scharflinks(){                 //Bei Abkommen von Strecke rechts
    digitalWrite(linksvor,LOW);
    digitalWrite(rechtsvor,HIGH);
    digitalWrite(linksrück,HIGH);
    digitalWrite(rechtsrück,LOW);
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

void loop() {

    reset();
    scharfrechts(); 
    scharflinks();

    while (MLWert == 0 && MRWert == 1)            //RECHTS Korrektur/Kurve fahren
    {
        digitalWrite(rechtsvor,LOW);
        digitalWrite(rechtsrück,HIGH);
        sensoren();
        scharfrechts();    
    }

    reset();
    
    while (MLWert == 1 && MRWert == 0)            //LINKS Korrektur/Kurve fahren
    {                           
        digitalWrite(linksvor,LOW);
        digitalWrite(linksrück,HIGH);
        sensoren();   
        scharflinks();         
    }

    reset();                

    while (rot>50)            //Rote Ampel Warten
    {
        digitalWrite(rechtsvor,LOW);
        digitalWrite(linksvor,LOW);
        sensoren();  
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
                index = 0;     //von vorne beginnen, durch while(true) ersetzen für abbruch
                Serial.println("Strecke abgefahren!");
            }
        
        }
        delay(200);
    }

    reset();
    
    
    if(ARWert == 0 && ALWert == 0 &&MRWert == 0 && MLWert == 0)   {         //Beim Abkommen an einer geraden
        delay(500);
        Serial.println("Von Streck abgekommen, setze zurück...");
        while(ARWert == 0 && ALWert == 0 &&MRWert == 0 && MLWert == 0){                                                             
            digitalWrite(linksvor,LOW);
            digitalWrite(rechtsvor,LOW);
            digitalWrite(linksrück,HIGH);
            digitalWrite(rechtsrück,HIGH);
            sensoren();
        }
    }
}
