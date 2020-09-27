//*********************************************************
//AMT Fahren mit Ampeln
//Autoren: Lars Leferenz, Tobias Scholz, Sebastian Adler
//Stand: 30.06.2020 17:09
//*********************************************************



byte linksvor = 9;                           //AMT Konfiguration
byte rechtsvor = 7;
byte linksrück= 8;
byte rechtsrück = 6;
                                               
byte LL = 3;
byte LR = 2;
byte KL = 4;
byte KR = 5;

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

int LLWert ;
int LRWert ;
int KLWert ;
int KRWert ;

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

    pinMode(LL,INPUT);
    pinMode(LR,INPUT);
    pinMode(KL,INPUT);
    pinMode(KR,INPUT);

    Serial.begin(9600);
}

void sensoren(){                    //Updated Senson VAriablen
    LLWert = digitalRead(LL);
    LRWert = digitalRead(LR);
    KLWert = digitalRead(KL);
    KRWert = digitalRead(KR);

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
    while(LLWert == 0 && LRWert == 0){
        sensoren();
    }
    reset();
}
void scharflinks(){                 //Bei Abkommen von Strecke rechts
    digitalWrite(linksvor,LOW);
    digitalWrite(rechtsvor,HIGH);
    digitalWrite(linksrück,HIGH);
    digitalWrite(rechtsrück,LOW);
    while(LLWert == 0 && LRWert == 0){
        sensoren();
    }
    reset();
}

void kreuzungKorrektur(){                           //Richtet AMT vor Kreuzung gerade aus
    Serial.println("Korrigiere Ausrichtung...");
    reset();
    switch(KRWert) {
        case 0:
            while (KRWert == 0 ){           
                digitalWrite(linksvor,LOW);                                            
                sensoren(); 
            }
            
            break;
        case 1: 
            while (KLWert == 0 ){
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

    while (LLWert == 0 && LRWert == 1)            //RECHTS Korrektur/Kurve fahren
    {
        digitalWrite(rechtsvor,LOW);
        digitalWrite(rechtsrück,HIGH);
        sensoren();
        scharfrechts();    
    }

    reset();
    
    while (LLWert == 1 && LRWert == 0)            //LINKS Korrektur/Kurve fahren
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
    
    if ((KLWert == 1 || KRWert == 1) && LLWert == 1 && LRWert == 1){  //KREUZUNG

        delay(100);
        sensoren();

        if (((KLWert == 1 || KRWert == 1) && LLWert == 1 && LRWert == 1)){  
            switch (weg[index])
            {
            case 0:                             //Geradeaus
                kreuzungKorrektur();
                while (KLWert == 1 || KRWert == 1) {
                    reset();
                    sensoren();
                }
                break;
            case 1:                           //LINKS an ner  KReuzung
                kreuzungKorrektur();                      
                while((LRWert == 1 && LLWert == 1)){  
                    sensoren();
                    digitalWrite(linksvor,LOW);       
                }
                while (!(LRWert == 1 && LLWert == 1)){
                    sensoren();
                    delay(100);
                }
                break;
            case 2 :                              //RECCHTS an ner Kreuzung
                kreuzungKorrektur();
                while ((LRWert == 1 && LLWert == 1)){
                    sensoren();
                    digitalWrite(rechtsvor,LOW);
                }
                while(!(LRWert == 1 && LLWert == 1)){
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
    
    
    if(KRWert == 0 && KLWert == 0 &&LRWert == 0 && LLWert == 0)   {         //Beim Abkommen an einer geraden
        delay(500);
        Serial.println("Von Streck abgekommen, setze zurück...");
        while(KRWert == 0 && KLWert == 0 &&LRWert == 0 && LLWert == 0){                                                             
            digitalWrite(linksvor,LOW);
            digitalWrite(rechtsvor,LOW);
            digitalWrite(linksrück,HIGH);
            digitalWrite(rechtsrück,HIGH);
            sensoren();
        }
    }
}
