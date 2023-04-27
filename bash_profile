# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -d "$HOME/bin" ]; then
  PATH="$PATH:$HOME/Android/Sdk/platform-tools"
fi
source ~/.profile

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/rwernicke/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
