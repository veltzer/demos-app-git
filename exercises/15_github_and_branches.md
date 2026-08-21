# Github and Branches

===================

* Create a github account.
* Create a private/public keypair and add it to your github account.
  [URL](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* Configure git to use your newly created private/public keypair.

## You should add something like this to your ~/.gitconfig

    [user]

## signingkey = 73C128F9

    Your key id is the last 8 characters of your full key id.
    You can use either a text editor or:
    $ git config --global user.signingkey [yourkeyid]
* Create a repository in your github account.
* Clone your project to your laptop/desktop.
* add files, commit, see your change in github.com
* create branches commit on them and see them in github.com
