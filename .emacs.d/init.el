;; global emacs style
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-hl-line-mode 0)
(global-linum-mode t)
(setq linum-format "%3d ")

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
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; elisp
(defun elisp-mode-hooks()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-nultiline-p t)
    (turn-on-eldoc-mode)))
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)
