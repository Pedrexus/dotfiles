# Project Tasks

## shell
>
> Sets the system zsh as the default login shell.

~~~bash
shell_path="$(awk '/^\/(usr\/)?bin\/zsh$/ { print; exit }' /etc/shells 2>/dev/null)"

if [ -z "$shell_path" ]; then
	echo "No valid system zsh was found in /etc/shells."
	echo "Install zsh with your system package manager first, for example: sudo apt install -y zsh"
	exit 1
fi

sudo chsh -s "$shell_path" "$USER"
~~~

## install
>
> Installs global dependencies using pixi and npm packages.

~~~bash
python3 -c "import tomllib; data = tomllib.load(open('pixi.toml', 'rb')); print(' '.join(data['dependencies'].keys()))" | xargs pixi global install
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
