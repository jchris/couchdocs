## page was renamed from Cl-CouchDb
Go to the official [[http://common-lisp.net/project/cl-couch/|Cl-couch page on common-lisp.net]]

= Overview =

[[Cl-Couch]] is a Common Lisp suite for interacting with CouchDB databases.

It defines three systems: 

 * {{{cl-couchdb-client}}} -- a client server for making requests to a CouchDB database from Common Lisp
 * {{{cl-couchdb-view-server}}} -- a view server for programming CouchDB [[Views]] with Common Lisp
 * {{{cl-couchdb-object-layer}}} -- a simple object layer for making {{{cl-couchdb-client}}} easier to work with

= Getting =

There are no official releases of [[Cl-Couch]] yet.

Check out the latest version from the [[http://common-lisp.net/cgi-bin/darcsweb/darcsweb.cgi?r=cl-couch-cl-couch;a=tree|darcs repo]]:

{{{
darcs get http://www.common-lisp.net/project/cl-couch/darcs/cl-couch
}}}

== Cl-CouchDB-client ==

{{{Cl-CouchDB-client}}} allows the user to make requests to the running CouchDB server from lisp. It's main entry point is the macro {{{R}}}.

=== Starting the server ===

You start the server with by calling {{{open-server}}}:
{{{
COUCHDB-SERVER> (open-server)
*COUCHDB-SERVER*
}}}

This sets {{{*COUCHDB-SERVER*}}} to the default http://localhost:5984. This isn't really necessary, but allows us to omit the server argument when we make requests.

=== COUCH-REQUEST ===

{{{COUCH-REQUEST}}} takes specifiers for a request to a CouchDB database and returns a Lisp object. HTTP PUT and POST requests with {{{COUCH-REQUEST}}} take Lisp objects as well, thus enabling the programmer to black-box the JSON layer completely.

==== Examples ====

Using {{{COUCH-REQUEST}}} to make a GET request to {{{http://localhost:5984/blog/150fedd5d14f0771eb5e44d071a1df5d}}}:

{{{
COUCHDB-CLIENT> (couch-request :get (blog "150fedd5d14f0771eb5e44d071a1df5d"))
((:_ID . "150fedd5d14f0771eb5e44d071a1df5d") (:_REV . "253381451")
 (:AUTHOR . "foo") (:BODY . "Zażółć") (:POST . "third") (:TYPE . "comment")
 (:N . 66))
}}}

Using {{{COUCH-REQUEST}}} to make a GET request to {{{http://localhost:5984/blog/_all_docs?count=2}}}:

{{{
COUCHDB-CLIENT> (couch-request :get (blog _all_docs :count 2))
((:TOTAL-ROWS . 48) (:OFFSET . 0)
 (:ROWS
  ((:ID . "06672346ffc093ce68a07692a5f12db5")
   (:KEY . "06672346ffc093ce68a07692a5f12db5") (:VALUE (:REV . "3441371051")))
  ((:ID . "14328cab564dfec5eac0ff0a44d2083d")
   (:KEY . "14328cab564dfec5eac0ff0a44d2083d") (:VALUE (:REV . "1258191009")))))
}}}

=== COUCH-REQUEST* ===

{{{COUCH-REQUEST*}}} is the functional equivalent to the macro {{{COUCH-REQUEST}}}.

=== @ ===

{{{@}}} is a utility function that enables you to access Lisp data in the JavaScript dot style. For example,
{{{(@ doc :friend :id)}}} is equivalent to js {{{doc.friend.id}}}.

When looking into lists, {{{@}}} does an alist lookup by default. Since it's a generic function, however, it's behavior can be extended for any type of object (eg, those created from CouchDB documents by {{{cl-CouchDB-object-layer}}}).

== Cl-CouchDB-View-Server ==

{{{Cl-CouchDB-View-Server}}} enables you to write views with Common Lisp instead of having to use JavaScript. It supports both standard and mapreduce views.

Writing views with Common Lisp has several advantages:

 * Common Lisp compiles to fast code.
 * Views are compiled (even ad hoc views) since CouchDB usually sends symbols naming functions, rather than their source.
 * You can do all sorts of weird tricks with the running Lisp image, such as maintaining an in-memory database for faster indexed lookup, making requests to the CouchDB server itself, or well... any of the weird things you can do with Lisp...

=== Starting the Lisp View Server ===

==== From the CouchDB side ====

A Lisp image that with a running view server will be listening to port 5477. So, you need to add something like 

{{{
common-lisp=/usr/bin/socat - TCP4:localhost:5477
}}}

to the {{{[Couch Query Servers]}}} section of your {{{couch.ini}}} (you can substitute socat for any program that will allow a
socket open on port 5477 look like a program with standard input and standard output).  

'''Update: ''' As of CouchDB 0.9.0, the configuration file has been replaced with a combination of {{{default.ini}}} and {{{local.ini}}}.  The line above needs to be added to the {{{local.ini}}} file under the {{{[query_servers]}}} section instead.  Restart the CouchDB server and make sure common-lisp is listed next to the query_servers field in the configuration page in Futon.

==== From the Lisp Side ====

The Lisp image just needs to open a client server (we need to be able to speak with couchdb through HTTP) and a view server and it's ready for action.

{{{
COUCHDB-SERVER> (open-server)
*COUCHDB-SERVER*

COUCHDB-SERVER> (start-view-server)
#<view-server :host "127.0.0.1" :port 5477>
}}}

=== Creating Design Documents ===

The {{{DEFDESIGN}}} macro creates a design document and saves it to the database.

This example creates a design document "test" with one view ({{{by-author-type}}}) and saves it to the database "blog":

{{{
COUCHDB-SERVER> (defdesign test
		    ((by-author-type :map (doc)
				     (emit (list (@ doc :author) (@ doc :type)) doc)))
		  (:documentation "A test view.")
		  (:sync blog))
#<design-document :name TEST :revision NIL :views (#<view BY-AUTHOR-TYPE :map "#'CL-COUCHDB-VIEW-SERVER::BY-AUTHOR-TYPE-MAP" :reduce NIL>)>
}}}

A {{{:reduce}}} view-function may be called either in the {{{reduce}}} or {{{rereduce}}} phase. In the latter situations it gets as its argument the list of earlier calls to reduce instead the usual list of key-value pairs produced by {{{map}}}. The function may tell whether this is the case by checking the value of the special variable {{{*in-rereduce*}}}.

=== Querying the View Server ===

You can query views with the function {{{query-view}}}:

{{{
COUCHDB-SERVER> (query-view 'by-author-type :startkey '("foobar") :endkey '("foobar" #()))
(((:ID . "first") (:KEY "foobar" "blogPost")
  (:VALUE (:_ID . "first") (:_REV . "2718626630") (:AUTHOR . "foobar")
   (:BODY . "Zażółć gęślą jaźń") (:TYPE . "blogPost") (:N . 5)))
 ((:ID . "fourth") (:KEY "foobar" "blogPost")
  (:VALUE (:_ID . "fourth") (:_REV . "2695588251") (:AUTHOR . "foobar")
   (:BODY . "Zażółć gęślą jaźń") (:TYPE . "blogPost") (:N . 8)))
 ((:ID . "second") (:KEY "foobar" "blogPost")
  (:VALUE (:_ID . "second") (:_REV . "230136489") (:AUTHOR . "foobar")
   (:BODY . "Zażółć gęślą jaźń") (:TYPE . "blogPost") (:N . 6)))
 ((:ID . "third") (:KEY "foobar" "blogPost")
  (:VALUE (:_ID . "third") (:_REV . "2453743212") (:AUTHOR . "foobar")
   (:BODY . "Zażółć gęślą jaźń") (:TYPE . "blogPost") (:N . 7))))
47
39
}}}

You can create ad-hoc views with the function {{{query}}}:
{{{
COUCHDB-SERVER> (query 'blog '(lambda (doc) (emit (@ doc :author) (@ doc :body))) :count 2)
(((:ID . "06672346ffc093ce68a07692a5f12db5") (:KEY . "foo")
  (:VALUE . "Zażółć"))
 ((:ID . "146238e235f0cc36661ce82c909044be") (:KEY . "foo")
  (:VALUE . "Zażółć")))
47
0
}}}

== Cl-CouchDB-Object-Layer ==

{{{Cl-CouchDB-Object-Layer}}} provides an object abstraction layer over the alists coming in and out of the database. Most importantly, using these objects (called {{{docs}}}) allows you to automatically validate the information coming in and out of the database (preventing other Lispers from polluting your pristine CouchDB database with specious data ;-) )

=== Defining Doc Classes ===

To define a doc class, use {{{DEFDOC}}} (which is similar to [[http://www.lisp.org/HyperSpec/Body/mac_defclass.html|DEFCLASS]]).

{{{
COUCHDB-OBJECTS> (defdoc blog-post 
		     ((:author :validator #'stringp)
		      (:title :validator #'stringp)
		      (:_id :initform (lambda (doc) (url-encode (@ doc :title))))
		      (:body :validator #'stringp))
		   (:default-db 'blog))
#<STANDARD-METHOD MAKE-DOC ((EQL BLOG-POST)) {BEB6679}>
}}}

"Attributes" are like slots, except identified by a keyword. Attributes can have a {{{:VALIDATOR}}} and {{{:INITFORM}}} and {{{:DOCUMENTATION}}} attribute-options (which are liks slot-options for CLOS objects).

 * A {{{:VALIDATOR}}} must be a unary function that take the value of an attribute and returns a non-{{{NULL}}} value if it is valid.
 * An {{{:INITFORM}}} may be either a normal Lisp value or unary function, which is called on the object itself after setting other attributes.
 * a {{{:DOCUMENTATION}}} attribute-option is a doc string.

=== Making Docs ===

Use the function {{{MAKE-DOC}}} to make {{{DOC}}}s. {{{MAKE-DOC}}} is something like [[http://www.lisp.org/HyperSpec/Body/stagenfun_make-instance.html|MAKE-INSTANCE]].

{{{
COUCHDB-OBJECTS> (make-doc 'blog-post :author "Kuba" :title "O czym dziś napisać" :body "Foo")
#<doc(NIL) :_ID "o_czym_dzis_napisac" :BODY "Foo" :TITLE "O czym dziś napisać" :AUTHOR "Kuba" :TYPE "BLOG-POST">
}}}

=== Getting Data from Docs ===

You can call {{{@}}} on docs to get the value of an attribute, exactly as you would call {{{@}}} on an alist.

{{{
COUCHDB-OBJECTS> (let ((doc (make-doc 'blog-post :author "Kuba" :title "O czym dziś napisać" :body "Foo")))
		   (@ doc :title))
"O czym dziś napisać"
}}}

=== Saving Docs ===

We can call {{{make-and-save}}} to create a document and save it in the database:

{{{
COUCHDB-OBJECTS> (make-doc-and-save 'blog-post :author "Kuba" :title "Zażółć gęślą jaźń" :body "foobar") ;we'll get the rev in return
"2591270477"
}}}

Note: if an object is invalid, it won't be saved:
{{{
COUCHDB-OBJECTS> (make-doc-and-save 'blog-post :author "Kuba" :title "Zażółć gęślą jaźń")
The document #<doc(NIL) :_ID "zazolc_gesla_jazn" :TITLE "Zażółć gęślą jaźń" :AUTHOR "Kuba" :TYPE "BLOG-POST"> is invalid. Reason: attribute
		      :BODY with value NIL didn't validate using #<FUNCTION STRINGP>
   [Condition of type VALIDATOR-FAILED]
...
}}}

= License =


BSD sans advertising clause.

= Author =

Ryszard Szopa <ryszard.szopa@gmail.com>, with one component (logv)
being authored by Nick Allen <nallen05@gmail.com>.
