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
(setq doom-theme 'doom-one)

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

(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'latte) ;; or 'latte, 'macchiato, or 'mocha
;;(catppuccin-reload)

(setq confirm-kill-emacs nil)

(setq org-list-allow-alphabetical t)

(setq org-image-actual-width nil)

(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 28))

(doom! :completion (ivy +fuzzy ivy-rich))

(after! ivy-rich
  (ivy-rich-modify-columns
   'counsel-rg
   '((counsel-projectile-rg . (:width 0.6))
     (ivy-rich-counsel-function-docstring . (:face font-lock-doc-face)))))

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

;; This syntaxe should work all the time
(define-key general-override-mode-map (kbd "M-n") 'evil-window-down)
;; (map! :map 'override "SPC s s" #'find-file)

(global-set-key (kbd "C-h") 'switch-to-last-buffer)

(after! vertico
  (map!
   :n "SPC s s" #'find-file))

(define-key minibuffer-local-map (kbd "C-e") 'previous-line)
;; (define-key org-agenda-keymap (kbd "n") 'org-agenda-next-item)
;; (define-key org-agenda-keymap (kbd "e") 'org-agenda-previous-item)

;; (map!
;;  :after calendar
;;  :map calendar-mode-map
;;  "C-i" #'calendar-forward-day
;;  "C-h" #'calendar-backward-day
;;  "C-n" #'calendar-forward-week
;;  "C-e" #'calendar-backward-week)

(map!
 ;; :i "C-e" #'evil-complete-previous

 :n "C-n" #'evil-scroll-down
 :n "C-e" #'evil-scroll-up
 :n "C-e" #'evil-scroll-up
 :n "n" #'evil-next-line
 :n "e" #'evil-previous-line
 :n "i" #'evil-forward-char
 :m "n" #'evil-next-line
 :m "e" #'evil-previous-line
 :m "i" #'evil-forward-char

 :n "k" #'evil-next-match
 :n "K" #'evil-previous-match
 :v "k" #'evil-next-match
 :v "K" #'evil-previous-match

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

(map! :map org-agenda-mode-map "n" 'org-agenda-next-line)
(map! :map org-agenda-mode-map "e" 'org-agenda-previous-line)
;; (map! :map org-agenda-mode-map "m" 'org-agenda-month-view)
