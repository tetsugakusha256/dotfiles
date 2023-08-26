# Keybinding vicmd keymap
bindkey -M vicmd "^D" list-choices
bindkey -M vicmd "^G" list-expand
# Backspace and <c-h>
bindkey -M vicmd "^H" vi-backward-char
bindkey -M vicmd "^J" accept-line
bindkey -M vicmd "^L" clear-screen
bindkey -M vicmd "^M" accept-line

# bindkey -M vicmd "^N" down-history
# bindkey -M vicmd "^E" up-history

bindkey -M vicmd "^R" redo
bindkey -M vicmd "^[" beep
bindkey -M vicmd "^[OA" up-line-or-history
bindkey -M vicmd "^[OB" down-line-or-history
bindkey -M vicmd "^[OC" vi-forward-char
bindkey -M vicmd "^[OD" vi-backward-char
bindkey -M vicmd "^[[200~" bracketed-paste
bindkey -M vicmd "^[[A" up-line-or-history
bindkey -M vicmd "^[[B" down-line-or-history
bindkey -M vicmd "^[[C" vi-forward-char
bindkey -M vicmd "^[[D" vi-backward-char
bindkey -M vicmd " " vi-forward-char
bindkey -M vicmd "\"" vi-set-buffer
bindkey -M vicmd "#" pound-insert
bindkey -M vicmd "\$" vi-end-of-line
bindkey -M vicmd "%" vi-match-bracket
bindkey -M vicmd "'" vi-goto-mark-line
bindkey -M vicmd "+" vi-down-line-or-history
bindkey -M vicmd "," vi-rev-repeat-find
# bindkey -M vicmd "-" vi-up-line-or-history
bindkey -M vicmd "." vi-repeat-change
bindkey -M vicmd "/" history-incremental-search-backward
# Remap incremental history search to Ctrl+S
bindkey -M isearch '^E' history-incremental-pattern-search-backward
bindkey -M isearch '^N' history-incremental-pattern-search-forward
# bindkey -M isearch '^H' backward-delete-char

bindkey -M vicmd "_" vi-digit-or-beginning-of-line

bindkey -M vicmd "1"-"9" digit-argument
bindkey -M vicmd ":" execute-named-cmd
bindkey -M vicmd ";" vi-repeat-find
bindkey -M vicmd "<" vi-unindent
bindkey -M vicmd "=" list-choices
bindkey -M vicmd ">" vi-indent
# bindkey -M vicmd "?" vi-history-search-forward
bindkey -M vicmd "?" history-incremental-search-forward
bindkey -M vicmd "A" vi-add-eol
bindkey -M vicmd "B" vi-backward-blank-word
bindkey -M vicmd "C" vi-change-eol
bindkey -M vicmd "D" vi-kill-eol
bindkey -M vicmd "E" vi-forward-blank-word-end
bindkey -M vicmd "F" vi-find-prev-char
bindkey -M vicmd "G" vi-fetch-history

bindkey -M vicmd "L" vi-insert-bol
bindkey -M vicmd "J" vi-join
bindkey -M vicmd "N" vi-rev-repeat-search
bindkey -M vicmd "O" vi-open-line-above
bindkey -M vicmd "P" vi-put-before
bindkey -M vicmd "R" vi-replace
bindkey -M vicmd "S" vi-change-whole-line
bindkey -M vicmd "T" vi-find-prev-char-skip
bindkey -M vicmd "V" visual-line-mode
bindkey -M vicmd "W" vi-forward-blank-word
bindkey -M vicmd "X" vi-backward-delete-char
bindkey -M vicmd "Y" vi-yank-whole-line
bindkey -M vicmd "\^" vi-first-non-blank
bindkey -M vicmd "\`" vi-goto-mark
bindkey -M vicmd "a" vi-add-next
bindkey -M vicmd "b" vi-backward-word
bindkey -M vicmd "c" vi-change
bindkey -M vicmd "d" vi-delete

bindkey -M vicmd "k" vi-forward-word-end
bindkey -M vicmd "f" vi-find-next-char
bindkey -M vicmd "gE" vi-backward-blank-word-end
bindkey -M vicmd "gU" vi-up-case
bindkey -M vicmd "gUU" "gUgU"
bindkey -M vicmd "ga" what-cursor-position
bindkey -M vicmd "ge" vi-backward-word-end
bindkey -M vicmd "gg" beginning-of-buffer-or-history
bindkey -M vicmd "gu" vi-down-case
bindkey -M vicmd "guu" "gugu"
bindkey -M vicmd "g~" vi-oper-swap-case
bindkey -M vicmd "g~~" "g~g~"
bindkey -M vicmd "h" vi-backward-char

bindkey -M vicmd "l" vi-insert

bindkey -M vicmd "n" down-line-or-history

bindkey -M vicmd "e" up-line-or-history

bindkey -M vicmd "i" vi-forward-char
bindkey -M vicmd "m" vi-set-mark

bindkey -M vicmd "j" vi-repeat-search
bindkey -M vicmd "o" vi-open-line-below
bindkey -M vicmd "p" vi-put-after
bindkey -M vicmd "r" vi-replace-chars
bindkey -M vicmd "s" vi-substitute
bindkey -M vicmd "t" vi-find-next-char-skip
bindkey -M vicmd "u" undo

bindkey -M vicmd "v" edit-command-line
# bindkey -M vicmd "v" visual-mode
bindkey -M vicmd "w" vi-forward-word
bindkey -M vicmd "x" vi-delete-char
bindkey -M vicmd "y" vi-yank
bindkey -M vicmd "|" vi-goto-column
bindkey -M vicmd "~" vi-swap-case
bindkey -M vicmd "^?" vi-backward-char

# Keybinding viins keymap
bindkey -M viins "^A"-"^C" self-insert
bindkey -M viins "^D" list-choices
bindkey -M viins "^E"-"^F" self-insert
bindkey -M viins "^G" list-expand
# Backspace and <c-h>
bindkey -M viins "^H" backward-delete-char
bindkey -M viins "^I" expand-or-complete
bindkey -M viins "^J" accept-line
bindkey -M viins "^K" self-insert
bindkey -M viins "^L" clear-screen
bindkey -M viins "^M" accept-line
# bindkey -M viins "^N"-"^P" self-insert
bindkey -M viins "^Q" vi-quoted-insert
bindkey -M viins "^R" redisplay
bindkey -M viins "^S"-"^T" self-insert
bindkey -M viins "^U" vi-kill-line
bindkey -M viins "^V" vi-quoted-insert
bindkey -M viins "^W" vi-backward-kill-word
bindkey -M viins "^X^R" _read_comp
bindkey -M viins "^X?" _complete_debug
bindkey -M viins "^XC" _correct_filename
bindkey -M viins "^Xa" _expand_alias
bindkey -M viins "^Xc" _correct_word
bindkey -M viins "^Xd" _list_expansions
bindkey -M viins "^Xe" _expand_word
bindkey -M viins "^Xh" _complete_help
bindkey -M viins "^Xm" _most_recent_file
bindkey -M viins "^Xn" _next_tags
bindkey -M viins "^Xt" _complete_tag
bindkey -M viins "^X~" _bash_list-choices
bindkey -M viins "^Y"-"^Z" self-insert
bindkey -M viins "^[" vi-cmd-mode
bindkey -M viins "^[," _history-complete-newer
bindkey -M viins "^[/" _history-complete-older
bindkey -M viins "^[OA" up-line-or-history
bindkey -M viins "^[OB" down-line-or-history
bindkey -M viins "^[OC" vi-forward-char
bindkey -M viins "^[OD" vi-backward-char
bindkey -M viins "^[[200~" bracketed-paste
bindkey -M viins "^[[A" up-line-or-history
bindkey -M viins "^[[B" down-line-or-history
bindkey -M viins "^[[C" vi-forward-char
bindkey -M viins "^[[D" vi-backward-char
bindkey -M viins "^[~" _bash_complete-word
bindkey -M viins "^\\\\"-"~" self-insert
bindkey -M viins "^?" vi-backward-delete-char
bindkey -M viins "\M-^@"-"\M-^?" self-insert

bindkey -M visual "i" vi-forward-char
