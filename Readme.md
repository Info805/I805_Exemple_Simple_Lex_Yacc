# Exemple minimaliste de d'analyseur syntaxique avec Lex et Yacc

Il s'agit ici de faire un analyseur syntaxique 
pour reconnaitre des séquences des phrases simples 
du type `<sujet> <verbe> <complement> <point>`.


[Flex](https://fr.wikipedia.org/wiki/Flex_(logiciel)) 
est utilisé pour la génération de l'analyseur lexical.

[GNU Bison](https://www.gnu.org/software/bison/) pour la génération de l'analyseur syntaxique.

## Analyseur lexical

La spécification de l'analyseur lexical est dans le fichier [simple.l](simple.l).

Il permet de reconnaître un **sujet** (_il_ ou _elle_), 
un **verbe** (_est_ ou _boit_), un **complément** 
(_vite_, _bien_, _chaud_, _beau_, _belle_) ou un **point** (_.;!?_).

À partir de cette spécification, GNU Flex génère le fichier c, 
`simple.yy.c` qui contient l'analyseur lexical utilisé en entrée 
de l'analyseur syntaxique.

## Analyseur syntaxique

La spécification de l'analyseur syntaxique est dans le fichier [simple.y](simple.y).

À partir de cette spécification, GNU Bison génère les fichiers, 
`simple.tab.c` (contient l'analyseur syntaxique) et 
`simple.tab.h` (utilisé dans l'analyseur lexical pour renvoyer 
les tokens (unités lexicales) attendus par l'analyseur syntaxique).

## Construction du projet 

Pour construire le projet (nécessite l'installation de préalable flex, bison, make et d'un compilateur c), 
aller dans le dossier du projet puis exécuter la commande `make`. 
Vous obtenez alors un fichier exécutable `simple.exe`, 
permettant d'analyser les *phrase* sur le flux d'entrée standard ou dans un fichier passé en paramètre.

## Utilisation avec Docker

Contruire l'image docker avec `docker build -t simple --target=simple .` ou
`docker build -t simple --target=small .`
puis utiliser l'analyseur à partir du container :

```bash
cat <<EOF | docker run --rm -i simple
Elle est belle.
Il boit vite !
Elle est rapide ?
Il boit chaud.
EOF
```


 
