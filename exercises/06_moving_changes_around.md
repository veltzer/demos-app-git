# Moving changes around

* Create a local repository with a master branch. Create two feature branch.
  Fold both feature branches into master with either push or pull.

* Create two users each with his/her own feature branch. Move changes between
  the two users without going through the master branch but with the aid
  of the server. using two methods:
        * merge and then rebase
        * cherry pick

* Create one user with two local branches. Move changes between these branches
  locally (without pushing anything to the server).
  Do it using two methods:
        * pull (use "." as the origin)
        * cherry pick

* Simulate working on a long term feature branch (optional)
  Create a server.
  Branch into a feature branch.
  Do some commits on the feature branch.
  Push (from another user) commits to the master.
  Sync up against the master branch (use rebase of course).
  Repeat
