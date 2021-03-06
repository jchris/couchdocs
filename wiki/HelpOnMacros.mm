## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:None
##master-date:None
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en

<<Navigation(children)>>
<<TableOfContents>>

== Macros ==
Macros allow the insertion of system features into normal wiki pages; the only thing that makes those pages special is that they contain macros. If you edit pages like RecentChanges or SystemInfo, you'll see what that means.

For more information on the possible markup, see HelpOnEditing. 

=== Search macros ===

MoinMoin now uses a new search engine, that lets your make sophisticated searches using both the interactive search box or any of the search macros. For more help, see HelpOnSearching.

||'''Macro'''||'''Description'''||'''Example'''||
||{{{<<TitleSearch>>}}}     || create a search box on the page, which search the page titles || See FindPage ||
||{{{<<FullSearch>>}}}      || create a search box on the page, which search the page contents || See FindPage ||
||{{{<<FullSearch()>>}}}      || print a list of pages whose content matches the current page title (like clicking on the page title) || See the CategoryCategory page ||
||{{{<<FullSearch(text)>>}}} || print a list of pages whose content matches the search term || Search for {{{powered}}}:<<FullSearch(powered)>> ||
||{{{<<GoTo>>}}}            || directly go to the page you enter || See the FindPage ||
||{{{<<PageList(Help)>>}}} || print a list of pages whose title matches the search term || See the HelpIndex ||

=== Navigation ===
||'''Macro'''||'''Description'''||'''Example'''||
||{{{<<RecentChanges>>}}}   || a list of recently edited pages || See RecentChanges ||
||{{{<<TitleIndex>>}}}      || an index of all page titles || See TitleIndex ||
||{{{<<WordIndex>>}}}       || an index of all words in page titles || See WordIndex ||
||{{{<<WantedPages>>}}} || list links to non-existent pages || See WantedPages ||
||{{{<<OrphanedPages>>}}} || list pages no other page links to || See OrphanedPages ||
||{{{<<AbandonedPages>>}}} || list pages that were not edited for the longest time || See AbandonedPages ||
||{{{<<RandomPage>>}}}      || a link to a random page || <<RandomPage>> ||
||{{{<<RandomPage(#)>>}}}   || links to a number of random pages || Two random pages:<<RandomPage(2)>> ||
||{{{<<TableOfContents([maxdepth])>>}}} || display a local table of contents, possibly limited to a maximal depth || See above ||
||{{{<<Anchor(anchorname)>>}}} || macro to insert anchors into a page || <<Anchor(here)>>[#here] ||
||{{{<<Navigation(children[,maxdepth])>>}}} || macro to list all of a pages' children || See start of this page ||
||{{{<<Navigation(siblings[,maxdepth])>>}}} || quick navigation to siblings of a page || See /MailTo ||
||{{{<<Navigation(slideshow)>>}}} || creates a link to toggle between slide show and wiki mode, and a link to start the slide show || See HelpOnSlideShows ||
||{{{<<Navigation(slides)>>}}} || displays first/prev/next/last links || See HelpOnSlideShows ||
||{{{<<AttachInfo>>}}} || displays number of attachments for current page || See HelpOnActions/AttachFile ||
||{{{<<AttachInfo(page)>>}}} || displays number of attachments for page || See HelpOnActions/AttachFile ||
||{{{<<AttachList>>}}} || displays list of attachments for current page || See HelpOnActions/AttachFile ||
||{{{<<AttachList(page)>>}}} || displays list of attachments for page || See HelpOnActions/AttachFile ||

=== System information ===
||'''Macro'''||'''Description'''||'''Example'''||
||{{{<<InterWiki>>}}}       || a list of all known InterWiki names || InterWiki ||
||{{{<<SystemInfo>>}}}      || info on the wiki, the python interpreter and the host system || SystemInfo ||
||{{{<<PageCount(exists)>>}}}  || current page count. If `exists` is supplied as an argument, only existing pages will be shown. || <<PageCount>> pages ||
||{{{<<PageSize>>}}}        || list the sizes of all pages || See PageSize ||
||{{{<<StatsChart(type)>>}}} || shows statistical charts (currently defined types: hitcounts, pagesize, useragents) || See EventStats and subpages  ||
||{{{<<SystemAdmin>>}}} || Information for system administrators || Needs admin rights.<<BR>> <<SystemAdmin>> ||

=== Others ===
||'''Macro'''||'''Description'''||'''Example'''||
||{{{<<Icon(image)>>}}}     || display system icons || See HelpOnNavigation ||
||{{{<<UserPreferences>>}}} || display a user preferences dialog || See UserPreferences ||
||{{{<<BR>>}}} || insert a line break || 1st line<<BR>>2nd line ||
||{{{<<RandomQuote(pagename)>>}}} || Select a random quote from the given page, or from `FortuneCookies` if ommitted || <<RandomQuote>> ||
||{{{<<Include(HelloWorld[,"heading"[,level>>)>>}}} || include contents of another page || for details see ["/Include"] ||
||{{{<<FootNote(text)>>}}} || Add a footnote (the text cannot contain any wiki markup), or explicitely display collected footnotes when no args are given || See HelpOnPageCreation for an example ||
||{{{<<Date(timestamp)>>}}} || display a timestamp according to system settings || <<Date()>> ||
||{{{<<DateTime(timestamp)>>}}} || display a timestamp<<FootNote("timestamp" can be empty (current time), a number of seconds since 1970 (unix timestamp), or a W3C time specification ("2002-01-23T12:34:56"). See RFC822, sect. 5. )>> according to user settings || <<DateTime()>> ||
||{{{<<GetText(text)>>}}} || loads I18N texts (mainly intended for use on Help pages) || "Edit``Text" is translated to "<<GetText(EditText)>>" ||
||{{{<<TeudView>>}}} || useful for intranet developer wikis, a means to view pydoc documentation, formatted via a XSLT stylesheet || See [http://twistedmatrix.com/wiki/python/TeudProject] ||
||{{{<<MailTo(email)>>}}} || protect your email address from spam bots || for details see /MailTo ||
||{{{<<NewPage(PageTemplate,ButtonLabel,ParentPage[,NameTemplate])>>}}}|| Allow the user to create (sub-) pages easily, using the page `PageTemplate`as the template for the new page and the string `NameTemplate` as a template for the name.<<FootNote(`NameTemplate` is formatted with `time.strftime()`, with the exception of `%s` which is replaced by the input into the edit box (which is only shown if necessary). If `NameTemplate` is not specified or empty, it defaults to `%s`.)>> || <<NewPage(CategoryTemplate, Create new category,,Category%s)>>||
||{{{<<GetVal(NeatSnippets,regards)>>}}} || Retrieve dictionary entries from dict pages. || If you have a page called GermanDict which contains the entry ''Test'', you should see the translation here: <<GetVal(GermanDict,Test)>> ||

<<FootNote()>>

=== Writing your own macro ===
Create a python file called {{{MacroName.py}}} located in your {{{data/plugins/macro}}} directory. Ensure it has a single method called {{{execute(macro, arguments)}}}, which is the entry-point.
 * ''macro'' is an instance of class Macro, and also evaluates to a string of the macroname.
 * ''arguments'' is an arbitrary argument string you can pass in with parameters to your macro.

All {{{Macro}}} instances have a {{{request}}} member through which you can access the form parameters and other information related to user interaction.
   
{{{execute()}}} should use the formatter to construct valid markup for the current target format. In most cases this is HTML, so writing a macro which returns HTML will work in most cases but fail when formats like XML or `text/plain` are requested.
   
For example, your wiki page has the following line on it:
{{{
<<MacroName(arg1,arg2,arg3)>>
}}}
   
You could write a !MacroName.py file like this:
{{{
Dependencies = []

def execute(macro, args):
    return macro.formatter.text("I got these args from a macro %s: %s" %
    (str(macro), args))
}}}

 /!\ You have to fill the dependencies list if your macro's output does not solely depend on the parameters. This is true for macros that output random data or query other data sources like e.g. databases. You may use arbitrary items to fill this list but should look at other macros' dependencies lists. 

<<FootNote>>
