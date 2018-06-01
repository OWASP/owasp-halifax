[![Build Status](https://api.travis-ci.org/OWASP/owasp-halifax.svg?branch=master)](https://travis-ci.org/OWASP/owasp-halifax)
[![License: CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/3.0/80x15.png)](https://raw.githubusercontent.com/OWASP/owasp-halifax/master/LICENSE)
<<<<<<< HEAD

# About Us

The Open Web Application Security Project (OWASP) Halifax Chapter (https://owasp.github.io/owasp-halifax)
is a Chapter of the OWASP worldwide charitable organization (https://www.owasp.org) focused on improving
the security of software.

Our mission is to make software security visible, so that individuals and organizations are able to make
informed decisions.

OWASP Halifax is in a unique position to provide impartial, practical information about Application Security
to individuals, corporations, universities, government agencies and other organizations worldwide.

Operating as a community of like-minded professionals, OWASP Halifax issues software tools and
knowledge-based documentation on application security.

Everyone is free to participate (we are wheelchair accessible) in OWASP Halifax and all of our materials are
available under a free and open software license.

You'll find everything about OWASP Halifax here and current information on our OWASP Halifax Blog.

OWASP Halifax does not endorse or recommend commercial products or services, allowing our community to remain
vendor neutral with the collective wisdom of the best minds in software security worldwide.

# People

## Chapter Leaders
- [Lilly Chalupowski](https://lillypad.github.io)
- [Tyler Parrott](mailto:tyler.parrott@owasp.org)

# Contributing

You can contribute to OWASP Halifax by donating, becoming a sponsor, submitting talks or helping with the
website or other code OWASP manages.

For more information on contributing code, articles or documents follow the guidelines in
[CONTRIBUTING.md](https://github.com/OWASP/owasp-halifax/blob/master/CONTRIBUTING.md)

# Becoming a Supporter

OWASP Halifax is always looking for like minded organisations to support our activities.  To donate, go to:
 [Local Chapter Donation](https://www.owasp.org/index.php/Local_Chapter_Supporter)

# Governance

OWASP Halifax is an official OWASP Chapter.

For more information, see [GOVERNANCE.md](https://github.com/OWASP/owasp-halifax/blob/master/GOVERNANCE.md)

# More Information

For help or more information, contact the Chapter Leaders directly, come out to an OWASP Halifax event
or join the OWASP [slack channel](https://owasphalifax.slack.com).
=======
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
>>>>>>> upstream/develop
