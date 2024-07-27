## Complitions section
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' menu select                              # Highlight menu selection
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZDOTDIR/cache

WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

## Keybindings section
bindkey -N custom
alias bind="bindkey -M custom"
typeset -A key
key=(
  Enter "^M"

  Tab "${terminfo[ht]}"

  Home "${terminfo[khome]}"
  End "${terminfo[kend]}"
  Insert "${terminfo[kich1]}"

  Delete "${terminfo[kdch1]}"
  CtrlDEL "${terminfo[kDC5]}"

  Backspace "${terminfo[kbs]}"
  CtrlBCS "${terminfo[cub1]}"

  PageUP "${terminfo[kpp]}"
  PageDOWN "${terminfo[knp]}"
  
  # Arrows
  Right "${terminfo[kcuf1]}"
  CtrlRA "${terminfo[kRIT5]}"
  Left "${terminfo[kcub1]}"
  CtrlLA "${terminfo[kLFT5]}"
  Up "${terminfo[kcuu1]}"
  Down "${terminfo[kcud1]}"
)

bind "$key[Home]" beginning-of-line
bind "$key[End]" end-of-line

bind "^V" quoted-insert
bind "^[[200~" bracketed-paste

bind "$key[CtrlBCS]" backward-kill-word                         # Delete previous word
bind "^W" backward-kill-word
bind "$key[CtrlDEL]" kill-word                                  # Delete next word
bind "$key[Insert]" overwrite-mode
bind "$key[Delete]" delete-char
bind "$key[Backspace]" backward-delete-char

bind "$key[Right]" forward-char
bind "^[l" forward-char
bind "$key[Left]" backward-char
bind "^[h" backward-char
bind "$key[CtrlRA]" forward-word
bind "^[^l" forward-word
bind "$key[CtrlLA]" backward-word
bind "^[^h" backward-word

bind "$key[Up]" up-line-or-history
bind "^[k" up-line-or-history
bind "$key[Down]" down-line-or-history
bind "^[j" down-line-or-history
bind "$key[PageUP]" history-beginning-search-backward
bind "$key[PageDOWN]" history-beginning-search-forward

bind "$key[Tab]" expand-or-complete

# Common keys
bind "$key[Enter]" accept-line
bind -R " "-"~" self-insert
bind -R "\M-^@"-"\M-^?" self-insert

unset key
unalias bind
bindkey -A custom main                                          # Activate keymap

## Alias section
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias la='ls -A'
alias ll='ls -lah'
