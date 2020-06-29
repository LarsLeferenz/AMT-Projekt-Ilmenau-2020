
//*********************************************************
//AMT Zielfuhrendes-fahren
//Autoren: Lars Leferenz, Tobias Scholz, Sebastian Adler
//Stand: 07.05.2020 12:51
//*********************************************************



int linksvor = 9;                           //AMT Konfiguration
int rechtsvor = 7;
int linksruck= 8;
int rechtsruck = 6;
                                               
int ML = 3;
int MR = 2;
int AL = 4;
int AR = 5;

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
    pinMode(linksruck,OUTPUT);
    pinMode(rechtsruck,OUTPUT);

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

void loop() {

    reset();
    scharfrechts(); 
    scharflinks();

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
                index = 0;     //von vorne beginnen, durch while(true) ersetzen fur abbruch
                Serial.println("Strecke abgefahren!");
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
