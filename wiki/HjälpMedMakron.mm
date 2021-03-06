## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##||{{{<< >>}}} ||  ||  ||
##master-page:HelpOnMacros
##master-date:2002-05-10 10:00:43
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv

<<TableOfContents>>

== Makron ==
Med makron kan du göra vissa systemomperationer på normala wikisidor. Det enda som gör dessa sidor speciella är att de innehåller makron. Om du redigerar en sida som SenasteÄndringar eller SystemInfo, så ser du exempel på det.

För mer information om olika märkkoder se HjälpMedÄndringar.

=== Sökmakron ===
||'''Makro'''||'''Beskrivning'''||'''Exempel'''||
||{{{<<TitleSearch>>}}}     || söker i sidtitlar || Se SökSida ||
||{{{<<FullSearch>>}}}      || söker i sidinnehåll || Se SökSida ||
||{{{<<FullSearch()>>}}}      || sök den aktuella sidtitlen i alla sidor (som att klicka på sidtiteln) || Se KategoriKategori-sidan ||
||{{{<<FullSearch('text')>>}}} || söker efter "text" i alla sidor || Sök efter {{{FullSearch}}}:<<FullSearch('FullSearch')>> ||
||{{{<<GoTo>>}}}            || gå direkt till en sida som du matar in || Se SökSida''''''n ||
||{{{<<PageList(regex)>>}}} || listar alla sidor vars titel matchar det reguljära uttrycket || Se HjälpInnehåll ||

=== Navigation ===
||'''Makro'''||'''Beskrivning'''||'''Exempel'''||
||{{{<<RecentChanges>>}}}   || ger en lista med de senast ändrade sidorna || Se SenasteÄndringar ||
||{{{<<TitleIndex>>}}}      || ger en lista på alla sidtitlar || Se TitelRegister ||
||{{{<<WordIndex>>}}}       || ger en lista på alla ord i sidtitlarna || Se OrdRegister ||
||{{{<<WantedPages>>}}} || ger en lista på alla refererade icke-existerande sidor || Se ÖnskadeSidor ||
||{{{<<OrphanedPages>>}}} || ger en lista på alla sidor som inte någon annan sida länkar till || Se FöräldrarlösaSidor ||
||{{{<<AbandonedPages>>}}} || ger en lista på de sidor som inte har ändrats på längst tid || Se ÖvergivnaSidor ||
||{{{<<RandomPage>>}}}      || en länk till en slumpvis sida || <<RandomPage>> ||
||{{{<<RandomPage(#)>>}}}   || länkar till ett antal slumpvisa sidor || Två slumpvisa sidor:<<RandomPage(2)>> ||
||{{{<<TableOfContents>>}}} || ger en lokal innehållsförteckning || Se nedan ||
||{{{<<Anchor(anchorname)>>}}} || marko för att sätta in ankare på en sida || <<Anchor(här)>>[#här] ||

=== Systeminformation ===
||'''Makro'''||'''Beskrivning'''||'''Exempel'''||
||{{{<<InterWiki>>}}}       || ger en lista på alla kända InterWiki-namn || InterWiki ||
||{{{<<SystemInfo>>}}}      || ger information om den här `wiki:n`, om pythontolken och systemet || SystemInfo ||
||{{{<<PageCount>>}}}       || ger antalet sidor || <<PageCount>> sidor ||
||{{{<<PageSize>>}}}        || listar storleken på alla sidor || Se SidStorlek ||
||{{{<<StatsChart(type)>>}}} || ger statistiska tabeller (tillåtna typer för närvarande är: hitcounts, pagesize, useragents) || Se HändelseStatistik med undersidor  ||
||{{{<<SystemAdmin>>}}} || Web-interface till wiki-administration (inte färdig ännu med version 1.0) || Se SystemInfo ||

=== Annat ===
||'''Makro'''||'''Beskrivning'''||'''Exempel'''||
||{{{<<Icon(image)>>}}}     || visar systemikoner || Se HjälpMedNavigering ||
||{{{<<UserPreferences>>}}} || visar en dialog för användarinställningar || Se AnvändarInställningar ||
||{{{<<BR>>}}} || infoga en hård radbrytning || rad 1<<BR>>rad 2 ||
||{{{<<Include(HejVärlden[,"heading"[,level>>)>>}}} || infoga innehållet från en annan sida || <<Include(HejVärlden)>> ||
||{{{<<FootNote(text)>>}}} || Lägg till en fotnot (texten kan inte innehålla någon wiki-märkord), eller infoga alla explicit insamlade fotnötter om makrot är argumentläst || Se HjälpMedAttSkapaSidor för ett exempel ||
||{{{<<Date(timestamp)>>}}} || visar tiden med systemets inställningar || <<Date()>> ||
||{{{<<DateTime(timestamp)>>}}} || visar tiden <<FootNote("timestamp" kan vara tomt, vilket betyder tiden just nu, eller är annars antalet sekunder efter 1970 (unixtid), eller är en W3C tidsspecifikation ("2002-01-23T12:34:56").)>> med användarens inställning || <<DateTime()>> ||
||{{{<<GetText(text)>>}}} || laddar I18N texts (huvudsakligen för användning på hjälpsidor) || "Edit``Text" är översatt till "<<GetText(EditText)>>" ||
||{{{<<TeudView>>}}} || användbart för IntraNet-utvecklings-wikis och är ett sätt att se pydoc dokumentation formatterade via en XSLT stilmall. För detaljer se EfnetPythonWiki:TeudProject || Se EfnetPythonWiki:TeudViewer?module=MoinMoin.macro.TeudView ||

<<FootNote>>

== Hur det ser ut ==
Vi visar inte exempel för alla makron här, då det skulle göra sidan för lång. Vi visar endast vad makrot {{{<<SystemInfo>>}}} visar:
 <<SystemInfo>>
