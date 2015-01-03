;; anzu
(global-anzu-mode +1)
(setq anzu-mode-lighter "")
(setq anzu-deactivate-region t)
(setq anzu-search-threhold 1000)
(setq anzu-replace-to-string-separator " => ")
(global-set-key (kbd "C-c %") 'anzu-query-replace)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c a") 'anzu-query-replace-at-cursor-thing)
