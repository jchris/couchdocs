## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
## page was renamed from WikiCourse/17 Extern links
## page was renamed from WikiKurs/17 externe Links
##master-page:
##master-date:
#acl -All:write Default
#format wiki
#language en
#pragma section-numbers off
<<Navigation(slides)>>
= External links =
You can, of course, also link to external content on the internet.

== Input ==
{{{
http://example.net/

<<http://moinmoin.in/|MoinMoin Wiki>>

ftp://example.org/pub/

{{http://static.moinmo.in/logos/moinmoin.png}}
}}}
== Display ==

http://example.net/

<<http://moinmoin.in/|MoinMoin Wiki>>

ftp://example.org/pub/

{{http://static.moinmo.in/logos/moinmoin.png}}

(!) As you can see, `<<...>>` sets a link to the target, `{{...}}` embeds the target, which is especially useful for pictures.
