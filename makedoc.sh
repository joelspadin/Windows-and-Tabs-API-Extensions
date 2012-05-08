# This only works with Cygwin
wdir="`pwd`"
path="$wdir/js/api-extensions.js"

rm -rf ./jsdoc

# jsdoc.sh is a script that runs the given file through JSDoc, then 
# copies the output folder to ./jsdoc
"/c/Users/Joel/Programs/Programming/JSDoc 3/jsdoc.sh" "$path"
