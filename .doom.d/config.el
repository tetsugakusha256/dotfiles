;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
;;(catppuccin-reload)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/MyOrg")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(setq confirm-kill-emacs nil)

(setq org-list-allow-alphabetical t)

(setq org-image-actual-width nil)

(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 32))

;; Todo keyword
;; ! = record a timestamp when set
;; @ = timestamp + note when set
(after! org
(setq org-agenda-files
      (directory-files-recursively "~/Documents/MyOrg" "\\.org$"))
(setq org-todo-keywords
      '((sequence "IDEA(i)" "DOING(g)" "TODO(t)"  "|" "DONE(d)" "CANCELED(c)")
        (sequence "BUG(B)" "KNOWNCAUSE(k)" "TOFIX(r)" "|" "FIXED(f)")
        (sequence "NEED_DL(l)" "|" "DOWNLOADED(L)")
        (sequence "WANT(w)" "NEED(n)" "|" "BOUGHT(b)"))))
;; add projects accessed with SPC p p or open file in project with SPC SPC
;; (after! projectile
;; (projectile-add-known-project “~/Documents/MyOrg”)
;;   )
;; Allow time logging when setting a todo to done
(setq org-log-done 'time)

(doom! :completion (ivy +fuzzy ivy-rich))

(after! ivy-rich
  (ivy-rich-modify-columns
   'counsel-rg
   '((counsel-projectile-rg . (:width 0.6))
     (ivy-rich-counsel-function-docstring . (:face font-lock-doc-face)))))

(add-hook 'org-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 90)

(defun toggle-checkbox ()
  "Toggle the checkbox state at point."
  (interactive)
  (when (org-at-item-checkbox-p)
    (org-toggle-checkbox)))
(map! :map org-mode-map
      "C-SPC" #'toggle-checkbox)

(defun switch-to-last-buffer ()
  (interactive)
  (switch-to-buffer nil))

;; (define-key general-override-mode-map (kbd "SPC w w") #'(lambda () (interactive) (find-file "~/.bashrc")))
;; (map! :map 'override "SPC s s" #'find-file)



;; Removes ESC as a prefix globaly (used to be map, and anoying)
(global-set-key (kbd "<escape>")      'keyboard-escape-quit)
(global-set-key (kbd "C-h") 'switch-to-last-buffer)

;; This syntaxe should work all the time
(define-key general-override-mode-map (kbd "M-n") 'evil-window-down)

(after! vertico
  (map!
   :n "SPC s s" #'find-file))

(define-key minibuffer-local-map (kbd "C-e") 'previous-line)

;; (map!
;;  :after calendar
;;  :map calendar-mode-map
;;  "C-i" #'calendar-forward-day
;;  "C-h" #'calendar-backward-day
;;  "C-n" #'calendar-forward-week
;;  "C-e" #'calendar-backward-week)


(defun decrement-first-number ()
  "Increment the first number in the current line."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (re-search-forward "[0-9]+" nil t)
    (replace-match (number-to-string (1- (string-to-number (match-string 0)))))))
(defun increment-first-number ()
  "Increment the first number in the current line."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (re-search-forward "[0-9]+" nil t)
    (replace-match (number-to-string (1+ (string-to-number (match-string 0)))))))


(pixel-scroll-precision-mode 1)
(setq org-table-formula-evaluate-inline t)

;; --------------------------------------------------
;; Capture
;; --------------------------------------------------
(defun get-org-anniversary-string ()
  "Return the string 'org-anniversary'."
  "(org-anniversary")
(setq org-cycle-separator-lines -1)
(after! org
  (setq org-capture-templates
        '(
          ("b" "[B]uying list"
           entry (file+headline "~/Documents/MyOrg/Shopping_list_buying.org" "Stuff I need to buy")
           "*** NEED %?"
           :prepend t
           :empty-lines 0)
          ("f" "[F]inance"
           table-line (file+datetree "~/Documents/MyOrg/Money_Management_Finances.org")
           "| %u | %^{Price} | %^{Type} |"
           :tree-type month
           :immediate-finish t
           ;; This means relative to the 3rd(III) ----- line go one up (-1)
           :table-line-pos "III-1"
           :empty-lines 0)
          ("g" "[G]ame Waitlist"
           entry (file+headline "~/Documents/MyOrg/Waitlist_watchlist.org" "Games")
           "** %?\n %{Game Release Date}^t"
           :empty-lines 0)
          ("M" "[M]ovie to download"
           entry (file+olp "~/Documents/MyOrg/Movies_and_Series.org" "To Download" "Movies" "Newly added")
           "**** NEED_DL  %^{Movie Title}"
           :immediate-finish t
           :empty-lines 0)
          ("S" "[S]eries to download"
           entry (file+olp "~/Documents/MyOrg/Movies_and_Series.org" "To Download" "Series" "Newly added")
           "**** NEED_DL  %^{Serie Title}"
           :immediate-finish t
           :empty-lines 0)
          ("A" "[A]nime to download"
           entry (file+olp "~/Documents/MyOrg/Movies_and_Series.org" "To Download" "Animes" "Newly added")
           "**** NEED_DL  %^{Anime Title}"
           :immediate-finish t
           :empty-lines 0)
          ("m" "[M]ovie Waitlist"
           entry (file+headline "~/Documents/MyOrg/Waitlist_watchlist.org" "Movies")
           "** %?\n %^{Movie Release Date}t"
           :empty-lines 0)
          ("s" "[S]how Waitlist"
           entry (file+headline "~/Documents/MyOrg/Waitlist_watchlist.org" "Shows")
           "** %?\n %^{Show Release Date}t"
           :empty-lines 0)
          ("e" "[E]vent Waitlist"
           entry (file+headline "~/Documents/MyOrg/Waitlist_watchlist.org" "Events")
           "** %?\n %^{Events Date}t"
           :empty-lines 0)
          ("B" "[B]irthday"
           plain (file+headline "~/Documents/MyOrg/Birthdays.org" "Birthdays")
           "%%%(get-org-anniversary-string) %^{YEAR} %^{MONTH} %^{DAY} \) %^{NAME} %d years old"
           :immediate-finish t
           :empty-lines 0)
          ("n" "Quick [n]ote"
           entry (file+datetree "~/Documents/MyOrg/quick_note_to_be_added_later.org")
           "* %?"
           :empty-lines 0)
          ("t" "[T]asks"
           entry (file+headline "~/Documents/MyOrg/Todo_list.org" "Quick Tasks")
           "* TODO %?"
           :empty-lines 0)
          ("o" "[O]rg tasks"
           entry (file+headline "~/Documents/MyOrg/Todo_list.org" "Org/Wiki Tasks")
           "* TODO %?"
           :empty-lines 0)
          ("l" "[L]ife tasks"
           entry (file+headline "~/Documents/MyOrg/Todo_list.org" "Life Tasks")
           "* TODO %?"
           :empty-lines 0)
          ("c" "[C]omputer tasks"
           entry (file+headline "~/Documents/MyOrg/Todo_list.org" "Computer Tasks")
           "* TODO %?"
           :empty-lines 0)
          ("j" "[J]apanese tasks"
           entry (file+headline "~/Documents/MyOrg/Todo_list.org" "Japanese Tasks")
           "* TODO %?"
           :empty-lines 0)
          )))

;; --------------------------------------------------
;; AGENDA
;; --------------------------------------------------
;; remaps org-agenda to just SPC o a

(map! :leader
      :desc "org-agenda" "o a" #'org-agenda)
(setq org-tag-alist '((:startgrouptag)
                      ("Life")
                      (:grouptags)
                      ("Buy")
                      (:endgrouptag)
                      (:startgrouptag)
                      ("Computer")
                      (:grouptags)
                      ("MyOrg")
                      ("nvim")
                      (:endgrouptag)))
(setq org-agenda-custom-commands
      '(("." tags-todo "+Today")
        ("l" tags-todo "+Life")
        ("c" tags-todo "+Computer")
        ("b" tags-todo "+Buy")
        ("j" tags-todo "+Japanese")
        ("d" todo "DONE")
        ("D" todo-tree "DONE")
        ("o" todo "TODO")
        ("O" todo-tree "TODO")
        ("n" todo "NEED")
        ("N" todo-tree "NEED")
        ("i" todo "IDEA")
        ("I" todo-tree "IDEA")))
;; Remapping of org-agenda keys
(after! evil-org-agenda
  (map! :map evil-org-agenda-mode-map
        :m "i" #'org-agenda-switch-to
        :m "N" #'org-agenda-priority-down
        :m "E" #'org-agenda-priority-up
        :m "H" #'org-agenda-todo-previousset
        :m "I" #'org-agenda-todo-nextset
        :m "»" #'org-agenda-next-item
        :m "«" #'org-agenda-previous-item
        ;; v = view
        :m "v n" #'org-agenda-fortnight-view
        :m "v m" #'org-agenda-month-view
        :m "v y" #'org-agenda-year-view
        ))
;; TODO make it work
(after! evil-org
(map! :map evil-org-mode-map
      :n "H" #'org-shiftleft
      :n "¬" #'org-shiftleft
      :n "I" #'org-shiftright
      :v "i" #'evil-forward-char))

;; ------------------------------ 
;; Custom
;; ------------------------------ 

(defvar my-search-directory "~/Documents/MyOrg")

(defun my-search-in-myorg ()
  "Search in myorg"
  (interactive)
  (counsel-rg nil my-search-directory))

(map! :leader
      (:prefix ("s" . "search")
       :desc "Search MyOrg" "o" #'my-search-in-myorg))


;; Increment decrement
(map! :desc "Decrement first number"
      "C-S-a" #'decrement-first-number
      :desc "Increment first number"
      "C-a" #'increment-first-number)

;; Go to next/previous link
(after! org
(map! :desc "Go to next link"
      "»" #'org-next-link
      :desc "Go to prev link"
      "«" #'org-previous-link)
        )

;; ------------------------------ 
;; VIM/evil Mappings 
;; ------------------------------ 
(after! evil-motion-state
  (map! :map evil-motion-state-map
        :m "C-n" #'evil-scroll-down
        :m "C-e" #'evil-scroll-up
        ))

(after! evil-visual-state
  (map! :map evil-visual-state-map
        'override "i" #'evil-forward-char
        ))
(map!
 ;; :i "C-e" #'evil-complete-previous
 :n "C-h" #'switch-to-last-buffer

 :n "C-n" #'evil-scroll-down
 :n "C-e" #'evil-scroll-up
 :m "C-n" #'evil-scroll-down
 :m "C-e" #'evil-scroll-up
 :n "n" #'evil-next-line
 :n "e" #'evil-previous-line
 :n "i" #'evil-forward-char
 :m "n" #'evil-next-line
 :m "e" #'evil-previous-line
 :m "i" #'evil-forward-char

 :n "k" #'evil-ex-search-next
 :n "K" #'evil-ex-search-previous
 :v "k" #'evil-ex-search-next
 :v "K" #'evil-ex-search-previous

 :n "M-+" #'doom/increase-font-size

 :n "SPC s s" #'find-file

 :n "M-n" #'evil-window-down
 :n "M-e" #'evil-window-up
 :n "M-h" #'evil-window-left
 :n "M-i" #'evil-window-right
 :n "M-a" #'evil-window-split
 :n "M-o" #'evil-window-new
 :n "M-v" #'evil-window-vsplit
 :n "M-w" #'evil-window-delete

 :n "C-q" #'save-buffers-kill-terminal

 :n "C-u" #'company-select-previous

 :n "j" #'evil-forward-word-end

 :n "l" #'evil-insert
 :n "L" #'evil-insert-0-line
 :n "n" #'evil-next-line
 :n "e" #'evil-previous-line
 :n "C-s" #'save-buffer
 :n "SPC p" #'clipboard-yank
 :n "SPC y" #'+default/yank-pop

 :v "i" #'evil-forward-char
 :v "l" #'evil-insert
 :v "n" #'evil-next-line
 :v "e" #'evil-previous-line

 )
;; (map! :map org-agenda-mode-map "m" 'org-agenda-month-view)
