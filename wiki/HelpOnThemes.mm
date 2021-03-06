## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en

MoinMoin has a theme plugin system that make it easy to change the look and feel without touching the core code. You can customize colors by editing the stylesheets, or create totally new user interface by writing a new theme plugin in Python. When you upgrade MoinMoin, you theme is not touched - it will work with the new version, or needs only small changes due to theme API changes.

A theme "THEMENAME" is made of these components:
 * a python module in `MoinMoin/theme/THEMENAME.py` or in your wiki `data/plugin/theme/THEMENAME.py`
 * set of stylesheets, in `/usr/share/moin/htdocs/THEMENAME/css/`
 * Collection of images in `/usr/share/moin/htdocs/THEMENAME/img/`

= Stylesheets =

The 'classic' theme is heavily based on CSS. So for easy changes (like changing colours or fonts, moving around stuff), you maybe only need to change the CSS (like the `starshine` theme does to get dark).

= Images =

When you do a new theme, copy all images from `classic` to your img directory and then modify as needed. If you modify an image, do not forget to update the icon dict in the theme code - the image geometry is stored there for faster rendering.

= Python module =

The theme code is called by moinmoin with (more or less) abstract data in a dictionary usually called `d`. The code then uses items in that dictionary to generate HTML (also heavily relying on CSS). The new theme system in 1.3 avoid using the data dictionary when possible, and instead call different moin parts to get the needed data. 

When you do a new theme, first clone your favorite theme, then try to edit the stylesheets to get what you want. Only if you can't reach your goal using CSS only, override some functions in your theme code.

All themes are sub classes of MoinMoin.theme.ThemeBase which define the primitive user interface elements, like logo, username, title, searchform, editbar, actions menu etc. You should reuse these parts unless you need to change their content or create new element that you can not build from existing parts. The theme API is not stable yet, and might change in the future.

= Installation =
To install a theme, unpack the archive and copy the resulting top-level directory (e.g., leftsibebar2) to the wikis htdocs directory, e.g. `/usr/share/moin/mywiki/htdocs`. You should end up with the following subdirectories: `css/`, `img/`.

After you do this, copy the file `THEMENAME.py` (e.g., `leftsidebar2.py`) to the `data/plugin/theme` directory of your wiki.

= Setting the default theme =

Once you have created all the necessary theme components and saved them as indicated above, the theme can be applied to your wiki by using the `theme_default` option in `wikiconfig.py` (see HelpOnConfiguration). 

= Sharing your theme =
If you made a nice theme (of course adhering to HTML and CSS standards), package it like described below and put it onto MoinMoin:ThemeMarket. Please put it under GPL license, if possible.

{{{
# <THEMENAME>-<VERSION>.tar.gz (or .zip), containing:
<THEMENAME>/<THEMENAME>.py
<THEMENAME>/img/*.png
<THEMENAME>/css/*.css
}}}

= When you don't have to make a theme =
 * head
  * config.html_head is added into the <head> element for ''all'' pages, while
 * body
  * you can use some html fragments to customize moin's output (we are referring to `classic` theme, others could differ) - here is the sequence how stuff is output:
  * header:
   * config.page_header1
   * config.logo_string - use this to modify the logo (usually at top left)
   * username, title
   * iconbar
   * config.navi_bar - is a list of page names that are added to the title area, if None, add no navigation bar.
   * trail
   * config.page_header2
   * msg
  * wiki page
  * footer:
   * config.page_credits
   * config.page_footer1
   * Edit``Text, search forms, actions
   * config.page_footer2
 * as a wiki user, you can override theme CSS settings by putting your own user CSS URL into UserPreferences - this CSS is loaded after the theme CSS, so you can override all you want changed. Your CSS file must be in UTF-8 encoding (and as ASCII is a subset of that, it is ok, too).

`page_header1`, `page_header2`, `page_footer1` and `page_footer2` can now be callables and will be called with the "request" object as a single argument (note that you should accept any keyword arguments in order to be compatible to future changes).
