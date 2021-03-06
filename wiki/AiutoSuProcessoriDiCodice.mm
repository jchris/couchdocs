## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language it
<<TableOfContents>>

== Processori di Codice ==

I processori di codice elaborano il testo contenuto in una sezione
''codice''. Puoi specificare quale processore usare dichiarandolo
nella prima riga con un construtto detto ''bang path''. Si tratta
di un concetto derivato dalla convenzione utilizzata negli script
Unix, grosso modo con lo stesso obbiettivo: la prima riga indica
alla shell quale programma attivare per elaborare le rimanenti righe
dello script.

Per ulteriori informazioni sulle possibili formattazioni, consulta AiutoSuModificaPagina.

=== Colorize ===

Il processore `Colorize` è per il momento in grado di riconoscere ed
enfatizzare i sorgenti Python. Oltre alla maniera usuale di invocare
quel processore, MoinMoin riconosce anche il tradizionale ''bang path''<<FootNote("bang" è l'appellativo gergale per il carattere "!", il punto esclamativo)>>
nella prima riga dello script, posto che contenga la parola "`python`".

Esempio:
{{{
#!python
if lines[0].contains("python"):
    print "a colori!"
}}}

=== CSV ===

Il processore CSV elabora i cosiddetti ''Comma Separated Values'', ossia
''lista di valori separati da virgole'', anche se spesso viene utilizzato il
punto-e-virgola ";" al posto della virgola.
La prima riga viene considerata come intestazione delle colonne, e verrà
resa in '''grossetto''', così quando non desideri avere l'intestazione,
lascia una prima riga vuota.

Il bang path può contenere argomenti "`-`''indice''" , per nascondere alcune
colonne; l'indice delle colonne parte da 1.

 /!\ L'implementazione corrente contiene un parser CSV ''molto'' semplice.

Esempio:
MoinMoin Version History: {{{#!CSV -3
Versione;Data;NASCOSTO!
0.11;2002-03-11;Revision 1.151
0.10;2001-10-28;Revision 1.134
0.9;2001-05-07;
0.8;2001-01-23;
0.7;2000-12-06;
0.6;2000-12-04;
0.5;2000-11-17;
0.4;2000-11-01;
0.3;2000-10-25;
0.2;2000-08-26;
0.1;2000-07-29;
}}}
