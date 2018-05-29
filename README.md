[![Build Status](https://api.travis-ci.org/OWASP/owasp-halifax.svg?branch=master)](https://travis-ci.org/OWASP/owasp-halifax)
[![License: CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/3.0/80x15.png)](https://raw.githubusercontent.com/OWASP/owasp-halifax/master/LICENSE)
# OWASP Halifax Website

[Vist our Website Here!](https://owasp.github.io/owasp-halifax)

# Chapter Leaders

- [Lilly Chalupowski](https://lillypad.github.io)
- [Tyler Parrott](mailto:tyler.parrott@owasp.org)

# Dependancies
- npm
- python
- ruby
- jekyll

# Building The Site

__Download:__
```bash
git clone https://github.com/owasp/owasp-halifax.git
cd owasp-halifax/
```

__Build and Serve Locally:__
```bash
make
make serve
```

__Docker Build:__
```bash
docker build -t owasp-halifax .
```

__Docker Compose:__
```bash
docker-compose up .
```

# Contributing

__Continious Integration:__

All commits to the `master` branch must first pass the `.travis.yml` checks.

Both `javascript` and `html` linting is used so please check for syntax errors.

__Commit Signing:__

In order to contribute to the `develop` and `master` branches code signing is required.

Generating a Key:
```bash
gpg --full-generate-key
```

Importing Keys:
```bash
gpg --allow-secret-key-import --import private.key
gpg --import public.key
srm --dod private.key
```

Get your `key-id`:
```bash
gpg --list-secret-keys --keyid-format LONG
```

Set Meta Data:
```bash
gpg --edit-key [key-id]
gpg> adduid
```
NOTE: Your email must be the same as the one in `git config user.email`

Set Trust level of `5`:
```bash
gpg> trust
```
NOTE: If you trust yourself that is

Export Public Key:
```bash
gpg --armor --export [key-id]
```

NOTE: You need to import this in the GitHub web interface in your settings

In the `owasp-halifax` repository:
```bash
git config --local user.email [same email from adduid]
git config --local user.signingkey [key-id]
git config --local commit.gpgsign true
```

You should now be able to make commits.

If you have tty issues try this:
```bash
echo "export GPG_TRUST=$(tty)" >> ~/.bashrc
source ~/.bashrc
```

If you have any trouble contributing to this repository please let us know and we can help.
