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

; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/init")

;; global language
;(set-language-environment "Japanese")
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

;; eshell
(add-hook 'eshell-mode-hook (lambda () setq pcomplete-cycle-completions nil))

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

(provide 'init)

;; Local Variables:
;; flycheck-checker: emacs-lisp-checkdoc
;; End:

;;; init.el ends here
