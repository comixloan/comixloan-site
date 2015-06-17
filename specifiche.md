#Casi D'uso

## UC1: Registrazione utente

L’utente utilizza il sistema per registrarsi: è richiesta una mail valida e non utilizzata (prova@mail.qualcosa) , una password, un username, il nome ed il cognome  dell’utente.

Una volta registrato l’utente può utilizzare il sistema.

## UC2: Accesso utente

L’utente può accedere inserendo mail/username e  password.

## UC3: Creazione comunita

L’utente sceglie di creare una nuova comunità , inserisce il nome , ed aggiunge una descrizione. Dopo averla creata può aggiungere altri utenti inserendo il loro username.

## UC4: Navigazione comunita

L’utente può navigare fra le comunità in cui è iscritto e visualizzare gli altri utenti iscritti in esse.

## UC5: Gestione Volumi

L’utente sceglie di visualizzare i propri fumetti. Il sistema visualizza i fumetti posseduti, il loro numero totale ed il valore della “libreria”(di tutti i fumetti posseduti dall’Utente).

Può aggiungerne di nuovi selezionando la serie di cui vuole aggiungere uno o più fumetti. 

Se la serie non esiste nel database deve crearla inserendone il nome, l’autore, la descrizione e l’editore.

L’utente quando aggiunge un singolo fumetto indica il numero dell’albo, la descrizione ed il relativo prezzo. Se aggiunge più fumetti insieme deve inserire l’intervallo desiderato ed indicare il prezzo di default di ogni volume dell’intervallo.

## UC6: Visualizzazione prestiti in corso

L’utente sceglie di visualizzare tutti i prestiti in corso. Selezionando un prestito in corso l’utente può  ottenere informazione sulla data in cui è iniziato, sui fumetti prestati e sull’utente.

## UC7: Creazione nuovo prestito

L’Utente sceglie di creare un nuovo prestito. Il sistema visualizza solo gli utenti che sono iscritti ad una comunità dell’Utente.  L’Utente seleziona quello a cui vuole prestare i suoi fumetti. L’utente cerca i fumetti disponibili. Il sistema visualizza i fumetti non prestati dell’utente. L’utente seleziona i fumetti da aggiungere al prestito (“lo zaino”). Quando ha concluso l’utente dice al sistema di creare il prestito. Da questo momento il prestito sarà visualizzabile fra i prestiti in corso.

## UC8: Restituzione prestito

L’utente sceglie di visualizzare i prestiti in corso e segna come restituito il prestito che si è concluso. Da questo momento il prestito è concluso e quindi il sistema lo registra nello Storico prestiti.

## UC9: Log-out dell'utente

L’utente sceglie di uscire dal sistema. Il sistema scollega l’utente.
