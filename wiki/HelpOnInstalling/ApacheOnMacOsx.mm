## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en

You must not be afraid to use the terminal. It is possible but much harder to install without using the terminal.

There are 2 step in the installation:
 1. Install the MoinMoin engine - once
 2. Create wiki instance. You can create and serve as many wikis as you like.

== Download ==

Download the source on the Desktop. You should see a `moin-1.3.tar.gz` file. Extract this file on the desktop with Stuffit Expander, or from the terminal (faster and safer):
{{{
cd ~/Desktop
tar -xzf moin-1.3.0.tar.gz
}}}

= Installing MoinMoin =

Use these commands in the terminal to install the !MoinMoin wiki engine into the system.

First, open a shell as root. You will need this to install MoinMoin and configure the wiki. When asked, enter your password.
{{{
sudo -s
... password:
}}}
Now you have root privileges in this shell.

Install:
{{{
cd moin-1.3.0
python setup.py install --install-data='/usr/local'
}}}

 (!) The --install-data='/usr/local' will put the shared data in the convenient `'/usr/local/share/moin'` folder. If you don't use it, your shared data will be at `'/System/Library/Frameworks/Python.framework/Versions/2.3/share/moin'`. On OX X '/usr' belong to Apple, and it is safer to install in '/usr/local'.

 (!) The default Python used by Apache is the framework one supplied by Apple.  If you have added another Python version such as through DarwinPorts or Fink, then you should substitute "/usr/bin/python" for "python" above or you should substitute the specific path for the Python that will be used by Apache.

Now the installation is finished. You will not have to repeat this step unless you upgrade moin.

= Creating a wiki =

After you have installed the software, you need to create a wiki. You may create several wikis if you need.

== Copying a template wiki ==

Copy a template wiki from the {{{/usr/local/share/moin}}}. Do not try to run the wiki from {{{/usr/local/share/moin/data}}} because your wiki will be overwritten when you install a new version of moin.

 <!> '''Security warning: do not put your wiki folder where the web server can access it! Your wiki should not be at the "Sites" folder in your home folder.'''

The following instructions will create a wiki called "mywiki". You can choose any name you like, except the reserved name "wiki".

Do these commands:
{{{
cd /usr/local/share/moin
mkdir mywiki
cp -r data mywiki
cp -r underlay mywiki
cp server/moin.cgi mywiki
cp config/wikiconfig.py mywiki
}}}

== Setting Permissions ==

You have to make the web server the owner of the files in your wiki. Unless you changed the default configuration, both are 'www'.
{{{
chown -R www:www mywiki
chmod -R ug+rwX mywiki
chmod -R o-rwx mywiki
}}}

== Configure Apache ==

We'll use the pico editor:
{{{
pico /etc/httpd/httpd.conf
}}}

Go to the end of the Aliases section and edit like the example below:
{{{
    Alias /wiki/ "/usr/local/share/moin/htdocs/"      
    ScriptAlias /mywiki "/usr/local/share/moin/mywiki/moin.cgi"       
}}}
Use Control+O to save the file and Control+X to exit pico.

Restart Apache - open System Preferences, go to the Sharing page, select "Personal Web Sharing" and click "Stop" then "Start". Or just type this instead:
{{{
apachectl graceful
... /usr/sbin/apachectl graceful: httpd gracefully restarted
}}}


Installation finished - exit from the shell with the root privileges - working as root is dangerous.
{{{
exit
}}}
Now you are running again safely.


= Testing Your New Wiki =

In a web-browser surf to the site: http://localhost/mywiki

You should see the !FrontPage of your new wiki.

Now run the unit tests, to make sure everything is fine. Go to this address: http://localhost/mywiki?action=test

You should see a report on the wiki and tests results for the MoinMoin engine. If some of the tests fail, please report the problem on [http://moinmoin.wikiwikiweb.de/MoinMoinBugs MoinMoinBugs].

= Configuration You wiki =

The wiki you created is a new "Untitled Wiki", using the default configuration. You want to give a better name and setup some configuration values. Open {{{wikiconfig.py}}} and read the comments. You can edit the file with any text editor, like pico, emacs, or BBEdit. 

 (!) Note that the file belongs to user and group www:www. You can edit the file as root, or change the group of the file to yourself with {{{chown www:username wikiconfig.py}}}.

For more help on configuration, see HelpOnConfiguration.

= Optional Installs =

== RSS ==

If you want your wiki to support RSS and Mozilla Firefox Live Bookmarks features, you have to install PyXML. Get PyXML from http://sourceforge.net/projects/pyxml/ and install according to the instructions.
