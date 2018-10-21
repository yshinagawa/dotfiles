(when window-system
  (menu-bar-mode 1)
  (scroll-bar-mode 0)
  (fringe-mode 0)
  (define-key global-map (kbd "s-0") 'delete-window)
  (define-key global-map (kbd "s-1") 'delete-other-windows)
  (set-frame-size
   (selected-frame)
   95
   (- (/ (- (x-display-pixel-height) 22) (frame-char-height)) 1))
  (set-face-attribute 'default nil
                      :family "Ricty Diminished Discord"
                      :height 140)
  (setq-default line-spacing 0.2)
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b")) " @ Emacs " emacs-version))
  (setq ring-bell-function 'ignore)

  (set-variable 'magit-emacsclient-executable "/usr/local/Cellar/emacs/25.2/bin/emacsclient"))
