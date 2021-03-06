## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:
##master-date:
#acl -All:write Default
#format wiki
#language en
#pragma section-numbers off
<<Navigation(slides)>>
= Macros =

A macro is called using "`<<macroname(parameter)>>`". Parameters vary from macro to macro and are sometimes not used.

== Input ==
{{{
<<TableOfContents>>
----
Some text with a footnote.<<FootNote(This is the footnote.)>>

|| <<MonthCalendar>> || <<MonthCalendar(,2000,1)>> ||
----
A certain moment - world wide: <<DateTime(2006-01-26T23:03:25Z)>>

}}}
== Display ==
<<TableOfContents>>
----
Some text with a footnote.<<FootNote(This is the footnote.)>>

|| <<MonthCalendar>> || <<MonthCalendar(,2000,1)>> ||
----
A certain moment - world wide: <<DateTime(2006-01-26T23:03:25Z)>>
