#!/bin/bash

dir="~/src/fancy_tools"
a="source $dir/.aliases"
b="source $dir/fancy_functions.sh"
c=$(<~/.bashrc)
d="export PATH=$PATH:~/bin"

# sourcer le ./aliases
if grep -q "$a" <<< "$c"; then
	echo "Fichier '.aliases'est deja dans le bashrc"
else
	echo source $dir/.aliases >> ~/.bashrc
	echo "Fichier '.aliases' a etait ajouer dans le bashrc avec succes"
fi

#file fancy_functions.sh
if grep -q "$b" <<< "$c"; then
	echo "Fichier 'Fancy_functions.sh' est deja dans le bashrc"
else
	echo source $dir/fancy_functions.sh >> ~/.bashrc
	echo "Fichier 'fancy_functions.sh' a etair ajouter dans le bashrc avec succes"
fi

#folder ~/bin
if [[ -d ~/bin ]]
then
	echo "folder ~/bin existe deja"
else
	mkdir ~/bin
	echo "folder ~/bin a etait ajouter avec succes"
fi

#PATH
if grep -q "$d" <<< "$c"; then
	echo "PATH est deja dans le bashrc"
else
	echo "export PATH=$PATH:~/bin" >> ~/.bashrc
	echo "PATH a etait ajouter dans le bashrc avec succes"
fi

