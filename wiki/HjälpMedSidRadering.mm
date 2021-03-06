## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnPageDeletion
##master-date:2002-03-05 10:00:33
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
HjälpInnehåll > HjälpMedAdministration > HjälpMedSidRadering

== Hur man kan ta bort sidor ==
Det normala sättet att ta bort sidor är via kommandotolkaren på värdsystemet. Man kan hitta sidfilerna i "data/text"-biblioteket och du kan helt enkelt radera dom här. Observera att filnamnen i vissa fall kan ha ickeintutivt utseende. Det finns dock en programfix som gör att svenska bokstäver accepteras i filnamn. Men om den inte är installerad visas de som sekvenser av understrykningstecknet åtföljt av två sedecimal siffror (hex). Tecken som inte är bokstäver eller siffror visas alltid på det sättet.

Det finns ett anpassningsval som tillåter åtgärden {{{RaderaSida}}} (se HjälpMedAnpassning och HjälpDiverse/VanligaFrågor). Observera att radering innebär att en säkerhetskopia görs av sidan innan den tas bort. Detta är nästan som att spara en tom sida (vilket inte är tillåtet av systemet).

Detta betyder att du kan få tillbaka raderade sidor genom att använda standardmekanismer. Se HjälpDiverse/VanligaFrågor - "Kan jag återställa en sida från en gammal version?" om detta. Specifikt, om du ger sidnamnet i `GåTill`-dialogen, så ser du det vanliga sidskapningsinformationen, men om du klickar på `SidInformation` så ser du sidans revisionshistorik om inte sidan har blivit helt bortrensad imellan.
