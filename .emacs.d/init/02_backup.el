;; recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 50)

;; minibuffer history
(savehist-mode 1)

;; placing all backup files in one directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
