## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:XsltVersion
##master-date:2004-01-30 23:15:45
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language zh-tw
<?xml version="1.0" encoding="utf-8"?>

<?xml-stylesheet href="XsltVersion" type="text/xml"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html" omit-xml-declaration="yes" indent="no"/>

   <xsl:template match="/">
    本维基使用
     <xsl:value-of select="system-property('xsl:vendor')"/>
     (<a href="{system-property('xsl:vendor-url')}"><xsl:value-of select="system-property('xsl:vendor-url')"/></a>)
    开发的 XSLT 引擎, 支持 XSLT v<xsl:value-of select="system-property('xsl:version')"/> 版.
   </xsl:template>

</xsl:stylesheet>
