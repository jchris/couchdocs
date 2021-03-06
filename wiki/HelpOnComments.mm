## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:None
##master-date:None
#acl -All:write Default
#format wiki
#language en
= Comments =
MoinMoin has the capability to use in-context comments to directly add some comment or additional information to the place you are commenting on, while still enabling the user to get a clean display of the page contents without the comments.

The edit bar has a toggle for the visibility of these comments.

(!) Just click on <<GetText(Comments)>> to toggle the visibility (requires Javascript enabled in your browser).

The comments will usually be rendered slightly different from normal text (e.g. different colour), so the user can still see what is main content and what is a comment.

== Inline comments ==

=== Markup ===
{{{
Diamonds are expensive. /* BTW, there are also inexpensive industrial diamonds. */ Their price depends on multiple factors: ...
}}}
 
=== Display ===

Diamonds are expensive. /* BTW, there are also inexpensive industrial diamonds. */ Their price depends on multiple factors: ...

== Comment sections ==

=== Markup ===
{{{{
Some normal text.

{{{#!wiki comment
This is just a wiki parser using a div class="comment" to contain its output.
 1. first
 1. second
 1. ...
}}}

More normal text.
}}}}

=== Display ===

Some normal text.

{{{#!wiki comment
This is just a wiki parser using a div class="comment" to contain its output.
 1. first
 1. second
 1. ...
}}}

More normal text.

== Hints for using comments ==
 * You need Javascript to toggle the visibility of the comments. If you don't have Javascript, see below.
 * You can set the visibility of comments in your user preferences, the default is to not show comments (so you need to click on <<GetText(Comments)>> to see them).
  * This default was chosen because the main intention of this feature is to have a ''clean'' page display.
  * You still have the choice of seeing everything without additional clicks (and hiding by using the toggle) by enabling <<GetText(Show comment sections)>> in your user preferences.

Additionally to the comments feature, there is also the "supplementation page" feature (see HelpOnConfiguration/SupplementationPage).
