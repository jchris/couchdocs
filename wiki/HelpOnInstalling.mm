## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
HelpContents > HelpOnAdministration > HelpOnInstalling

<<TableOfContents>>

= How to install your own MoinMoin Wiki =
This page describes the installation procedure of MoinMoin. In the next section, there is a list of real-world [#installscenarios Installation Scenarios] that help you to understand how to apply the instructions in different environments. If you already have a wiki running and want to upgrade, see HelpOnUpdating.

A Moin``Moin installation is done by some elementary steps:
 * /BasicInstallation explains the "`setup.py`" step of the installation in more detail. This is uses to get the Moin``Moin code and wiki template installed onto your system. This applies equally to all scenarios, and you should read it before trying a live installation.
 * /WikiInstanceCreation explains how you make a new wiki instance (data and configuration). This is also common to all scenarios.
 * Setup your webserver
  * Decide which solution you want to use (see below).
  * Getting the web server to serve static stuff under the `/wiki` URL (url_prefix), used for theme CSS and images, etc. This is slightly different for the various web servers that can be used - see below.
  * Getting the web server to execute the moin code when you access wiki pages. This is done either by CGI, FastCGI, mod_python or Twisted or the built-in stand alone server - this is slightly different for the various web servers that can be used - see below.
 * After a successful installation, you might want to read more about configuration and other options that you, as the wiki administrator, can set up. HelpOnAdministration contains links to pages that cover these topics. Especially, the HelpOnConfiguration and HelpOnUpdating pages provide additional information regarding wiki setup and maintenance.
 * /TroubleShooting helps with fixing any general problems you might encounter which apply to any installation platform. 

<<Anchor(installscenarios)>>
= Installation scenarios =

The following subpages will show you concrete examples of installation sessions, showing the commands used and explaining what they do. You ''must first read the general information on installing above'' before doing the installation steps described on the pages linked from below:

== Personal wiki ==

Wiki for personal use or small workgroup. Does not require anything but Python and MoinMoin.

 * /StandaloneServer

== Public wiki using CGI ==

CGI is very common, well tested and easy to configure but rather slow.

 * /ApacheOnLinux
 * /ApacheOnLinuxFtp
  * If you have just FTP access, choose this scenario.
 * /ApacheOnMacOsx
 * /ApacheOnWin32
 * /InternetInformationServer
 * /WebLogic

== High performance public wiki ==

These servers are much faster than CGI, but might be harder to install and configure.

 * /TwistedWeb 
 * /ApacheWithFastCgi
 * /ApacheWithModPython
