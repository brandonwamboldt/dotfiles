#!/bin/bash

NAME="Your Name"
EMAIL="your.name@example.com"
NAME_ENABLE=1
EMAIL_ENABLE=1
SHELL=$(ps -p $(ps -f -p $$ | awk '{print $3}' | awk 'NR>1') | awk '{print $4}' | awk 'NR>1')

if [ -f ~/.gitconfig ]; then
	grep --quiet "^ *name" ~/.gitconfig
	NAME_ENABLE=$?
	grep --quiet "^ *email" ~/.gitconfig
	EMAIL_ENABLE=$?
	NAME=$(grep "^ *name *= *" ~/.gitconfig | awk '{$1=$2=""; print $0}' | xargs)
	EMAIL=$(grep "^ *email *= *" ~/.gitconfig | awk '{$1=$2=""; print $0}' | xargs)
fi

curl -sSL https://github.com/brandonwamboldt/dotfiles/archive/master.tar.gz | tar --strip-components=1 -C ~ -zx
/bin/rm ~/README.md
/bin/rm ~/install.sh

sed -i "s/name = Your Name/name = $NAME/g" ~/.gitconfig
sed -i "s/email = your.name@example.com/email = $EMAIL/g" ~/.gitconfig

if [[ "$NAME_ENABLE" == "0" ]]; then
	sed -i "s/#    name/    name/g" ~/.gitconfig
fi

if [[ "$EMAIL_ENABLE" == "0" ]]; then
	sed -i "s/#    email/    email/g" ~/.gitconfig
fi
