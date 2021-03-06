## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpMiscellaneous/FrequentlyAskedQuestions
##master-date:2004-05-16 23:32:14
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de

'''Index'''
<<TableOfContents>>

=== Was ist ein ''Wiki''? Was ist ein ''MoinMoin''? ===

Die Bezeichnung ''Wiki'' ist eine Abkürzung des Ausdrucks Wiki''''''Wiki''''''Web. Ein Wiki ist eine Datenbank, in der Seiten gespeichert werden, die kollaborativ mit irgendeinem Web-Browser 
editiert werden können.

Ein Moin''''''Moin ist ein Wiki, das vom Python-Wiki-Programm "Moin''''''Moin" zur Verfügung gestellt wird.

=== Wozu ist das gut? ===

Um ehrlich zu sein, es ist überall gut, wo Sie vorhaben, es einzusetzen. Bei [http://www.lineo.com Lineo] haben wir ein Wiki in unserer internen Website eingerichtet. In diesem Wiki gibt es zahlreiche Seiten, die unsere verschiedenen Projekte, Architekturen, Ideen, etc. beschreiben, und es erlauben, dass andere Leute ihre Kommentare dazu abgeben. Manche Seiten stehen herum und geben Informationen her. Andere enthalten eine Einladung zur offenen Diskussion und fordern die Benutzer dazu auf, ihre Meinung zu sagen. Wir haben sogar ein Wiki für eine einfache Skills-Datenbank eingerichtet.

Generell ist ein Wiki ein Freiform-Werkzeug, dessen Wert aus dem Zweck kommt, zu dem es eingesetzt wird. Zum Beispiel kann ein Wiki die selbe Aufgabe erfüllen, wie ein Diskussionsfaden. Sie könnten eine Wiki-Seite benutzen, um kollaborativ an einem Projekt zu arbeiten.

Wikis werden intern von den Leuten eingesetzt, die [http://www.zope.org/ Zope] machen, um ihre Ideen und Projekte zu koordinieren.

=== Was zeichnet ein Wiki aus? ===

Hier haben wir ein paar wichtige Eigenschaften von Wikis gesammelt:

 * Editierbar durch jeden - eine Wiki-Seite kann von jedem, der einen Web-Browser bedienen kann, editiert werden.
 * Die Möglichkeit, AktuelleÄnderungen anzusehen
 * Die Möglichkeit, auf verschiedenste Arten nach Seiten zu suchen.
 * Die Möglichkeit, neue Seiten sehr einfach einzufügen.
 * Die Möglichkeit, die Versionshistorie einer Seite zu betrachten
 * Die Möglichkeit, neue Information hinzuzufügen oder bestehende Informationen zu verändern.

=== Wie steht's mit der Wiki-Security?  Werden Wikis nicht von Saboteuren heimgesucht, die Seiten löschen oder sonstigen Unfug treiben? ===

Dies ist eine wichtige Frage. Generell haben seither Wikis '''KEINE''' Sicherheit. (Das ist wahr!)

MoinMoin hat dies mit Einfuehrung von ACLs (siehe HelpOnAccessControlLists) geaendert.

Aber, falls Sie keine ACLs benutzen, besteht die Moeglichkeit, dass Informationen absichtlich oder versehentlich zerstoert oder korrumpiert werden.

Es gibt zwei Wege, die es ermöglichen, ein Wiki wertlos zu machen. Der eine Weg ist das Löschen, der andere Weg ist das Stören der Daten. Mit gelöschten Seiten wird man einfach fertig, da die vorherigen Revisionen einer Seite an einem Ort aufgehoben werden, der einem Web-Benutzer nicht zugänglich ist. Sobald jemand eine gelöschte Seite bemerkt (was generell ziemlich schnell passiert), kann die alte, funktionierende Revision wieder eingespielt werden.

Mit absichtlicher Störung der Daten im Wiki ist etwas schwieriger fertig zu werden. Es ist möglich, dass jemand Falschinformation in eine Seite eingibt, oder Seiten derart editiert, dass sie Falschinformation enthalten (zum Beispiel kann man eine Seite editieren, und einen Kommentar so aussehen lassen, als ob jemand anders diesen Kommentar abgegeben hätte; oder jemand könnte den Inhalt eines Absatzes so ändern, dass die Aussage eine ganz andere ist, als die vom Autor beabsichtigte). So ziemlich jedes kollaborative System hat dieses Problem. In einem Wiki kann es nur einfacher ausgenützt werden, weil es in einem Wiki überhaupt keine Sicherheit gibt. In der Praxis ist die Zerstörung eines Wikis ein sehr seltenes Ereignis, und eines, das man sehr schnell und einfach wieder ausbügeln kann, und zwar mittels der sogenannten "Notification", einem Hinweis, der einem festgelegten Auditor geschickt wird, sobald sich etwas auf einer Seite ändert.

In anderen Worten, es ist die Philosophie eines Wikis, dass man händisch mit (selten auftretenden) Problemen fertig wird, anstatt mehr Features und Aufwand (in der Implementierung und der Benutzung gleichermaßen) in das Wiki aufzunehmen, um Schaden durch einen Saboteur zu verhindern.

== Fragen zur Benutzung dieses Wikis ==
=== Finden von und Zugreifen auf Informationen im Wiki ===
==== Wie kann ich das Wiki durchsuchen? ====
 
Es gibt viele Wege, das Wiki zu durchsuchen:
 * Auf das Lupen-Icon klicken. Damit kommen Sie auf die SeiteFinden-Seite, wo Sie nach Sie nach Stichworten in Titeln, per Volltextsuche, mit normalen Worten oder mit Wildcards (regulären Ausdrücken) suchen können.
 * Klicken Sie auf TitelIndex. Dies zeigt Ihnen eine alphabetische Liste aller Seiten, nach Titel sortiert.
 * Klicken Sie auf WortIndex.  Dies zeigt Ihnen eine alphabetische Liste von jedem Einzelwort in jedem Seitentitel (d.h. eine Seite namens Blue``Tooth ist sowohl unter B / Blue als auch unter T / Tooth aufgeführt).
 * Klicken Sie auf {{{LikePages}}} im Fußbereich der Seite. Dies zeigt Ihnen Seiten, die Worte in Ihren Titeln haben, die ähnlich zur aktuellen Seite sind.
 * Klicken Sie auf den Seitentitel im Kopfbereich der Seite. Dies zeigt Ihnen, welche Seiten auf die aktuelle Seite verweisen (was Ihnen hilft, verwandte Seiten zu finden).

==== Wie sehe ich, was sich im Wiki in letzter Zeit getan hat? ====

Klicken Sie auf den AktuelleÄnderungen-Link oben auf jeder Seite.

==== Was hat es mit diesen KomischenRotenLinks auf sich, die ich überall gesehen habe? ====

Jedes gemischt gross/klein-geschriebene Wort, zu dem keine Seite existiert, wird als roter Verweis angezeigt.

=== Hinzufügen von Informationen in das Wiki ===

==== Wie fügt man etwas in's Wiki hinzu oder ändert etwas, was falsch ist? ====

Wenn Sie etwas sehen, was Sie gerne kommentieren, wo sie etwas hinzufügen oder ändern würden, klicken Sie einfach auf den {{{Editieren}}}-Link unter jeder Seite oder klicken Sie auf das <<Icon(edit)>>-Icon oben auf der Seite.  Die Seite wird dann in einem Editierfeld Ihres Browsers angezeigt und Sie können die Änderung dann einfach machen.
Der Wiki-Formatierer wird im allgemeinen "das Richtige tun" mit jeglichem Text, den Sie eingeben. Wenn Sie es hübsch machen wollen, können Sie ähnliche Arten von Formatierungen machen, wie es Ihnen auch HTML erlauben würde. Siehe die HilfeZumFormatieren-Seite für einige Tips und Beispiele.

==== Gibt es Konventionen, denen ich folgen sollte, wenn ich Informationen hinzufüge? ====

Nicht sehr viele. Es hilft, wenn man bestimmte Arten von Informationen auf konsistente Art formatiert. Eine wichtige Konvention ist die Verwendung von Schablonen-Seiten, um die Konsistenz zu wahren.

Im Wiki gibt es sog. "Schablonen", die angeboten werden, wenn Sie eine neue Seite erzeugen. Wenn Sie auf eine davon klicken, wenn Sie eine neue Seite anlegen, wird diese Seite eine Struktur ähnlich der anderen Seiten dieses Typs haben. Zum Beispiel können Sie, wenn Sie Ihre eigene Wiki-Homepage anlegen, die Schablone HomepageTemplate verwenden, die Ihnen beim Erzeugen angeboten wird.

==== Wie kann ich nicht-textuelle Informationen zum Wiki hinzufügen? ====

Wenn es diese Inhalte schon auf einer Webseite gibt, fügen Sie einfach einen Link hinzu zu der Wiki-Seite. Verfahren sie wie folgt:
 * stellen Sie die URL des Dokuments fest,
 * editieren Sie die Wiki-Seite (gehen Sie zu der Seite und klicken Sie auf den Editiere''''''Text-Link)
 * geben Sie die URL dort ein, wo sie auf der Seite stehen soll
 * speichern Sie die Änderungen.
Das Wiki wird dann automatisch einen Hypertext-Link aus der eingegebenen URL erzeugen.

Sie können den Verweis noch etwas hübscher machen, indem Sie einige beschreibende Wort für den Link in Klammern eingeben. Die beschreibenden Worte werden auf der Seite sichtbar sein, aber der Link wird den Benutzer zu der URL verweisen, sobald er darauf klickt. Ein Beispiel:
{{{
  [http://www.ihreseite.de/wasauchimmer.html Dies wird der Link-Text sein]
}}}
ergibt:

[http://www.ihreseite.de/wasauchimmer.html Dies wird der Link-Text sein]

==== Wie füge ich ein Bild einer Seite hinzu? ====

Sie können die URL einfach auf die Seite schreiben. Beispiel:
{{{
http://c2.com/sig/inter/wikibase.gif
}}}
ergibt

http://c2.com/sig/inter/wikibase.gif

==== Hinzufügen von Dokumenten im Intranet ====
Wenn Sie MoinMoin in einem Intranet benutzen, kann es nützlich sein, Links zu erstellen auf Dokumente auf Dateifreigaben, die im Netz verfügbar sind.
Zum Beispiel:
{{{
[file://servername/voller/pfad/zur/datei.txt Klicken Sie hier um datei.txt zu lesen]
}}}

Sie können auch auf Dateien mit Leerzeichen im Dateinamen verweisen, indem Sie manuell die URL-Kodierung für Leerzeichen ({{{%20}}}):
{{{
[file://servername/voller/pfad/zur/datei%20mit%20leerzeichen.txt Klicken Sie hier um datei mit leerzeichen.txt zu lesen  ]}}}

Eine andere naheliegende Möglichkeit ist, die Aktion {{{AttachFile}}} zu verwenden.

==== Soll ich meine Änderungen ''unterschreiben''? ====

Wenn sie signifikant sind oder wenn Sie wollen, dass bekannt wird, dass Sie sie gemacht haben, dann sollten Sie signieren. Hängen Sie einfach Ihren Namen oder Ihre email-Adresse hinter Ihren Kommentar an. Es ist nicht unüblich, Kommentare unterhalb des originalen Textes, den Sie kommentieren, einzurücken. Es hilft auch, eigene Kommentare ''kursiv zu schreiben'', um Sie vom Haupt-Text abzuheben, den Sie kommentieren.

In einigen Fällen ist es aber auch angemessen, einfach anonym Änderungen zu machen.
Rechtschreibkorrekturen, Formatierung, triviale Wortänderungen sind einige Beispiele, wo es nicht notwendig ist (und sogar unerwünscht ist), Änderungen zu signieren.

=== Andere Dokumentenformate dem Wiki hinzufügen ===
==== Kann ich HTML dem Wiki hinzufügen? ====

Wenn Sie eine einzelne Zeile HTML hinzufügen wollen, benutzen Sie das HTML-Makro.
Übergeben Sie einfach Ihren HTML-Text als Parameter dem HTML-Makro, so wie hier:

{{{<<HTML(<font size=+12>Dies ist ein grosser Font</font>)>>}}}

Dies sieht dann auf der Seite so aus:
<<HTML(<font size=+12>Dies ist ein grosser Font</font>)>>

Es ist auch möglich, ein HTML-Dokument auf eine Seite zu platzieren, indem Sie {{{#format html}}}
als erste Zeile auf die Seite schreibe.  Wenn diese Zeile vorhanden ist, wird die ganze Seite als HTML interpretiert (und dadurch werden auch Verweise auf andere Seiten etwas schwieriger!). Stellen Sie sicher, dass Sie nur den "body"-Anteil der Seite hinzufügen (nicht die HTML-Header oder etwas anderes ausserhalb des body, inklusive dem <BODY>-Tag selbst).

 /!\ Dies alles funktioniert nur, wenn die HTML-Erweiterungen (HTML-Makro und -Parser)  installiert sind.

=== Interwiki-Links ===
==== Wie füge ich neue Wikis in die Liste der verlinkten Wikis Hinzu und wie entferne ich welche? ====
Das hat scheinbar mit was mit der Liste im InterWikiMap zu tun, oder?

== Installation & Konfiguration ==

 (!) Siehe HilfeZurAdministration für allgemeine Hilfe zu diesem Thema.

=== Wie aktiviere ich die "DeletePage"-Option? ===

"Delete''''''Page" ist nicht standardmäßig aktiviert, da es meist nur in Intranets benutzt wird und in öffentlichen Wikis etwas gefährlich ist. Um diese und andere gefährliche Aktionen zu erlauben, fügen Sie sie wie folgt hinzu zur {{{wikiconfig.py}}}: {{{
allowed_actions=['DeletePage']
}}}

Um Löschen zu dürfen, muss man angemeldet sein (via BenutzerEinstellungen).

== Administrieren des Wiki ==
=== Wie administriere ich das Wiki? ===

Es gibt viele administrative Informationen auf der Seite AktuelleÄnderungen, mitunter die Anzahl der Seiten, sowie die installierten Makros und Aktionen.

Ich erstelle üblicherweise eine "Admin''''''Seite", wo ich Makros für dieselben hineinstelle, wie auch Informationen über den wahren physikalischen Speicherort der Seiten und Makros für VerwaisteSeiten und andere und andere Dinge, die sich ein Administrator möglicherweise ansehen will.

=== Kann ich eine alte Version einer Seite wiederherstellen? ===
 1. klicken Sie auf das kleine "i" oben rechts in der Ecke ({{{PageInfo}}}).
 1. klicken Sie auf "restaurieren" bei der Version, die Sie wieder herstellen wollen.

Um Restaurieren zu duerfen, muss man angemeldet sein (via BenutzerEinstellungen).

=== Wie kann ich eine neue Schablonenseite anlegen? ===

Schablonen sind Seiten, die automatisch zur Auswahl angeboten werden, wenn man eine neue Seite anlegt. Jede Seite, die mit dem Wort "Template" aufhört, wird automatisch in dieser Liste angezeigt.  Wenn Sie also gewisse Typen von Seiten in einem ähnlichen Format haben wollen (ähnliche Überschriften, Seitenaufbau, etc.), definieren Sie einfach eine Seite, die auf "Template" endet - und wenn Sie Seiten dieses Typs generieren, wählen Sie diese Schablone und editieren sie. Das Wiki füllt dann den anfänglichen Inhalt für Sie ein. Schablonen ("Templates") sind editierbare Wiki-Seiten wie jede andere auch.

Um eine Schablonenseite anzulegen, erzeugen Sie einfach eine neue Seite namens <Irgendwas>Template
