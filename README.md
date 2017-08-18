# dotfiles

To install:

```
make
```

## z

- Install `z` from `brew`: `brew install z`
- `.bash_profile` is configured to source `z.sh` from the brew installation root.

## bash-completion

- Install `bash-completion` from `brew`: `brew install bash-completion`
- Tap brew completions: `brew tap homebrew/completions`
- `.bash_profile` is configured to source `bash_completion` from the brew installation root.

### Docker

If Docker for Mac is installed, enable for bash-completion:

```
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion 
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion 
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
```
