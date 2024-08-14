# CZ

For a long time I used the [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
pattern to write my commit messages, and when I heard of the [`cz-cli`](https://github.com/commitizen/cz-cli)
and [`cz-emoji`](https://github.com/ngryman/cz-emoji) command line utilities
I've installed them in that same moment. But the fact that these programs is
written in JavaScript and depends on a Node packager manager (`npm`, `pnpm` or
`yarn`) always annoyed me – yeah, I know that this make the project cross
platform, but I really don't care, just makes the project difficult to setup in
multiple OSes. So, I made my own Bash script for that. Hope it's helpful for you
as well :heart:.

https://github.com/user-attachments/assets/292ae53e-4fd7-47e3-9b17-6669705ff201


## Documentation

Before anything, this project is meant to run only in **Unix-like systems**. So,
if you're a Windows user, I recommend you to use WSL or ask Chat-GPT to convert 
the main file (`cz.sh`) to a `.ps1` one and drag that to your path. Anyway...


### Installation Process

This program is really small and doesnt has many dependencies, maybe everyting's
already installed in your system. But, be sure that you can `man` the commands
bellow before running the application for the first time. If not, search in the
package manager of your distro (`apt` or `pacman`, for example)

**Dependencies list**:

+ :package: [`git`](https://github.com/git/git)
+ :package: [`fzf`](https://github.com/junegunn/fzf)
+ :package: [`jq`](https://github.com/jqlang/jq)
+ :package: [`rlwrap`](https://github.com/hanslub42/rlwrap)

**Steps to install the script file and ithe `types.json` file**:

```bash
git clone https://github.com/kevinmarquesp/cz
mkdir ~/.local/share/cz ~/.local/bin
cp cz/cz.sh ~/.local/bin/cz
cp cz/types.json ~/.local/share/cz/types.json
rm -rf cz
```


### Uninstall

Actually, this script need a `types.json` file that, if you followed the steps 
above, will be stored in the `~/.loocal/share/cz` directory. It's the only
dependency, so you'll need to remove that directory and the script file. Here's
the steps for that:

```bash
rm ~/.local/bin/cz
rm -rf ~/.local/share/cz
```


### Features Of This Application

This script is just an wrapper around the `git commit` command, so it expects 
that you'll execute that inside a Git repository. It'll display a list of 
commit types with the `fzf` tool for you to chose one, then will ask you a 
*context* (a.k.a. *scope* of the commit), and the *commit message*, straight 
up, simple as that.

The *is breaking* prompt will put a little `!` after the commit type name in 
the final message. It's useful to know which commits represents moments of the 
time where the project actually works.

The commit prompt will have a bar with 80 characters long, it's not a rule, but 
it's a good practice to keep your commit messages short and precise, this bar 
helps with that.

If you used the `-d` or `--description` flags, you'll get another prompt, but 
this time asking for a better, and longer, description of what your commit 
does. It' useful when it's a *breaking change*.

You can always edit the `types.json` in `~/.local/share/cz/types.json` to have
custom types. But if you're in a project that has a specific convention you can
set a custom commit types JSON file with the options `-j` or `--json`. 

Also, if your terminal doesn't support emoji characters, you can  *disable the 
font display* with `-N` or `--no-display-emoji` to avoid any crashes or weird 
invalid font characters. But if you don't want any emoji at all on your commit 
messages, you can *disable the commit message emoji* with the `-n` or
`--no-emoji` options.

Use `cz --help` for more information.

> [!TIP]
> If you have a custom alias for your `fzf` command like I do, this script will 
push that before running the `fzf` command. So you can expect a customized good 
looking `fzf` prompt if you already have!
