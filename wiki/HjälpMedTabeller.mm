## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnTables
##master-date:2002-03-05 10:00:33
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
== Tabellmärkord ==
För att skapa en tabell, börjar de med tabelltaggen "{{{||}}}". Inuti tabellen kan du skapa celler genom att separera dem med "{{{||}}}". För att få en centrerad cell som sträcker sig över flera kolumner börjar du cellen med mer än en celltagg. Intilliggande linjer på samma indenteringsnivå kombineras automatiskt till en.

För mer information om olika möjliga märkord, se HjälpMedÄndringar.

=== Tabellattribut ===

Förutom möjligheten att repetera celltaggar för att få celler som sträcker sig över flera kolumner kan du sätta många HTML-attribut direkt. Sådana attribut sätter du mellan spetsiga parenteser {{{<...>}}} direkt efter celltaggen.

Wiki-märkspråket har följande attribut för tabeller:
 * {{{<50%>}}}: cellens bredd
 * {{{<-2>}}}: cellen sträcker sig över flera kolumner
 * {{{<|2>}}}: cellen sträcker sig över flera rader
 * {{{<(>}}}: vänsterjustering
 * {{{<:>}}}: centrering
 * {{{<)>}}}: högerjustering
 * {{{<^>}}}: justerad överst i cellen
 * {{{<v>}}}: justerad underst i cellen
 * {{{<#XXXXXX>}}}: bakgrundsfärg

Om det finns flera motsägelsefulla attribut som {{{<(:)>}}}, är det den sista som gäller. Det finns inget separat attribut för vertikal centrering, eftersom det är det normala utan andra attribut.

Förutom dessa kan du lägga till några traditionella, längre HTML-attribut (observera att endast vissa HTML-attribut är tillåtna). Genom att specifiera attribut på det här sättet är det också möjligt att ändra formatet på tabellen själv. Specifikt kan du sätta tabellbredden genom {{{||<tablewidth="100%">...||}}} i den allra första tabellraden, och färgen för en hel tabellrad genom {{{||<rowbgcolor="#FFFFE0">...||}}} i tabellens allra första cell. Som du kan se så måste lägga förstavelsen {{{table}}} eller {{{row}}} till HTML-attributet.

=== Exampel ===
{{{
 Generell tabellayout och HTML-lika alternativ::
 ||||||<tablewidth="80%">'''Rubrik'''||
 ||cell 1||cell2||cell 3||
 ||<rowspan=2> över flera rader||||<bgcolor='#E0E0FF'> över 2 kolumner||
 ||<rowbgcolor="#FFFFE0">cell2||cell 3||
 Cellbredd::
 || smal ||<:99%> bred ||
 Täckande flera rader och kolumner::
 ||<|2> 2 rader || rad 1 ||
 || rad 2 ||
 ||<-2> rad 3 över 2 kolumner ||
 Justering::
 ||<(> vänster ||<^|3> uppåt ||<v|3> nedåt ||
 ||<:> centrerat ||
 ||<)> höger ||
 Färger::
 ||<#FF8080> röd ||<#80FF80> grön ||<#8080FF> blå ||
}}} 

=== Hur det ser ut ===
 Generell tabellayout och HTML-lika alternativ::
 ||||||<tablewidth="80%">'''Rubrik'''||
 ||cell 1||cell2||cell 3||
 ||<rowspan=2> över flera rader||||<bgcolor='#E0E0FF'> över 2 kolumner||
 ||<rowbgcolor="#FFFFE0">cell2||cell 3||
 Cellbredd::
 || smal ||<:99%> bred ||
 Täckande flera rader och kolumner::
 ||<|2> 2 rader || rad 1 ||
 || rad 2 ||
 ||<-2> rad 3 över 2 kolumner ||
 Justering::
 ||<(> vänster ||<^|3> uppåt ||<v|3> nedåt ||
 ||<:> centrerat ||
 ||<)> höger ||
 Färger::
 ||<#FF8080> röd ||<#80FF80> grön ||<#8080FF> blå ||
