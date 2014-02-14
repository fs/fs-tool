fs
==========================================================================

A legendary command-line tool whose kung fu skills were the stuff of legend.


## Installation

```bash
git clone git@github.com:fs/fs-tool.git ~/.fs-tool
```

Bash users:

```bash
echo 'eval "$($HOME/.fs-tool/bin/fs init -)"' >> ~/.bash_profile
exec bash
```

Zsh users:

```bash
echo 'eval "$($HOME/.fs-tool/bin/fs init -)"' >> ~/.zshenv
source ~/.zshenv
```


## Commands

Run `fs` without any arguments or run `fs help` to explore available commands.
`fs help <command_name>` prints usage and other command documentation.

### `fs wisdom` (`fs wise`)

Shares the best wisdom quotes and our core values with you.

```bash
$ fs wisdom
Great Work is a Matter of Pride
```

### `fs gh`

Open current github repo in browser

```bash
$ fs gh                          # opens current repo on github
$ fs gh pulls (fs gh p)          # opens current repo's pull requests on github
$ fs gh issues (fs gh i)         # opens current repo's issues on github
$ fs gh search (fs gh s) <query> # search in current repo
```
