## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:
##master-date:
#acl -All:write Default
#format wiki
#language en
== HelpOnSubscribing ==

----

'''Overview:'''  Subscribing is an optional feature on MoinMoin wikis which enables users to receive an email notification when any changes have been made on specific wiki webpages.  This optional feature is available only if the wiki administrator has enabled email support.  This feature may also be available across a whole wiki farm if the wiki farm administrator has enabled sharing of user accounts and data. Subscribing is also described on HelpOnUserPreferences.

There are two general ways to subscribe to MoinMoin wiki webpages. The first and easiest way is to click on the 'Subscribe' link at the top of a wiki webpage.  The second way is to edit 'User Preferences'.  Both methods are described in detail below.

----

'''Definitions:'''

'''Subscribe:''' When you 'subscribe' to a MoinMoin wiki webpage, you are requesting that an email be sent to you when anyone other than yourself changes the contents of the webpage.

'''Unsubscribe:'''  At any time after you have 'subscribed' to a MoinMoin wiki webpage, you may choose to 'unsubscribe' to this webpage.  After you 'unsubscribe' to a wiki webpage, you will NOT be notified when changes are made to this webpage.

'''Wiki farm:'''  A wiki farm is a cluster of wiki websites that are maintained on a common server or server farm and share the same domain name (e.g. myfirstwiki.anywiki.net and mysecondwiki.anywiki.net).  For more information about wiki farms and server farms, please read <<http://wikipedia.org/wiki/Wiki_farm|Wikipedia's article on WikiFarms>>.

'''!InterWiki name:''' A shorthand abbreviation for a wiki URL.  An interwiki name may be assigned by the wiki administrator. See InterWiki for more information.

----

'''Subscribe or unsubscribe to one wiki webpage:'''

'''Subscribing:''' The easiest way to subscribe to a MoinMoin wiki webpage is to click on the 'Subscribe' link near the top of the page.  You cannot subscribe to a page unless you are logged in.  After you do this, you will automatically receive an email each time another user modifies this wiki webpage.  In addition, the 'Subscribe' link will change to an 'Unsubscribe' link on this wiki webpage.

'''Unsubscribing:''' To unsubscribe to a wiki webpage, click on the 'Unsubscribe' link near the top of the page.  After you do this, you will no longer receive emails when the page is modified.  You must be logged in to unsubscribe.

Remember that any user who has logged in to a wiki may subscribe and unsubscribe to a wiki page that you have created. 

----

'''Subscribe to multiple wiki webpages one at a time:'''

You may repeat the above process in order to subscribe to any number of wiki webpages on one or more MoinMoin wiki websites.  However, if you want to subscribe to many wiki webpages or collections of wiki webpages, it may be easier to do this by changing your user preferences as described below.

If you forget which wiki webpages you have subscribed to, you can find a list of these pages under User Preferences.

----

'''Subscribe to multiple wiki webpages through 'User Preferences':'''

After you login using your wiki username and password, click on the 'Preferences' link near the top of any wiki webpage on the wiki website.  This will open your 'User Preferences' webpage.  Scroll down the page until you see the following label:

 __Subscribed wiki pages (one regex per line)__

If you have previously subscribed to individual wiki webpages as described above, there should be a list of these webpages in the text box on the right.  If you have not subscribed to any wiki webpages, the text box will be blank.  To subscribe to individual wiki webpages or collections of webpages, follow the examples shown in the table below.  After you add to the subscribed pages list, save your preferences to make them permanent.  For more information about regular expressions ('regex'), please see the note below about __Regular expressions__.
 

'''Examples for Subscribe:'''

{{{
Please see notes below about interwiki names, wiki farms and regular expressions.
}}}


||'''Example'''||'''Subscribes to'''||
|| {{{.*}}} || {{{All webpages on the current wiki (or wiki farm) - Warning: use with CAUTION }}}  <!>  ||
|| {{{MyFirstWiki:.*}}} || {{{All webpages on the MyFirstWiki wiki}}}||
|| {{{MainPage}}} || {{{All pages named 'MainPage' on the current wiki (or wiki farm)}}} ||
|| {{{MyFirstWiki:MainPage}}} || {{{The MainPage on the MyFirstWiki wiki}}} ||
|| {{{MyFirstWiki:MainPage/.*}}} || {{{All subpages of the MainPage on the MyFirstWiki wiki}}} ||
|| {{{Help.*}}} || {{{All pages starting with the word 'Help' on the current wiki (or wiki farm)}}} ||
|| {{{MyFirstWiki:Help.*}}} || {{{All pages starting with the word 'Help' on the MyFirstWiki wiki}}} ||
|| {{{Help(On|For).*}}} || {{{All pages starting with the term 'HelpOn' or 'HelpFor' on the current wiki (or wiki farm)}}} ||
|| {{{MyFirstWiki:MainPage/.*(Help|Question).*}}} || {{{All subpages of the MainPage on the MyFirstWiki wiki which contain either the word 'Help'}}}<<BR>>{{{or the word 'Question' anywhere in the name }}} ||

....

'''Unsubscribe''' to any of the above pages by simply removing the line from the text box and saving your User Preferences.

----

'''Notes:'''

'''Interwiki names:'''  In the examples above, the term {{{'MyFirstWiki'}}} is the interwiki name of the current wiki that was assigned by the wiki administrator. This will be different on your wiki. The easiest way to learn the interwiki name of your wiki is to subscribe to one or more individual wiki pages.  When you open your user preferences, you will find your interwiki name in each line of your subscribed pages.  The interwiki name is the term before the colon character.  You should always include the interwiki name when creating interwiki links, since you may accidentally subscribe to all pages which match your regex expression across a whole wiki farm.

....

'''Wiki farms:'''  In the examples in the table above, if the interwiki name is NOT included (before the colon character),
the regex term will apply to either 1) the current wiki only or 2) the current wiki farm.  The latter will apply only if your current wiki is part of a wiki farm and the wiki farm administrator has enabled 'sharing of user accounts and data'.  This is described on HelpOnUserHandling.

....

'''Regular Expressions:''' Regular expressions (abbreviated regex) are symbolic terms used for pattern matching in computer programming languages.  As illustrated above, regular expressions are used in MoinMoin user preferences to subscribe to more than one wiki webpage at a time.  For example, the term period-asterisk (.*) means zero or more repetitions (*) of any character (.) in the wiki page name.  The expression '(Help|Question)' means either the word 'Help' or the word 'Question' must occur in the wiki page name.  There are many more symbols used in regular expressions but they are beyond the scope of this help page.  The regular expression syntax used in User Preferences on a MoinMoin wiki is the <<http://docs.python.org/lib/re-syntax.html|Python programming language>> syntax.

An important feature of regex expressions used for subscribing in a MoinMoin wiki (as illustrated in the table above) is that each expression is automatically enclosed between the symbols "^" and "$" which represent the beginning and end of the wiki webpage name.  Thus, the regex expression {{{'MainPage'}}} will match only pages with that name but will not match pages named {{{'MyMainPage' or 'MainPageOne'}}}, etc.

For more information about regular expressions, please consult <<http://wikipedia.org/wiki/Regular_expression|Regular expression on Wikipedia>>.
