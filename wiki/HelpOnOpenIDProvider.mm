## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:
##master-date:
#acl -All:write Default
#format wiki
#language en
= MoinMoin as an OpenID Provider =

/!\ If you're looking for allowing log-in in to Moin using OpenID (Moin being an OpenID Relying Party), please see HelpOnAuthentication!

MoinMoin can be used as a flexible OpenID provider, allowing authentication with any of the existing authentication methods.

MoinMoin's OpenID provider code is very flexible, allowing various use cases. Generally, though, if the OpenID server is enabled, each user's homepage is also their OpenID. It is possible through a processing instruction, if permitted, to use any other page as the OpenID for a specific user if the page contains that processing instruction, see below.

== Configuration ==

The OpenID server code supports several configuration variables that can restrict the way the wiki can be used as an OpenID provider:
 1. `openid_server_enabled` (boolean): used to enable/disable the built-in OpenID server completely
 1. `openid_server_enable_user` (boolean): If set, the `OpenIDUser` processing instruction is allowed, see below.
 1. `openid_server_restricted_users_group` (group page name): if set, the page it points to must contain a list of users that are allowed to use the wiki as an OpenID provider.

== Processing instruction ==

The new processing instruction `OpenIDUser` is enabled depending on the configuration, its only argument must be a username, for example "{{{#OpenIDUser SomeUserName}}}". When this instruction is used, Moin will also allow using that particular page as an OpenID URL for the given username. However, note that this form of the processing instruction can never override the default so it cannot be used on another user's homepage.

== Currently not implemented functionality ==
The OpenID server code is not perfect, it could
 * implement attribute exchange,
 * be an IDP so users can enter just `http://wiki.example.com/` and choose their identity by logging in,
 * allow delegation, would be easy to do with a new user preferences plugin (and a new configuration option `openid_server_enable_delegation`)
