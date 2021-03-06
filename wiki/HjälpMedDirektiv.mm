## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnProcessingInstructions
##master-date:2002-03-05 10:00:33
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
== Speciella direktiv ==
MoinMoin har speciella direktiv som har liknande format som i XML:. De bestämmer hur innehållet i en sida ska tolkas. Dessa direktiv är rader som börjar med ett "{{{#}}}"-tecken åtföljt av ett nyckelord och eventuellt av parameterar. Små och stora bokstäver spelar ingen roll i nyckelordet. Två konsekutiva "{{{#}}}"-tecken markerar att raden är en kommentar som inte visas med sidan.

Direktiv som kan användas är:
 * {{{##}}} ''vilken text som helst'': kommentar
 * {{{#FORMAT}}} ''format-specifikation'': definierar informatet för den här sidan, kända format är:
   * '''Wiki''': det normala MoinMoin märkspråket
   * '''Plain''': normal text
   * '''Python''': syntaxfärglagd Python-källkod
   * '''HTML''' ( <!> inte implementerat ännu)
 * {{{#REDIRECT}}} ''sidnamn'': omdirigerar till en annan sida (se MeatBall:PageRedirect'''''')
 * `#PRAGMA` ''mod'' ''parametrar'': sätter olika bearbetningsmod för den här sidan. Stora och stmå bokstäver spelar ingen roll i modnamn. Tillåtna modnamn är:
 * `#pragma section-numbers off` (eller "0" eller av) Stänger av numrering av sektionsrubriker och "on" (eller "1" eller på) slår på numrering (om inte angivet är det satt med anpassningsalternativet `show_section_numbers`)
 * {{{#DEPRECATED}}}: Markera den här sidan som historisk och inte rekommenderad. Dvs. framtida förändringar av sidan kommer inte att skapa säkerhetskopior och när sidan visas, så ser man det nuvarande innehållet (oftast skälet till att sidan inte ska användas längre) plus sista säkerhetskopian. Detta fryser sista versionen av sidan och gör att den inte kommer med i sökningar, men att man fortfarande kan se på den.
 * {{{#FORM}}}: Har endast effekt på en FormulärSida. (Vad gör den?)

Alla speciella direktiv måste vara allra först på sidan. Ett undantag är kommentarer, som kan finnas varsomhelst på sidor med "wiki"-format (men inte på sidor med ett annat format).

För mer information om märkspråket se HjälpMedÄndringar.
