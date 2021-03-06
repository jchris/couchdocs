## Please edit system and help pages ONLY in the moinmaster wiki!
## For more information, please see MoinMaster:MoinPagesEditorGroup.
## Merci de n'éditer les pages systèmes et d'aide QUE sur MoinMaster !
## Pour plus d'information, consultez MoinMaster:MoinPagesEditorGroup.
##master-page:XsltVersion
##master-date:2004-05-16 22:32:27
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language fr
<?xml version="1.0" encoding="ISO-8859-1"?>

<?xml-stylesheet href="VersionXslt" type="text/xml"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html" omit-xml-declaration="yes" indent="no"/>

   <xsl:template match="/">
     Ce Wiki utilise le moteur XSLT
     <xsl:value-of select="system-property('xsl:vendor')"/>
     (<a href="{system-property('xsl:vendor-url')}"><xsl:value-of select="system-property('xsl:vendor-url')"/></a>)
     qui met en œuvre XSLT version <xsl:value-of select="system-property('xsl:version')"/>
   </xsl:template>

</xsl:stylesheet>
