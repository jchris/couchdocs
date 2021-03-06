## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnEditing/SubPages
##master-date:2004-09-03 23:14:35
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language zh

["帮助目录"] > ["帮助-编辑"]

== Creating Subpages ==

Subpages are groups of pages that share a common prefix, which itself is another page. While this is also possible with "classic" wiki, by using names like {{{SomeTopicSubTopic}}}, the use of {{{SomeTopic/SubTopic}}} allows better navigational support, and you can omit the common prefix when linking from the parent page to the child page.

Thus, by using "/" to concatenate several WikiName''''''s, you can create arbitrarily deep hierarchies (within limits, especially the length of filenames on your system). In reality, subpages are normal pages that contain a "/" in their name, and thus they are stored besides all other pages in the file system. Subpages are a configurable feature, but they're on by default and it's recommended that you keep it that way, since the help pages themselves use this feature.

Links to sibling pages start with "`../`", for example ["../子网页"] (a link to this page).

=== Example ===
{{{
 * HelpOnEditing/SubPages
 * ["帮助-编辑/子网页"]
 * [wiki:帮助-编辑/子网页 就是此页]
 * [wiki:Self:帮助-编辑/子网页 就是此页]
 * /ThirdLevel
 * [wiki:/ThirdLevel A page below this one]
 * ["../子网页"]
 * ["../"] (anonymous parent link)
 * [:../:free parent link]
}}} 

=== Display ===
 * HelpOnEditing/SubPages
 * ["帮助-编辑/子网页"]
 * [wiki:帮助-编辑/子网页 就是此页]
 * [wiki:Self:帮助-编辑/子网页 就是此页]
 * /ThirdLevel
 * [wiki:/ThirdLevel A page below this one]
 * ["../子网页"]
 * ["../"] (anonymous parent link)
 * [:../:free parent link]

/!\ Please do all of us a favour and don't create the /ThirdLevel pages, it's just an example!

此页的英文版本：HelpOnEditing/SubPages
