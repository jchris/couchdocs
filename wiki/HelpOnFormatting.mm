## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
== Text Formatting Rules ==

Leave blank lines between paragraphs. Use {{{<<BR>>}}} to insert linebreaks into paragraphs.

You can render text in ''italics'' or '''bold'''.
To write italics, enclose the text in double single quotes.
To write bold, enclose the text in triple single quotes.
__Underlined text__ needs a double underscore on each side.
You get ^superscripted text^ by enclosing it into caret characters,
and ,,subscripts,, have to be embedded into double commas.
If you need something ~-smaller-~ or ~+larger+~ you can get that by writing {{{~-smaller-~}}} or {{{~+larger+~}}}.

To insert program source in a {{{monospace font}}} without reformatting, use three curly braces:
{{{
10 PRINT "Hello, world!"
20 GOTO 10
}}}

Note that within code sections, both inline and display ones, any wiki markup is ignored. An alternative and shorter syntax for `inlined code` is to use backtick characters (note that this can be disabled by the site's configuration, but is enabled by default).

For more information on the possible markup, see HelpOnEditing.

=== Example ===
{{{
__Mixing__ ''italics'' and '''bold''':
 * '''''Mix''' at the beginning''
 * '''''Mix'' at the beginning'''
 * '''Mix at the ''end'''''
 * ''Mix at the '''end'''''

You might recall ''a''^2^ `+` ''b''^2^ `=` ''c''^2^ from your math lessons, unless your head is filled with H,,2,,O.

An { { {inline code sequence} } } has the start and end markers on the same line. Or you use `backticks`.

A code display has them on different lines: { { {
'''No''' markup here!
} } }
}}} 
/!\ In the above example, we "escaped" the markers for source code sequences by inserting spaces between the curly braces.

=== Display ===
__Mixing__ ''italics'' and '''bold''':
 * '''''Mix''' at the beginning''
 * '''''Mix'' at the beginning'''
 * '''Mix at the ''end'''''
 * ''Mix at the '''end'''''

You might recall ''a''^2^ `+` ''b''^2^ `=` ''c''^2^ from your math lessons, unless your head is filled with H,,2,,O.

An {{{inline code sequence}}} has the start and end markers on the same line. Or you use `backticks`.

A code display has them on different lines: {{{
'''No''' markup here!
}}}

=== Colorized code displays ===
There are several ways to get colorized formatting of code<<FootNote(There is currently only support for limited number of languages, see HelpOnParsers.)>>:
 1. start a code display with a line only containing "#!PARSERNAME"
 1. embed a file attachment bearing a ".py" extension via "inline:"
 1. start a page with a format processing instruction ("#format PARSERNAME")

Example: {{{#!python
from colors import palette
palette.colorize('python')
}}}
