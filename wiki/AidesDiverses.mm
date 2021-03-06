## Please edit system and help pages ONLY in the moinmaster wiki!
## For more information, please see MoinMaster:MoinPagesEditorGroup.
## Merci de n'éditer les pages systèmes et d'aide QUE sur MoinMaster !
## Pour plus d'information, consultez MoinMaster:MoinPagesEditorGroup.
##master-page:HelpMiscellaneous
##master-date:2004-11-28 20:25:06
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language fr
== Aide de MoinMoin : autres thèmes ==

'''Sous-thèmes'''
 * /QuestionsUsuelles (FAQ)
 * /FonctionnalitésExpérimentales

'''Sommaire''' <<TableOfContents>>

=== Ajouter une icône à votre wiki ===

Peut-être voudrez-vous ajouter une icône à votre wiki, cette icône habituellement appelée `favicon.ico`. Afin d'obtenir ces petites icônes à côté de vos signets et sur les onglets lors de la navigation, ajoutez ceci à votre `wikiconfig.py` :
{{{
html_head = '''
<link rel="icon" href="/images/icone.png" type="image/png">
<!-- ... d'autres éléments d'en-tête ... -->
'''
}}}

La taille de l'image ''doit'' être de 16x16. L'ajouter simplement comme `/favicon.ico` à la racine de votre site ''ne'' marche ''pas'' avec tous les navigateurs (par exemple, cela ne marche pas avec les version 1.0 à 1.3 de Mozilla).

=== Astuces pour Apache ===

==== Moyens de sécuriser l'accès d'un wiki via Apache ====

Voir MoinMoin:PasswordProtectedEditing (en anglais)

==== Offrir le wiki depuis la racine du domaine ====
Modification de `httpd.conf` pour installer [wiki:MoinMoinVF MoinMoin] sur « / » :
{{{
# Section globale
LoadModule rewrite_module /usr/lib/apache/1.3/mod_rewrite.so
# Section virtualhost
RewriteEngine on
RewriteRule ^/wiki/       -                      [last]
RewriteRule ^/robots.txt  -                      [last]
RewriteRule ^/favicon.ico -                      [last]
RewriteRule ^/?(.*) /chemin/vers/moin.cgi/$1  [last,type=application/x-httpd-cgi]
}}}
De cette façon, vous pourrez utiliser des URL courtes et claires telles que : « http://LinuxWiki.de/PageD'Accueil ».

Notes :

 * /chemin/vers/moin.cgi est un chemin absolu (i. e. depuis la racine du système de fichier), pas une URL.
 * Assurez-vous que le ''chemin absolu'' vers moin.cgi dispose bien des privilèges ExecCGI dans httpd.conf.
 * Pas besoin d'utiliser un !ScriptAlias vers moin.cgi, mais vous avez quand même besoin de l'alias vers le dossier htdocs/ de [wiki:MoinMoinVF MoinMoin] : `Alias /wiki/ "/usr/share/moin/htdocs/"`.

=== Offrir le wiki depuis wiki.domaine.org et la page d'accueil du site depuis www.domaine.org ===

Voici une configuration d'hôte virtuel avec des permissions spécifiques pour un Linux Gentoo. Le paramétrage suivant s'applique aux fichiers de configuration Apache2. Contentez vous de placer tout cela dans le httpd.conf pour Apache 1.

Ajoutez ceci au fichier /etc/apache2/conf/vhosts/vhosts.conf :

{{{
NameVirtualHost *

<VirtualHost *>
   ServerName www.domaine.org
   ServerAlias domaine.org
   DocumentRoot /var/www/domaine.org/htdocs
</VirtualHost>
 
<VirtualHost *>
   ServerName wiki.domaine.org
   Alias /wiki/ "/usr/share/moin/htdocs/"
   Alias /favicon.ico "/var/www/htdocs/favicon.ico"
   ScriptAlias / "/usr/share/moin/monwiki/moin.cgi/"
</VirtualHost>
}}}

Puis, ajoutez ceci au fichier /etc/apache2/conf/commonapache2.conf :

{{{
<Directory /usr/share/moin/htdocs/>
   Order deny,allow
   Allow from all
</Directory>

<Directory /usr/share/moin/domaine.org/>
   Order deny,allow
   Allow from all
</Directory>
}}}

=== Fonctions spéciales pour l'hébergement de masse et les intranets ===

Vous trouverez ci-dessous la présentation d'un certain nombre de fonctions qui pourront vous aider à optimiser votre configuration lorsque vous faites tourner plusieurs wikis sur le même hôte ou lorsque vous utilisez [wiki:MoinMoinVF MoinMoin] dans un réseau interne d'entreprise.

==== Paramétrage centralisé ====

 * farmconfig.py
 * intermap.txt partagé
 * icônes et code de base partagés

==== Déplacement d'URL ====
La variable de configuration « `url_mappings` » peut être utilisée pour faire correspondre des URL absolues à des URL relatives ou pour changer certains préfixes d'URL en préfixes totalement différents. Ceci est particulièrement utile dans des réseaux internes d'entrerprises (intranets), lorsque la hiérarchie des documents hébergés hors du wiki a été complètement remaniée.

« `url_mappings` » est une table de correspondance, sous la forme d'un dictionnaire (un dictionnaire est une structure associant une clef à une valeur). La clef est le préfixe à remplacer, la valeur est le remplacement. Un exemple classique serait `url_mappings = {'http://mon.server.net/': '/'}`, qui enlève l'adresse du site de l'URL, ce qui permet d'utiliser des liens à la fois en `http` ''et'' en `https`.

'''Faites attention :''' si vous souhaitez ''rediriger'' une seule page, indiquez simplement `#REDIRECT` et le nom de la page destination sur la première ligne de votre page. Voir l'AideDesInstructionsDeTraitement.

=== Reste à faire ===

<!> Reste à faire : expliquer les points ci-dessous en détail et compléter les sections ci-dessus

Demande plus d'explications :
 * Journalisation des évènements.
 * Voir le chemin suivi (préférence utilisateur).
 * PréférencesUtilisateurs : les cases à cocher pour éditer par un double-clic, le chemin suivi, les liens améliorés, les frimousses, aller à la dernière page visitée et quelques options demandant une réponse par oui ou par non.
 * L'option « Supprimer les espaces à la fin des lignes » de l'éditeur.
 * Modèles de page (créer une nouvelle page en utilisant un modèle) 
 * Seules les URL « normales » (hors des crochets) sont converties en images intégrées au texte ==> expliquer les règles précises
 * Mise en valeur du résultat des recherche et des mots incorrects dans la correction orthographique.
 * Compatibilité avec les URL de type « file: ».
 * Fonctions de notification par courrier électronique.
 * Icône RSS affichée par la macro [wiki:ModificationsRécentes RecentChanges].
 * Champ commentaire de l'éditeur, modifications récentes et informations sur la page.
 * Mise en cache de la page, pour l'instant limitée au traitement XSLT (où elle est absolument nécessaire) ; nouveaux code et API pour permettre l'ajout du lien « R''''''afraîchirLeCache ».
 * Champs intégrés de recherche (en bas de chaque page)
 * Le nom interwiki « Self » (soi-même) pointe dorénavant vers votre propre wiki.
 * Actions de la page d'information.

Les trucs administratifs :
 * Mieux décrire l'outil « moin.cgi?action=test ».
 * Compatibilité avec l'hébergement de masse :
   * <répertoire_data>/plugin/macro et <répertoire_data>/plugin/action peuvent être utilisés pour enregistrer des macros et des actions locales à une instance particulière de wiki.
   * config.shared_intermap peut contenir le chemin d'un fichier « intermap.txt » partagé (i. e. qui soit enregistré hors du répertoire data).
 * La variable $PAGE dans la table de correspondance interwiki

Outils à utiliser depuis une ligne de commande :
 * « moin-dump » pour créer une copie statique du contenu du wiki.
 * « pagescleaner » qui affiche les répertoires inutilisés de data/pages.
 * Le script « globaledit » qui permet de faire des modifications globales à toutes les pages d'un wiki.

Compatibilité :
 * Les fonctions RSS nécessitent de disposer d'une version récente de PyXML (CVS ou 0.7) à cause des erreures dans la gestion des espaces de noms de xml.sax.saxutils des versions précédentes. Ceci devrait (en théorie) être automatiquement détecté à chaque installation.
