;; dired
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "C-t") 'other-window)))

;; dirtree
(require 'dirtree)

;; neotree
;(require 'neotree)
;(global-set-key [f8] 'neotree-toggle)
