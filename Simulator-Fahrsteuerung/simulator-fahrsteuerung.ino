
//*********************************************************
//AMT Zielfuhrendes-fahren
//Autoren: Lars Leferenz, Tobias Scholz, Sebastian Adler
//Stand: 07.05.2020 12:51
//*********************************************************



int linksvor = 5;                           //AMT Konfiguration
int rechtsvor = 7;
int linksruck= 9;
int rechtsruck = 11;
                                               
#define LL A1  //Sensoren
#define LR A2
#define KL A0
#define KR A3

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
    pinMode(linksruck,OUTPUT);
    pinMode(rechtsruck,OUTPUT);

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
}

void reset(){                       //Setzt AMT auf Vorwärts
    digitalWrite(linksvor,HIGH);
    digitalWrite(rechtsvor,HIGH);
    digitalWrite(linksruck,LOW);
    digitalWrite(rechtsruck,LOW);
    sensoren();
}
void scharfrechts(){                //Bei Abkommen von Strecke links
    if(LLWert == 0 && LRWert == 0 && KRWert==1){
        Serial.println("scharfrechts...");
        digitalWrite(linksvor,HIGH);
        digitalWrite(rechtsvor,LOW);
        digitalWrite(linksruck,LOW);
        digitalWrite(rechtsruck,HIGH);
        while(LLWert == 0 && LRWert == 0){
            sensoren();
        }
    reset();
    }
}
void scharflinks(){                 //Bei Abkommen von Strecke rechts
    if(LLWert == 0 && LRWert == 0 && KLWert==1){
        Serial.println("scharflinks...");
        digitalWrite(linksvor,LOW);
        digitalWrite(rechtsvor,HIGH);
        digitalWrite(linksruck,HIGH);
        digitalWrite(rechtsruck,LOW);
        while(LLWert == 0 && LRWert == 0){
            sensoren();
        }
        reset();
    }
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
        digitalWrite(rechtsruck,HIGH);
        sensoren();
        scharfrechts();    
    }

    reset();
    
    while (LLWert == 1 && LRWert == 0)            //LINKS Korrektur/Kurve fahren
    {                           
        digitalWrite(linksvor,LOW);
        digitalWrite(linksruck,HIGH);
        sensoren();   
        scharflinks();         
    }

    reset();                              
    
    if ((KLWert == 1 || KRWert == 1) && LLWert == 1 && LRWert == 1){  //KREUZUNG

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
                index = 0;     //von vorne beginnen, durch while(true) ersetzen fur abbruch
                Serial.println("Strecke abgefahren!");
            }
        
        }
        delay(200);
    }

    reset();
    
    
    if(KRWert == 0 && KLWert == 0 &&LRWert == 0 && LLWert == 0)   {         //Beim abkommen an einer geraden
        delay(500);
        Serial.println("Von Streck abgekommen, setze zuruck...");
        while(KRWert == 0 && KLWert == 0 &&LRWert == 0 && LLWert == 0){                                                             
            digitalWrite(linksvor,LOW);
            digitalWrite(rechtsvor,LOW);
            digitalWrite(linksruck,HIGH);
            digitalWrite(rechtsruck,HIGH);
            sensoren();
        }
    }
}
