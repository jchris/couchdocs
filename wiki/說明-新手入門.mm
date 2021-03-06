## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpForBeginners
##master-date:2004-01-30 23:15:44
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language zh-tw
== WikiWikiWeb ==
["中文的WikiWikiWeb"] 是多人合作的超文本操作環境，特別強調資訊要容易取得、方便修改。

只要按下頁尾的''編輯本頁'', 每個人都可以修改任何一頁. 連在一起的首字大寫詞叫做 ["Wiki名稱"] (WikiName), 是指向到另一頁的連結. 在每頁開頭的標題點一下, 就可以檢索每個連向本頁的頁面. 空有連結沒有內容的話, 前面會打上「問號」或粗體紅字, 點一下連過去, 就可以著手編寫內容. 你可以用同樣的方法新增頁面: 在現有的頁面加上一個 ["Wiki名稱"], 存檔, 點一下問號, 進入新頁. 詳細說明請參考 HelpOnPageCreation.

建議你到 ["Wiki沙箱"] 塗塗改改, 在熟悉編輯和 wiki 的運作方式之前, 請不要修改別頁.

如果你想知道更多有關 Wiki:WikiWikiWeb 的事情, 可以參考 Wiki:WhyWikiWorks 和 Wiki:WikiNature, 也請參考 Wiki:WikiWikiWebFaq 和 Wiki:OneMinuteWiki.
本站也是 ["網際Wiki"] 空間的一部份, 意思是說, 你很容易通過其他公開 wiki 站點, 取得大量信息.

提供幾個探索 wiki 的起點:
 * ["最新更動"]: 看看其他人最近做了什麼
 * ["尋找頁面"]: 用幾種不同方式尋找頁面
 * ["標題索引"]: 本站頁面清單
 * ["詞彙索引"]: 列出每頁標題的單字 (也就是說, 顯示本站的概念清單)
 * ["本站導覽"]: 用幾種不同方式索引本站
 * ["Wiki沙箱"]: 這頁可以讓你塗塗改改，實驗 Wiki 的編輯功能

在 HelpContents 和 HelpIndex 裡有更多幫助說明.

== Wiki 名稱 (Wiki Names) ==
WikiName 指的是連在一起的首字大寫字, 會自動變成指向 WikiName 那頁的連結. 哪些是大寫和哪些小寫在設定檔裡定義, MoinMoin 原本依照 Latin-1 字集 (ISO-8859-1 字集) 定義, ["中文的MoinMoin"] wiki 大寫指 A-Z，小寫指 0-9 及 a-z. 亞洲字符、希伯來文及其他非西方字集的設定, 請參考以下說明.

點一下每頁最上面的標題 (像本頁的標題就是 ["說明-新手入門"]), 就可以檢索每個連向本頁的頁面, 還沒填上內容的頁面也可以這樣操作.

如果連結前面有個問號、或是用粗體紅字顯示, 表示該頁還沒有內容, 你可以點一下那個問號, 進入該頁, 編寫內文 (像這頁: NoSuchPageForReal). 點進去以後, 你會看到預設的畫面, 點選''編輯本頁''後再''存檔''，那一頁才算是編寫好了. 沒有內容的頁面的清單，列在 ["未定義頁"].

如果你要輸入一個 WikiName, 但又不要它是連結, 像這樣: Wiki''''''Name, 可以插進一個"空的"粗體 (6 個單引號), 如: {{{Wiki''''''Name}}}, 或是插入兩個倒引號 "{{{``}}}", 如: {{{Wiki``Name}}}, 但是因為中文 Big5 碼有用到倒引號, 所以這個功能在以 Big5 碼為內碼的 wiki 中, 可能沒有作用.

HelpOnEditing 說明更多 wiki 標記.

== 任意的頁面名稱 ==
如果你用中括號和雙引號夾住一個名字 {{{["like this"]}}}, 那樣也視為連結. 中文頁面都需要這樣連結. 這樣就可以用 ["中文的MoinMoin"] 來做一些特別的事, 比方說用 "原本" 的名字來整理你的 CD 收藏等等. 其他非西方字集的頁面都要這樣製作.

/!\ '''這個功能在設定檔裡叫 `allow_extended_names`, 沒開的話不能用!'''
