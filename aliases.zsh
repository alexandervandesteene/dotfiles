# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# Laravel
alias a="php artisan"
alias va="valet php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias c="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"
alias phpunit="vendor/bin/phpunit"
alias pest="vendor/bin/pest"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# Git
alias gc="git checkout"
alias gpo="git push origin"
alias gp="git pull"
alias gps="git push"
alias gm="git merge"
alias glog="git log"


#leaf
alias leaf="docker run -e LOCAL_USER_ID=$(id -u ${USER}) --rm -v ~/codedor/leaf:/home/leaf -v ~/.ssh/id_rsa:/home/leaf/.ssh/id_rsa:ro -it --init codedor/leaf:latest"

