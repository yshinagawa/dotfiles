;; edit
(show-paren-mode t)
(global-font-lock-mode t)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

;; ffap
(ffap-bindings)

;; abbrev-mode
(setq save-abbrevs nil)
(setq-default abbrev-mode t)

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)
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
