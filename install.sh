#!/bin/bash

dir="~/src/fancy_tools"
a="source $dir/.aliases"
b="source $dir/fancy_functions.sh"
c=$(<~/.bashrc)
d="export PATH=$PATH:~/bin"

#creer et sourcer src
if [[ -d ~/src ]]
then
        echo "folder ~/src exists deja"
else
        mkdir ~/src
        echo "folder ~/src a etait creer avec succes"
fi


#creer sourcer le ./aliases
if grep -q "$a" <<< "$c"; then
	echo "Fichier '.aliases'est deja dans le bashrc"
else
	echo source $dir/.aliases >> ~/.bashrc
	echo "Fichier '.aliases' a etait ajouer dans le bashrc avec succes"
fi

#creer et sourcer fancy_functions.sh
if grep -q "$b" <<< "$c"; then
	echo "Fichier 'Fancy_functions.sh' est deja dans le bashrc"
else
	echo source $dir/fancy_functions.sh >> ~/.bashrc
	echo "Fichier 'fancy_functions.sh' a etair ajouter dans le bashrc avec succes"
fi

#creer et sourcer ~/bin
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

#clone fancy_tools dans le src
if [[ -d ~/src/fancy_tools ]]
then
	echo "fancy_tools est deja dans le folder src"
else
	git clone --single-branch --branch master https://github.com/diksha002/fancy_tools.git ~/src/fancy_tools
	echo "le clone a etait fait dans fancy_tools in ~/src avec succes"
fi

# pour copier le updateFancyTools
cp ~/src/fancy_tools/bin/updateFancyTools ~/bin
#donner le droit d'execution au fichier pour eviter des problemes en installation
chmod +x ~/bin/updateFancyTools

