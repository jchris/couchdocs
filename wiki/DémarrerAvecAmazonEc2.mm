#language fr
Démarrez avec CouchDB et Amazon Elastic Compute Cloud.

== Debut ==
 * Lancez AMI ''ami-b832d7d1'', et obtenez un DNS Public.
 * Authorisez le port TCP 5984.
 * Dans le naviagateur, ouvrez http://PublicDNS.compute-1.amazonaws.com:5984/.

== Description détaillé ==
Cette version d'AMI est basée sur Debian 3.1 (Etch) avec une installation Elastic, so you might consider some kind of persistence to Amazon S3 or other supported platforms, like Nirvanix etc., thus preserving the data that is stored in CouchDB.

CouchDB has been built from source (version 0.7.2, revision 645), and configured to run as a service.

== AMI Support ==
All the necessary information has been submitted for inclusion into repository of Amazon Public AMIs, and is listed as [[http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1192&categoryID=101|ElasticDB - (Elasticdrive + CouchDB)]]. We created support thread at Amazon forums, specifically [[http://developer.amazonwebservices.com/connect/thread.jspa?threadID=19405&tstart=0|Amazon SimpleDB (Beta)]] and provide limited support there, when time allows and scope is limited to EC2/SimpleDB-related issues.
