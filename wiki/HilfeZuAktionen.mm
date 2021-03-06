## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnActions
##master-date:2003-04-15 05:39:09
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de
== Aktionen ==

Aktionen sind Werkzeuge, die auf einer Seite oder auf dem ganzen Wiki arbeiten, aber, anders als Makros, nichts zum Seiteninhalt hinzufügen, wenn man die Seite anschaut, sondern den Seiteninhalt bearbeiten. Sie erzeugen eine Ausgabe, die vom Seiteninhalt abhängt (Navigations-Aktionen wie Suchen) oder implementieren Funktionen, die nicht mit dem Betrachten zusammenhängen (wie Löschen oder Umbenennen einer Seite).

Es gibt eine Menge von system-definierten Aktionen, worin auch das Editieren einer Seite enthalten ist. Sie können diese Menge bekannter Aktionen durch eigene erweitern. Für mehr Informationen darüber siehe HilfeFürEntwickler.

Die folgenden Aktionen werden zu der Liste von benutzerdefinierten Erweiterungs-Aktionen am Ende jeder Seite hinzugefügt. Dies geschieht für jede gemischtgeschriebene Aktion - für andere Aktionen (komplett in Kleinbuchstaben), siehe die Liste weiter unten auf dieser Seite. Einige dieser Aktionen sind möglicherweise nicht in Ihrem Wiki verfügbar.

 * `AttachFile`: Dateien an eine Seite anhängen, siehe /DateiAnhänge für weitere Details.
 * `DeletePage`: Löschen einer Seite, nachdem Sie nochmals bestätigt haben. Löschen heisst, dass eine letzte Sicherungskopie angelegt und dann die Seite entfernt wird, d.h. Sie können die Seite später ''wiederbeleben'' (solange die Sicherungskopien nicht physikalisch gelöscht werden).
 * `LikePages`: Auflisten von Seiten, deren Titel mit dem gleichen MeatBall:WikiWord anfangen oder enden wie der aktuelle Seitentitel.
 * `LocalSiteMap`: Anzeigen von nahen Links der aktuellen Seite, d.h. eine Liste aller Seiten, auf die verwiesen wird - und auch wieder die Seiten, auf die von dort verwiesen wird - bis zu einer bestimmten, begrenzten Tiefe.
 * `SpellCheck`: rufe die Rechtschreibprüfung für die aktuelle Seite auf; siehe HilfeZurRechtschreibprüfung für weitere Informationen.

Es folgt eine Liste von ''internen'' Aktionen, die für die Implementierung der verschiedenen Icons und Links oben und unten auf der Seite benutzt werden oder zur Unterstützung von gewissen Makros.
 * titleindex: Auflistung aller Seitennamen als [wiki:Self:?action=titleindex Text] oder [wiki:Self:?action=titleindex&mimetype=text/xml XML]; die Hauptanwendung dieser Aktion ist es, MeatBall:MetaWiki zu ermöglichen.
 * fullsearch: diese Aktion wird durch Klicken auf den "Go"-Knopf des `FullSearch`-Makros (Self:?action=fullsearch&value=HilfeZuAktionen) ausgelöst.
 * titlesearch: diese Aktion wird durch Klicken auf den "Go"-Knopf des `TitleSearch`-Makros (Self:?action=titlesearch&value=HilfeZuAktionen) ausgelöst.
 * inlinesearch: damit wird die eingebettete Suche für die Formularfelder am Ende jeder Seite implementiert (beachten Sie, dass dies POST-Requests benutzt, Sie werden diese Aktion also normalerweise nicht in der URL sehen).
 * highlight: das Suchwort markieren, wenn man auf einen Verweis in der Liste der Suchergebnisse klickt.
 * diff: Anzeigen von Unterschieden zwischen Seiten-Revisionen.
 * info: zeigt Metadaten zu einer Seite an.
 * recall: zeigt eine ältere Revision einer Seite an.
 * show: zeigt eine Seite an (die Standard-Aktion).
 * refresh: Erneutes Laden der gecachten Version einer Seite (momentan nur auf XSLT-formatierten Seiten verwendet).
 * print: Anzeigen einer Druckansicht einer Seite, bei der Navigationselemente weggelassen werden.
 * edit: Ändern dieser Seite.
 * savepage: Speichern dieser Seite (niemals manuell benutzen).
 * subscribe: eine Seite abonnieren.
 * userform: Benutzereinstellungen aufrufen.
 * bookmark: setzt Lesezeichen für AktuelleÄnderungen.
 * formtest: wird für die Entwicklung benutzt.
 * raw: sende die rohen Wiki-Texte als text/plain (z.B. für Backup-Zwecke via wget); Self:SystemInfo?action=raw zeigt den Roh-Text von SystemInfo.
 * format: erzeugt speziell formattierte Anzeigen einer Seite.
 * rss_rc: erzeugt einen RSS-Feed für AktuelleÄnderungen.
 * chart: Charts anzeigen.
 * dumpform: wird für die Entwicklung genutzt.
 * export: Wiki exportieren (experimentell).
 * macro: Ausführen einer Hilfs-Aktion in einem externen Makro. ''[1.1]''
