## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
#pragma section-numbers off
<<Navigation(slides)>>

= Headlines and Paragraphs =

Headlines are placed on a line of their own and surrounded by one to five equal signs denoting the level of the headline. The headline is in between the equal signs, separated by a space. Example: <<BR>> `== Second Level ==`

 (!) A common error is to insert an additional blank after the ending equal signs!

Paragraphs are lines separated by empty lines or other block structures.  This means
those lines
which ''directly'' follow each other
belong to ''one'' paragraph.

Preformatted text (e.g. a copy of an email) should be placed inside three curly braces `{{{ ... }}}`: {{{
First Line
...
Last Line
}}}

For better visual separation, horizontal lines can be generated by using four dashes.
----
For details see HelpOnHeadlines and HelpOnRules.