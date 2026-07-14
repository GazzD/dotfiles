# ─────────────────────────────────────────────────────────────
#  ZSH CONFIG — Estilo Fish + Oh My Zsh
#  Prompt: Starship (compartido con Fish)
# ─────────────────────────────────────────────────────────────


# ── HISTORIAL (como Fish) ────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY      # timestamp en cada entrada
setopt INC_APPEND_HISTORY    # escribe al instante
setopt SHARE_HISTORY         # comparte entre sesiones
setopt HIST_IGNORE_DUPS      # ignora duplicados consecutivos
setopt HIST_IGNORE_SPACE     # comandos con espacio no se guardan
setopt HIST_REDUCE_BLANKS    # elimina espacios extras
setopt HIST_NO_STORE         # no guarda history/clear/etc
setopt HIST_VERIFY           # muestra !comando antes de ejecutar


# ── COMPORTAMIENTO FISH-LIKE ─────────────────────────────────
setopt AUTO_CD               # cd sin escribir "cd" (como Fish)
setopt AUTO_LIST             # lista opciones al TAB
setopt AUTO_MENU             # menú automático de completado
setopt COMPLETE_IN_WORD      # completa desde el cursor
setopt INTERACTIVE_COMMENTS  # comentarios # en línea (como Fish)
setopt NO_BEEP               # sin beep molesto
setopt AUTO_PARAM_SLASH


# ── OH MY ZSH (completions y plugins) ────────────────────────
export ZSH="/usr/share/oh-my-zsh"
ZSH_THEME=""                  # Sin tema de OMZ (usamos Starship)

plugins=(
    git
    fzf
    extract
    sudo
)

source $ZSH/oh-my-zsh.sh


# ── COMPLETIONS (menú navegable, descripciones) ─────────────
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' complete-options true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' keep-prefix true

# Formato: sin separadores pesados
zstyle ':completion:*:descriptions' format ' %F{cyan}%d%f'
zstyle ':completion:*:corrections' format ' %F{yellow}%d%f'
zstyle ':completion:*:messages' format ' %F{blue}%d%f'
zstyle ':completion:*:warnings' format ' %F{red}sin resultados%f'

# Búsqueda: mayúsculas, separadores y substrings
zstyle ':completion:*' matcher-list \
    'm:{a-z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' \
    'l:|=* r:|=*'


# ── STARSHIP (prompt compartido con Fish) ────────────────────
eval "$(starship init zsh)"


# ── PLUGINS ADICIONALES ──────────────────────────────────────
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

# FZF (extra: OMZ ya carga el plugin fzf, esto asegura FZF_BASE)
export FZF_BASE=/usr/share/fzf


# ── MAN PAGES con color (como Fish CachyOS) ──────────────────
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


# ── ALIASES ──────────────────────────────────────────────────
alias make="make -j$(nproc)"
alias ninja="ninja -j$(nproc)"
alias n="ninja"
alias rmpkg="sudo pacman -Rsn"
alias cleanch="sudo pacman -Scc"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias update="sudo pacman -Syu"
alias apt="man pacman"
alias apt-get="man pacman"
alias please="sudo"
alias tb="nc termbin.com 9999"
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"
alias jctl="journalctl -p 3 -xb"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias mirror="sudo cachyos-rate-mirrors"
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# eza (reemplazo de ls, como Fish CachyOS)
alias ls='eza -al --color=always --group-directories-first --icons'
alias la='eza -a  --color=always --group-directories-first --icons'
alias ll='eza -l  --color=always --group-directories-first --icons'
alias lt='eza -aT --color=always --group-directories-first --icons'
alias l.="eza -a | grep -e '^\.'"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias c="clear"
alias cat="bat"


# ── BIENVENIDA (como Fish CachyOS) ────────────────────────────
fastfetch


# ── YAZI (file manager) ──────────────────────────────────────
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    command rm -f -- "$tmp"
}


# ── MISE (version manager) ───────────────────────────────────
eval "$(mise activate zsh)"


# ── ZOXIDE (navegación inteligente) ─────────────────────────
eval "$(zoxide init zsh)"


# ── PATH ─────────────────────────────────────────────────────
case ":${PATH}:" in
    *:"$HOME/.local/bin":*) ;;
    *) export PATH="$HOME/.local/bin:$PATH" ;;
esac


# ── DOTFILES SYNC ───────────────────────────────────────────
alias dotfiles-sync="$HOME/Projects/dotfiles/scripts/sync.sh"

# ── SYNTAX HIGHLIGHTING (siempre al final) ──────────────────
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:~/.spicetify

export PATH=$PATH:/home/gazzd/.spicetify
