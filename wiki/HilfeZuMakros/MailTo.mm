## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page: HelpOnMacros/MailTo
##master-date:
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de
<<Navigation(siblings)>>

Mit Hilfe des '''`MailTo`'''-Makros kann man E-Mail-Adressen recht sicher in ein Wiki einbringen, ohne befürchten zu müssen, dass sie leicht durch Spam-Bots (automatische E-Mail-Adressen-Sammelroboter) gefunden und missbraucht wird.

= Benutzung =

{{{
<<MailTo(Vorname DOT Nachname AT example DOT net)>>
}}}

oder

{{{
<<MailTo(Vorname DOT Nachname AT example DOT net, Link-Text)>>
}}}

= Was passiert dann? =

Es wird unterschieden zwischen ''angemeldeten'' und ''anonymen'' Benutzern.

Bei angemeldeten Benutzern wird davon ausgegangen, dass sie diese E-Mail-Adresse lesen und benutzen dürfen (sonst würde man sie ja nicht im Wiki veröffentlichen).

Bei anonymen Benutzern ist die Lage kritischer - denn das können einerseits zwar auch "normale" Benutzer sein, es besteht aber auch genauso die Möglichkeit, dass hier jemand oder etwas (ein Spam``Bot) Mailadressen einsammelt, um deren Besitzer nachher mit unerwünschter kommerzieller Werbung zu beglücken (dies ist ein ganz allgemeines Problem im Internet).

== Angemeldete Benutzer ==

Diese bekommen Folgendes zu sehen:
 Vorname.Nachname@example.net

Also einen direkt lesbaren und anklickbaren `mailto:`-Link.

== Anonyme Benutzer ==

Bei anonymen Benutzern (ebenso wie bei Spam-Bots und anderen Robots) zeigt das Makro den Text einfach so an, wie er als Parameter dem Makro übergeben wurde:

 Vorname DOT Nachname AT example DOT net

Also reinen Text, ohne `mailto:`-Link. Ein intelligenter menschlicher Leser kann sich dann einen Reim darauf machen und die E-Mail-Adresse dann von Hand in sein E-Mail-Programm eingeben.

Ein automatischer Spam-Bot kann aber vermutlich mit diesem Text nichts anfangen, er "überliest" ihn (es sei denn, es ist ein besonders schlauer, dazu siehe unten) und das Makro hat seinen Zweck erfüllt, nämlich unnötigen Spam zu verhindern.

= Funktionsweise und weitere Beispiele =

Bei anonymen Benutzern gibt das Makro den Text so aus, wie er als Parameter übergeben wurde.

Bei angemeldeten Benutzern verarbeitet das Makro die übergebene Zeichenkette:

 1. Folgende komplett groß geschriebene Worte werden ersetzt:

  || AT   || @ ||
  || DOT  || . ||
  || DASH || - ||

 1. Andere komplett groß geschriebene Worte wie z.B. NO SPAM NOSPAM WASAUCHIMMER ICH WILL KEINEN SPAM usw. werden einfach weggeworfen (also durch einen Leerstring ersetzt).

 1. Danach werden die Leerzeichen entfernt.

 1. Zuguterletzt wird daraus ein anklickbarer `mailto:`-Link generiert.

Es besteht natürlich die Gefahr, dass ein besonders ''schlauer'' Spam-Bot vielleicht übliche Sachen wie AT und DOT und NOSPAM auch schon erkennen kann und entsprechend umformt.

Was aber die Sache wirklich schwierig macht, ist, dass man ''beliebige'' Worte einstreuen kann und auch beliebig Leerzeichen einstreuen kann.

Der Spam-Bot, der das noch erkennen kann, hat sich die E-Mail dann quasi redlich verdient. ;)

Man kann die Funktionsweise von Mail``To gut sehen, wenn man diese Beispiele als angemeldeter und nicht angemeldeter Benutzer vergleicht:

 * `<<MailTo(Vorname DOT Nachname AT example DOT net)>>` ergibt: <<MailTo(Vorname DOT Nachname AT example DOT net)>>

 * `<<MailTo(Vorname . Nachname AT exa mp le DOT n e t)>>` ergibt: <<MailTo(Vorname . Nachname AT exa mp le DOT n e t)>>

 * `<<MailTo(Vorname ICH WILL KEINEN SPAM . Nachname@example DOT net)>>` ergibt: <<MailTo(Vorname ICH WILL KEINEN SPAM . Nachname@example DOT net)>>

 * `<<MailTo(Vor name ICH Nachname WILL AT KEINEN SPAM example DOT n e t)>>` ergibt: <<MailTo(Vor name ICH Nachname WILL AT KEINEN SPAM example DOT n e t)>>

 * `<<MailTo(Vorname DOT Nachname AT example DOT net, Ich, meinereiner und ich selbst)>>` ergibt: <<MailTo(Vorname DOT Nachname AT example DOT net, Ich, meinereiner und ich selbst)>>

/!\ Wieviel jeder Eigentümer einer Mailadresse den nicht-angemeldeten ''menschlichen'' Benutzern zumuten will, sei jedem selbst überlassen. Wer es selbst für den menschlichen Leser schwierig macht, bekommt eben weniger E-Mail. ;)
