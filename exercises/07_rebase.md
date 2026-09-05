# Rebase

* create a repo with several commits
  (you can clone one from github)

* do the following:
    * remove some commit from history (drop)
    * squash several commits into one commit
    * rename commits
    * reorder commits
    * some of the above together
    * edit commits

* hint:
  `$ git rebase -i [commit id]`
  [commit id] can be: id (binary), HEAD calculation, tag
  add several commits with:
  `$ for i in {1..5}; do touch $i.txt; git add $i.txt; git commit -m "commit $i"; done`
