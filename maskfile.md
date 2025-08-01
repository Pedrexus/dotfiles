# Project Tasks

## init (repo_url)
>
> Initializes chezmoi with your dotfiles repository.

~~~bash
chezmoi init {{repo_url}}
~~~

## apply
>
> Applies your dotfiles.

~~~bash
chezmoi apply
~~~

## install-core-tools
>
> Installs chezmoi and zsh using pixi.

~~~bash
pixi global install chezmoi zsh
~~~

## set-default-shell
>
> Sets zsh as the default shell.

~~~bash
chsh -s $(which zsh)
~~~

## install-global-dependencies
>
> Installs global dependencies using pixi.

~~~bash
python3 -c "import tomllib; data = tomllib.load(open('~/.local/share/chezmoi/pixi.toml', 'rb')); print(' '.join(data['dependencies'].keys()))" | xargs pixi global install
~~~

## uninstall-global-dependencies
>
> Uninstalls global dependencies using pixi.

~~~bash
python3 -c "import tomllib; data = tomllib.load(open('~/.local/share/chezmoi/pixi.local/share/chezmoi/pixi.toml', 'rb')); print(' '.join(data['dependencies'].keys()))" | xargs pixi global uninstall
~~~

## export (email)
>
> Exports your GPG private key to a file named 'private.key'.
> Transfer this file securely to your new machine.

~~~bash
gpg --export-secret-keys --armor {{email}} > private.key
~~~

## import
>
> Imports the 'private.key' file into your GPG keyring on the new machine.

~~~bash
gpg --import private.key
~~~

## trust-gpg-key (email)
>
> Sets ultimate trust for your GPG key.
> In the GPG prompt, type 'trust', select '5' for ultimate trust, and then 'quit'.

~~~bash
gpg --edit-key {{email}}
~~~

## list-gpg-secret-keys
>
> Lists your GPG secret keys to verify import.

~~~bash
gpg --list-secret-keys
~~~

