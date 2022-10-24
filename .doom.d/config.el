(setq user-full-name "Brian Nguyen"
      user-mail-address "brian.edison.nguyen@gmail.com")

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(map! :leader
      (:prefix ("=" . "open file")
       :desc "Edit doom config.org" "c" #'(lambda () (interactive) (find-file "~/.doom.d/config.org"))
       :desc "Edit doom init.el" "i" #'(lambda () (interactive) (find-file "~/.doom.d/init.el"))
       :desc "Edit doom packages.el" "p" #'(lambda () (interactive) (find-file "~/.doom.d/packages.el"))
       :desc "Edit agenda.org" "a" #'(lambda () (interactive) (find-file "~/Documents/notes/agenda.org"))
))

(setq doom-font (font-spec :family "JetBrainsMonoMedium Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15))

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

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (select-frame frame)
            (set-frame-parameter (selected-frame) 'alpha '(90 90)))
   (set-frame-parameter (selected-frame) 'alpha '(90 90))))

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
                          (agenda . 5 )
                          (bookmarks . 5)
                          (projects . 5)
                          (registers . 5))))

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
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
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

(use-package company
  :after lsp-mode
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
          ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
          ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.1))

(use-package emmet-mode
  :ensure t
  :config
  (add-to-list 'emmet-jsx-major-modes 'jsx-mode))

(map! :leader
      :desc "Toggle emmet mode"
      "e m" #'emmet-mode)

(use-package hippie-exp
  :ensure nil
  :defer t
  :bind ("<C-return>" . hippie-expand)
  :config
  (setq-default hippie-expand-try-functions-list
                '(yas-hippie-try-expand emmet-expand-line)))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(require 'neotree)
(with-eval-after-load 'doom-themes
  (doom-themes-neotree-config)
  (setq doom-themes-neotree-file-icons t)
 )

(after! org
  (setq org-agenda-files '("~/Documents/notes/agenda.org")
      org-journal-dir "~/Documents/notes/journal/"
      org-journal-date-format "%A, %Y-%m-%d"
      org-journal-file-type 'monthly
      org-journal-file-format "%Y-%m.org"
      org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
      )
  ;; Needed to fix tabbing on headers
  (setq org-fold-core-style 'overlays)
)

(setq org-ellipsis " ⤵")

(after! org
  (setq org-roam-directory "~/Documents/notes/"))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(map! :leader
      :desc "Toggle org-roam-ui-mode"
      "n r u" #'org-roam-ui-mode)

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(setq org-publish-use-timestamps-flag nil)
(setq org-export-with-broken-links t)
(setq org-publish-project-alist
      '(("Life"
         :base-directory "~/Documents/notes/Life/"
         :base-extension "org"
         :publishing-directory "~/Documents/notes/Life/html"
         :recursive t
         :exclude "org-html-themes/.*"
         :publishing-function org-html-publish-to-html
         :auto-preamble t)
        ("org-static"
         :base-directory "~/Documents/notes/Life/"
         :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Documents/notes/Life/html/"
         :recursive t
         :exclude "org-html-themes/.*\\|html/"
         :publishing-function org-publish-attachment
    ))
)

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                (list 'org-agenda-mode)))
     (rainbow-mode 1))))
(global-rainbow-mode 1 )
