## Please edit system and help pages ONLY in the moinmaster wiki!
## For more information, please see MoinMaster:MoinPagesEditorGroup.
## Merci de n'éditer les pages systèmes et d'aide QUE sur MoinMaster !
## Pour plus d'information, consultez MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnLists
##master-date:2005-02-20 10:55:46
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language fr

== Les listes et les retraits ==

La création de listes, numérotées ou non, est assez naturelle. Il suffit d'ajouter une ligne contenant l'élément de liste. Pour obtenir une liste non numérotée, l'élément doit commencer par un astérisque « * ». Pour une liste numérotée,  il doit commencer par un motif de numérotation : « 1. », « a. », « A. », « i. » ou « I. ». Pour faire démarrer une liste numérotée à une certaine valeur, ajoutez « #valeur » au motif de numérotation. 

/!\ L'astérisque ou le motif de numérotation doit être précédé et suivi d'au moins une espace.

Pour imbriquer des listes de niveaux différents, il suffit d'utiliser des niveaux de renfoncement différents. Toutes les entrées de même niveau appartiennent à la même liste ou sous-liste. Ce qui implique également qu'il n'est pas possible de modifier le style d'une liste en cours de route.

Il est également possible de créer des listes de termes sous la forme suivante :
{{{
<espaces>terme:: définition
}}}

/!\ Le ''terme'' ne doit pour l'instant contenir aucun balisage wiki.

Consultez l'["AideDeL'Édition"] pour en savoir plus sur les balisages possibles.

=== Exemple ===
{{{
Si vous placez ce texte en retrait,
  comme ceci, il sera alors placé en retrait à l'affichage.
    Il est possible d'avoir des retraits de niveaux différents.

Maintenant, plaçons des astérisques en début de ligne :
  * Vous obtenez
  * une liste
  * non numérotée
    * qui peut être placée
      * plus ou moins en retrait.
  * Vous pouvez passer à la ligne dans un élément de liste
  en plaçant les lignes suivante au même niveau de renfoncement
  que l'astérisque (ou le motif de numérotation) commençant
  cette entrée.

Une liste numérotée imbriquée dans une liste non numérotée :
  1. un
  1. deux
    1. une
      * puce numéro 1
      * puce numéro 2
    1. deux
  1. trois
    * puce
      1. un

Variations sur les listes numérotées :
  * Chiffres romains minuscules :
    i. un ;
    i. deux.
  * Chiffres romains majuscules (commençant à 42) :
    I.#42 quarante-deux ;
    I. quarante-trois.
  * Lettres minuscules :
    a. un ;
    a. deux.
  * Lettres majuscules :
    A. un ;
    A. deux.

 terme:: définition
 un autre terme:: et sa définition
}}} 

=== Affichage ===
Si vous placez ce texte en retrait,
  comme ceci, il sera alors placé en retrait à l'affichage.
    Il est possible d'avoir des retraits de niveaux différents.

Maintenant, plaçons des astérisques en début de ligne :
  * Vous obtenez
  * une liste
  * non numérotée
    * qui peut être placée
      * plus ou moins en retrait.
  * Vous pouvez passer à la ligne dans un élément de liste
  en plaçant les lignes suivante au même niveau de renfoncement
  que l'astérisque (ou le motif de numérotation) commençant
  cette entrée.

Une liste numérotée imbriquée dans une liste non numérotée :
  1. un
  1. deux
    1. une
      * puce numéro 1
      * puce numéro 2
    1. deux
  1. trois
    * puce
      1. un

Variations sur les listes numérotées :
  * Chiffres romains minuscules :
    i. un ;
    i. deux.
  * Chiffres romains majuscules (commençant à 42) :
    I.#42 quarante-deux ;
    I. quarante-trois.
  * Lettres minuscules :
    a. un ;
    a. deux.
  * Lettres majuscules :
    A. un ;
    A. deux.

 terme:: définition
 un autre terme:: et sa définition
