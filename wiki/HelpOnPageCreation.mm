## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en

 <!> Needs update for 1.3

== Creating a New Page ==

To create a page, add its WikiName to an existing page (make sure you spelled it correctly) and save it. After that, you can click on it on the revised page, since it automatically becomes a hyperlink.

You will then be presented with your new page, which you can edit in the normal way. After you ''first'' saved it, it will be automatically created.

On details on how to create and link to subpages, see HelpOnEditing/SubPages. 

== Creating and Using Template Pages ==
To create a template, follow the above description and create a page with a name ending in "'''Template'''"<<FootNote(If the wiki administrator changed the default settings, rules for what names are template pages might be different.)>>. This page will then be added to the list of template pages displayed when you try to show a non-existent page. For example, NonExistentHelpPage has a link to HelpTemplate that loads the content of HelpTemplate into the editor box, when you click on that link.

== Variable Substitution when Saving a Page ==

<<Anchor(variablesubstitution)>>
The following variables are substituted when a page is ''finally'' saved. Note that they'll appear unreplaced in the preview!

|| Variable         || Description                                  || Example ||
|| @''''''PAGE@     || Name of the page (useful for template pages) || HelpOnPageCreation ||
|| @''''''DATE@     || Current date in the system's format          || <<Date(2004-08-30T06:38:05Z)>> ||
|| @''''''TIME@     || Current date and time in the user's format   || <<DateTime(2004-08-30T06:38:05Z)>> ||
|| @''''''USERNAME@ || Just the user's name (or his domain/IP)      || TheAnarcat ||
|| @''''''USER@     || Signature "-- loginname"                     || -- TheAnarcat ||
|| @''''''SIG@      || Dated Signature "-- loginname date time"     || -- TheAnarcat <<DateTime(2004-08-30T06:38:05Z)>> ||
|| @''''''MAILTO@   || A fancy mailto: link with the user's data    || None - on public sites, better use the Mail``To macro) ||

You can use Home``Page``Name/Wiki``Dict to expand those variables, just put a WikiDict there with your variables and values.

Note that saving template or form definition pages and using preview does ''not'' expand variables. Other than that, variable expansion is very global and happens anywhere on the page, including code displays, comments, processing instructions and other "special" areas of a page you might think are excluded.

= Editor backup =

If the user has a homepage<<FootNote(Having a homepage means you're logged in under a name that is also the name of an existing wiki page.)>> indicated by the <<Icon(home)>> icon, a backup of save/preview text is saved either as subpage `Home``Page``Name/Moin``Editor``Backup` (if subpages are allowed) or as page `Home``Page``Name``Moin``Editor``Backup` (if subpages are not allowed).

So if you preview often, you will keep your changes, even if your browser crashes.
