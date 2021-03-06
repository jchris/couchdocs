## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnProcessors
##master-date:2002-03-19 10:00:27
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
== Åtgärder ==

Ätergärder är verktyg som arbetear på en sida eller på hela wikin, men olikt makron lägger de inte till på vad en sida visar utan arbetar på sidinnehållet. De ger antingen en utmatning baserat på sidinnehållet (som t.ex. navigationshjälpmedel som sökning) eller har de funktioner som inte är relaterade till visningen av sidor (som att radera eller byta namn på en sida).

Det finns en grupp systemdefinierade åtgärder, vilka inkluderar sidredigering. Du kan också bygga ut de kända åtgärderna med dina egna. Se HjälpFörUtvecklare för mer information om det.

Följande åtgärder finns på botten av varje sida, förutom de som är användardefinitierade. Detta händer för alla åtgärder med blandade stora och små bokstäver i namnet. För åtgärder med namn som bara innehåller små bokstäver, se nedan. En del av åtgärderna kanske inte finns på varje wiki-plats.
 * `DeletePage`: Raderar en sida, efter att du har gett bekräftelse. Radering innebär att en sista säkerhetskopia skapas och sedan tas sidan bort. Sidan kan återskapas sedan med ''revive'', så länge som säkerhetskopiorna inte har avlägsnats.
 * `LikePages`: listar sidor vars title börjar eller slutar med samma WikiOrd som den aktuella sidans titel.
 * `AttachFile`: bifoga filer till en sida. Se /BifogaFil för mer detaljer.
 * `LocalSiteMap`: visa närliggande länakar till den aktuella sida. Dvs. lista alla sidor som refereras, samt deras referenser till ett visst begränsat djup.
 * `SpellCheck`: kontrollera stavningen på aktuella sidan. Se HjälpMedStavningsKontroll för mer information.

Följande åtgärder är ''interna'' och används för att visa vissa ikoner och länkar i sidhuvudet och sidfoten eller som supplement till vissa makros.
 * `titelindex`: Listar alla sidnamn som text, (Self:?action=titleindex) eller XML (Self:?action=titleindex&mimetype=text/xml). Det huvudsakliga syftet för den här åtgärden är att tillåta MeatBall:MetaWiki.
 * `fullsearch`: denna åtgärd utförs när att man klickar på "Utför"-knappen på `FullSearch`-makrot (Self:?action=fullsearch&value=HjälpMedÅtgärder).
 * `titlesearch`: denna åtgärd utförs när man klickar på "Utför"-knappen på `TitleSearch`-makrot (Self:?action=titlesearch&value=HelpMedÅtgärder).
 * `inlinesearch`: denna åtgärd implementerar sökning på plats för formulärfält längs ner på varje sida (observera att den använder POST-begäran, så du ser normalt inte denna åtgärd i `URL:er`). ''[0.11]''
 * `highlight`: färglägger sökordet när du klickar på en länk i sökresultatlistan.
 * `diff`: visar skillnader mellan sidor med olika versioner.
 * `info`: visar metadata för en sida.
 * `recall`: visar äldre versioner av en sida.
 * `show`: visar en sida (standardåtgärden).
 * `refresh`: uppdaterad cache-versionen av en sida (används för närvarande bara för XSLT-formaterade sidor).
 * `print`: visar en version av sidan som lämpar sig för utskrift, utan sidhuvud och sidfot.
 * `edit`: redigera den här sidan
 * `savepage`: spara den här sidan (använd aldrig denna åtgärd manuellt).
 * `subscribe`: prenumerera på en sida. ''[0.11]''
 * `userform`: spara användarinställningar
 * `bookmark`: sätt bokmärke för <<GetText(LatestChanges)>>
 * `formtest`: används för utveckling. ''[0.11]''
 * `raw`: sänder den råa wiki sidan som text/plain (t.ex. för att ta säkerhetskopior med wget); Self:SystemInfo?action=raw visar den råa wiki-sidan för SystemInfo.
 * `format`: genererat en speciellt formaterad version av en sida.
 * `rss_rc`: genererar en RSS-variant av <<GetText(LatestChanges)>>. ''[0.11]''
 * `chart`: visar diagram. ''[0.11]''
 * `dumpform`: används för utveckling. ''[0.11]''
 * `export`: exporterar wikiinnehållet ''[experimentell]''
 * `content`: för includering i statiska webb-sidor sänder den här åtgärden sidinnehållet utan <html>, <head> och <body>-taggar. ''[1.0]''
 * `links`: genererar en lista av alla sidor och de länkar de har, precis som MeatBall:LinkDatabase. ''[1.0]''
 * `xmlrpc`: Wiki XML-RPC interface, se MeatBall:XmlRpcToWiki. ''[1.0]''
