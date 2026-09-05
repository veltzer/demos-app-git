# Merge vs Rebase

* open a server repo using:
  `$ git init --bare`
* use that repo to simulate the work of two users working against
that repo.
* simulate two ways of merging the code that these two users write:
* the "merge" way
  by using "git pull"
  which is really "git fetch" and "git merge"
  under the hood
* the "rebase" way
  by using "git fetch"
  and "git rebase"
    * bonus points: try the --interactive flag to git-rebase
Compare the two ways of working in terms of the git log of the master
repository after the work has been done.
Which do you like and why?
