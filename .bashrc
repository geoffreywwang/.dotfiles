# ==================== PATH ====================
export PERSONAL_TOOLS_PATH=~/Documents/Tools
export PATH="$PERSONAL_TOOLS_PATH:/usr/local/bin:$PATH"

# ================== Python ====================
# Initialize python to be the current version
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init - --no-rehash)"
fi

# ========== Aliases ===========
# Used to open up this file for editing
alias editPath="nvim ~/.bashrc"

# Prints brew dependancy tree
alias brewlist="brew leaves | xargs brew deps --tree"

# MIT Athena cluster
alias sshathena="ssh -Y -K geowang@ftp.dialup.mit.edu"
export ATHENA="geowang@athena.dialup.mit.edu"

# Dot files git repository
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# Alison <3
alias alison="echo 'I love you <3 <3 <3'"

# Pytorch
alias pytorch="sudo docker run --gpus all --rm -it --ipc=host -p 8888:8888 -v /home/geoffrey/Documents/projects/pytorch:/home/geowang personal-pytorch:1.1"

# ========== Bash ==========
PS1='\[\e[0;2;3m\]\w\[\e[m\] \[\e[0;38;5;45m\]>\[\e[m\] \[\e0'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
