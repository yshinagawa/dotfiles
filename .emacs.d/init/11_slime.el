;; slime
;(setf inferior-lisp-program "/usr/local/bin/sbcl")
;(require 'slime-autoloads)
;(slime-setup '(slime-repl slime-fancy slime-banner slime-indentation))
;(setq slime-net-coding-system 'utf-8-unix)
;
;;; ac-slime
;(require 'ac-slime)
;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;(eval-after-load "auto-complete"
;  '(add-to-list 'ac-modes 'slime-repl-mode))
;
;;; popwin
;(require 'popwin)
;(popwin-mode 1)
;(push '("*slime-apropos*") popwin:special-display-config)
;(push '("*slime-macroexpansion*") popwin:special-display-config)
;(push '("*slime-description*") popwin:special-display-config)
;(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;(push '("*slime-xref*") popwin:special-display-config)
;(push '(sldb-mode :stick t) popwin:special-display-config)
;(push '(slime-repl-mode) popwin:special-display-config)
;(push '(slime-connection-list-mode) popwin:special-display-config)
