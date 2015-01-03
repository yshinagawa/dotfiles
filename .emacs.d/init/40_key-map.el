;; general key-map
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-t") 'other-window)
(define-key global-map (kbd "s-0") 'delete-window)
(define-key global-map (kbd "s-1") 'delete-other-windows)

;; minibuffer history key-map
(define-key minibuffer-local-map (kbd "M-p") 'previous-complete-history-element)
(define-key minibuffer-local-map (kbd "M-n") 'next-complete-history-element)
(define-key minibuffer-local-map (kbd "M-r") 'previous-matching-history-element)
(define-key minibuffer-local-map (kbd "M-s") 'next-matching-history-element)
