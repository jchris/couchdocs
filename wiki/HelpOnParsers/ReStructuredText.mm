## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
= What is ReStructured Text? =

!ReStructuredText is an easy-to-read, what-you-see-is-what-you-get plaintext markup syntax and parser system. It is useful for in-line program documentation (such as Python docstrings), for quickly creating simple web pages, and for stand-alone documents. !ReStructuredText is designed for extensibility for specific application domains. !ReStructuredText is a revision and re-interpretation of the !StructuredText and Setext lightweight markup systems.

= ReStructuredText Parser =

Before you can use it, you need to install the Python docutils package (0.3.3 or newer), which provides the additional reStructuredText support that MoinMoin needs. The parser supports the same features that are supported by the docutils HTML writer. However, some aspects have been slightly modified to work well with MoinMoin. These areas are outlined below. This parser can also be used in all versions of MoinMoin 1.2.X and 1.3.X. However, it is not part of the distribution before 1.3.2.

=== Example ===

{{{#!rst
This is a *very* simple example. If you see two asterisks around the word "very" in the previous sentence, then the module docutils is improperly installed (or not installed at all). When the module docutils is there, the word is displayed in italics and this whole block of text is not displayed in a special source-code-like format, but like a normal part of the page.
}}}

=== Unknown Targets ===

Unknown targets are used to create wiki links. Typically an unknown target would cause an error in a reStructuredText document. To enable wiki like behavior, unknown targets now create links to wiki pages using the target name as the name of the wiki page. For example:

 {{{ #!rst
 
Here is a link to a MoinMoin page named SecondPage_.
}}}

 {{{#!rst
 
Here is a link to a MoinMoin page named SecondPage_.
}}}

The above contains a reStructuredText reference to "SecondPage". The reference would typically cause an unknown target error from the docutils parser. This is because there isn't a target in the document named "SecondPage". However, with the MoinMoin parser, the "SecondPage_" reference instead creates a link to a MoinMoin page named "SecondPage".

=== Support for MoinMoin-specific link schemes ===

MoinMoin-specific link schemes are supported when used in a reStructuredText  explicit hyperlink target. For example:

 {{{ #!rst
Here is a link to a page attachment__.

__ attachment:Attachment.zip
}}}

 {{{#!rst
Here is a link to a page attachment__.

__ attachment:Attachment.zip
}}}

The above creates a link to an attachment named Attachment.zip. If the attachment for the page does not exist, the link text will be replaced with the typical MoinMoin replacement text for uploading an attachment. Supported MoinMoin-specific link schemes are:

    * {{{wiki:}}}
    * {{{attachment:}}}
    * {{{inline:}}}
    * {{{drawing:}}}
    
=== Inline Images ===

Docutils image directives, that are not urls, are converted to MoinMoin {{{inline:}}} links. This produces the expected behavior of inserting the image into the document. If the image attachment does not exist, the typical MoinMoin upload new attachment message will be displayed instead. For example:

 {{{ #!rst
Here is the picture I took yesterday |image|

.. |image| image:: Yesterday.jpg
}}}

 {{{#!rst
Here is the picture I took yesterday |image|

.. |image| image:: Yesterday.jpg
}}}

The above will insert the image "Yesterday.jpg" in place of {{{|image|}}}.

=== Experimental Features ===

The include and macro directives are considered experimental due to lack of
testing. They are expected to work but have not been used extensively.

==== Include Support ====

The reStructuredText include directive is supported with some restrictions. The directive allows including wiki pages from the same wiki (page attachments are not candidates for the include directive). Included pages must be formatted using reStructuredText (wiki formatted pages will produce improperly formatted documents). For example, the following would insert the pages header and footer surrounding the page contents.

 {{{ #!rst
.. include:: header

The sole document sentence.

.. include:: footer
}}}

The number of included documents is limited to ten. This is to prevent denial of service attacks using recursive include directives.

==== Macro Support ====

The MoinMoin reStructuredText parser adds a new MoinMoin specific macro
directive. The directive allows access to MoinMoin macros from within a
reStructuredText document. For example:

 {{{ #!rst
Use the title search macro to insert a search box to search through page titles.

.. macro:: <<TitleSearch>>
}}}

 {{{#!rst
Use the title search macro to insert a search box to search through page titles.

.. macro:: <<TitleSearch>>
}}}

=== Known Issues ===

 * Docutils and MoinMoin use different sets of css directives. Some directives overlap, while others do not. For example, the note directive is not displayed with any special formatting. This issue is most severe when using the rightsidebar theme with the docutils sidebar directive. The docutils sidebar will replace the MoinMoin sidebar. It is currently recommended that the sidebar directive not be used with MoinMoin.
 * Features related to external URL and local file retrieval are unsupported by the parser in order to guarantee local security. Besides that, raw roles and other features that might support the user to output raw HTML are disallowed, too.

=== Links ===

  * [http://docutils.sourceforge.net/rst.html reStructuredText]
  * [http://docutils.sourceforge.net/docs/user/rst/quickref.html Quick Reference]
  * [http://docutils.sourceforge.net/ Docutils]
  * [:HelpOnParsers/ReStructuredText/RstPrimer:A ReStructuredText Primer]
