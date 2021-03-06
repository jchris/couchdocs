## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language it
== Regole di formattazione del testo ==

Lascia una riga vuota tra i paragrafi. Usa {{{<<BR>>}}} per forzare l'a-capo in un paragrafo.

Puoi visuazzare del testo in ''corsivo'' oppure in '''grassetto'''.
Per scrivere in corsivo, racchiudi il testo in doppi apici.
Per scrivere in grassetto, delimita il testo con tre apici.
Per ottenere del testo ^spostato in alto^, racchiudilo con due caratteri "^".

Per inserire del testo senza che sia riformattato con un carattere {{{a spaziatura fissa}}}, ad esempio
il sorgente di un programma, usa tre parentesi graffe consecutive:
{{{
10 PRINT "Hello, world!"
20 GOTO 10
}}}

Note that within code sections, both inline and display ones, any wiki markup is ignored. An alternative and shorter syntax for `inlined code` is to use backtick characters (note that this can be disabled by the site's configuration, but is enabled by default).

For more information on the possible markup, see HelpOnEditing.

=== Example ===
{{{
Mixing ''italics'' and '''bold''':
 * '''''Mix''' at the beginning''
 * '''''Mix'' at the beginning'''
 * '''Mix at the ''end'''''
 * ''Mix at the '''end'''''

You might recall ''a''^2^ `+` ''b''^2^ `=` ''c''^2^ from your math lessons.

An { { {inline code sequence} } } has the start and end markers on the same line. Or you use `backticks`.

A code display has them on different lines: { { {
'''No''' markup here!
} } }
}}} 
/!\ In the above example, we "escaped" the markers for source code sequences by inserting spaces between the curly braces.

=== Display ===
Mixing ''italics'' and '''bold''':
 * '''''Mix''' at the beginning''
 * '''''Mix'' at the beginning'''
 * '''Mix at the ''end'''''
 * ''Mix at the '''end'''''

You might recall ''a''^2^ `+` ''b''^2^ `=` ''c''^2^ from your math lessons.

An {{{inline code sequence}}} has the start and end markers on the same line. Or you use `backticks`.

A code display has them on different lines: {{{
'''No''' markup here!
}}}

=== Colorized code displays ===
There are several ways to get colorized formatting of Python code<<FootNote(There is currently no support for languages other than Python.)>>:
 1. start a code display with a line only containing "#!python"
 1. embed a file attachment bearing a ".py" extension via "inline:"
 1. start a page with a Python format processing instruction ("#format python")

Example: {{{
#!python
from colors import palette
palette.colorize('python')
}}}
