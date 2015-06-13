# comixloan-site

## Che cosa è?
Il portale web comiXloan permette di gestire il prestito di fumetti in una comunità di amici.
Il sistema prevede che un utente, una volta acceduto possa:

1. entrare in una delle comunità di amici a cui è iscritto
2. confermare la richiesta di prestito di uno o più albi ,appartenenti ad una delle sue serie. NB: un utente può prestare albi solo ad amici di una comunità a cui è iscritto.
3. confermare la restituzione di uno o più albi da parte di un utente.

Altre specifiche saranno approfondite nel diagramma delle classi Software.

## Configurazione Database

Creare in WebContent/WEB-INF questo file resources.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<tomee>
<Resource id="comiCloan Database" type="DataSource">
JdbcDriver  	 	org.postgresql.Driver
JdbcUrl  			jdbc:postgresql://localhost/products
UserName     		postgres
Password     		siw
JtaManaged      	true
DefaultAutoCommit   false
</Resource>
</tomee>

```

## Librerie sviluppate ad hoc

### jQuery Action

Un esempio di questo plugin può essere visionato in [questa pagine](https://github.com/comixloan/comixloan-site/blob/master/WebContent/loan/add.xhtml)

Questo plugin per jQuery serve per risolvere un bug di JSF: l'action del commandButton o commandLink non funzionano dentro un un ui:repeat o un c:forEach.

#### Come usarlo

Al di fuori del ui:repeat o del c:forEach scrivere ad esempio:

```xml
<h:form id="action_select_user" class="formhide">
    <h:commandButton action="#{loanController.selectUser}"
    value="Seleziona">
    </h:commandButton>
</h:form>
```

Sostituire il commmandButton che non funziona con questo codice:

```xml
<button onclick='$("#action_select_user").action({idUser: #{user.id}});'>Seleziona</button>
```

Nel caso di un commandLink può essere sostituito con questo codice:

```xml
<a href = "#" onclick='$("#action_select_user").action({idUser: #{user.id}});'>Seleziona</a>
```

## Link Utili

DEMO: [http://comixloan.tk/](http://comixloan.tk/)

DOC: [http://doc.comixloan.tk/](http://doc.comixloan.tk/)
