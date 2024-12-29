(setq user-full-name "Brian Nguyen"
      user-mail-address "brianenguyen@proton.me")

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(map! :leader
      (:prefix ("=" . "open file")
       :desc "Edit doom config.org" "c" #'(lambda () (interactive) (find-file "~/.config/doom/config.org"))
       :desc "Edit doom init.el" "i" #'(lambda () (interactive) (find-file "~/.config/doom/init.el"))
       :desc "Edit doom packages.el" "p" #'(lambda () (interactive) (find-file "~/.config/doom/packages.el"))
       :desc "Edit agenda.org" "a" #'(lambda () (interactive) (find-file "~/GitRepos/notes/Agenda/agenda.org"))
))

(setq org-hide-emphasis-markers t)

(setq display-line-numbers-type 'relative)

(set-face-attribute 'default nil :font "Roboto Mono")
(set-face-attribute 'italic nil :font "Roboto Mono" :slant 'italic)
(setq doom-font (font-spec :family "Roboto Mono" :size 16)
       doom-variable-pitch-font (font-spec :family "Roboto Mono" :size 16)
       doom-big-font (font-spec :family "Roboto Mono" :size 24))

(use-package all-the-icons
  :if (display-graphic-p))

(beacon-mode 1)
(setq beacon-blink-when-point-moves-vertically 1
      beacon-color "#F28AB3" ;; light pink color
      beacon-blink-when-buffer-changes t
      beacon-blink-when-window-scrolls t)

(after! org
  (setq org-agenda-files '("~/GitRepos/notes/Agenda/agenda.org")
      org-journal-dir "~/GitRepos/notes/journal/"
      org-journal-date-format "%A, %Y-%m-%d"
      org-journal-file-type 'monthly
      org-journal-file-format "%Y-%m.org"
      org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
      )
  ;; Needed to fix tabbing on headers
  (setq org-fold-core-style 'overlays)

  (setq org-highest-priority ?A)
  (setq org-lowest-priority ?E)
  (setq org-default-priority ?A)
  (setq org-priority-faces '((?A . error)
                            (?B . warning)
                            (?C . success)
                            (?D . font-lock-doc-face)
                            (?E . font-lock-comment-face)))
)

(setq org-ellipsis " ⤵")

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode))
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/GitRepos/notes/"))
  (require 'org-roam-protocol))
