;; xterm-title
;(defun set-xterm-title ()
;  "Set window title for xterm."
;  (xterm-set-window-title
;   (concat (buffer-name)(format " @ Emacs %s" emacs-version))))
;(when (not window-system)
;  (require 'xterm-frobs)
;  (add-hook 'window-configuration-change-hook 'set-xterm-title)
;  (add-hook 'emacs-startup-hook 'set-xterm-title))
