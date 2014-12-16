(when window-system
  ;(server-start)
  (menu-bar-mode 1)
  (scroll-bar-mode 0)
  (fringe-mode 0)
  (add-to-list 'default-frame-alist '(height . 48))
  (add-to-list 'default-frame-alist '(width . 95))
  (set-face-attribute 'default nil
                      :family "Source Code Pro"
                      :height 130)
  (set-fontset-font nil 'japanese-jisx0208
                    (font-spec :family "Hiragino Maru Gothic Pro"))
  ;(global-hl-line-mode t)
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b")) " @ Emacs " emacs-version))
  (setq ring-bell-function 'ignore)

  (set-variable 'magit-emacsclient-executable "/usr/local/Cellar/emacs/24.4/bin/emacsclient"))
