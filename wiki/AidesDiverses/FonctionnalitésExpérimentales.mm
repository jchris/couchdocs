## Please edit system and help pages ONLY in the moinmaster wiki!
## For more information, please see MoinMaster:MoinPagesEditorGroup.
## Merci de n'éditer les pages systèmes et d'aide QUE sur MoinMaster !
## Pour plus d'information, consultez MoinMaster:MoinPagesEditorGroup.
##master-page:HelpMiscellaneous/ExperimentalFeatures
##master-date:2004-11-23 10:12:42
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language fr

Cette page décrit les fonctions qui ne sont pas encore au point ou qui ont besoin d'être essayées sur le terrain avant d'être ajoutées aux fonctions de base. Ces fonctions pourraient être amenées à disparaître ou être substanciellement modifées !

== Divers ==

 * `[:nom de la page]` et `[:nom de la page:texte du lien]` sont une forme raccourcie de `[wiki:Self:...]`, qui présente l'avantage de permettre la présence de caractères quelconques, y compris des espaces, aussi bien dans le `nom de la page` que dans le `texte du lien`. :
   * avantages : cela permet d'utiliser des espaces et cela permet d'utiliser les caractères codés sous la forme `&#...;` (la compatibilité avec ce codage restant à ajouter) afin de permettre l'ajout de caractères non-occidentaux dans les noms wikis des wikis occidentaux utilisant le codage latin 1. Cette fonctionnalité n'est plus nécessaire car moin-1.3 est compatible Unicode ;
   * inconvénient : c'est encore un moyen supplémentaire de créer des liens.

== Compatibilité avec les langues s'écrivant de façon bidirectionnelle ==

 * `config.default_lang` sert à définir la langue par défaut du contenu d'un wiki (note : cela n'a pas grand chose à voir avec la langue utilisée par l'interface vue par l'utilisateur) :
   * l'attribut HTML `lang` de la balise `body` de la page prend comme valeur cette langue.
 * pour chaque langue avec laquelle [wiki:MoinMoinVF MoinMoin] est compatible, une macro correspondante `<<lang>>` existe (par exemple `<<fr>>`) :
   * cette macro définit l'attribut `lang` des paragraphes, et cætera ;
   * elle modifie également le sens d'écriture du texte.

Consultez également [wiki:MoinMoin:BetterHebrewSupport CompatibiltéAmélioréAvecL'Hébreu] (en anglais).

== Forumlaires définis par les utilisateurs ==

 <!> À réaliser
