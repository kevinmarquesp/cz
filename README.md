# Committizen Emoji SH
For a long time I used the [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) pattern to write my commit messages, and when I head of the [`cz-cli`](https://github.com/commitizen/cz-cli) and [`cz-emoji`](https://github.com/ngryman/cz-emoji) command line utilities I've installed them in that same moment. But the fact that these programs is written in JavaScript and depends on a Node packager manager (`npm`, `pnpm` or `yarn`) always annoyed me – yeah, I know that this make the project cross platform, but I really don't care, just makes the project difficult to setup in multiple OSes. So, I made my own Bash script for that. Hope it's helpful for you :heart:.
## Documentation
Before anything, this project is meant to run only in Unix systems. So, if you're a Windows user, I recommend you to use WSL or ask Chat-GPT to convert the main file (`cz.sh`) to a `.ps1` one and drag that to your path. Anyway…
### Installation Process
As you already know, this tool was written using Bash script, so you need to have, at least, bash installed in your system. Along side that, you will need the `base` package (in Arch Linux) to have access to the `sed` command and other tools that I'll assume that's already installed on you distribution.

**Dependencies list**:
+ 📦 [`git`](https://github.com/git/git)
+ :package: [`fzf`](https://github.com/junegunn/fzf)
+ :package: [`jq`](https://github.com/jqlang/jq)

**Steps to install the script file and ithe `types.json` file**:
```bash
git clone https://github.com/kevinmarquesp/committizen_emoji_sh
mkdir ~/.local/share/committizen_emoji_sh ~/.local/bin
cp committizen_emoji_sh/cz.sh ~/.local/bin/cz
cp committizen_emoji_sh/types.json ~/.local/share/committizen_emoji_sh/types.json
rm -rf committizen_emoji_sh
```
### Uninstall
Actually, this script need a `types.json` file that, if you followed the steps above, will be stored in the `~/.loocal/share/committizen_emoji_sh` directory. It's the only dependency, so you'll need to remove that directory and the script file. Here's the steps for that:
```bash
rm ~/.local/bin/cz
rm -rf ~/.local/share/commitzen_emoji_sh
```
### Features Of This Application
This script is just an wrapper around the `git commit` command, so it expects that you'll execute that inside a Git repository. It'll display a list of commit types with the `fzf` tool for you to chose one, then will ask you a *context* (a.k.a. *scope* of the commit), and the *commit message*, straight up, simple as that.

The commit prompt will have a bar with 80 characters long, it's not a rule, but it's a good practice to keep your commit messages short and precise, this bar helps with that.

If you used the `-d` or `--description` flag, you'll get another prompt, but this time asking for a better, and longer, description of what your commit does. It' useful when it's a *breaking change*.

You can always edit the `types.json` in `~/.local/share/committizen_emoji_sh/types.json` to have custom types. But if you're in a project that has a specific convention you can set a custom commit types JSON file with the options `-j` or `--json`. 

Use `cz --help` for more information.
## Development & Contribution
### TODO
- [ ] Verify if the JSON path exists before opening the `fzf` prompt.
- [ ] Add a *no display emoji* option, for terminal emulators that doesn't support that.
- [ ] Add a *no emoji* option; not anyone likes cute little emojis on their commit messages.
- [ ] Add a *breaking change* prompt that will just add a `!` after the commit name;
