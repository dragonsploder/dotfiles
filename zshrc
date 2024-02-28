# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dragonsploder/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Custom
setopt PROMPT_SUBST
PROMPT='%n@%m: ${(%):-%~} $ '

bindkey '^R' history-incremental-search-backward

path+=('/home/dragonsploder/.local/bin')
export PATH

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export GLFW_IM_MODULE=ibus


# Load Angular CLI autocompletion.
# source <(ng completion script)
