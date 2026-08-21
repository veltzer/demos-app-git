# Git bisect

use git to find a commit that introduced a bug...

* create a new repo
* create a first commit for that repo
* create a test script within the repository which succeeds.
* create 10 commits on top of the first commit where commit number 7
  breaks the code.
* use git bisect and find the change that introduced the bug.
