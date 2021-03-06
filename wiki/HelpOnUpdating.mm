## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
HelpContents > HelpOnAdministration > HelpOnUpdating 

'''Index'''
<<TableOfContents>>

== General procedures ==

=== Backup ===

/!\ '''Before you update an existing wiki, MAKE A BACKUP!'''

You have been warned, and it's not our fault when you end up like this: X-( 

There are two directory trees which you should backup:

    * The one containing the MoinMoin executable files (e.g. {{{/usr/lib/python*.*/site-packages/MoinMoin}}})
    * and the one containing the data (e.g. {{{/usr/share/moin/wikiname/data}}} - see data_dir in your moin_config.py). 

The pathes depend on your installation.

=== Install ===

Download the MoinMoin code that you are interested in updating to.

As root, run "{{{python setup.py install}}}" to install the new version.

=== Configuration update ===

After upgrading, your existing wiki should continue to work (the goal is to have sane defaults for any new config values, but then there can be bugs). Check that this is indeed the case, and then take the time to check the CHANGES file in your distribution. Often, new features will be invisible unless your extend your configuration in "moin_config.py" (1.3: wikiconfig.py).

This is especially true for:
 * somewhat dangerous macros that won't be activated by default, because they're not advisable for public wikis. You need to explicitely activate those by adding an {{{allowed_actions}}} list to the config. Currently, the actions {{{DeletePage}}} and {{{AttachFile}}} are considered unsafe.

 * email features: you need to provide {{{mail_smarthost}}} and {{{mail_from}}}.

 * new pages icons: to get new icons like "XML", "Subscribe" etc. it's best to just delete the {{{page_icons}}} setting, now that "config.py" has a default for it. If you changed it in the past, add new icons from the "config.py" default to your "moin_config.py".

=== Updating files ===

 Images and CSS:: On every update, you should copy the content of the "share/moin/htdocs/" directory to the directory visible to your web server, normally a new release has some new images and CSS in it. If you use the default distutils setup scheme, this is no longer necessary (distutils updates the files for you, and your webserver gets the files from the installed images and CSS).

 System pages:: When upgrading to a new version, copy at least the help pages ("Help*") to your existing directory. Then check whether you miss any new system pages. In 1.3 these pages are kept separate in the underlay directory.

 InterWiki:: Check that you have the newest "intermap.txt" file; If you have your own entries, you can point "shared_intermap" at a file loaded ''before'' the file in your data directory, which takes precedence (i.e. have global entries in the shared one, private entries the data dir file).

=== Troubleshooting ===

A good idea is to do a request for "moin.cgi?action=test" (which calls an internal diagnosis feature) after you installed a new release, which will spot some common errors.

Depending on your installation, more tightly secured permissions are a good idea. Ideally, you assign all files in the data directory to the user the web server runs under, and then you use `700` or `755`.

== Upgrade information for specfic versions ==

The following sections provide information pertaining to specific versions of the software; if you jump several versions, read all the sections applying to your situation.

<<Anchor(update-1-0)>>
=== Version 1.0 ===

Version 1.0 is the last to support Python 1.5.2, but some optional features (like statistics) already require Python 2.0.


<<Anchor(update-1-1)>>
=== Version 1.1 ===

Be sure to read the above section on ''General procedures'' before you start upgrading.

'''Version 1.1 requires Python 2.0 or higher''', we recommend to use Python 2.2 (version 2.2.2 if that is available on your host) or even better >= 2.3.2 (with 2.3.x, MoinMoin runs about 20-30% faster).


'''Upgrading your configuration'''

 * If you changed the default for `page_template_ending`, this is now called `page_template_regex` and must contain a regex (defaults to '[a-z]Template$').
 * Same applies to `page_form_ending` now called `page_form_regex` (default: '[a-z]Form$')
 * Not a new feature, but configurable now: `page_category_regex` (default: '^Category[A-Z]')
 * If you have added your own `SecurityPolicy`, the class interface for that has changed (see `security.py`).

'''Enabling new features'''

 * `default_lang` (default: 'en') - If user does not set a language in his user settings, this will be used.
 * `edit_locking` (default: `'warn 10'`) - Editor locking policy: None, 'warn <timeout in minutes>', or 'lock <timeout in minutes>'.
 * `hosts_deny` (default: `[]`) - a list of denied IPs; if an IP ends with a dot, it denies a whole subnet (class A, B or C).
 * `html_pagetitle` (default: `None`) -  Allows you to set a specific HTML page title (if not set, it defaults to the value of sitename).
 * `mail_login` (default: `None`) - This is only needed when you use SMTP AUTH to send mail; in that case, set this to the username and password separated by a space, i.e. "user pwd".
 * `smileys` (default: `{}`) -  User-defined smileys (a dict with the markup as the key and a tuple of width, height, border, image name as the value).
 * don't forget to read the CHANGES file in the distribution archive

<<Anchor(update-1-2)>>
=== Version 1.2 ===

'''Version 1.2 requires Python 2.2.2 or higher''', we recommend to use Python >=2.3.2 (with 2.3.x, MoinMoin runs about 20-30% faster).

 * the URL for the RecentChanges RSS feed changed. It now only works with `?action=rss_rc`.

 * drawings use a new applet. It saves PNG instead of GIF and can do image maps to make areas of the drawing active. On display a GIF will be searched if no PNG is found. We recommend changing all GIFs to indexed PNGs cause this fallback might disappear in later versions.
 Sample code using bash & !ImageMagick (be sure you know what you do):
 {{{
for draw in `find /path/to/wiki/data -name \*.draw`; do
    file=`dirname $draw`/`basename $draw .draw`
    if [ -e "${file}.gif" ]; then
        echo "Converting ${file}.gif to ${file}.png"
        convert "${file}.gif" "${file}.png"
    fi
done
}}}

 * `caching_formats` (default: {{{['text_html',]}}}) - enable caching for the given output formats; enabled by default. Developers maybe want to disable this and use the empty list.

 * Themeing and HTML/CSS cleanup
  * Browsers with completely broken CSS support (like e.g. Netscape 4.x) are no longer supported. If you still need to support them, do not upgrade to moin 1.2. If you still use these browsers, we recommend that you upgrade your browser first (Mozilla 1.5 has nice and standards compliant HTML and CSS support and is available as Free Software for Windows, Linux and Mac).
  * If you changed any html in code or by config you will have to check if it still works. For the usual stuff, look into `MoinMoin/theme/classic.py` and `classic/css/screen.css`. For config defaults of the html fragments, read `MoinMoin/config.py`. If you want to modify a theme, don't simply change classic, but copy or subclass it under a new theme name.
  * because of the new theme support the layout of the `htdocs` directory changed:
   * Instead of using icons under `img/` and css under `css/`, there will be an additional `themename/` directory in between, e.g. `classic/img/` and `classic/css/`. If you added own icons, you may have to copy them to the themes directory.
   * The filename of the CSS file has changed to the media type, so the normal one used for screen output has changed name from `moinmoin.css` to `screen.css`. There also were quite some changes and enhancements to the CSS files, so better use the new ones.
  * config.css_url was removed

 * Plugins - we use a new plugin loader that requires a correct `__init__.py` file in the plugin directories. See the directory `wiki/data/plugin/` in the distribution archive and just copy it over to your wiki's plugin directory.

 * Do not forget to update to the new Twikidrawplugin that comes with moin 1.2.

 * removed config variables:
  * external_diff (not needed any more, we have internal diff now)
  * shared_metadb (wasn't implemented for long - we will re-add it, when it is)
  * title1/2 (please use page_header1/2)
  * page_icons_up

 * changed config variables:
  * changed_time_fmt (removed some html and brackets around time from default)
  * html_head (default is empty string now)
  * page_footer1/2 (default is empty string now)
  * page_icons (is now a list of icon names, not html any more)
  * umask (default is 0770 now, not world r/w any more == more secure)

 * new config variables (see MoinMaster:HelpOnConfiguration):
  * cookie_lifetime
  * mail_login
  * page_credits
  * page_dict_regex
  * page_group_regex
  * page_header1/2
  * page_iconbar 
  * page_icons_table
  * page_license_enabled
  * page_license_page
  * theme_default
  * theme_force
  * tz_offset 


<<Anchor(update-1-2-1)>>
<<Anchor(update-1-2-2)>>
<<Anchor(update-1-2-3)>>
=== Version 1.2.1, 1.2.2, 1.2.3 ===
As 1.2.x is primarily a bug-fix release for 1.2, there is not much special if you run 1.2 and want to update to 1.2.x.

If you run a version previous to 1.2, please read above about upgrading to 1.2 first.

In any case, read the `CHANGES` file in the toplevel directory of your moin archive - all fixes are described there and also some few new features.

Be aware that except code fixes, there were also fixes in the data and htdocs directory - so please selectively copy them over to your running wiki installation.

<<Anchor(update-1-3)>>
=== Version 1.3 ===

/!\ Upgrading to moin 1.3 will be non-trivial. It will definitely take you more than 5 minutes. /!\

This is because of many changes to configuration, data format, filenames and pathes.

In any case, make a backup or you risk destroying your wiki's content.

Please read the files `CHANGES` and `README.migration` in the toplevel directory of your moin archive for details on what changed and how to upgrade.

=== Deprecation Note ===

This page is deprecated (at least the version specific stuff on it), for 1.4 it will be gone and we will use CHANGES file exclusively.
