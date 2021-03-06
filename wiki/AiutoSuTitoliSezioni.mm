## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language it
#pragma section-numbers on

== Intestazione Sezioni ==

Puoi creare delle intestazioni cominciando e terminando una riga con
fino a cinque caratteri "=" consecutivi. Questi marcatori delimitano
il testo dell'intestazione, con uno spazio tra ogni marcatore e il
testo che lo segue/precede.

Le intestazioni vengono numerate automaticamente, cosa che può essere
disabilitata sulla singola pagina (vedi `#pragma section-numbers` on
AiutoSuIstruzioniDiProcesso) e complessivamente per tutto il sito
(vedi `show_section_numbers` on HelpOnConfiguration).

Per ulteriori informazioni sulle possibilità di formattazione, vedi AiutoSuModificaPagina. 

=== Esempio ===
{{{
 = Sezione =
 == Sottosezione ==
 === Livello 3 ===
 ==== Livello 4 ====
 ===== Livello 5 =====
}}} 

=== Risultato ===
 = Sezione =
 == Sottosezione ==
 === Livello 3 ===
 ==== Livello 4 ====
 ===== Livello 5 =====

Da notare che per ottenere una numerazione corretta delle sezioni devi
impostare la pagina con una struttura valida, cioè indentata
correttamente.

L'esempio qui sopra non lo è, e quindi la numerazione ottenuta è
diversa da quella che ci si aspettava.
