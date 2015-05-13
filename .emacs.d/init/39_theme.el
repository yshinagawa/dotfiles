;; tango-dark
(load-theme 'tango-dark t)
(set-cursor-color "#ffffff")
(custom-set-faces
 '(default ((t (:background "grey7"))))
 '(font-lock-comment-face ((t (:slant italic :foreground "grey70"))))
 '(anzu-mode-line ((t :foreground inherit)))
 '(show-paren-match ((t (:weight normal :background nil :underline "white")))))

;; zenburn
;(load-theme 'hc-zenburn)
;(custom-set-faces
; '(anzu-mode-line ((t :foreground "#8FB28F")))
; ;'(fringe ((t (:background "gray15"))))
; '(vertical-border ((t (:foreground "#303030"))))
; '(isearch ((t (:background "#2B2B2B" :foreground "#F0DFAF"))))
; '(default ((t (:foreground "#F6F3E8"))))
; '(font-lock-comment-face ((t (:slant italic))))
; '(show-paren-match ((t (:weight normal :background nil :underline "#F6F3E8")))))

;; solarized-light
;(require 'solarized)
;(deftheme solarized-light "The light variant of the Solarized colour theme")
;(create-solarized-theme 'light 'solarized-light)
;(provide-theme 'solarized-light)
