# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias cl="clear"
alias dc="docker compose"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# Make-first workflow
alias m="make"
alias mh="make help"
alias mup="make up"
alias mdown="make down"
alias mre="make restart"
alias mclean="make pristine"
alias mpre="make prepush"
alias mmig="make migrate"
alias mmake="make migration"
alias mdb="make resetdb"
alias mdbt="make resettest"
alias mt="make phpunit"
alias ms="make phpstan"
alias mcs="make phpcs"
alias mrx="make rector"
alias mb="make behat"
alias mdp="make deptrac"
alias mqa="make checks"
alias mcc="make cc"
alias mroutes="make routes"
alias mlist="make list"
alias mtk="make tinker"

# Docker CLI helpers
cli() { docker compose run --rm cli "$@"; }
pc() { cli php bin/console "$@"; }
pct() { docker compose run --rm -e APP_ENV=test cli php bin/console "$@"; }
alias pcc="pc cache:clear"
alias proutes="pc debug:router"
alias plist="pc list"
alias dcl="docker compose logs -f --tail=200"
alias dcb="docker compose run --rm cli bash"

# Git
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gco="git switch"
alias gcb="git switch -c"
alias gb="git branch -vv"
alias gl="git log --oneline --graph --decorate -20"
alias gd="git diff"
alias gds="git diff --staged"
alias gpl="git pull --rebase --autostash"
alias gps="git push"
alias gpf="git push --force-with-lease"
alias gst="git stash -u"
alias gstp="git stash pop"

# tmux
alias t="tmux new -As main"
alias tl="tmux ls"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias tr="tmux source-file ~/.tmux.conf"

# Misc
alias cfresh="rm -rf vendor/ composer.lock && composer install"
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"
alias leaf="docker run -e LOCAL_USER_ID=$(id -u ${USER}) --rm -v ~/codedor/leaf:/home/leaf -v ~/.ssh/id_rsa:/home/leaf/.ssh/id_rsa:ro -it --init codedor/leaf:latest"
