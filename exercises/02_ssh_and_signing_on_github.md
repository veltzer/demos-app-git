# Ssh private/public keys and GPG keys for signing

This exercise has two parts but first you must do the following:

* sign up to GitHub, if you already have an account then don't and just
  use your existing account.
  [URL](https://github.com)
* for windows users:
  install gitbash and accept all defaults and you will have the tools you need for this
  exercise (GPG and ssh-keygen).

Part1: ssh access to GitHub

* follow GitHub instructions on creating and registering an ssh key.
  [URL](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  [URL](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
    * You don't really need to do the ssh-agent stuff
    * Pay attention to create a key without a password (insist on it twice and it will work)
    * Remember to configure GitHub to accept the key that you created (add it to your ssh keys collection
  on GitHub)
* show that you clone pull and push from GitHub without supplying a user/password which means that you are
  using your newly minted keys.

Part2: signing your commits

* follow GitHub instructions on creating and registering a GPG key.
  [URL](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
  [URL](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification)
    * Pay attention to create a key with the same email and name of your GitHub
    * Pay attention to create a key without a password (insist on it twice and it will work)
  account
  If generating the key takes too long here is how to speed it up:
  [URL](https://www.howtoforge.com/helping-the-random-number-generator-to-gain-enough-entropy-with-rng-tools-debian-lenny)
* create a new github repository called "gpg-sign-demo"
* clone it
* create a commit and sign it.
    1) make sure that under [user] name, email and signingkey have the right data and identical
  to your data at github. signing key needs to be the last 8 digits of your key id as shown
  from gpg --list-keys
    2) create a commit and sign it with:
       $ git commit -S -m "message"
  optionally: put the following snippet in your ~/.gitconfig or .git/config files:
  ===========>8===============
  [commit]
  gpgsign = true
  ===========>8===============
  in order to sign every commit
* push it to github.
* verity that you commit is signed
  go to the github website, find your repository, find your commit and see that is has the green
  [verified] box at it's description.
