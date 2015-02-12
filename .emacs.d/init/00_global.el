;; encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

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

(exec-path-from-shell-initialize)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; eshell
(add-hook 'eshell-mode-hook (lambda () setq pcomplete-cycle-completions nil))

;; magit
(require 'magit)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))
