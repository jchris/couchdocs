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

{{{
#pragma section-numbers off
#acl All:admin,read,write,delete,revert
#language en
}}}

This page tries to use each supported markup element at least once.

{{{
'''Index'''
<<TableOfContents(2)>>
}}}
'''Index'''

<<TableOfContents(2)>>

= Headers =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====

= Font styles =
{{{
Normal text, ''emphasized'', '''strong''', __underline__, ,,subscript,,, ^superscript^, `typewriter` and {{{typewriter}}}.
}}}

Normal text, ''emphasized'', '''strong''', __underline__, ,,subscript,,, ^superscript^, `typewriter` and {{{typewriter}}}.

== Syntax Highlighting ==
 {{{#!python
# python code
print code.colorize("abc", 1 + 1)
}}}

= Smileys =
<<ShowSmileys>>

= Hyperlinks =
== Internal ==
{{{
 * MoinMoin
 * MoinMoin/TextFormatting
 * MoinMoin/InstallDocs 
 * ../InstallDocs 
 * /SubPage
 * Self:InterWiki
}}}
 * MoinMoin
 * MoinMoin/TextFormatting
 * MoinMoin/InstallDocs 
 * ../InstallDocs 
 * /SubPage
 * Self:InterWiki

{{{
[#anchorname Anchor Link]
}}}
[#anchorname Anchor Link]

== External ==
{{{
 * http://moinmoin.wikiwikiweb.de/
 * [http://moinmoin.wikiwikiweb.de/]
 * [http://moinmoin.wikiwikiweb.de/ MoinMoin Wiki]
 * [http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png]
 * http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png
 * [http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png moinmoin.png]
 * MeatBall:InterWiki
 * wiki:MeatBall/InterWiki
 * [wiki:MeatBall/InterWiki]
 * [wiki:MeatBall/InterWiki InterWiki page on MeatBall]
 * [file://servername/full/path/to/file/filename%20with%20spaces.txt Click here to read filename with spaces.txt]
 * me@privacy.net
}}}
 * http://moinmoin.wikiwikiweb.de/
 * [http://moinmoin.wikiwikiweb.de/]
 * [http://moinmoin.wikiwikiweb.de/ MoinMoin Wiki]
 * [http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png]
 * http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png
 * [http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png moinmoin.png]
 * MeatBall:InterWiki
 * wiki:MeatBall/InterWiki
 * [wiki:MeatBall/InterWiki]
 * [wiki:MeatBall/InterWiki InterWiki page on MeatBall]
 * [file://servername/full/path/to/file/filename%20with%20spaces.txt Click here to read filename with spaces.txt]
 * me@privacy.net
== Escaping WikiNames ==
{{{
Wiki''''''Name
Wiki``Name
}}}
Wiki''''''Name
Wiki``Name

= Blockquote =
{{{
 This is indented
  Even more
}}}
 This is indented
  Even more

= Bullet list =
{{{
 * item 1

 * item 2, with gap
 * item 3
   * item 3.1
}}}
 * item 1

 * item 2, with gap
 * item 3
   * item 3.1
= Numbered list =
{{{
 1. item 1
   i. item 1
   i. item 2
}}}
 1. item 1
   i. item 1
   i. item 2
{{{
 1. item 2
   a. item 1
   a. item 2
}}}
 1. item 2
   a. item 1
   a. item 2
= Descriptions + Definitions =
{{{
 Term:: Description
 Label:: Definition
}}}
 Term:: Description
 Label:: Definition
= Code display =
 {{{
line 1
    indented 4 characters
}}}

= Tables =
== General table layout and HTML like options ==
{{{
 ||||||<tablewidth="80%">'''Heading'''||
 ||cell 1||cell2||cell 3||
 ||<rowspan=2> spanning rows||||<bgcolor='#E0E0FF'> spanning 2 columns||
 ||<rowbgcolor="#FFFFE0">cell2||cell 3||
}}}
 ||||||<tablewidth="80%">'''Heading'''||
 ||cell 1||cell2||cell 3||
 ||<rowspan=2> spanning rows||||<bgcolor='#E0E0FF'> spanning 2 columns||
 ||<rowbgcolor="#FFFFE0">cell2||cell 3||

== Cell width ==
{{{
 || narrow ||<:99%> wide ||
}}}
 || narrow ||<:99%> wide ||

== Spanning rows and columns ==
{{{
 ||<|2> 2 rows || row 1 ||
 || row 2 ||
 ||<-2> row 3 over 2 columns ||
}}}
 ||<|2> 2 rows || row 1 ||
 || row 2 ||
 ||<-2> row 3 over 2 columns ||

== Alignment ==
{{{
 ||<(> left ||<^|3> top ||<v|3> bottom ||
 ||<:> centered ||
 ||<)> right ||
}}}
 ||<(> left ||<^|3> top ||<v|3> bottom ||
 ||<:> centered ||
 ||<)> right ||

== Colors ==
{{{
 ||<#FF8080> red ||<#80FF80> green ||<#8080FF> blue ||
}}}
 ||<#FF8080> red ||<#80FF80> green ||<#8080FF> blue ||

== CSV Tables ==

Data separated by semicolons (see raw text):
{{{
#!CSV -2
Col1;Col2;Col3;Col4
1;2;3;4
a;b;c;d
}}}
 {{{#!CSV -2
Col1;Col2;Col3;Col4
1;2;3;4
a;b;c;d
}}}

Data separated by commas (see raw text):
{{{#!CSV ,
Col1,Col2,Col3,Col4
1,2,3,4
a,b,c,d
}}}

= Rules =
{{{
--- (not a rule)
----
-----
------
-------
--------
---------
----------
-------------------------------------------- (not thicker than 10)
}}}
--- (not a rule)
----
-----
------
-------
--------
---------
----------
-------------------------------------------- (not thicker than 10)

= Macros =
{{{
<<Anchor(anchorname)>>
'''<<PageCount>>''' pages
<<RandomPage>>
}}}
<<Anchor(anchorname)>>
'''<<PageCount>>''' pages
<<RandomPage>>
