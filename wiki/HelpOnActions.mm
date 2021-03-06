## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
== Actions ==

Actions are tools that work on a page or the whole wiki, but unlike macros do not add ''to'' the page content when viewing a page, but work ''on'' that page content. They either produce some output based on page contents (navigational actions like searching) or implement functions that are not related to viewing a page (like deleting or renaming a page).

There is a set of system-defined actions, which includes page editing; you can extend the set of known actions by your own ones. See HelpForDevelopers for more on that.

The following actions are added to the list of user-defined extension actions at the bottom of each page. This happens to any mixed-case extension, for other actions (all lower-case) see the list further down this page. Some of these action might not be available for your wiki site.
 * `AttachFile`: attach files to a page, see /AttachFile for more details.
  * This action is not granted if you are not logged in.
 * `DeletePage`: Delete a page, after you confirmed it; deletion means a final backup copy is created and only then the page is deleted, i.e. you can ''revive'' the page later on (as long as the backups are not physically deleted).
  * This action is not granted if you are not logged in.
 * `RenamePage`: Rename a page, after you confirmed it.
 * `LikePages`: list pages whose title starts or ends with the same MeatBall:WikiWord as the current page title.
 * `LocalSiteMap`: show nearby links of the current page, i.e. list all referred-to pages, and in turn their references, to a certain limited depth.
 * `SpellCheck`: call the spell checker for the current page; see HelpOnSpellCheck for more.

The following is a list of ''internal'' actions that are used to implement the various icons and links at the top and bottom of pages, or supplement certain macros.
 * titleindex: Implements the listing of all page names as [wiki:Self:?action=titleindex text] or [wiki:Self:?action=titleindex&mimetype=text/xml XML]; the main use of this action is to enable MeatBall:MetaWiki.
 * fullsearch: this action is triggered by clicking on the "Go" button of the `FullSearch` macro (Self:?action=fullsearch&value=HelpOnActions).
 * titlesearch: this action is triggered by clicking on the "Go" button of the `TitleSearch` macro (Self:?action=titlesearch&value=HelpOnActions).
 * inlinesearch: this implements the inline search for the form fields at the bottom of each page (note that this uses POST requests, so you won't normally see this action in URLs).
 * highlight: highlight the search word when you click on a link in a search result list.
 * diff: display differences between page revisions.
 * info: show meta-data on a page.
 * recall: display an older revision of a page.
 * show: display a page (the default action).
 * refresh: refresh the cached version of a page (currently only used on XSLT-formatted pages).
 * print: show the print-view of a page, which omits the navigational items from the display view.
 * edit: edit this page.
 * savepage: save this page (do not ever use this manually).
 * subscribe: subscribe to a page.
 * userform: save user preferences.
 * bookmark: set bookmark for RecentChanges.
 * raw: send the raw wiki markup as text/plain (e.g. for backup purposes via wget); Self:SystemInfo?action=raw shows the markup of SystemInfo.
 * format: emit specially formatted views of a page.
 * rss_rc: generate a RSS feed of RecentChanges.
 * chart: display charts.
 * export: export the wiki content. ''[experimental]''
 * content: for transclusion into static web pages, this action emits the pure page content, without any <html>, <head>, or <body> tags.
 * links: generates a list of all pages and the links on them, just like MeatBall:LinkDatabase.
 * xmlrpc: Wiki XML-RPC interface, see MeatBall:XmlRpcToWiki.
 * revert: revert to an older version of the page.
 * macro: execute a helper action in an external macro.
