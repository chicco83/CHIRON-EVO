# CHIRON-EVO
repository delle modifiche che ho attuato alla mia anycubic chiron

CONDFIGURAZIONE PRINTER.CFG

tutti i dettagli delle funzioni implementate sono descritte nel file di testo assieme al printer.cfg



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
