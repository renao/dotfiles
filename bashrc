# Source global definitions
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

source ~/.bash/common
source ~/.bash/prompt
source ~/.bash/git
source ~/.bash/rvm
source ~/.bash/ruby
source ~/.bash/screen

if [ "$(domainname)" = "NEOPOLY" ]; then
  source ~/.bash/neopoly
else
  source ~/.bash/private
fi

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/rwernicke/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
