## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnPageCreation
##master-date:2004-08-30 01:53:31
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de


testtest

== Erzeugen einer neuen Seite ==

Um eine neue Seite zu erzeugen, fügen Sie ihren WikiName``n auf eine existierende Seite hinzu (achten Sie auf korrekte Rechtschreibung) und speichern Sie. Danach können Sie (auf der geänderten Seite) auf den WikiName``n klicken, da daraus automatisch ein Verweis (Hyperlink) entstanden ist.

Dann wird Ihnen ihre neue Seite präsentiert, die Sie dann auf die übliche Art editieren können. Die Seite wird beim ersten Speichern automatisch angelegt.

Details über Erzeugen und Verlinken von Unterseiten siehe HilfeZumEditieren/UnterSeiten. 

<<FootNote>>

== Erzeugen einer Vorlagen-Seite ==
Um eine Vorlage (engl. "Template") zu erzeugen, befolgen Sie die obige Beschreibung und erzeugen Sie eine Seite, deren WikiName in "'''Template'''" endet. Diese Seite wird dann der Liste der Vorlagen-Seiten hinzugefügt, die angezeigt wird, wenn man versucht, auf eine nicht-existierende Seite zuzugreifen.

Zum Beispiel hat NichtExistierendeHilfeSeite einen Link zu HilfeTemplate, der den Inhalt von HilfeTemplate in den Editierbereich lädt, wenn man auf den Link klickt.

== Variablen-Ersetzung beim Speichern einer Seite ==

<<Anchor(variablenersetzung)>>
Die folgenden Variablen werden ersetzt, wenn man eine Seite speichert.

|| @''''''PAGE@     || Name der Seite (nützlich auf Seitenschablonen) ||
|| @''''''DATE@     || Aktuelles Datum im Systemformat ||
|| @''''''TIME@     || Aktuelles Datum und Uhrzeit im Benutzerformat ||
|| @''''''USERNAME@ || Nur der Name des Benutzers (oder seine Domain/IP) ||
|| @''''''USER@     || Unterschrift "-- Login-Name" ||
|| @''''''SIG@      || Unterschrift mit Datum/Uhrzeit "-- Login-Name Datum Uhrzeit" ||
|| @''''''MAILTO@   || {{{mailto:}}}-Link mit den Daten des Benutzers (auf oeffentlichen Seiten benutzen Sie besser das Mail``To-Makro)||

Um diese Variablen zu erweitern, benutzen Sie Home``Page``Name/Wiki``Dict und legen Sie dort ein WikiDict mit Ihren Variablen und Werten an.

Beachten Sie, dass beim Abspeichern von Vorlagen (Template) oder Formularen (Form) und bei der Vorschau die Variablen ''nicht'' ersetzt werden. Abgesehen davon ist die Variablenersetzung sehr global und und geschieht überall auf der Seite, inklusive Code-Anzeigen, Kommentaren, Verarbeitungsanweisungen und anderen "speziellen" Seitenbereichen, von denen man annehmen könnte, dass sie ausgeschlossen sind.

= Editor-Sicherung =

Wenn der Benutzer eine Homepage hat (wird durch <<Icon(home)>> angezeigt), wird beim Sichern oder bei der Vorschau einer Seite der aktuelle Text dort als Unterseite `Home``Page``Name/Moin``Editor``Backup` (wenn Unterseiten erlaubt sind) oder als Seite `Home``Page``Name``Moin``Editor``Backup` (wenn Unterseiten nicht erlaubt sind) gespeichert.

Wenn Sie sich also oft eine Vorschau anzeigen lassen, verlieren Sie Ihre Änderungen nicht, selbst wenn Ihr Browser abstürzt.
