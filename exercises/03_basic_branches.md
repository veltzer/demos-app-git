# Basic Branches

* Create a repository with an initial commit
  `$ git init [repo_name]`
  and create a first commit
* Create several commits on top of the initial commit.
* Branch out to branch "branch1"
  `$ git branch [branchname]`
* Create several commits on top of branch1
* Return to master
* Add several commits
* Branch to "branch2"
* Move (either push or pull) commits from branch1 to branch2
* Collapse the branch2 branch to master
  go to master and pull changes from branch 2 using:
  `$ git pull . branch2`
* update branch1 from master
  go to branch1 and pull from master using:
  `$ git pull . master`
* collapse branch1 to master
  go to master and pull from branch1:
  `$ git pull . branch1`
* delete branches branch1 and branch2
  `$ git branch -d branch1`
  `$ git branch -d branch2`
