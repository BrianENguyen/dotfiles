(setq user-full-name "Brian Nguyen"
      user-mail-address "brianenguyen@proton.me")

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(map! :leader
      (:prefix ("=" . "open file")
       :desc "Edit doom config.org" "c" #'(lambda () (interactive) (find-file "~/.config/doom/config.org"))
       :desc "Edit doom init.el" "i" #'(lambda () (interactive) (find-file "~/.config/doom/init.el"))
       :desc "Edit doom packages.el" "p" #'(lambda () (interactive) (find-file "~/.config/doom/packages.el"))
       :desc "Edit agenda.org" "a" #'(lambda () (interactive) (find-file "~/GitRepos/notes/agenda.org"))
))

(setq org-hide-emphasis-markers t)

(setq display-line-numbers-type 'relative)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :init
  (load-theme 'doom-one t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;;(setq doom-font (font-spec :family "JetBrains Mono" :size 15)
;;       doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 15)
;;       doom-big-font (font-spec :family "JetBrains Mono" :size 24))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(use-package all-the-icons
  :if (display-graphic-p))

;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (select-frame frame)
            (set-frame-parameter (selected-frame) 'alpha '(95 95)))
   (set-frame-parameter (selected-frame) 'alpha '(95 95))))

(beacon-mode 1)
(setq beacon-blink-when-point-moves-vertically 1
      beacon-color "#F28AB3" ;; light pink color
      beacon-blink-when-buffer-changes t
      beacon-blink-when-window-scrolls t)

(evil-define-key 'normal ibuffer-mode-map
  (kbd "f c") 'ibuffer-filter-by-content
  (kbd "f d") 'ibuffer-filter-by-directory
  (kbd "f f") 'ibuffer-filter-by-filename
  (kbd "f m") 'ibuffer-filter-by-mode
  (kbd "f n") 'ibuffer-filter-by-name
  (kbd "f x") 'ibuffer-filter-disable
  (kbd "g h") 'ibuffer-do-kill-lines
  (kbd "g H") 'ibuffer-update)

(global-set-key (kbd "C-c c") '=calendar)

(setq holiday-general-holidays nil
      holiday-christian-holidays nil
      holiday-hebrew-holidays nil
      holiday-islamic-holidays nil
      holiday-bahai-holidays nil
      holiday-oriental-holidays nil)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(after! dashboard
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))
   dashboard-banner-logo-title "\nKEYBINDINGS\
                                 \nFind file          (SPC .)\
                                 \nEdit Doom Config   (SPC = c)\
                                 \nEdit Doom Init     (SPC = i)\
                                 \nEdit Doom Packages (SPC = p)\
                                 \nEdit agenda        (SPC = a)"
   dashboard-startup-banner "~/.doom.d/splash/doomEmacsDoomOne.svg"
   dashboard-set-heading-icons t
   dashboard-set-file-icons t
   dashboard-items '((recents . 5)
                          (agenda . 8)
                          (bookmarks . 5)
                          (projects . 5))))

(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file" "d v" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "O") 'dired-do-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "+") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines
  (kbd "% l") 'dired-downcase
  (kbd "% m") 'dired-mark-files-regexp
  (kbd "% u") 'dired-upcase
  (kbd "* %") 'dired-mark-files-regexp
  (kbd "* .") 'dired-mark-extension
  (kbd "* /") 'dired-mark-directories
  (kbd "; d") 'epa-dired-do-decrypt
  (kbd "; e") 'epa-dired-do-encrypt)
;; Get file icons in dired
;; (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files/")

(use-package emojify
  :hook (after-init . global-emojify-mode))

;; needed to work in emacsclient
(require 'centaur-tabs)
(setq centaur-tabs-set-bar 'over
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-modified-marker "•")

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(after! org
  (setq org-agenda-files '("~/GitRepos/notes/agenda.org")
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

(setq org-fancy-priorities-list '((?A . "🟥")
                                  (?B . "🟧")
                                  (?C . "🟨")
                                  (?D . "🟩")
                                  (?E . "🟦")
                                  ))
)

(setq org-ellipsis " ⤵")

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(setq org-publish-use-timestamps-flag nil)
(setq org-export-with-broken-links t)
(setq org-publish-project-alist
      '(("Life"
         :base-directory "~/GitRepos/notes/Life/"
         :base-extension "org"
         :publishing-directory "~/GitRepos/notes/Life/html"
         :recursive t
         :exclude "org-html-themes/.*"
         :publishing-function org-html-publish-to-html
         :auto-preamble t)
        ("org-static"
         :base-directory "~/GitRepos/notes/Life/"
         :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/GitRepos/notes/Life/html/"
         :recursive t
         :exclude "org-html-themes/.*\\|html/"
         :publishing-function org-publish-attachment
    ))
)

;; (setq initial-buffer-choice "~/.config/doom/start.org")

;; (define-minor-mode start-mode
;;   "Provide functions for custom start page."
;;   :lighter " start"
;;   :keymap (let ((map (make-sparse-keymap)))
;;           ;;(define-key map (kbd "M-z") 'eshell)
;;             (evil-define-key 'normal start-mode-map
;;               (kbd "1") '(lambda () (interactive) (find-file "~/.config/doom/config.org"))
;;               (kbd "2") '(lambda () (interactive) (find-file "~/.config/doom/init.el"))
;;               (kbd "3") '(lambda () (interactive) (find-file "~/.config/doom/packages.el")))
;;           map))
;;
;; (add-hook 'start-mode-hook 'read-only-mode) ;; make start.org read-only; use 'SPC t r' to toggle off read-only.
;; (provide 'start-mode)
