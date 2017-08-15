for file in ~/.{bash_prompt,aliases,exports}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        source "$file";
    fi
done;
unset file;
