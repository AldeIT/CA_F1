.section .data
###############################
#dichiarazione variabili utili#
###############################
pilot_0_str:
    .string   "Pierre Gasly\0"
pilot_1_str:
    .string   "Charles Leclerc\0"
pilot_2_str:
    .string   "Max Verstappen\0"
pilot_3_str:
    .string   "Lando Norris\0"
pilot_4_str:
    .string   "Sebastian Vettel\0"
pilot_5_str:
    .string   "Daniel Ricciardo\0"
pilot_6_str:
    .string   "Lance Stroll\0"
pilot_7_str:
    .string   "Carlos Sainz\0"
pilot_8_str:
    .string   "Antonio Giovinazzi\0"
pilot_9_str:
    .string   "Kevin Magnussen\0"
pilot_10_str:
    .string  "Alexander Albon\0"
pilot_11_str:
    .string  "Nicholas Latifi\0"
pilot_12_str:
    .string  "Lewis Hamilton\0"
pilot_13_str:
    .string  "Romain Grosjean\0"
pilot_14_str:
    .string  "George Russell\0"
pilot_15_str:
    .string  "Sergio Perez\0"
pilot_16_str:
    .string  "Daniil Kvyat\0"
pilot_17_str:
    .string  "Kimi Raikkonen\0"
pilot_18_str:
    .string  "Esteban Ocon\0"
pilot_19_str:
    .string  "Valtteri Bottas\0"

invalid_pilot_str:
	.string "Invalid\0"

id:
	.long 20

char1:
	.byte 'c'

num:
	.long 10

vel:
	.long 0

vel_minore:
	.long 100

vel_maggiore:
	.long 250

vel_max:
	.long 0

velMedia:
	.long 0

contatoreVel:
	.long 0

sommaVel:
	.long 0

rpm:
	.long 0

rpm_minore:
	.long 5000

rpm_maggiore:
	.long 10000

rpm_max:
	.long 0

temp:
	.long 0

temp_minore:
	.long 90

temp_maggiore:
	.long 110

temp_max:
	.long 0

lowS:
	.string "LOW\0"

mediumS:
	.string "MEDIUM\0"

highS:
	.string "HIGH\0"

moltiplicatore:
	.long 10

contatorePush:
	.long 0

.section .text
.global telemetry

telemetry:

movl 4(%esp), %esi                #metto esi ho la stringa di input
movl 8(%esp), %edi                #metto edi ho la stringa di output

pushl %eax
pushl %ebx
pushl %ecx
pushl %edx

#############################
#controllo del nome pilota 0#
#############################
pilota_id0:
	xorl %edx, %edx				          #reset edx
	pushl %edx              	      #metto id nello stack
	xorl %ecx, %ecx			            #resetto ecx
	leal pilot_0_str, %eax		      #metto in eax il nome corrente da analizzare, preso da variabile
	controllo0:                     #controllo primo pilota
		movb (%eax, %ecx), %dl        #prendo un char del nome corrente
		movb %dl, char1               #metto il primo char in una variabile
		cmpb $0, char1                #controllo che non sia l ultimo carattere della prima riga
		je secondIf                   #in caso sia l ultimo carattere vado a un ultimo controllo
		movb (%esi, %ecx), %dl        #prendo un char del nome del file in input
		cmpb %dl, char1               #confrontiamo i due char
		jne pilota_id1                #se sono diversi passo al prossimo controllo che confrontera un nuovo nome
		incl %ecx                     #aumento ecx che fa da contatore per muoversi di char in char
		jmp controllo0                #ripeto il ciclo

#############################
#controllo del nome pilota 1#
#############################
pilota_id1:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_1_str, %eax
	controllo1:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id2
		incl %ecx
		jmp controllo1

#############################
#controllo del nome pilota 2#
#############################
pilota_id2:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_2_str, %eax
	controllo2:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id3
		incl %ecx
		jmp controllo2

#############################
#controllo del nome pilota 3#
#############################
pilota_id3:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_3_str, %eax
	controllo3:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1  #
		jne pilota_id4
		incl %ecx
		jmp controllo3

#############################
#controllo del nome pilota 4#
#############################
pilota_id4:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_4_str, %eax
	controllo4:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id5
		incl %ecx
		jmp controllo4

#############################
#controllo del nome pilota 5#
#############################
pilota_id5:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_5_str, %eax
	controllo5:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id6
		incl %ecx
		jmp controllo5

#############################
#controllo del nome pilota 6#
#############################
pilota_id6:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_6_str, %eax
	controllo6:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id7
		incl %ecx
		jmp controllo6

#############################
#controllo del nome pilota 7#
#############################
pilota_id7:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_7_str, %eax
	controllo7:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id8
		incl %ecx
		jmp controllo7

#############################
#controllo del nome pilota 8#
#############################
pilota_id8:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_8_str, %eax
	controllo8:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id9
		incl %ecx
		jmp controllo8

#############################
#controllo del nome pilota 9#
#############################
pilota_id9:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_9_str, %eax
	controllo9:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id10
		incl %ecx
		jmp controllo9

##############################
#controllo del nome pilota 10#
##############################
pilota_id10:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_10_str, %eax
	controllo10:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id11
		incl %ecx
		jmp controllo10

##############################
#controllo del nome pilota 11#
##############################
pilota_id11:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_11_str, %eax
	controllo11:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id12
		incl %ecx
		jmp controllo11

##############################
#controllo del nome pilota 12#
##############################
pilota_id12:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_12_str, %eax
	controllo12:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id13
		incl %ecx
		jmp controllo12

##############################
#controllo del nome pilota 13#
##############################
pilota_id13:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_13_str, %eax
	controllo13:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id14
		incl %ecx
		jmp controllo13

##############################
#controllo del nome pilota 14#
##############################
pilota_id14:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_14_str, %eax
	controllo14:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id15
		incl %ecx
		jmp controllo14

##############################
#controllo del nome pilota 15#
##############################
pilota_id15:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_15_str, %eax
	controllo15:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id16
		incl %ecx
		jmp controllo15

##############################
#controllo del nome pilota 16#
##############################
pilota_id16:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_16_str, %eax
	controllo16:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id17
		incl %ecx
		jmp controllo16

##############################
#controllo del nome pilota 17#
##############################
pilota_id17:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_17_str, %eax
	controllo17:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id18
		incl %ecx
		jmp controllo17

##############################
#controllo del nome pilota 18#
##############################
pilota_id18:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_18_str, %eax
	controllo18:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne pilota_id19
		incl %ecx
		jmp controllo18

##############################
#controllo del nome pilota 19#
##############################
pilota_id19:
	popl %edx
	incl %edx
	pushl %edx
	xorl %ecx, %ecx
	leal pilot_19_str, %eax
	controllo19:
		movb (%eax, %ecx), %dl
		movb %dl, char1
		cmpb $0, char1
		je secondIf
		movb (%esi, %ecx), %dl
		cmpb %dl, char1
		jne invalid                     #invece che andare al controllo pilota successivo andiamo a invalid che printa l'errore
		incl %ecx
		jmp controllo19

secondIf:                           #controllo di fine stringa
	movb (%esi, %ecx), %dl            #prendo l ultimo char della prima riga del file
	cmpb $10, %dl                     #verifico che sia /n
	je trovato                        #se si, controllo completato e vado a ad assegnare id
	jmp invalid                       #se no, stringhe diverse, vado in invalid e printo errore

invalid:
	popl %edx                         #tiro fuori id dallo stack
	xorl %edx, %edx                   #resetto edx
	xorl %ecx, %ecx                   #resetto ecx
	xorl %ebx, %ebx                   #resetto ebx
	xorb %al, %al                     #resetto al
	leal invalid_pilot_str, %edx      #carico indirizzo della stringa in edx
	cicloInvalid:
		movb (%edx, %ebx), %al          #prendo il primo char della stringa
		cmpb $0, %al                    #guardo che non sia /0
		je fine                         #in caso si, ho finito
		movb %al, (%edi, %ebx)          #altrimenti lo metto nel file di output
		incl %ebx		                    #incremento ecx, contatore
		jmp cicloInvalid		            #ripeto il ciclo

trovato:
	popl %edx                         #tiro fuori id dallo stack
	movl %edx, id	                    #assegno all id il valore trovato
	# movl %ecx, indice
	xorl %eax, %eax                   #resetto eax
	xorl %ebx, %ebx                   #resetto ebx
	xorl %edx, %edx                   #resetto edx
        nuovaRiga:                        #Vado alla riga di dati (puntavo allo \n della prima riga)
		pushl %ecx                      #salvo nello stack la posizione dell ultimo char della riga sopra
		incl %ecx                       #incremento il contatore per prendere il primo char
		movb (%esi,%ecx),%al            #prendo il primo char della riga
		cmpb $0, %al                    #se risulta /0, sono alla fine del file
		je ultimaRigaPop
		checkRiga:                      #cerco la prima virgola della riga
			movb (%esi,%ecx),%al          #prendo il valore
			cmpb $44, %al                 #guardo che sia la virgola
			je checkId                    #se si, ho trovato id
			incl %ecx                     #incremento contatore
			jmp checkRiga                 #richiamo

	checkId:                          #inizio a verificare id
		incl %ecx                       #incremento il contatore
		movb (%esi,%ecx),%al            #prendo il char
		incl %ecx                       #incremento il contatore
		cmpb $44,(%esi,%ecx)            #controllo di avere una virgola, per vedere se id a una o due cifre
		je unaCifra
		jmp dueCifre

	unaCifra:                         #controllo id a una cifra
		subb $48, %al                   #tolgo 48 al char per avere il valore numerico
		cmpb id,%al                     #verifico che sia uguale al nostro id trovato prima
		je idUguale
		jmp idDiverso

	dueCifre:
		subb $48, %al                   #tolgo 48 al char per avere il valore numerico
		mulb num                        #risultato in %ax, moltiplico per 10
                movb (%esi,%ecx),%dl            #prendo la seconda cifra di id
		subb $48, %dl                   #tolgo 48 al char per avere il valore numerico
		addb %dl, %al                   #aggiungo la seconda cifra alla prima che avevamo moltiplicato per 10
		cmpb id,%al                     #verifico che siano uguali al nostro id trovato prima
		je idUguale
		jmp idDiverso

	idUguale:                         #se id uguali
		popl %ecx                       #riprendo il contatore che indica inizio riga
		incl %ecx                       #incremento contatore
		jmp stampaRiga                  #vado a stampare il tempo

	idDiverso:
		popl %ecx                       #prendo il contatore dallo stack
		incl %ecx                       #lo incremento
		jmp nextRiga                    #passo alla riga successiva

	nextRiga:
		movb (%esi,%ecx),%al            #prendo il primo char della nuova riga
		cmpb $0, %al                    #guardo che non sia /0
		je stampaUltimaRiga
		cmpb $10,%al                    #guardo che non sia /n
		je nuovaRiga                    #rimando sopra e ricomincio con una riga nuova
		incl %ecx                       #incremento
		jmp nextRiga                    #richiamo

	stampaRiga:                       #situazione: ho ecx che conta al primo char della riga
		movb (%esi,%ecx),%al            #prendo il primo char della riga
		cmpb $44,%al                    #guardo che non sia una virgola
		je skip_id                      #se virgola, ho id, skippo che non serve piu
		movb %al,(%edi,%ebx)            #metto il char in out, uso come contatore ebx, poiche parto da 0 ora
		incl %ebx                       #incremento contatore out
		incl %ecx                       #incremento contatore in
		jmp stampaRiga                  #richiamo

	skip_id:                          #per saltare id mentre scriviamo nel file
		incl %ecx                       #incremento, ora sto puntato alla prima cifra di id
		movb (%esi,%ecx),%al            #prendo la prima cifra
		cmpb $44,%al                    #guardo se virgola
		je velocita                     #se non e virgola vado avanti con la velocita
		jmp skip_id                     #se virgola, id a due cifre, ripeto ciclo

	velocita:                         #stampa nel out di velocita
		movl $0, vel                    #metto a 0 la var velocita
		pushl %ebx                      #salvo nello stack il count dell out
		ciclo_v:
			incl %ecx                     #incremento ecx, count in
			xorl %eax, %eax               #resetto eax
			movb (%esi,%ecx),%al          #prendo il primo numero della velocita e metto in eax
			cmpb $44,%al                  #guardo che non sia virgola
			je checkVelMax                #se virgola passo a altri controlli
			pushl %eax                    #salvo nello stack la cifra appena presa
			xorl %eax, %eax               #resetto eax
			movl vel, %eax                #metto in eax il valore precedente che avevo nella variabile velocita
			mull moltiplicatore           #moltiplico eax per dieci, risultato in al
			movl %eax, %ebx               #muovo eax in ebx
			xorl %eax, %eax               #resetto eax
			popl %eax                     #riprendo dallo stack il valore che avevo messo in precedenza, la cifra
			subl $48, %eax                #tolgo 48 per avere il valore numerico
			addl %ebx, %eax               #aggiungo il valore di ebx alla cifra
			movl $0, vel                  #resetto la variabile velocita
			movl %eax, vel                #metto eax, nuova velocita con cifra in piu, nella variabile
			jmp ciclo_v                   #ripeto il ciclo

	checkVelMax:                      #trovo il valore massimo tra le velocita
		xorl %eax, %eax                 #resetto eax
		movl vel, %eax                  #sposto la velocita in eax, l ultima trovata
		addl $1,contatoreVel            #incremento il contatore di velocita
		addl %eax,sommaVel              #aggiungo la velocita al tot, servira per la media
		cmpl vel_max, %eax              #confronto la velocita massima salvata con quella attuale
		jng calcolo_rpm                 #se non maggiore salto a calxolo rpm
		movl %eax,vel_max               #se maggiore
		jmp calcolo_rpm                 #vado a calcolo rpm

	calcolo_rpm:
		movl $0, rpm                    #metto a 0 la variabile rpm
		ciclo_rpm:
			incl %ecx                     #incremento contatore in
			xorl %eax,%eax                #resetto eax
			movb (%esi,%ecx),%al          #prendo il valore e lo metto in al
			cmpb $44,%al                  #guardo che non sia una virgola
			je checkRpmMax                #se si passo ad altro controllo
			pushl %eax                    #salvo nello stack la cifra appena presa
			xorl %eax,%eax                #resetto eax
			movl rpm,%eax                 #sposto in eax il valore precedente che avevo in rpm
			mull moltiplicatore           #moltiplico per 10, risultato in al
			movl %eax, %ebx               #muovo il valore in ebx
			xorl %eax, %eax               #resetto eax
			popl %eax                     #riprendo il valore che avevo salvato nello stack
			subl $48, %eax                #sottraggo 48 per avere il valore effettivo
			addl %ebx, %eax               #aggiungo il valore
			movl $0, rpm                  #resetto la variabile
			movl %eax, rpm                #sposto il valore finale nella variabile
			jmp ciclo_rpm                 #richiamo il ciclo

	checkRpmMax:
		xorl %eax, %eax                 #resetto eax
		movl rpm, %eax                  #sposto il valore di rpm in eax
		cmpl rpm_max, %eax              #verifico che attuale rpm sia maggiore o meno del maggiore trovato in precedenza
		jng calcolo_temperatura         #se no passo a calcolo temperatura
		movl %eax,rpm_max               #se si lo setto come maggiore
		jmp calcolo_temperatura         #passo a calcolo temperatura

	calcolo_temperatura:
		movl $0, temp                   #metto a 0 la variabile temp
		ciclo_temp:
			incl %ecx                     #incremento contatore in
			xorl %eax,%eax                #resetto eax
			movb (%esi,%ecx),%al          #prendo il valore e lo metto in al
			cmpb $0,%al                   #guardo che non sia una virgola
			je checkTempMax               #se si passo ad altro controllo
			cmpb $10,%al                  #guardo di non essere a fine riga
			je checkTempMax               #se si passo ad altro controllo
			pushl %eax                    #salvo nello stack la cifra appena presa
			xorl %eax,%eax                #resetto eax
			movl temp,%eax                #sposto in eax il valore precedente che avevo in temp
			mull moltiplicatore           #moltiplico per 10, risultato in al
			movl %eax, %ebx               #muovo il valore in ebx
			xorl %eax, %eax               #resetto eax
			popl %eax                     #riprendo il valore che avevo salvato nello stack
			subl $48, %eax                #sottraggo 48 per avere il valore effettivo
			addl %ebx, %eax               #aggiungo il valore
			movl $0, temp                 #resetto la variabile
			movl %eax, temp               #sposto il valore finale nella variabile
			jmp ciclo_temp                #richiamo il ciclo

	checkTempMax:
		xorl %eax, %eax                 #resetto eax
		movl temp, %eax                 #sposto il valore di temp in eax
		cmpl temp_max, %eax             #verifico che attuale temp sia maggiore o meno del maggiore trovato in precedenza
		jng controllo_rpm               #se no passo a controllo
		movl %eax,temp_max              #se si sposto la temp corrente in max
		jmp controllo_rpm               #passo a controllo

	controllo_rpm:
		popl %ebx                       #riprendo il count out che avevo nello stack (riga 635)
		call virgola                    #chiamo funzione per printare virgola
		xorl %eax, %eax                 #resetto eax
		movl rpm_minore,%eax            #prendo il valore minore di controllo e lo metto in eax
		cmp %eax,rpm                    #confronto le variabili
		jle stampa_low_rpm              #se minore vado a stampa minore rpm
		xorl %eax, %eax                 #resetto eax
		movl rpm_maggiore,%eax          #prendo il valore maggiore di controllo e lo metto in eax
		cmp %eax,rpm                    #confronto le variabili
		jg stampa_high_rpm              #se maggiore vado a stampa maggiore rpm
		jmp stampa_medium_rpm           #vado a stampa media rpm

	controllo_temp:
		call virgola                    #chiamo funzione per printare virgola
		xorl %eax, %eax                 #resetto eax
		movl temp_minore,%eax           #prendo il valore minore di controllo e lo metto in eax
		cmp %eax,temp                   #confronto le variabili
		jle stampa_low_temp             #se minore vado a stampa minore temp
		xorl %eax, %eax                 #resetto eax
		movl temp_maggiore,%eax         #prendo il valore maggiore di controllo e lo metto in eax
		cmp %eax,temp                   #confronto le variabili
		jg stampa_high_temp             #se maggiore vado a stampa maggiore temp
		jmp stampa_medium_temp          #vado a stampa media temp

	controllo_vel:
		call virgola                    #chiamo funzione per printare virgola
		xorl %eax, %eax                 #resetto eax
		movl vel_minore,%eax            #prendo il valore minore di controllo e lo metto in eax
		cmp %eax,vel                    #confronto le variabili
		jle stampa_low_vel              #se minore vado a stampa minore vel
		xorl %eax, %eax                 #resetto eax
		movl vel_maggiore,%eax          #prendo il valore maggiore di controllo e lo metto in eax
		cmp %eax,vel                    #confronto le variabili
		jg stampa_high_vel              #se maggiore vado a stampa maggiore vel
		jmp stampa_medium_vel           #vado a stampa media vel

	stampa_low_rpm:
		call low                        #chiamo funzione per printare low
		jmp controllo_temp

	stampa_medium_rpm:
		call medium                     #chiamo funzione per printare medium
		jmp controllo_temp

	stampa_high_rpm:
		call high                       #chiamo funzione per printare high
		jmp controllo_temp

	stampa_low_temp:
		call low                        #chiamo funzione per printare low
		jmp controllo_vel

	stampa_medium_temp:
		call medium                     #chiamo funzione per printare medium
		jmp controllo_vel

	stampa_high_temp:
		call high                       #chiamo funzione per printare high
		jmp controllo_vel

	stampa_low_vel:
		call low                        #chiamo funzione per printare low
		call newline                    #chiamo funzione per printare /n
		xorl %eax,%eax                  #resetto eax
		movb (%esi,%ecx),%al            #prendo char da input
		cmpb $0,%al                     #confronto
		je ultimaRiga                   #se 0 sono a fine file in
		jmp nuovaRiga                   #altrimenti vado a nuova riga

	stampa_medium_vel:
		call medium                     #chiamo funzione per printare medium
		call newline                    #chiamo funzione per printare /n
		xorl %eax,%eax                  #resetto eax
		movb (%esi,%ecx),%al            #prendo char da input
		cmpb $0,%al                     #confronto
		je ultimaRiga                   #se 0 sono a fine file in
		jmp nuovaRiga                   #altrimenti vado a nuova riga

	stampa_high_vel:
		call high                       #chiamo funzione per printare high
		call newline                    #chiamo funzione per printare /n
		xorl %eax,%eax                  #resetto eax
		movb (%esi,%ecx),%al            #prendo char da input
		cmpb $0,%al                     #confronto
		je ultimaRiga                   #se 0 sono a fine file in
		jmp nuovaRiga                   #altrimenti vado a nuova riga

	ultimaRiga:
	        jmp stampaUltimaRiga

	ultimaRigaPop:
		popl %ecx
		jmp stampaUltimaRiga

stampaUltimaRiga:
	xorl %eax, %eax                  #resetto eax
	xorl %edx, %edx                  #resetto edx
	movl sommaVel, %eax              #metto la var sommaVel in eax
	cmpl $0,contatoreVel             #controllo che il contatoreVel non sia 0
	je fine                          #vado a fine
	divl contatoreVel                #divido eax per contatoreVel
	movl %eax, velMedia              #sposto il risultato nella var velMedia
	movl rpm_max, %eax               #metto rpm_max in eax
	call itoa                        #chiamo funzione int to ascii, ho bisogno del valore ascii per mettere nel file out
	call virgola                     #funzione per printare la virgola
	movl temp_max, %eax              #metto temp_max in eax
	call itoa                        #chiamo funzione int to ascii, ho bisogno del valore ascii per mettere nel file out
	call virgola                     #funzione per printare la virgola
	movl vel_max, %eax               #metto vel_max in eax
	call itoa                        #chiamo funzione int to ascii, ho bisogno del valore ascii per mettere nel file out
	call virgola                     #funzione per printare la virgola
	movl velMedia, %eax              #metto velMedia in eax
	call itoa                        #chiamo funzione int to ascii, ho bisogno del valore ascii per mettere nel file out
	nop                              #per il debug :)
	jmp fine                         #vado a fine

fine:
call newline                       #nuova riga
popl %edx
popl %ecx
popl %ebx
popl %eax
ret

.type low, @function
low:                               #inserimento della stringa lowS all'interno del file di output
	pushl %ecx                 #salvo nello stack il valore corrente di ecx (contatore del file di input)
	xorl %ecx, %ecx            #resetto il valore di ecx dato che mi serve come contatore che parte da 0
	xorl %eax, %eax            #resetto eax
	xorl %edx, %edx            #resetto edx 
	leal lowS, %edx            #carico indirizzo della stringa in edx
        cicloLow:
		movb (%edx, %ecx), %al          #prendo il char della stringa spiazzato di ecx
		cmpb $0, %al                    #guardo che non sia /0
		je cicloLowEsci                 #in caso si, ho finito
		movb %al, (%edi, %ebx)          #altrimenti lo metto nel file di output
		incl %ebx	                #incremento ebx, contatore file output
		incl %ecx	                #incremento ecx, contatore
		jmp cicloLow		        #ripeto il ciclo
	
	cicloLowEsci:
		popl %ecx          #riprendo il valore di ecx salvato nello stack
		ret

.type medium, @function
medium:                            #inserimento della stringa mediumS all'interno del file di output
	pushl %ecx                 #salvo nello stack il valore corrente di ecx (contatore del file di input)
	xorl %ecx, %ecx            #resetto il valore di ecx dato che mi serve come contatore che parte da 0
	xorl %eax, %eax            #resetto eax
	xorl %edx, %edx            #resetto edx 
	leal mediumS, %edx            #carico indirizzo della stringa in edx
        cicloMedium:
		movb (%edx, %ecx), %al          #prendo il char della stringa spiazzato di ecx
		cmpb $0, %al                    #guardo che non sia /0
		je cicloMediumEsci                 #in caso si, ho finito
		movb %al, (%edi, %ebx)          #altrimenti lo metto nel file di output
		incl %ebx	                #incremento ebx, contatore file output
		incl %ecx	                #incremento ecx, contatore
		jmp cicloMedium		        #ripeto il ciclo
	
	cicloMediumEsci:
		popl %ecx          #riprendo il valore di ecx salvato nello stack
		ret


.type high, @function
high:                              #inserimento della stringa highS all'interno del file di output
	pushl %ecx                 #salvo nello stack il valore corrente di ecx (contatore del file di input)
	xorl %ecx, %ecx            #resetto il valore di ecx dato che mi serve come contatore che parte da 0
	xorl %eax, %eax            #resetto eax
	xorl %edx, %edx            #resetto edx 
	leal highS, %edx            #carico indirizzo della stringa in edx
        cicloHigh:
		movb (%edx, %ecx), %al          #prendo il char della stringa spiazzato di ecx
		cmpb $0, %al                    #guardo che non sia /0
		je cicloHighEsci                 #in caso si, ho finito
		movb %al, (%edi, %ebx)          #altrimenti lo metto nel file di output
		incl %ebx	                #incremento ebx, contatore file output
		incl %ecx	                #incremento ecx, contatore
		jmp cicloHigh		        #ripeto il ciclo
	
	cicloHighEsci:
		popl %ecx          #riprendo il valore di ecx salvato nello stack
		ret


.type virgola, @function
virgola:                           #metto ascii della virgola in out
	movb $44,(%edi,%ebx)
	incl %ebx
ret

.type newline, @function
newline:                           #metto ascii di \n in out
	movb $10,(%edi,%ebx)
	incl %ebx
ret

.type itoa @function
itoa:                              #conversione da intero a stringa, per mettere poi dentro out
	cmpl $10, %eax
	jge divisione
	addb $48, %al
	movb %al,(%edi,%ebx)
	incl %ebx
	popItoa:
		cmpl $0,contatorePush
		je return
		popl %eax
		addb $48, %al
		movb %al,(%edi,%ebx)
		incl %ebx
		subl $1,contatorePush
		jmp popItoa

	divisione:
		xorl %edx, %edx
		divl moltiplicatore # Moltiplicatore vale 10
		pushl %edx
		addl $1,contatorePush
		jmp itoa

	return:
		ret
