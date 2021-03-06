## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:
##master-date:
#acl -All:write Default
#format wiki
#language en

<<TableOfContents>>
== What is a TextCHA? ==
It is a pure text alternative to ''CAPTCHAs''. !MoinMoin uses it to prevent wiki spamming.

Features:
 * for page save, ask a random question
 * match the given answer against a regular expression
 * q and a can be configured in the wiki config
 * multi language support: a user gets a textcha in his language or in language_default or in English (depending on availability of questions/answers for the language)

Tips for answering:
 * you need to answer the textcha for e.g.:
  * page save
  * attachment upload
  * user profile creation

 * you do not need to answer the textcha for e.g.:
  * page preview (if you do, it will remember what you entered, though)
  * user profile changes

 * it is usually a simple/short answer
 * it compares case-insensitive
 * sometimes you can find the right answer by reading some important pages of the wiki
 
== Configuration ==

Tips for configuration:
 * have 1 word / 1 number answers
 * ask questions that normal users of your site are likely to be able to answer
 * do not ask too hard questions
 * do not ask "computable" questions, like "1+1" or "2*3"
 * do not ask too common questions
 * do not share your questions with other sites / copy questions from other sites (or spammers might try to adapt to this) 
 * you should at least give textchas for 'en' (or for your language_default, if that is not 'en') as this will be used as fallback if !MoinMoin does not find a textcha in the user's language

In your wiki config, do something like this:
{{{
    textchas_disabled_group = u"TrustedEditorGroup" # members of this don't get textchas
    textchas = {
        'en': { # silly english example textchas (do not use them!)
            u"Enter the first 9 digits of Pi.": ur"3\.14159265",
            u"What is the opposite of 'day'?": ur"(night|nite)",
            # ...
        },
        'de': { # some german textchas
            u"Gib die ersten 9 Stellen von Pi ein.": ur"3\.14159265",
            u"Was ist das Gegenteil von 'Tag'?": ur"nacht",
            # ...
        },
        # you can add more languages if you like
    }
}}}

Note that TrustedEditorGroup from above example can have groups as members.
