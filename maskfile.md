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

## install-global-dependencies
>
> Installs global dependencies using pixi.

~~~bash
python -c "import tomllib; data = tomllib.load(open('/home/pedro/.local/share/chezmoi/pixi.toml', 'rb')); print(' '.join(data['dependencies'].keys()))" | xargs pixi global install
~~~

## uninstall-global-dependencies
>
> Uninstalls global dependencies using pixi.

~~~bash
python -c "import tomllib; data = tomllib.load(open('/home/pedro/.local/share/chezmoi/pixi.toml', 'rb')); print(' '.join(data['dependencies'].keys()))" | xargs pixi global uninstall
~~~
