(setq user-full-name "Brian Nguyen"
      user-mail-address "brian.edison.nguyen@gmail.com")

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15))

(setq doom-theme 'doom-one)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-frame-parameter (selected-frame) 'alpha '(90 90))

(setq display-line-numbers-type 'relative)

(beacon-mode 1)
(setq beacon-blink-when-point-moves-vertically 1)
(setq beacon-blink-when-buffer-changes t)
(setq beacon-blink-when-window-scrolls t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-banner-logo-title "Welcome to Doom Emacs!"
   dashboard-startup-banner "~/.doom.d/doom-emacs-dash.png"
   dashboard-set-heading-icons t
   dashboard-set-file-icons t
   dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 5)
                          (projects . 5)
                          (registers . 5)))

(after! org
  (setq org-directory "~/org/")
  (setq org-agenda-files '("~/Documents/journal/agenda.org"))
  (setq org-journal-dir "~/Documents/journal/"
      org-journal-file-header "#+TITLE: %M %Y"
      org-journal-date-format "%A, %Y-%m-%d"
      org-journal-file-type 'monthly
      org-journal-file-format "%Y-%m.org")
  ;; Needed to fix tabbing on headers
  (setq org-fold-core-style 'overlays)
)

(global-set-key (kbd "C-c c") '=calendar)

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(require 'neotree)
