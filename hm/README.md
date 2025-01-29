## Set ZSH as default shell
Add zsh to /etc/shells:

`command -v zsh | sudo tee -a /etc/shells`

You can now use chsh to set zsh as shell:

`sudo chsh -s "$(command -v zsh)" "${USER}"`
