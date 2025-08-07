# Project Tasks

## shell
>
> Sets zsh as the default shell.

~~~bash
chsh -s $(which zsh)
~~~

## install
>
> Installs global dependencies using pixi and npm packages.

~~~bash
python3 -c "import tomllib; data = tomllib.load(open('pixi.toml', 'rb')); print(' '.join(data['dependencies'].keys()))" | xargs pixi global install
mask npm
~~~

## npm
>
> Installs npm global packages including Claude Code.

~~~bash
npm install -g @anthropic/claude-code
~~~

## uninstall
>
> Uninstalls global dependencies using pixi.

~~~bash
python3 -c "import tomllib; data = tomllib.load(open('pixi.toml', 'rb')); print(' '.join(data['dependencies'].keys()))" | xargs pixi global uninstall
~~~
