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
python3 - <<'EOF' | xargs pixi global install
import tomllib, platform
with open('pixi.toml', 'rb') as f:
    data = tomllib.load(f)
s, m = platform.system().lower(), platform.machine().lower()
if s == 'darwin':
    plat = 'osx-arm64' if m in ('arm64', 'aarch64') else 'osx-64'
elif s == 'linux':
    plat = 'linux-aarch64' if m == 'aarch64' else 'linux-64'
else:
    plat = ''
pkgs = set(data.get('dependencies', {}).keys())
if plat:
    pkgs |= set(data.get('target', {}).get(plat, {}).get('dependencies', {}).keys())
print(' '.join(pkgs))
EOF
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
python3 - <<'EOF' | xargs pixi global uninstall
import tomllib, platform
with open('pixi.toml', 'rb') as f:
    data = tomllib.load(f)
s, m = platform.system().lower(), platform.machine().lower()
if s == 'darwin':
    plat = 'osx-arm64' if m in ('arm64', 'aarch64') else 'osx-64'
elif s == 'linux':
    plat = 'linux-aarch64' if m == 'aarch64' else 'linux-64'
else:
    plat = ''
pkgs = set(data.get('dependencies', {}).keys())
if plat:
    pkgs |= set(data.get('target', {}).get(plat, {}).get('dependencies', {}).keys())
print(' '.join(pkgs))
EOF
~~~
