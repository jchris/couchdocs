## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en

'''Index'''
<<TableOfContents>>

== Requirements ==

Before you install MoinMoin:MoinMoin, make sure you have the necessary infra-structure in place, namely the ''Internet Information Services'' webserver (any version should be OK), and a ''Python'' installation (version 2.2.2 is required, 2.3 or higher is recommended).

In the following description, we assume that you have installed or will install things to these locations:
 * IIS to its default location
 * `C:\Python` - the Python interpreter
 * `C:\Moin` - Moin``Moin itself

Quite often, you might want to install things elsewhere, which is no problem at all; you just have to adapt any paths that appear in a command or config file to the locations you have chosen.

This installation procedure was tested with IIS 5.1 for Windows running on Windows XP SP2, using Python 2.4.

== Preparation ==

=== Installing IIS ===

You currently need an external webserver to run Moin``Moin. 

From Microsoft: (http://www.microsoft.com/windows2000/en/server/iis/)

  To install IIS, add components, or remove components:

  Click Start, point to Settings, click Control Panel and start the Add/Remove Programs application. 
  Select Configure Windows, click the Components button, and then follow the on-screen instructions 
  to install, remove, or add components to IIS. 

Make sure that your webserver runs without problems before you start to install Moin``Moin; problems with your webserver installation are not in the scope of this document.

=== Installing Python ===

Download [http://www.python.org/ftp/python/2.3.4/Python-2.3.4.exe Python 2.3.4] and install it. Python installation is done via a standard Windows installer program.

=== Installing MoinMoin ===

Before creating a wiki instance, you have to download and install the basic Moin``Moin software. We assume you already have downloaded the distribution archive to the "`C:\TEMP`" directory.

Open a console window and enter the following commands:
{{{
C:
cd \temp
unzip moin-1.3.zip
cd moin-1.3
python setup.py install --prefix=C:\Moin --record=install.log
}}}

This will install all necessary files to the "`C:\Moin`" directory, and create a "`install.log`" file listing all the files that are created there.

<<FootNote>>

== Creating a Wiki Instance ==

Enter these commands in a console window from C:\Moin:
{{{
md mywiki
md mywiki\data
md mywiki\underlay
xcopy share\moin\data mywiki\data /E
xcopy share\moin\underlay mywiki\underlay /E
copy share\moin\server\moin.cgi mywiki\
copy share\moin\htdocs\index.html mywiki\default.htm
}}}

"`mywiki`" is the name of your wiki instance, you might want to chose a different name best fitting the intended use of this instance; just don't name it simply "`wiki`", because that would result in confusion and problems later on.

We have to make sure that `moin.cgi` can find the Moin``Moin directory, so that "{{{import MoinMoin}}}" will work. The easiest way to make sure `MoinMoin` can be imported is to append to `sys.path` ''within'' `moin.cgi`.

You can change the first two lines of code in moin.cgi to something like this:
{{{#!python
#!python
import sys
sys.path.append('C:/Moin/Lib/site-packages')
}}}
Notice that we're pointing to the directory which contains the Moin``Moin directory, not the directory itself.

Next, you'll need to create two virtual directories in IIS. One for the shared data, and one for this specific wiki instance. 

Go to ''Control Panel => Administrative Tools => Internet Information Service''. Open up the tree to ''Default Web Site''. 

Right click on ''Default Web Site'' and choose ''New => Virtual directory''. This will bring up a wizard with the manditory useless first screen, hit next. Enter "`wiki`" for the alias name and hit next. Browse to "`C:\Moin\share\moin\htdocs`" and hit next. Leave the ''Access permissions'' at their defaults and hit next. And now you're done, hit finish!

Now follow the same steps, but set the alias to "`mywiki`" and the path to "`C:\Moin\mywiki`". 

Use IIS Admin to remove permissions to read the data directory: expand the "`mywiki`" node, right click on `data`, select `Properties`, and uncheck `Read`. Repeat these steps with the `underlay` directory.

Now you need to setup the 'mywiki' alias so that it will run Python to interpret `.cgi` files. Right click on your new 'mywiki' alias and choose ''Properties''. On the first tab (''Virtual Directory''), click the ''Configuration'' button. The first tab is the ''App Mappings'' tab, which defines which programs to use for each file exetension. Click ''Add''. Browse to your `python.exe` (probably something like `c:\pythonXX\python.exe`). Then add {{{-u "%s" "%s"}}} after the Python executable path. The ''Executable'' line will look something like this: {{{"C:\Python22\python.exe" -u "%s" "%s"}}}. In the ''Extension'' box enter {{{.cgi}}} with the begining period. Make sure that the ''Check that file exists'' option is not checked (if it is, Moin``Moin won't be able to display sub pages). Ok, you're done with the alias configuration, click ''OK'' several times to get back out of all the dialog boxes.

If you add another wiki instance, you'll only need to setup the reference to its folder, they can safely share the "`wiki`" alias which points to static files only.

That is all, try to access your new-born wiki with the URL "`http://127.0.0.1/mywiki/`". You should see the Front``Page, try to edit and save it, and if that works, see if your edit is reflected on the Recent``Changes page.

Finally, edit "`wikiconfig.py`" and at least change "`sitename`" and "`logo_url`" to some personal values:
{{{
sitename = u'My Wiki'
logo_url = '/images/mywiki-logo.gif'
}}}
It is advised that you use "`logo_string`" for an image, string, or both instead of "`logo_url`":
{{{
logo_string = u'<img src="/mywiki/images/mywiki-logo.gif" alt="MyWiki Logo">My Wiki'
}}}
Where "`images`" is a directory under your "`mywiki`" instance.

NOTE: The configuration variable "`url_prefix`" in "`wikiconfig.py`" should match the alias for "`C:\Moin\share\moin\htdocs`" or themes will not work ("`/wiki`" for the instructions above).  This way, any reference in "`wikiconfig.py`" to "`/wiki/something`" will look in the shared data directory and a reference to "`/mywiki/something`" will look in the wiki instance directory.  These are considered absolute paths because relative paths will not work correctly.

For a personal or intranet installation, you'll normally also add the line {{{
allowed_actions = ['DeletePage', 'AttachFile', 'RenamePage', ]
}}}

=== IIS 6.0 (Windows.NET Server 2003) ===

The instructions below also apply to IIS 6.0 but the more aggressive security settings in newer version of IIS disallow the usage of ''unknown CGI extensions''.  That means you will always get a 404 error unless you do this:

 1. Open "Internet Information Services (IIS)" in the control panel.
 1. Go the the "Web Service Extensions" folder.
 1. There you will see "All Unknown CGI Extensions" is probably set to "Prohibited".  Make it "Allowed" and MoinMoin should now work.

At the time I'm writing this, I'm running Windows.NET Standard Server 2003 _RC1_.  It may be different in later version.  But if you get a 404 error on moin.cgi after following the regular steps, double-check that setting.

''Enabling "All Unknown CGI Extensions" can be a security hole. To just enable Python CGI scripts, add and enable a new web service extension where the 'required files' exactly match the path plus arguments as described above (e.g. {{{C:\Python23\python.exe -u %s %s}}}). You cannot have any spaces in the path to python.exe, but quotes around the path to python.exe and each %s will work. There are also permission issues related to the user executing the moinmoin code (access to cmd.exe) which I have not yet sorted through. -- mb''

== Troubleshooting ==

If you see an error like "{{{ImportError: No module named MoinMoin}}}", it means that python cannot find Moin``Moin. See above for how to add to `sys.path`.

If you see an error like Error 13: Permission Denied, it means that your web user permissions for the files do not have write/modify enabled.

If the page never loads after hitting `Save Changes`, you should check the permissions of the `data` directory.  Make sure the IUSR_COMPUTERNAME user has modify permissions.

If some images like InterWiki and WorldWideWeb don't show up, it could have been because of incorrect permissions or a bad "`url_prefix`" in "`wikiconfig.py`" or the cached pages need to be updated by an Edit or deleting them in the data folder.
