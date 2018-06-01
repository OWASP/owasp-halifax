# Contributing Articles

To contribute a blog article, submit a pull request under
[Posts](https://github.com/OWASP/owasp-halifax/tree/master/_posts)
with your article in markdown format.

# Donating

OWASP Halifax is always looking for like minded organisations to support our activities.  To donate, go to:
 [Local Chapter Donation](https://www.owasp.org/index.php/Local_Chapter_Supporter)

# Contributing Code

## Dependancies
- npm
- python
- ruby
- jekyll

## Building The Site

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
sudo docker build -t owasp-halifax .
```

__Docker Compose:__
```bash
sudo docker-compose up .
```

# Submitting Pull Requests

All changes to the OWASP Halifax organisation must be submitted as GitHub pull requests.

__Continious Integration:__

All commits to the `master` branch must first pass the `.travis.yml` checks.

Both `javascript` and `html` linting is used so please check for syntax errors.

__Commit Signing:__

In order to contribute to the `develop` and `master` branches code signing is required on every commit on every
pull request.

To enable code signing, follow the
[GitHub Code Signing Guide](https://help.github.com/articles/signing-commits-using-gpg/)

## OWASP Halifax Code Signing Tutorial

Generating a Key:
```bash
gpg --full-generate-key
```

Alternatively, if you have an older version:

```
gpg --gen-key
```

GPG consumes system entropy while generating keys and can stall if your system doesn't have enough.

To check entropy:

```bash
cat /proc/sys/kernel/random/entropy_avail
```

...and available entropy should be >3000.  If it isn't, consider installing rng-tools or generating additional IO.

If you already have GPG keys and would like to import them:
```bash
gpg --allow-secret-key-import --import private.key
gpg --import public.key
srm --dod private.key
```

Once you have generated a key, you'll need to get your `key-id`:
```bash
gpg --list-secret-keys --keyid-format LONG
```

```bash
gpg --edit-key [key-id]
gpg> adduid
```

And it's helpful to make it trusted on the local machine (set level 5):
```bash
gpg> trust
```

## Adding your key to GitHub
NOTE: You need to import this in the GitHub web interface in your settings.  Follow the
[GitHub Guide to Adding a New GPG Key](https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account/)

Export Public Key:
```bash
gpg --armor --export [key-id]
```

## Cloning the repo and setting your local config
Once you have your GitHub account configured properly, fork the owasp-halifax repository.  Follow the [GitHub Guide to Forking a Repository](https://help.github.com/articles/fork-a-repo/) for more information on how to do that.

Clone the repository into your local workspace and set your git local variables (in Git v2+) to enable
 code signing by default:
```bash
git clone <your forked repo>
cd <repo>
git config --local user.email [same email from adduid]
git config --local user.signingkey [key-id]
git config --local commit.gpgsign true

git commit -a -S -m"This is my first commit!"
```

You should now be able to make commits.

## TTY
If you are accessing tty issues try this:
```bash
echo "export GPG_TRUST=$(tty)" >> ~/.bashrc
source ~/.bashrc
```

Alternatively, add a local script and use it instead:
```
mkdir ~/.gpg
vi ~/.gpg/owasp-halifax.gpg # Add your password in plaintext here.  Don't worry - the user home is the right place!
cat >/usr/bin/gpg-owasp <<EOF
exec gpg --batch --passphrase-file ~/.gpg/owasp-halifax.gpg
EOF
chmod o+x /usr/bin/gpg-owasp
git config --local gpg.program gpg-owasp
```

If you have any trouble contributing to this repository please let us know and we can help.
