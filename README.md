# CHIRON-EVO
repository delle modifiche che ho attuato alla mia anycubic chiron


UPDATES PRINTER.CFG

8-5-21 settato  stealthchop_threshold a 999 per assi X e Y e a 1 per Z, Z1 ed E quindi attivo sempre sui primi due assi e sempre disattivo su estrusore e asse Z
8-5-21 aggiunto SCREW ADJUST
8-5-21 aggiunto SuperSlicer_2.3.6a 4-5-21 NIGHTLY

FUNZIONI IMPLEMENTATE IN KLIPPER PRINTER.CFG

[output_pin power]
accensione e spegnimento della stampante tramite semplice rele che interrompe il positivo che esce dal connettore della spina. vedi foto nella sezione MOD HARDWARE / INSTALLAZIONE RELE

[idle_timeout]
se dopo 5 minuti dal riscaldamento la stampante non ha ricevuto input, ritrae il filamento spegne hotend e piatto, suona e da un output su console che avvisa dell'avvenuto idle_timeout

[temperature_sensor Raspberry CPU]  
nelle temperature viene mostrata anche quella della cpu del raspberry

gli stepper sono gia predisposti per lavorare con i driver 4988 o 2209
da calibrare in base alla propria meccanica le rotation_distance
https://github.com/KevinOConnor/klipper/blob/master/docs/Rotation_Distance.md

#[temperature_sensor TMC_2209]
aggiunto un semplice termistore da hotend collegato al pin t2 per monitorare la temperatura dei tmc al momento il codice è disattivato e gira quello nella sezione 

[temperature_fan stepper_driver_fan]
questo codice permette di settare la temperatura obiettivo da mantenere per i driver e la ventola varia in automatico la propria velocita.
per ottenere maggiore silezionsita ho collegato assieme alla ventola della scheda madre anche quella dell'alimentatore.

[endstop_phase]
assieme ai tmc 2209 permette una perfetta calibrazione degli endstop soprattutto sull'asse Z
https://github.com/KevinOConnor/klipper/blob/master/docs/Endstop_Phase.md


[verify_heater extruder]
attivo il controllo delle temperature analogo a marlin in modo da spegnere tutto se le letture delle temperature non sono congrue e quindi c'è un guasto

[verify_heater heater_bed]
come sopra per l'hot bed

[bed_mesh]
attiva la generazione della mesh tramite il sensore di livellamento. se non ne siete in possesso si puo comprare quello per la kossel su aliexpress oppure farlo da soli dato che  è un semplice switch come quello degli endstop meccanici

[pause_resume]
attivata la funzione di messa in pausa e ripresa della stampante

[firmware_retraction]
prevista la ritrazione da firmware ma lasciata disattivata a vantaggio della pressure advance

[gcode_arcs]
inserita la gestione degli archi

[input_shaper]
inserita la sezione per lo smorzamento delle vibrazioni. l'ideale è comprare l'accellerometro che costa pochi spiccioli e farla con quello
https://www.klipper3d.org/Resonance_Compensation.html

[output_pin BEEPER_pin]
abiltiato il beeper per creare macro con avvisi sonori

[filament_switch_sensor my_sensor]
supportato il sensore di fine filamento
in caso di fine filamento la stampante va in pausa ed emette un avviso sonoro.
al rilevamento del nuovo filo lo carica automaticamente:lentamente i primi 2 cm, velocemente i successivi 49 e di nuovo lentamente gli ultimi 6 cm
poi riprende la stampa

[SCREW TILT CALCULATE]
indica come regolare le viti del piatto per una perfetta messa in piano fisica


MACRO.CFG

[gcode_macro M600]
macro m600 per cambio filo

[gcode_macro POWER_OFF_PRINTER]
gcode:
  SET_PIN PIN=power value=0

[gcode_macro POWER_ON_PRINTER]
gcode:
  SET_PIN PIN=power value=1
accensione e spegnimento della stampante tramite rele


MOD HARDWARE PER LA STAMPANTE

hotend trianglelab e3d v6
https://it.aliexpress.com/item/32844313509.html?spm=a2g0s.9042311.0.0.27424c4dBxZaBv
una volta montato andranno alzati gli endstop ottici o stampate alette piu lunghe altrimenti non arriva a fare il trigger del fine corsa

estrusore trianglelab  bmg v2
https://it.aliexpress.com/item/32917029058.html?spm=a2g0s.9042311.0.0.27424c4dk6avcs

barre filettate di rinforzo M10 con pezzi stampati per sfruttare la totale altezza della stampante qui
il progetto non è mio e dalla struttura delle cartelle sembra derivare da thingverse su cui però non l'ho trovato quindi non so a chi dare i credit

driver tmc 2209 5 pz versione UART
https://it.aliexpress.com/item/33029587820.html?spm=a2g0s.9042311.0.0.27424c4dK0OpVI
SEGUE GUIDA DEDICATA

tastatore per autobed leveling
https://it.aliexpress.com/item/4000792963251.html?spm=a2g0s.9042311.0.0.27424c4dK0OpVI
io ho preso la stampante usata e non c'era
SEGUE GUIDA DEDICACATA

accellerometro per ottimizzazione delle vibrazioni
https://it.aliexpress.com/item/32922294688.html?spm=a2g0s.9042311.0.0.27424c4dk6avcs

aggiunta rele per spegnimento stampante da klipper.
va installato un rele sul filo rosso saldato al connettore della spina e spostato il jumper che imposta l'alimentazione della trigorilla nella posizione usb in modo che la scheda sia alimentata dal raspberry. vedi foto nella cartella MOD HARDWARE / INSTALLAZIONE RELE

ELEMENTI DA STAMPARE LEGATI A KLIPPER

ho creato una cartella dedicata sotto klipper. al momento contiene un case per il rasp e un supporto un tablet da 7 pollici da usare come interfaccia localae

SOFTWARE

win32imager per fare un clone di backup della sd
https://sourceforge.net/projects/win32diskimager/
