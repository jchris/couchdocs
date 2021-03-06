## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:None
##master-date:None
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
HelpContents > HelpOnAdministration > HelpOnConfiguration

'''Subtopics'''
 * /CascadingStyleSheets
 * /EmailSupport
 * HelpOnAccessControlLists (permissions/users control)
 * /SecurityPolicy
 * /FileAttachments
 * /ApacheVoodoo

'''Contents'''
<<TableOfContents>>

= Configuring a single wiki =

If you run a single wiki, you should not copy the file `farmconfig.py` into your configuration directory (remove it, if it is there). Without farmconfig, moin uses the default `wikiconfig.py`

`wikiconfig.py` normally is located besides your `moin.cgi` driver script. If you need to make a custom install, it can be located anywhere, but you must add the path to the directory where it is located to your Python system path in your server script. See the "System Path Configuration" section in your server script.

== Wiki configuration file structure ==

General notes on wiki/farmconfig.py structure:
{{{
# -*- coding: iso-8859-1 -*-

from MoinMoin.multiconfig import DefaultConfig

class Config(DefaultConfig):

    sitename = u'MyWiki'   # u means that it will be converted to Unicode
    interwikiname = 'MyWiki'
    data_dir = '/where/ever/mywiki/data/'
    underlay_dir = '/where/ever/mywiki/underlay/'
    
    # More settings follow...
}}}

 * First, you must define the coding of the config file. The default setting is suited for Latin ("western") languages only, for international setup, read next section. If you don't define the coding, you can't use non-ascii characters.

 * Next we import moin's internal default configuration. The default configuration includes values for all options, so we don't have to define all values, just what we want to customize.

 * Then we define a new configuration class called "Config" and inherit all settings from the default configuration we imported. Note that the class name must be "Config".

 * Next lines are the configuration options for the Config class. Note that each line must be indented by 4 spaces, tabs are not allowed. Moin will not run if you use wrong indentation.

 * A common configuration item is `sitename` - in most cases you don't want your wiki to have the default "Untitled Wiki" name. You can define any name you like in any language, but before you do that, read next section on unicode options.

 * If you followed the install instructions, the wiki will run without any other change, but you might want to change some values, like `data_dir`, `data_underlay_dir` `acl_rights_before` and more. For most cases, setting all the values in the supplied `wikiconfig.py` file is enough.

 * Anything we do not define simply stays at moin's internal defaults which we inherited from !DefaultConfig.

= Unicode options =

 <!> '''Important: to use unicode values, you must setup a correct coding line in the first line of your configuration file. Check that your editor is configured correctly.'''

Certain options '''must''' use unicode values. For example, the site name could contain German umlauts or French accents or be in Chinese or Hebrew. Because of this, you must use unicode strings for those items. Unicode strings are defined by prefixing the letter `u` to the string. Here are some examples:

{{{
    # Site name, used by default for wiki name-logo [Unicode]
    sitename = u"Jürgen's Wiki"
    # another example:
    sitename = u'הוויקי של יורגן'
}}}

Read the comments in the configuration file - they tell you which options must use Unicode values.

Notes:

 * You can't mix different encodings in the same file. If your coding line says `iso-8859-1`, all your characters, the whole file content, must be in that encoding.

 * If you use utf-8 encoding (or plain ascii), you don't have to use unicode strings, moin will decode your string correctly for you. New in 1.3.2.

= International Setup =

The default configuration file shipped with moin uses `iso-8859-1` coding. This is fine for Latin languages like English or German, but not usable for non-latin languages. If you want to have non-latin characters in your configuration items, use utf-8 coding for the config file.

Set the first line of all configuration files to this line:
{{{
# -*- coding: utf-8 -*-
}}}

 /!\ You need a text editor being capable of (and also really using) utf-8 encoding for editing the config files.

Values using unicode strings (international users might want to change them):
 * sitename
 * logo_string
 * page_front_page
 * navi_bar
 * default_lang
 * page_category_regex
 * page_dict_regex
 * page_form_regex
 * page_group_regex
 * page_template_regex
 * page_license_page - New in 1.3.2
 * page_local_spelling_words - New in 1.3.2
 * acl_rights_default - New in 1.3.2
 * acl_rights_before - New in 1.3.2
 * acl_rights_after - New in 1.3.2

For ready made configuration in your language, see MoinMoin:ConfigMarket. Read also the section about unicode options.

= Configuration of multiple wikis =

The moinmoin wiki engine is capable of handling multiple wikis using a single installation, a single set of configuration files and a single server process. Especially for persistent environments like twisted, this is necessary, because the twisted server will permanently run on a specific IP address and TCP port number. So for virtual hosting of multiple domains (wikis) on the same IP and port, we need the wiki engine to permanently load multiple configs at the same time and choose the right of them when handling a request for a specific URL.

To be able to choose the right config, moin uses config variable `wikis` located in the file `farmconfig.py` - it simply contains a list of pairs `(wikiname, url-regex)`. Please only use valid python identifiers for `wikiname` (to be exact: `identifier ::= (letter|"_") (letter | digit | "_")*` - just try with a simple word if you didn't understand that grammar rule). When processing a request for some URL, moin searches through this list and tries to match the url-regex against the current URL. If it doesn't match, it simply proceeds to the next pair. If it does match, moin loads a configuration file named `<wikiname>.py` (usually from the same directory) that contains the configuration for that wiki. Internally, moin adds a ''catch all'' `('wikiconfig', '.*')` to the end of that list, so you do not need something like this in `farmconfig.wikis`.

`farmconfig.py` in the distribution archive has some sample entries for a wiki farm running multiple wikis. You need to adapt it to match your needs if you want to run multiple wikis.

/!\ For simpler writing of these help pages, we will call such a `<wikiname>.py` configuration file simply `wikiconfig.py`, of course you have to use the filename you chose.

Of course you have already adapted the `wikis` setting in `farmconfig.py` (see above), so we only give some hints how you can save some work. Please also read the single wiki configuration hints, because it explains config inheritance.

We now use the class-based configuration to be able to configure the common settings of your wikis at a single place: in the base configuration class (see `farmconfig.py` for an example).

The configs of your individual wikis then only keep the settings that need to be different (like the logo, or the data directory or ACL settings). Everything else they get by inheriting from the base configuration class, see `moinmaster.py` for a sample.

{{{
# -*- coding: iso-8859-1 -*-
# farmconfig.py:
from MoinMoin.multiconfig import DefaultConfig
class FarmConfig(DefaultConfig):
    url_prefix = '/wiki'
    show_hosts = 1
    underlay_dir = '/where/ever/common/underlay'
    # ...
}}}

Explanation:
 * first we import the default config, like we do when configuring a single wiki
 * now we define a new farm config class - and inherit from the default config
 * then we change everything that our farm wikis have in common, leaving out the settings that they need to be different
 * this Farm''''''Config class will now be used by the config files of the wikis instead of moin's internal Default''''''Config class, see below:

{{{
# -*- coding: iso-8859-1 -*-
# wikiconfig.py:
from farmconfig import FarmConfig
class Config(FarmConfig):
    show_hosts = 0
    sitename = u'MoinMaster'
    interwikiname = 'MoinMaster'
    data_dir = '/org/de.wikiwikiweb.moinmaster/data/'
    # ...
}}}

Explanation:
 * see single wiki configuration, the only difference is that we inherit from Farm''''''Config (that inherited from Default''''''Config) instead of directly using Default''''''Config
 * now we override show_hosts to be 0 - we want it for most wikis in our farm, but not for this one
 * we also override sitename, interwikiname and data_dir (the usual stuff)

= Overview of configuration options =

The following table contains default values and a short description for all configuration variables. Most of these can be left at their defaults, those you need to change with every installation are listed in the sample `wikiconfig.py` that comes with the distribution.

/!\ Starting with moin 1.3.1, some options must use unicode strings. Read the section about unicode options.

||<rowbgcolor="#FFFFE8"> '''Variable name''' || '''Default''' || '''Description''' ||
|| Security''''''Policy || None || Class object hook for implementing security restrictions ||
|| acl_enabled (& acl_...) || 0 || True to enable Access Control Lists - fine grained page access rights settings (see HelpOnAccessControlLists) ||
|| allow_extended_names || 1 || True to enable {{{["free link"]}}} markup ||
|| allow_numeric_entities || 1 || If true, numeric entities like `&#8364;` for &#8364; are not escaped, but &amp; and stuff still is ||
|| allow_xslt || 0|| True to enable XSLT processing via 4Suite (note that this enables anyone with enough know-how to insert '''arbitrary HTML''' into your wiki, which is why it defaults to 0) ||
|| allowed_actions || [] || Allow unsafe actions (list of strings) ||
|| attachments || None || If {{{None}}}, send attachments via CGI; else this has to be a dictionary with the path to attachment storage (key ''dir'') and the equivalent URL prefix to that same dir (key ''url'')||
|| auth_http_enabled || 0 || True to enable moin using the username of a user already authenticated by http basic auth ||
|| backtick_meta || 1 || True to enable {{{`inline literal`}}} markup ||
|| bang_meta || 0 || True to enable {{{!NoWikiName}}} markup ||
|| caching_formats || ['text_html'] || output formats that are cached; set to [] to turn off caching (useful for development) ||
|| changed_time_fmt || '%H:%M' || Time format used on RecentChanges for page edits within the last 24 hours ||
|| chart_options || None || If you have gdchart, use something like chart_options = {'width': 720, 'height': 540} ||
|| cookie_lifetime || 12 || 12 hours from now until the MoinMoin cookie expires and you get logged out ||
|| data_dir || './data/' || Path to the data directory containing your (locally made) wiki pages. ||
|| data_underlay_dir || './underlay/' || Path to the underlay directory containing distribution system and help pages. ||
|| date_fmt || '%Y-%m-%d' || System date format, used mostly in RecentChanges ||
|| datetime_fmt || '%Y-%m-%d %H:%M:%S' || Default format for dates and times (when the user has no preferences or chose the "default" date format) ||
|| default_lang || 'en' || Default language for user interface and page content, see HelpOnLanguages!||
|| default_markup || 'wiki' || Default page parser / format (name of module in `MoinMoin.parser`)  ||
|| edit_locking || 'warn 10' || Editor locking policy: `None`, `'warn <timeout in minutes>'`, or `'lock <timeout in minutes>'` ||
|| edit_rows || 30 || Default height of the edit box ||
|| hosts_deny || `[]` || List of denied IPs; if an IP ends with a dot, it denies a whole subnet (class A, B or C) ||
|| html_head || || Additional <HEAD> tags for all pages (see HelpOnSkins) ||
|| html_head_posts || robots: noindex,nofollow || Additional <HEAD> tags for POST requests ||
|| html_head_index || robots: index,follow || Additional <HEAD> tags for some few index pages ||
|| html_head_normal || robots: index,nofollow || Additional <HEAD> tags for most normal pages ||
|| html_pagetitle || None || Allows you to set a specific HTML page title (if not set, it defaults to the value of `sitename`) ||
|| interwikiname || None || InterWiki name (prefix, moniker) of the site, or None ||
|| logo_string || sitename || The wiki logo top of page, HTML is allowed (`<img>` is possible as well) [Unicode] ||
|| mail_from || None || `From:` header used in sent mails ||
|| mail_login || None || "user pwd" if you need to use SMTP AUTH ||
|| mail_smarthost || None || IP or domain name of an SMTP-enabled server; note that email features (notification, mailing of login data) works only if this variable is set ||
|| navi_bar || [u'%(page_front_page)s', u'!RecentChanges', u'!FindPage', u'!HelpContents',] || Most important page names. Users can add more names in their quick links in UserPreferences. To link to URL, use `u"[url link title]"`, to use a shortened name for long page name, use `u"[LongLongPageName title]"`. To use page names with spaces, use `u"[page_name_with_spaces any title]"` [list of Unicode strings] ||
|| nonexist_qm || 0 || Default for displaying WantedPages with a question mark, like in the original wiki (changeable by the user) ||
|| page_category_regex || u'^Category[A-Z]' || Pagenames containing a match for this regex are regarded as Wiki categories [Unicode] ||
|| page_credits || [...] || list with html fragments with logos or strings for crediting.  ||
|| page_dict_regex || u'[a-z]Dict$' || Pagenames containing a match for this regex are regarded as containing variable dictionary definitions [Unicode] ||
|| page_footer1 || "" || Custom HTML markup sent ''before'' the system footer (see HelpOnSkins) ||
|| page_footer2 || "" || Custom HTML markup sent ''after'' the system footer (see HelpOnSkins) ||
|| page_form_regex || u'[a-z]Form$' || Pagenames containing a match for this regex are regarded as containing form definitions [Unicode] ||
|| page_front_page || u'FrontPage' || Name of the front page (see [#default-front-page Default front page]) [Unicode] ||
|| page_group_regex || u'[a-z]Group$' || Pagenames containing a match for this regex are regarded as containing group definitions [Unicode] ||
|| page_header1 || "" || Custom HTML markup sent ''before'' the system header / title area (see HelpOnSkins) ||
|| page_header2 || "" || Custom HTML markup sent ''after'' the system header / title area (see HelpOnSkins) ||
|| page_iconbar || ["view", ...] || list of icons to show in iconbar, valid values are only those in page_icons_table. Available only in classic theme. ||
|| page_icons_table || dict || dict of {'iconname': (url, title, icon-img-key), ...}. Available only in classic theme. ||
|| page_license_enabled || 0 || Show a license hint in page editor. ||
|| page_license_page || u'WikiLicense' || Page linked from the license hint. [Unicode] ||
|| page_local_spelling_words || u'LocalSpellingWords' || Name of the page containing user-provided spellchecker words [Unicode] ||
|| page_template_regex || u'[a-z]Template$' || Pagenames containing a match for this regex are regarded as templates for new pages [Unicode] ||
|| refresh || None || refresh = (minimum_delay_s, targets_allowed) enables use of `#refresh 5 PageName` processing instruction, targets_allowed must be either `'internal'` or `'external'` ||
|| shared_intermap || None || Path to a file containing global InterWiki definitions (or a list of such filenames) ||
|| show_hosts || 1 || Disable this option to hide host names and IPs ||
|| show_section_numbers || 1 || True to show section numbers in headings by default ||
|| show_timings || 0 || Shows some timing values at bottom of page - used for development ||
|| show_version || 0 || Show MoinMoin's version at the bottom of each page ||
|| sitename || u'Untitled Wiki' || Short description of your wiki site, displayed below the logo on each page, and used in RSS documents as the channel title [Unicode] ||
|| theme_default || 'modern' || the name of the theme that is used by default (see HelpOnThemes) ||
|| theme_force || False || If True, do not allow to change the theme ||
|| trail_size || 5 || Number of pages in the trail of visited pages ||
|| tz_offset || 0.0 || default time zone offset in hours from UTC ||
|| ua_spiders || ...|google|wget|... || A regex of HTTP_USER_AGENTs that should be excluded from logging ||
|| url_mappings || {} || lookup table to remap URL prefixes (dict of {{{'prefix': 'replacement'}}}); especially useful in intranets, when whole trees of externally hosted documents move around ||
|| url_prefix || '/wiki' || used as the base URL for icons, css, etc. ||

Some values can only be set from MoinMoin/config.py (part of the MoinMoin code and thus GLOBALLY changing behaviour of all your wikis), but not from the individual wiki's config - you should only touch them if you know what you are doing:
|| allow_subpages || 1 || ''true'' to enable hierarchical wiki pages (see HelpOnEditing/SubPages) ||
|| charset || 'utf-8' || the encoding / character set used by the wiki ||
|| lowerletters || ''ucs-2 lowercase letters'' || Lowercase letters, used to define what is a WikiName ||
|| smileys || {} || user-defined smileys (a dict with the markup as the key and a tuple of width, height, border, image name as the value) ||
|| umask || 0770 || umask used on all open(), mkdir() and similar calls ||
|| upperletters || ''ucs-2 uppercase letters'' || uppercase letters, used to define what is a WikiName ||
|| url_schemas || `[]` || additional URL schemas you want to have recognized (list of strings; e.g. `['ldap', 'imap']`) ||

= Special options =

<<Anchor(default-front-page)>>
== Default front page ==

The default front page name, "FrontPage", is automatically translated into the user language. Thus, an English user will end up at FrontPage, while a French user will end up at ["PageD'Accueil"].

So you have 2 choices for your site:
 1. You will have a single language site, with a single language front page. Then just make your own single front page (and don't name it Front''''''Page) which is suitable for all people regardless of their native language and set the `page_front_page` setting to this name. For example: {{{
 page_front_page = u'MyGreatProject'
}}}
 1. You will have a multiple language site and you intend to speak the user's language (or at least some of those languages). In that case, just edit FrontPage to fit your needs. Also edit all the translations of FrontPage (like {de} StartSeite) you want to support (and keep them all in sync). If you don't want (or cannot) support a specific language, then replace that translation by a redirect to e.g. the english FrontPage: {{{
 #redirect FrontPage
}}}
 (!) Don't simply delete the unwanted translations of FrontPage or they might show up again after a MoinMoin upgrade.

<<Anchor(character-set)>>
== Character Set ==

Moin uses unicode internally, and `utf-8` for external output and input, like pages, html output and translation files. The external character set is defined in `config.charset` to `utf-8`. This setting is fine for all languages, as any character can be encoded in utf-8. You should not change this value, although technically it is possible.
 
 <!> '''Do not change `config.charset`. It is not tested and we can't support this.'''
