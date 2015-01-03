;; fic-mode
(custom-set-variables
  '(fic-highlighted-words
  (quote ("FIXME" "TODO" "BUG" "KLUDGE" "OPTIMIZE" "HACK" "REVIEW"))))
(require 'fic-mode)
(add-hook 'ruby-mode-hook 'turn-on-fic-mode)
