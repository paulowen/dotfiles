for dotfile in ~/.{bash_prompt,aliases,exports}; do
    if [ -r $dotfile ] && [ -f $dotfile ]; then
        source $dotfile;
    fi
done;
unset dotfile;

for brewfile in $(brew --prefix)/etc/{bash_completion,profile.d/z.sh}; do
    if [ -f $brewfile ]; then
        source $brewfile
    fi
done;
unset brewfile;
