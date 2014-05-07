;;; init.el --- yoshiki shinagawa's init.el for GNU Emacs

;;; Commentary:

;;; Code:

;; package-initialize
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; global emacs style
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-linum-mode t)
(setq linum-format "%4d ")
(blink-cursor-mode 0)

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
(electric-pair-mode t)
(global-font-lock-mode t)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

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

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; helm
(require 'helm-config)
(require 'helm-ag)
(require 'helm-descbinds)
(helm-descbinds-mode)
(global-set-key (kbd "C-;") 'helm-mini)
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

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-no-redo)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

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

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; general key-map
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-t") 'other-window)
(define-key global-map (kbd "s-0") 'delete-window)
(define-key global-map (kbd "s-1") 'delete-other-windows)

;; theme
(load-theme 'zenburn t)

;; Cocoa Emacs
(when window-system
  ;; global emacs style
  (menu-bar-mode 1)
  (scroll-bar-mode 0)
  (fringe-mode 0)
  (add-to-list 'default-frame-alist '(height . 48))
  (add-to-list 'default-frame-alist '(width . 108))
  (set-face-attribute 'default nil
                     :family "Source Code Pro"
                     :height 130)
  (set-fontset-font nil 'japanese-jisx0208
                    (font-spec :family "Hiragino Maru Gothic Pro"))
  (global-hl-line-mode t)
  (setq frame-title-format (format "%%b @ Emacs %s" emacs-version))
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
 '(w3m-header-line-location-title ((t (:background "gray20" :foreground "#F0DFAF" :underline t :weight bold))))
 '(w3m-header-line-location-content ((t (:background "gray20" :foreground "#F0DFAF" :underline t :wigh t bold))))
 '(w3m-image-anchor ((t (:background "dark green")))))

(provide 'init)

;; Local Variables:
;; flycheck-checker: emacs-lisp-checkdoc
;; End:

;;; init.el ends here
