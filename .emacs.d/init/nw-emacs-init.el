(custom-set-faces
 '(vertical-border ((t (:foreground "#313131"))))
 '(font-lock-fic-face ((t (:foreground "#313131" :background "#6C8C6C" :weight bold)))))

;; xterm-title
;(defun set-xterm-title ()
;  "Set window title for xterm."
;  (xterm-set-window-title
;   (concat (buffer-name)(format " @ Emacs %s" emacs-version))))
;(when (not window-system)
;  (require 'xterm-frobs)
;  (add-hook 'window-configuration-change-hook 'set-xterm-title)
;  (add-hook 'emacs-startup-hook 'set-xterm-title))
