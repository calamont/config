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
mv config-tmp/* .
config config status.showUntrackedFiles no
```
