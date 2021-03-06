## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
= Using MoinMoin with apache + mod_python =

<<TableOfContents>>

== Why Use mod_python ==
[http://modpython.org/ mod_python] embeds the python interpreter into the
apache server. This saves initialization time and the need of forking cgi
scripts. It doesn't have the ability to run as different users. It will
always run as the main apache user and group. Be sure that your wiki data
files are accessible and writable by your apache server!

/!\ mod_python versions 2.7.10, 3.0.4 and 3.1.2b have a bug in `apache.resolve_object`
This bug was reported to the mod_python maintainers and has been fixed in the
3.1.3 release.  The basic configurations here assume you are using a fixed version of mod_python, however there is information on a workround using a wrapper script and a method to fix your installation given later.

/!\ mod_python will cause your apache processes to increase their memory requirements considerably - especially as apache runs many separate processes which will each need to have their own copy of the python code and data in the process memory space.  You may find that fast_cgi, as detailed in HelpOnInstalling/ApacheWithFastCgi is rather more efficient in this respect.

== Configuring MoinMoin and Apache to use mod_python ==

 1. Make sure mod_python is installed and seen by Apache.
 1. Set up your MoinMoin instance as normal.
 1. Edit the `wikiconfig.py` config file.
 3. Edit your apache `httpd.conf` file.
 1. Restart Apache

The sample configurations below are for a wiki instance called `mywiki` installed in a directory `/var/www/moin/mywiki` with the main MoinMoin installation installed in python's default site library path (and so not needing any special configuration).  The wiki appears as URL `/mywiki` under the server - ie `http://my.ser.ver/mywiki`.  You will need to change these to reflect your installation.

=== Install mod_python ===
Most people will just add a `mod_python` package to their current operating system installation.  If you are building from source then you should consult the [http://modpython.org/live/current/doc-html/ mod_python documentation].

The mod_python installation should have added some lines to the Apache configuration file - either in the file itself or in an included configuration file (for example on Red Hat or Fedora linux the mod_python configuration is in `/etc/httpd/conf.d/python.conf`).  The configuration will look like this:-
{{{
# Load and enable mod_python
# This configuration should have been done when you installed
# mod_python
LoadModule python_module modules/mod_python.so
}}}

Uncomment the `LoadModule` line if it is commented.

After this restart Apache and make sure that it starts successfully, and that the error log has a line similar to this:-
{{{
[Sat Jan 01 15:40:49 2005] [notice] mod_python: Creating 4 session mutexes based on 150 max processes and 0 max threads.
}}}

You may need to change some environment variables on (eg) FreeBSD - this is detailed in the port installation message.

=== Set up a wiki instance ===
This is done as shown in [:HelpOnInstalling/WikiInstanceCreation:WikiInstanceCreation]. You do not need to copy any of the moin cgi programs, however I suggest that you do initially set up the wiki as a CGI based wiki, and then convert to mod_python since this allows you be sure that any problems are in the mod_python transition rather than the basic MoinMoin installation.

You do need to copy the wiki configuration file into place and make the standard changes to it as detailed in HelpOnConfiguration.

You should make the appropriate changes to the Apache `httpd.conf` file - in particular you should add an alias for the `/wiki` path, and a `ScriptAlias` if you wish to test as a CGI application:-
{{{
# Standard alias command to allow apache to serve the
# literal images and css files.  Make sure this is accessible
Alias /wiki/ "/usr/share/moin/htdocs/"

# CGI invocation of MoinMoin
ScriptAlias /mywiki "/var/www/moin/mywiki/moin.cgi"
}}}

Restart Apache and so ensure that there are no syntax errors in the configuration file, and test that the configuration does what you expect.


=== Edit `wikiconfig.py` ===
`wikiconfig.py` is the per-wiki configuration file for MoinMoin version 1.3.x - if you have MoinMoin 1.2.x then the file is called `moin_config.py`, but has the same structure and requires the same changes.  The major change to the wiki config file to allow it to work under mod_python is to change all the pathnames for the directory locations to be full pathnames rather than relative ones.   The 2 directives which must be changed are `data_dir` and `data_underlay_dir`<<FootNote(The underlay directory was introduced in MoinMoin 1.3.x, so if you are using an older version such as 1.2.x you will not have this directive in your configuration)>>.
{{{
## Change data_dir and underlay directory
## Old copy of directives commented out, new one added
#data_dir = './data'
data_dir = '/var/www/moin/mywiki/data/'

#data_underlay_dir = './underlay/'
data_underlay_dir = '/var/www/moin/mywiki/underlay/'
}}}

If you had your wiki instance working (as a CGI) previously you should try it again at this stage to make sure it still works - it should still work with full paths under CGI.

=== Changes to Apache `httpd.conf` ===
The Apache `httpd.conf` file needs changing to call mod_python for your wiki rather than using standard CGI invocation.  This is done by adding a few directives within a `<Location>..</Location>` section.  Add the following configuration to `httpd.conf` (near the end or within the appropriate `<VirtualServer>` section):-
{{{
<Location /mywiki>
    SetHandler python-program
    # PythonPath has the pathname of your wiki instance as
    # the first element
    PythonPath "['/var/www/moin/mywiki']+sys.path"
    PythonHandler MoinMoin.request::RequestModPy.run
</Location>
}}}

If you have multiple MoinMoin instances then add one of the above configuration fragments for each one (changing the paths as appropriate).

If your MoinMoin installation is not under the system python site-packages directory you will need to give python a hint as to where your installation is, by modifying the `PythonPath` setting - for example if MoinMoin was installed under `/path/to/moin` then your `PythonPath` configuration would look like:-
{{{
# PythonPath has the pathname of your wiki instance as
# the first element and the MoinMoin installation path
# as the second element.
PythonPath "['/var/www/moin/mywiki','/path/to/moin']+sys.path"
}}}

If you have previously been using MoinMoin under CGI on Apache, make sure you comment out or delete the ScriptAlias comment you would previously have put in:-
{{{
## Comment out CGI moin instance
#ScriptAlias /mywiki "/var/www/moin/mywiki/moin.cgi"
}}}

Remember to restart Apache - everything should now work correctly.

== Root Wiki with mod_python ==

You may wish to have your wiki appearing at the root of your webserver - for example so that `http://wiki.example.com/` will map to your wiki rather than having to use `http://wiki.example.com/mywiki/`.  This requires a slightly different form of configuration using `mod_rewrite` - this is a standard module of recent Apache distributions, and is often enabled by default.

You need to set up your wiki instance as described above, and also copy `moinmodpy.py` from the Moin installation directory to the wiki instance directory (`/var/www/moin/mywiki` in these examples).

The Apache configuration needs `mod_rewrite` enabled - so the line
{{{
LoadModule rewrite_module modules/mod_rewrite.so
}}}
should appear in the first part of the `httpd.conf` configuration file.

The wiki and virtual host configuration sould look like this:-
{{{
<VirtualHost *:80>
  ServerAdmin postmaster@example.com
  DocumentRoot /var/www/html
  ServerName wiki.example.com
  Alias /wiki/ "/usr/share/moin/htdocs/"

  # Rewrite urls
  RewriteEngine On
  RewriteLogLevel 0
  # map /wiki static files to Moin htdocs
  RewriteRule ^/wiki/(.*)$ /usr/share/moin/htdocs/$1 [last]
  # map everything else to server script
  RewriteRule ^(.*)$ /var/www/moin/mywiki/moinmodpy.py$1

  <Directory "/var/www/moin/testwiki">
    # Modpy stuff
    AddHandler python-program .py
    # Add the path to the wiki directory, where
    # moinmodpy.py and wikiconfig.py are located.
    PythonPath "['/var/www/moin/mywiki'] + sys.path"
    PythonHandler moinmodpy
  </Directory>
</VirtualHost>
}}}

Apache should be restarted, and the !FrontPage of `mywiki` should now appear at `http://wiki.example.com/`.

Other ways of handling root level wikis with Apache are detailed in the appropriately named HelpOnConfiguration/ApacheVoodoo.

== Older mod_python versions ==
mod_python versions before 3.1.3 had a bug in `apache.resolve_object`.  The best fix for this is to update to the current release.  However if you are unable to do this there are 2 possible solutions:-

=== Use a wrapper script ===

MoinMoin come with a `moinmodpy.py` wrapper script, and this could be used by changing the `PythonPath` and `PythonHandler` directives as shown in the `moinmodpy.htaccess` file. The wrapper was named `moin_modpy.py` in MoinMoin 1.2.

=== Fix mod_python ===
mod_python has a small resolver bug in versions 2.7.10, 3.0.4 and 3.1.2b.
The method `resolve_object` in `mod_python/apache.py` checks the wrong
object, and so the lookup for `RequestModPy.run` fails.

To fix it you need to change the method `resolve_object` (around line 551 for
mod_python 3.1.2b) from

{{{
        if silent and not hasattr(module, obj_str):
            return None
}}}

to

{{{
        if silent and not hasattr(obj, obj_str):
            return None
}}}


== Troubleshooting ==

Page access gives apache error::
 {{{PythonHandler MoinMoin.request::RequestModPy.run: OSError: [Errno 2] No such file or directory: 'data/user'}}}
 This appears to be caused by you not having an absolute path for `data_dir` in `moin_config.py`.  There are several other lines of error traceback preceding this one in the apache error log.  Fix the path in `moin_config.py`.

<<FootNote>>
----
