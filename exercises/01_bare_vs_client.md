# Bare vs Client

* create a git repo with --bare.
  Can you do a commit on it?
  Clone it and do a commit on it that way.
* Open a new git repo
  do a few commits.
  To whom are they attributed?
  Change you username and email in either the project .git/config or ~/.gitconfig
  now do more commits
  what does the log say?
* Open a bare repo
  Clone to two users
  Experience what happens when you want to push and the content changed.
* Open a bare repo.
  Clone to two users.
  Create a "long" file (30 lines is enough).
  Create a conflict between the users, this means that both users
  will change the same area in the file in different ways.
  What happens when you try to integrate both users changes?
* Open a bare repo.
  Clone to two users.
  add a file called "foo.txt"
  make user1 do a commit that changes foo.txt
  make user2 do a commit that renames foo.txt -> bar.txt
  Could git merge your changes?
