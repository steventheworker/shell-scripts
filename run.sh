# used on purp (Ubuntu) - give shell script file a nickname(s)
if [ -z "$1" ]
then
   echo "No argument supplied"
   exit 1
fi
nn=$1 # script nickname

if [ "$nn" = "cat" ]; then ash ./Desktop/important/catvid.sh;
elif [ "$nn" = "ap" ]; then ash ./Desktop/important/toggle-airpods.sh
elif [ "$nn" = "icons" ]; then ash ./Desktop/important/desktop-icons.sh
elif [ "$nn" = "watch" ]; then fswatch -o "${PWD}" | xargs -n1 -I{} ~/proj/.zsh/shell-scripts/gitdiff.sh
elif [ "$nn" = "invert" ]; then ash ~/proj/.zsh/shell-scripts/invert.sh "$2"
fi
