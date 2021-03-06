## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format wiki
#language en

= Why use mod_wsgi? =

mod_wsgi is written directly to the internal Apache and Python application programming interfaces. As such, running Moin on Apache with mod_wsgi, Apache uses less memory and performs better than existing accelerators such as FastCGI, mod_python, or other proxy-based solutions. 

See the <<http://modwsgi.org/|mod_wsgi homepage>> for details.


= Getting Started =

It is recommended to first set up and configure Moin with Apache using standard CGI (see HelpOnInstalling). Test and make sure everything works, ''then'' change the configuration to use mod_wsgi. This allows you be sure that any problems are in the mod_wsgi transition rather than the basic MoinMoin installation.

The sample configurations below are for a wiki instance called `mywiki` installed in a directory `/var/www/moin/mywiki` with the main !MoinMoin installation installed in python's default site library path. The wiki appears as URL `/mywiki` under the server - ie `http://server.example.com/mywiki`.  You will need to change these to reflect your installation.


== Download & Install mod_wsgi ==

 1. Download the most current release that matches your Apache version, as linked from the <<http://modwsgi.org/|mod_wsgi homepage>>.

 1. install the mod_wsgi module into your Apache/modules directory
  i. Linux users will likely need to build from source (which is rather easy, assuming you have a development environment installed).
  i. Windows users will need to grab the pre-compiled binary from the mod_wsgi website.

 1. Modify your Apache httpd.conf file, to add the following line: {{{
LoadModule wsgi_module modules/mod_wsgi.so
}}}

 1. Restart Apache. Make sure it starts successfully, and check the error log for any errors.


== Modify Apache's configuration file ==

After your wiki is running as cgi script, convert it to run with mod_wsgi. 

If you run your wiki as cgi as we recommended before, remove or comment the !ScriptAlias directive:
{{{
#ScriptAlias /mywiki "/var/www/moin/mywiki/moin.cgi"
}}}

Add this to the same virtualhost definition:

 * __Linux users__: Please note that "daemon mode" is an optional, but perhaps preferred way to use mod_wsgi. Daemon-mode allows you to relaunch just mod_wsgi to pick up configuration changes, instead of having to relaunch the Apache server. This is useful if your web server is hosting other sites, for example.  See <<http://code.google.com/p/modwsgi/wiki/QuickConfigurationGuide|mod_wsgi configuration guide>> for detailed explanation. To implement, note the additional optional directives in the example below.
 * __Windows users__: daemon mode does not work under Windows, and so does not apply. You will need to stop & start the Apache2 service to pick up new configuration changes.


{{{

    ## this is the URL http://server.example.com/mywiki/ you will use to invoke moin:
    WSGIScriptAlias /mywiki /var/www/moin/mywiki/moin.wsgi

    ## in case you want your wiki under the root url (http://server.example.com/), use this instead:
    #Alias /robots.txt /usr/share/moin/htdocs/robots.txt
    #Alias /favicon.ico /usr/share/moin/htdocs/favicon.ico
    #WSGIScriptAlias / /var/www/moin/mywiki/moin.wsgi

    ## Linux-only (Windows users, please ignore): 
    ## uncomment & create some wsgi daemons - use someuser.somegroup same as your data_dir :
    #WSGIDaemonProcess moin user=someuser group=somegroup home=/home/someuser processes=5 threads=10 maximum-requests=1000 umask=0007


    ## Linux-only (Windows users, please ignore): 
    ## for mod_wsgi >= 2.0: uncomment & append this to have a nice ps aux display:
    # display-name=wsgi-moin

    ## Linux-only (Windows users, please ignore): 
    ## uncomment & use the daemons we defined above to process requests!
    #WSGIProcessGroup moin

    ## This is required if you plan to use HTTP authorization. Without it the user name won't
    ## be passed to MoinMoin. 
    #WSGIPassAuthorization On
}}}

== Copy and edit moin.wsgi ==
Copy `moin.wsgi` to `/var/www/moin/mywiki/` and then edit it there - you maybe have to change some `sys.path.insert` instructions so Python can find the !MoinMoin code and the wiki configuration, see the instructions in `moin.wsgi`.


== Finished! ==

Restart Apache - everything should now work correctly.
