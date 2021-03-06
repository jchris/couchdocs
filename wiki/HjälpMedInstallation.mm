## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
HjälpInnehåll > HjälpMedAdministration > HjälpMedInstallation

<<TableOfContents>>

== Hur du kan installera din egen MoinMoin Wiki ==
Den här sidan beskriver installationsproceduren för MoinMoin version 0.11 och senare. I nästa avdelning finns det en lista med [#installationsscenarion installationsscenarion] från verkliga världen som hjälper dig att förstå hur instruktionerna kan appliceras i olika miljöer. Om du redan har en wiki och vill uppgradera till version 0.11, se HjälpMedUppgradering.

/GrundläggandeInstallation förklarar "`setup.py`"-steget av installationen i mer detalj. Detta är giltligt för alla scenarion och du ska läsa den innan du försöker med en verklig installation.

/FelSökning hjälper med fixandet av olika generella problem som du kan få. Dessa gäller också för alla installationsmiljöer.

Efter att du har lyckats göra en installation, bör du läsa om konfigurering och andra tillval som du som wikiadministrator kan göra. HjälpMedAdministration har sidor som täcker de ämnena.
Specifikt ger sidona HjälpMedAnpassning och HjälpMedUppdatering information gällande uppsättning av wiki och underhåll. MoinMoin:MoinMoinWinCvs och MoinMoin:MoinMoinUnixCvs beskriver hur du kan använda den nyaste utvecklingsversionen från MoinMoin:SourceForge CVS-biblioteket.


<<Anchor(installationsscenarion)>>
=== Några exempelinstallationsscenarion ===

Följande undersidor ger dig konkreta exempel på hur du kan göra installationen i olika datormiljöer och visar vilka kommandon du ska använda och vad de gär. Det är start rekommenderat att du ''först'' läser den allmänna informationen om installation (speciellt nästa sektion på den här sidan) innan du väljer det installationsscenario som bäst passar den användning av MoinMoin som du har tänkt dig.

Linux:
 * /ApachePåLinux (på engelska HelpOnInstalling/ApacheOnLinux)

Windows:
 * /ApachePåWin32 (på engelska HelpOnInstalling/ApacheOnWin32)
 * /InternetInformationServer (på engelska HelpOnInstalling/InternetInformationServer)

Macintosh:
 * /ApacheOnMacOsx (på engelska HelpOnInstalling/ApacheOnMacOsx)
