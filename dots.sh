#/bin/sh
FLAG=$1
CWD=$HOME/Projects/dots

case $FLAG in
    "--update") bash $CWD/update.sh;;
    "--replace") bash $CWD/replace.sh;;
    "") echo "Usage: dots [--update || --replace]";;
    *) echo "Unknown command";;
esac
