;; cl
(require 'cl)

;; global emacs style
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-linum-mode t)
(setq linum-format "%4d ")
(blink-cursor-mode 0)

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

;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; magit
(require 'magit)

;; theme

;; elisp
(defun elisp-mode-hooks()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-nultiline-p t)
    (turn-on-eldoc-mode)))
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)

;; key-map
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-t") 'other-window)

;; Emacs.app
(when window-system
  ;; global emacs style
  (menu-bar-mode t)
  (scroll-bar-mode 0)
  (fringe-mode 0)
  (add-to-list 'default-frame-alist '(height . 48))
  (add-to-list 'default-frame-alist '(width . 108))
  (setq frame-title-format (format "%%b @ Emacs %s" emacs-version))
  (set-face-attribute 'default nil
                     :family "Source Code Pro"
                     :height 130)
  (set-fontset-font nil 'japanese-jisx0208
                    (font-spec :family "Hiragino Maru Gothic Pro"))
  (global-hl-line-mode t)
  (setq ring-bell-function 'ignore)

  ;; theme
  (load-theme 'leuven t))
