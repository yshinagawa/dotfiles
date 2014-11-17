;;; init.el --- yoshiki shinagawa's init.el for GNU Emacs

;;; Commentary:

;;; Code:

;; package-initialize
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; add load-path
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; init-loader
;(require 'init-loader)
;(setq init-loader-show-log-after-init nil)
;(init-loader-load "~/.emacs.d/init")

;; global emacs style
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-linum-mode t)
(setq linum-format "%4d ")
;(blink-cursor-mode 0)
(setq x-stretch-cursor t)
(setq-default cursor-type '(bar . 1))
(setq-default cursor-in-non-selected-windows nil)
(line-number-mode t)
(column-number-mode t)

(defun set-xterm-title ()
  "Set window title for xterm."
  (xterm-set-window-title
   (concat (buffer-name)(format " @ Emacs %s" emacs-version))))
(when (not window-system)
  (require 'xterm-frobs)
  (add-hook 'window-configuration-change-hook 'set-xterm-title)
  (add-hook 'emacs-startup-hook 'set-xterm-title))

;; global language
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

;; global edit style
(show-paren-mode t)
;(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)
(global-font-lock-mode t)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; abbrev-mode
(setq save-abbrevs nil)
(setq-default abbrev-mode t)

;; placing all backup files in one directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; whitespace
(setq whitespace-style '(face tabs tab-mark spaces space-mark trailing space-before-tab space-after-tab::space))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))
(global-whitespace-mode t)
(set-face-attribute 'whitespace-trailing nil
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :foreground "GreenYellow"
                    :weight 'bold)

;; exec-path-from-shell
(exec-path-from-shell-initialize)


;; dirtree
(require 'dirtree)

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; autopair
(require 'autopair)
(autopair-global-mode)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; anzu
(global-anzu-mode +1)
(setq anzu-mode-lighter "")
(setq anzu-deactivate-region t)
(setq anzu-search-threhold 1000)
(setq anzu-replace-to-string-separator " => ")
(global-set-key (kbd "C-c %") 'anzu-query-replace)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)

;; helm
(require 'helm-config)
(require 'helm-ag)
(require 'helm-descbinds)
(helm-descbinds-mode)
(global-set-key (kbd "C-c ;") 'helm-mini)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c b") 'helm-descbinds)
(global-set-key (kbd "C-c o") 'helm-occur)
(global-set-key (kbd "C-c s") 'helm-ag)
(global-set-key (kbd "C-c y") 'helm-show-kill-ring)

;; magit
(require 'magit)

;; auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140414.2324/dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-no-redo)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; quickrun
(require 'quickrun)
(global-set-key (kbd "<f5>") 'quickrun)

;; w3m
(setq browse-url-browser-function 'w3m-goto-url-new-session)
(setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")
(defun hn ()
  "Go to Hacker News."
  (interactive)
  (browse-url "http://news.ycombinator.com"))

;; elisp
(defun elisp-mode-hooks()
  "Lisp mode hooks."
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)

;; slime
(setf inferior-lisp-program "/usr/local/bin/sbcl")
(require 'slime-autoloads)
(slime-setup '(slime-repl slime-fancy slime-banner slime-indentation))
(setq slime-net-coding-system 'utf-8-unix)

;; ac-slime
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; popwin
(require 'popwin)
(popwin-mode 1)
(push '("*slime-apropos*") popwin:special-display-config)
(push '("*slime-macroexpansion*") popwin:special-display-config)
(push '("*slime-description*") popwin:special-display-config)
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
(push '("*slime-xref*") popwin:special-display-config)
(push '(sldb-mode :stick t) popwin:special-display-config)
(push '(slime-repl-mode) popwin:special-display-config)
(push '(slime-connection-list-mode) popwin:special-display-config)

;; ruby
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; scss
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(setq scss-compile-at-save nil)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 2)
(setq js2-highlight-level 3)
(add-hook 'js2-mode-hook (lambda () (electric-layout-mode -1)))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; coffee-mode
(setq whitespace-action '(auto-cleanup))
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
(custom-set-variables '(coffee-tab-width 2))

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; flycheck
(require 'flycheck)
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
;(add-hook 'ruby-mode-hook 'flycheck-mode)
(flycheck-define-checker ruby-rubocop
  "A Ruby syntax and style checker using the RuboCop tool."
  :command ("rubocop" "--format" "emacs" "--silent"
            (config-file "--config" flycheck-rubocoprc)
            source)
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
            line-end)
   (error line-start
          (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
          line-end))
  :modes (ruby-mode))
(flycheck-define-checker ruby-rubylint
  "A Ruby syntax and style checker using the rubylint tool."
  :command ("ruby-lint" source)
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
            line-end)
   (error line-start
          (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
          line-end))
  :modes (ruby-mode))

;; general key-map
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-t") 'other-window)
(define-key global-map (kbd "s-0") 'delete-window)
(define-key global-map (kbd "s-1") 'delete-other-windows)

;; minibuffer history key-map
(define-key minibuffer-local-map (kbd "M-p") 'previous-complete-history-element)
(define-key minibuffer-local-map (kbd "M-n") 'next-complete-history-element)
(define-key minibuffer-local-map (kbd "M-r") 'previous-matching-history-element)
(define-key minibuffer-local-map (kbd "M-s") 'next-matching-history-element)

;; theme
(when (not window-system)
  (load-theme 'zenburn t))

;; Cocoa Emacs
(when window-system
  ;; global emacs style
  (menu-bar-mode 1)
  (scroll-bar-mode 0)
  (fringe-mode 0)
  (add-to-list 'default-frame-alist '(height . 48))
  (add-to-list 'default-frame-alist '(width . 95))
  (set-face-attribute 'default nil
                      :family "Source Code Pro"
                      :height 130)
  (set-fontset-font nil 'japanese-jisx0208
                    (font-spec :family "Hiragino Maru Gothic Pro"))
  ;(global-hl-line-mode t)
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b")) " @ Emacs " emacs-version))
  (setq ring-bell-function 'ignore)

  ;; magit
  (set-variable 'magit-emacsclient-executable "/usr/local/Cellar/emacs/24.3/bin/emacsclient")

  ;; theme
  (load-theme 'zenburn t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ; customize for zenburn theme
 '(anzu-mode-line ((t :foreground "#8FB28F")))
 ;'(fringe ((t (:background "gray15"))))
 '(vertical-border ((t (:foreground "#303030"))))
 '(isearch ((t (:background "#2B2B2B" :foreground "#F0DFAF"))))
 '(default ((t (:foreground "#F6F3E8"))))
 '(font-lock-comment-face ((t (:slant italic))))
 '(show-paren-match ((t (:weight normal :background nil :underline "#F6F3E8"))))
 '(w3m-header-line-location-title ((t (:background "gray20" :foreground "#F0DFAF" :underline t :weight bold))))
 '(w3m-header-line-location-content ((t (:background "gray20" :foreground "#F0DFAF" :underline t :wight bold))))
 '(w3m-image-anchor ((t (:background "dark green"))))
 )

(provide 'init)

;; Local Variables:
;; flycheck-checker: emacs-lisp-checkdoc
;; End:

;;; init.el ends here
