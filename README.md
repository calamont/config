# Configuration files
Organising configuration/dotfiles is awkward. I still haven't come across a perfect solution. I am currently using a bare repo approach, detailed [here](https://news.ycombinator.com/item?id=11071754).

If starting from scratch...
```sh
git init --bare $HOME/.myconf
# put this alias into your .bashrc/.zshrc
alias config='/usr/bin/git --git-dir=$HOME/.config_bare/ --work-tree=$HOME'
config config status.showUntrackedFiles no
```

If setting up an existing repo on a new machine...
```sh
git clone --separate-git-dir $HOME/.config_bare git@github.com:calamont/config.git $HOME/config-tmp
rsync -ibr config-tmp/ ./
config config status.showUntrackedFiles no
```
Use `rsync` to copy across files to your new file directory. I suggest `rsync`
because its possible a `.config` folder already exists. Adding the `-b` flag means
any original files will be appended with ~ to stop them being overriden. You can
go through these one by one and see what you want to keep/change.
