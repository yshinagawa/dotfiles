(when window-system
  (menu-bar-mode 1)
  (scroll-bar-mode 0)
  (fringe-mode 0)
  (define-key global-map (kbd "s-0") 'delete-window)
  (define-key global-map (kbd "s-1") 'delete-other-windows)
  (add-to-list 'default-frame-alist '(height . 48))
  (add-to-list 'default-frame-alist '(width . 95))
  (set-face-attribute 'default nil
                      :family "Ricty Discord"
                      :height 140)
  (set-fontset-font nil 'japanese-jisx0208
                    (font-spec :family "Hiragino Maru Gothic Pro"))
  (setq-default line-spacing 0.2)
  (setq frame-title-format "Emacs")
  ;(setq frame-title-format
  ;      '((:eval (if (buffer-file-name)
  ;                   (abbreviate-file-name (buffer-file-name))
  ;                 "%b")) " @ Emacs " emacs-version))
  (setq ring-bell-function 'ignore)

  (set-variable 'magit-emacsclient-executable "/usr/local/Cellar/emacs/24.4/bin/emacsclient"))
