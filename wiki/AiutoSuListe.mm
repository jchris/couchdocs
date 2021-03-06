## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language it
== Liste e Rientranze ==

Puoi creare delle liste sia puntate che numerate in una maniera molto
naturale. Tutto quello che devi fare e' inserire le righe che
contengono gli elementi della lista. Per ottenere una lista puntata,
comincia la riga con un asterisco "{{{*}}}"; per una con gli elementi
numerati comincia ognuno di essi con un modello tipo "{{{1.}}}",
"{{{a.}}}", "{{{A.}}}", "{{{i.}}}" o "{{{I.}}}". Qualsiasi altra cosa
semplicemente fara' rientrare la riga rispetto al margine
sinistro. Per iniziare la numerazione da un certo valore, aggiungi
"{{{#}}}''valore''" al modello.

Per nidificare liste a diversi livelli, usa un differente margine
sinistro.  Tutti gli elementi con lo stesso margine appartengono alla
stessa (sotto-)lista. Questo significa anche che non e' possibile
modificare lo stile della lista dopo averla gia' cominciata.

Le liste di definizioni possono essere create con elementi nella forma {{{<spazi>termine:: definizione}}};
nota che ''termine'' non puo' al momento contenere nessun marcatore wiki.

Per ulteriori informazioni sulla formattazione, consulta AiutoSuModificaPagina.

=== Esempio ===
{{{
Se tu fai rientrare del testo
  in questa maniera, verra' fatto rientrare
    puoi avere piu' livelli di indentazione

Se metti un asterisco all'inizio della linea
  * ottieni
  * una lista
  * puntata
    * che a sua volta puo' essere
      * nidificata su piu' livelli

Un elenco numerato, con elementi puntati:
  1. uno
  1. due
    1. uno
      * punto 1
      * punto 2
    1. due
  1. tree
    * punto
      1. uno

Variazioni sulle liste numerate:
  * Romano minuscolo
    i. uno
    i. due
  * Romano maiuscolo (comincia da 42)
    I.#42 quaranta-due
    I. quaranta-tre
  * Alfabetico minuscolo
    a. uno
    a. due
  * Alfabetico maiuscolo
    A. uno
    A. due

 termine:: definizione
 altro termine:: e la sua definizione
}}} 

=== Risultato ===
Se tu fai rientrare del testo
  in questa maniera, verra' fatto rientrare
    puoi avere piu' livelli di indentazione

Se metti un asterisco all'inizio della linea
  * ottieni
  * una lista
  * puntata
    * che a sua volta puo' essere
      * nidificata su piu' livelli

Un elenco numerato, con elementi puntati:
  1. uno
  1. due
    1. uno
      * punto 1
      * punto 2
    1. due
  1. tree
    * punto
      1. uno

Variazioni sulle liste numerate:
  * Romano minuscolo
    i. uno
    i. due
  * Romano maiuscolo (comincia da 42)
    I.#42 quaranta-due
    I. quaranta-tre
  * Alfabetico minuscolo
    a. uno
    a. due
  * Alfabetico maiuscolo
    A. uno
    A. due

 termine:: definizione
 altro termine:: e la sua definizione
