## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
'''Index'''
<<TableOfContents>>

== "What is a Wiki?" questions ==
=== What is a ''Wiki''? What is a ''MoinMoin''? ===

The term ''Wiki'' is a shortened form of Wiki''''''Wiki''''''Web.  A Wiki is a database of pages that can be collaboritively edited using a web browser.

A Moin''''''Moin is a wiki provided by the python wiki program Moin''''''Moin.

=== What is this good for? ===

To be honest, it is good for whatever you use it for.  At [http://www.lineo.com/ Lineo] we have put up a wiki on our internal web site with very many pages, which describe various projects, architectures, ideas, etc. for people to comment on.  Some pages just sit there and
convey information.  Other pages are an open invitation for discussion and commentary.  We also have set up a wiki for a very simple skills database.

In general, a wiki is very much a free-form tool, whose value derives from the use to which it is put.  For instance, a page in a wiki can serve the same purpose as a discussion thread.  You could use a wiki page to collaboratively work on a project.

Wikis are used internally by the guys who write [http://www.zope.org/ Zope] to manage their ideas and projects.

=== What are the major features of a Wiki? ===

Here are some important wiki features:
 * Editability by anyone - A wiki page is editable by anyone with a web browser
 * ability to view recent changes
 * ability to search pages (several ways)
 * ability to very easily add new pages
 * ability to see the change history for a document
 * ability to add new information or modify existing information

=== What about Wiki security?  Isn't a Wiki subject to complete wipeout or nastiness from a saboteur? ===

This is an important question.  In general, wiki's used to have '''NO''' security. (That's right!)

For MoinMoin this has changed with the introduction of Access Control Lists, see HelpOnAccessControlLists.

But, assuming you do not use ACLs, the possibility exists for accidental or conscious destruction or corruption of part or all of the wiki.

There are two main ways to devalue a wiki.  One is through erasure and the other is through corruption.  Dealing with erasure is not terribly difficult, because there is a change log (and back versions) of every page maintained in a location inaccessible to web users.  Thus, when page deletions or major content erasures are detected (which should be fairly quickly), pages can be restored quite easily to their previous good state. 

Explicit and intentional corruption is more difficult to deal with.  The possibility exists that someone can enter incorrect information onto a page, or edit pages to intentionally change the information so it is incorrect (for example, people can change the attributions on a page to make it look like a different person made a particular comment, or someone can change the content of a paragraph to alter its meaning in a detrimental way).  Pretty much any collaborative system has this problem.  In practice, wiki corruption is an extremely rare
event, and one that can be dealt with (if needed) with the notification feature (to a fixed auditor) for new material submission.

In other words, the philosophy of wiki is one of dealing manually (the term for that is Soft``Security) with the rare (exception) case of a saboteur, rather than designing in features and overhead (both in implementation and in usage) to avoid the damage caused by a saboteur.

== Questions about using this Wiki ==
=== Finding and accessing information in the wiki ===
==== How can I search the wiki? ====
 
There are already more ways to search and/or scan the wiki than you can "shake a stick at":
 * Click on the magnifying glass icon. This brings you to the FindPage page, where you can search by keyword in title, by full text, with normal words or wildcards (regular expressions).
 * Click on TitleIndex.  This will show you an alphabetized list of all pages by title.
 * Click on WordIndex.  This shows an alphabetized list of every word in every title (i.e. a page named Blue``Tooth is listed under B / Blue as well as T / Tooth).
 * Click on {{{LikePages}}} at the bottom of the page.  This shows pages that have words in their titles that are similar to the current page.
 * Click on the page title at the very top of the page.  This shows what pages link to the current page (which may help you find related pages).

==== How do I see what's been going on recently in the wiki? ====

Click on the RecentChanges link at the top of any page.

==== How can I get RecentChanges to go farther back in time than it goes by default? ====

Log in and select up to 90 days back. Is this enough?

==== What are these WeirdRedLinks I keep finding all over the place? ====

Any mixed case name that doesn't have a page will show up as a red link.

=== Adding information to the wiki ===

==== How do add something to the wiki, or change something that's wrong? ====
  
If you see something you'd like to comment on, add to, or change, just click on the {{{EditText}}} link at the bottom of the page, or click on the <<Icon(moin-edit)>> icon at the top of the page.  The page is brought up in a text-edit pane in your browser, and you simply make the changes. The wiki formatter will generally "do the right thing" with any text you enter.  If you want to get fancy, you can do most of the same types of formatting that HTML allows you to do.  See the HelpOnFormatting page for some tips and examples.
  
==== Are there any conventions I should follow when adding information? ====
  
Not very many.  It helps to keep certain types of information formatted in a consistent way.  One important convention that will help with consistency is the use of "Template" pages.

The wiki has a feature called "Templates" which show up when you create a new page.  If you click on one of these when creating a new page, then that page will have a structure similar to others of the same type.  For example, when creating your own Wiki homepage, you should use the HomepageTemplate page, which is available when you create a new page in the wiki.
  
==== How can I add non-text information to the Wiki? ====
  
If the content already exists on a web site, then just add a link to a wiki page. Follow these steps:
 * Get the URL for the document,
 * Edit the Wiki page (go to the Wiki page and click the Edit''''''Text link)
 * Type in the URL where you want it in the document
 * Save the changes.
The wiki will automatically make a hypertext link from the text you type in.
  
You can make the link "prettier" by putting "cover" wording for the link in brackets.  The cover wording will appear on the page, but the
link will take the user to the URL when clicked on.  Here's an example:
{{{
  [http://your.link.here/foo.html This will be the link text]
}}}
produces:

[http://your.link.here/foo.html This will be the link text]

==== How do I add an image to a page? ====

You can include a url to the image in the page.  Example:
{{{
http://c2.com/sig/inter/wikibase.gif
}}}
produces

http://c2.com/sig/inter/wikibase.gif

==== Adding documents in an intranet ====
If you're using MoinMoin on an intranet, it may be useful to make links to documents on file shares available to everyone reading your wiki. For example:
{{{
[file://servername/full/path/to/file/filename.txt Click here to read filename.txt]}}}

You can also link to files with spaces in the filenames by manually entering the URL encoding for spaces({{{%20}}}):
{{{
[file://servername/full/path/to/file/filename%20with%20spaces.txt Click here to read filename with spaces.txt]}}}

Another obvious and maybe better option is to use the {{{AttachFile}}} action.

==== Should I ''sign'' my changes? ====

If they are significant, or you want people to know that you made them, then yes.  Just put your name or email address after your comment.  It is not uncommon to indent your comment under the statement you are commenting on.  Also, it helps to ''italicize'' your comment to make it stand off from the main body of the page you are commenting on.
 
However, in some cases it may be appropriate to just make your change anonymously.  Correcting spelling, formatting, or trivial word changes are some examples where it is not necessary (and even discouraged) for you to sign your modification.
  

=== Adding other document formats to the wiki ===
==== Can I add HTML to the wiki? ====

If you want to add a single line of HTML, use the HTML macro. This is done by putting your HTML text as a parameter to the
HTML macro, like so:

{{{<<HTML(<font size=+12>This is large font</font>)>>}}}

This would show up on the page as:
<<HTML(<font size=+12>This is large font</font>)>>

It's also possible to place an HTML document into a page by adding {{{#format html}}} as the first line in the page.  If that line is there then the whole page will be interpreted as HTML (thus making links to other pages becomes a bit more difficult!)  Make sure that you only add the body portion of the page (not the HTML headers or anything else outside of the body, including the <BODY> tag itself).

 /!\ All of this only works if the HTML extensions (HTML macro and parser) are installed.

== Installation & Configuration ==

 (!) See HelpOnAdministration for general help on this topic

=== How do I activate the "DeletePage" / "AttachFile" / "RenamePage" option? ===

"Delete''''''Page" is not active by default, since it's most often used in intranets only and is somewhat dangerous in public wikis. To allow this and other dangerous actions, add them like this to {{{wikiconfig.py}}}: {{{
allowed_actions=['DeletePage', 'RenamePage', 'AttachFile', ]
}}}

For being allowed to delete or rename pages, you will have to log in (through UserPreferences).

== Administering the Wiki ==
=== How do I administer the wiki? ===

There is a lot of administration information on the RecentChanges page, including the number of pages, and the macros and actions that are installed.

I usually set up an "Admin''''''Page", where I put macros for these, as well as information about the real physical location of the
pages, and macros for orphan pages or other things an adminstrator for the wiki might want to look at. 

=== Can I restore a page from an older version? ===

 1. click on the little "i" in the top-right corner ({{{PageInfo}}}).
 1. click on "revert" of the version you want to restore.

For being allowed to revert pages, you will have to log in (through UserPreferences).

=== How do I create a new Template page? ===

Templates are pages that show up automatically as options when you create a blank page.  Any page that ends in the word Template will automatically show up in the list.  Hence, if you want certain types of pages to have a similar format (similar headings, organization, etc.), you just define a page that ends in Template, and when creating pages of this type, select that template and edit it.  The wiki fills in the starting content for you.  Templates are editable wiki pages like any other.

To create a Template page, just create a new page called <something>Template.
