## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
== XML Pages & XSLT Processing ==
If you have [http://4suite.org/ Python4Suite] installed in your system, it is possible to save XML documents as pages. It's important to start those pages with an XML declaration "{{{<?xml ...>}}}" in the very first line. Also, you have to specify the stylesheet that is to be used to process the XML document to HTML. This is done using a [http://www.w3.org/TR/xml-stylesheet/ standard "xml-stylesheet" processing instruction], with the name of a page containing the stylesheet as the "{{{href}}}" parameter.

See the following example for details, which can also be found on the XsltVersion page.

=== Example ===
{{{
<?xml version="1.0" encoding="ISO-8859-1"?>

<?xml-stylesheet href="XsltVersion" type="text/xml"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html" omit-xml-declaration="yes" indent="no"/>

   <xsl:template match="/">
     This Wiki is running an XSLT engine by
     <xsl:value-of select="system-property('xsl:vendor')"/>
     (<a href="{system-property('xsl:vendor-url')}"><xsl:value-of select="system-property('xsl:vendor-url')"/></a>)
     implementing XSLT v<xsl:value-of select="system-property('xsl:version')"/>
   </xsl:template>

</xsl:stylesheet>
}}} 

=== Display ===
<<Include(XsltVersion)>>
