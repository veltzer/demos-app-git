# Tags

* create a "server" with two users.
* create tags by one of the users.
  * create unsigned tags
  * create signed tag (git tag -s)
* do tags get passed to server or to the other users when you push and pull?
* if yes how can you stop tags being pushed around.
* if no how can you make tags pass?
  * checkout the --tags/--follow-tags flag to "git push"
    or the [tags]/followTags = true in the git configuration.

NOTES:

* in order to sign tags you need to:
  * have your own private key (we already did that)
  * tell git to user your key ([user] signingkey= in your .gitconfig)
