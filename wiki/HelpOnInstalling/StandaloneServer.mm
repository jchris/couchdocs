## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
## page was renamed from HelpOnInstalling/StandaloneOnLinux
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
'''Installing and configuring standalone server for a personal wiki'''

The standalone server is especially made for local wikis because it does not need a web server installed. Only Python and Moin are necessary!

First do ../BasicInstallation and ../WikiInstanceCreation (home dir setup). Then copy `moin.py` to your wiki directory, where your wikiconfig.py is.

== Configuring moin.py ==

=== System path configuration ===

If you did a standard install, and you are not a developer, you probably want to skip this section. If not, you might want to add the path to moin and config file, like that:

{{{
import sys
sys.path.insert(0, '/path/to/moin')
sys.path.insert(0, '/path/to/wikiconfig')
}}}

=== Config class options ===

If you did a standard install, the default options might be just what you need. Check and change what you like:

|| '''Option''' || '''Default''' || '''Comment''' ||
|| docs || '/usr/share/moin/wiki/htdocs' || Path to moin shared files ||
|| user || 'www-data' || If you run as root, the server will run with as this user ||
|| group || 'www-data' || If you run as root, the server will run with as this group ||
|| port || 8000 || Port to serve. To serve privileged port under 1024 you will have to run as root ||
|| interface || 'localhost' || The interface the server will listen to. The default will listen only to localhost. Set to `''` to listen to all.||
|| logPath || 'moin.log' || Log file. Default is commented. ||
|| profiler || commented python code || Useful only if you are a moin developer. ||

== Configuring wikiconfig.py ==

The sample config file should be just fine.

|| '''Option''' || '''Default''' || '''Comment''' ||
|| url_prefix || '/wiki' || You should not change this, or images and css file will not be available to the wiki! ||

== Starting the server ==

Run `moin.py` from the command line:
{{{
$ ./moin.py
Serving on localhost:8000, documents in '/usr/share/moin/wiki/htdocs'
}}}

Test your wiki at http://localhost:8000/

On Windows, you can double click `moin.py` to start the server. A new terminal window will be opened. Close the window or press `CTRL` + `Pause` to stop the server.

On Unix, interrupt the server with `Control + C` in order to shut it down.

== Serving port 80 on Unix ==

On GNU/Linux, Mac OS X or other Posix like OS, you can serve the standard port 80 used for web serving, but you must run as `root` for this.
 
Set `port` to 80, and verify that `user` and `group` exists on your system. If not, set them to an existing user, meant for web serving. If needed, `chown` your wiki dir to this user and group.

Run `moin.py` as root:
{{{
$ sudo moin.py
Password:
Running as uid/gid 70/70
Serving on localhost:80, documents in '/usr/share/moin/wiki/htdocs'
}}}

Test your wiki at http://localhost/
