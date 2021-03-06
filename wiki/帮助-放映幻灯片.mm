## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnSlideShows
##master-date:2004-05-15 22:02:15
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language zh

<<Navigation(slideshow)>>

You can easily create slide shows using the `<<Navigation>>` macro.

For a new presentation, start on a new page - we use HelpOnSlideShows (''this'' page) as an example.

For your convenience, there is a SlideShowTemplate - use it!

Put `<<Navigation(slideshow)>>` on top of that page (looks like you see above) - that creates a link to toggle between slide show and wiki mode, and a link to start the slide show.

Refer to your slides with numbered sub-page links putting some code like that on your top page:
{{{
 * ["/000 前言"]
 * ["/100 创建幻灯片"]
 * ...
 * ["/900 最后: 放映开始"]
 * ["../幻灯讲义模板"]
}}}

(!) Leave some numbers free in between - just for that case you need to insert additional slides later.

(!) Don't use too long page titles - you will see that they look bad (at least in wiki mode due to wrapping of the wiki page title).

This will look like that:
 * ["/000 前言"]
 * ["/100 创建幻灯片"]
 * ...
 * ["/900 最后: 放映开始"]
 * ["../幻灯讲义模板"]

You may want to put `<<Navigation(children)>>` at bottom of the page - that lists the pages' child pages and looks like you see below:

<<Navigation(children)>>

此页的英文版本：HelpOnSlideShows
