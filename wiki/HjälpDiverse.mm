## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpMiscellaneous
##master-date:2002-03-12 10:00:40
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
== Andra MoinMoin hjälpämnen ==

'''Underämnen'''
 * /VanligaFrågor

'''Innehåll''' <<TableOfContents>>

=== Speciella funktioner för wiki-farmer IntraNät ===
I det följande visas hur olika funktioner kan hjälpa till att optimera din anpassning när du har flera wikis på samma system eller när du använder MoinMoin i en IntraNet-miljö.

==== Centraliserade anpassningar ====

 * `farmconfig.py`
 * delade `intermap.txt`
 * delad kodbas och ikoner

==== Ommappning av URL:er ====
Anpassningsvariabeln "`url_mappings`" kan användas för att mappa om absoluta `URL`:er till relativa eller för att ändra vissa URL-förled till andra helt annorlunda. Detta är speciellt vikigt på IntraNet, när hela träd av dokument, som finns utanför wikin, flyttas runt.

"`url_mappings`" är en uppslagstabell i form av en python-dict, där nyckeln är prefixet som ska ersättas. Ett typiskt exempel är `url_mappings = {'http://my.server.net/': '/'}`, vilket tar bort webb-protokollschemat från lokala `URL`:er och således gör att länkar till din egen server fungerar för både `http` ''och'' `https`.

=== ATT GÖRA ===

<!> ATT GÖRA: förklara följande i detalj och lägg till mer detaljer till ovanstående beskrivning.
Vad som behöver mer förklaring
 * händelseloggning
 * Sidspår ('Page trails', ett tillval)
 * AnvändarInställningar: ikryssningsrutor för dubbelklickredigering, sidspår, snygga länkar, smilisar, hoppa till sisa sidan som visas och några andra ja/nej-optioner
 * Ta bort "Eliminera efterföljande mellanslag från varje rad"-tillvalet i editorn
 * SidMallar (skapa en ny sida från en mallsida)
 * Endast "normala" URL_er (utanför hakparenteser) översätts till infogade bilder ==> dokumentera exakta regler
 * Markering av sökresultat och många felstavade ord vid felstavningskoll
 * Support för "file:" `URL`:er
 * e-mail notifieringsfunktioner
 * "RSS" icon som visas med LatestChanges-makrot
 * kommentarfältet för editor, senaste ändringar och sidinformation
 * Sid-caching är för närvarande begränsad till XSLT-processing (där den absolut behövs). Ny kod & API för att lägga till "Refresh``Cache"-länk.
 * infogade sökfält (längst ner på sidan)
 * interwikinamnet "Self" pekar inte alltid på den egna wikin
 * sidinformationsåtgärden

Administrativt:
 * beskriv "moin.cgi?action=test"-verktyget mer detaljerat
 * Wiki``Farm-support:
   * <datadir>/plugin/macro och <datadir>/plugin/action kan användas för att hålla makron och åtgärder lokalt för en specifik wiki-instans
   * config.shared_intermap kan ha en filsökväg till en delad "intermap.txt"-fil (t.ex. en sparad utanför datadir)
 * $PAGE-platsen för en interwiki-karta

Kommandoradverktyg:
 * "moin-dump" kommandoradverktyg som skapar en statisk kopia av wikins innehåll
 * Den självständiga webb-servern är inte rejält testad, men den fungerar nu för POST-anrop, eller med andra ord, den kan nu spara sidor. Det är fortfarande problem med långlivade globala variabler! Den kräver Python >= 2.0.

Kompatibilitet:
 * De statistiska funktionerna är INTE avsedda att fungera med Python 1.5.2 och kräver Python 2.0 eller högre. Överhuvudtaget är MoinMoin 0.11 inte grundligt testad för 1.5.2-kompatibilitet. Den lägsta ''rekommenderade'' Python-versionen är 2.0!
 * RSS-funktionerna kräver en ganska ny PyXML (CVS eller 0.7) beroende på buggar i namnhanteringen av xml.sex.sexutils i tidigare versioner. Detta upptäcks (förhoppningsvis) automatiskt vid varje installation.
