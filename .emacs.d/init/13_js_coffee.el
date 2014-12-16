(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 2)
(setq js2-highlight-level 3)
(add-hook 'js2-mode-hook (lambda () (electric-layout-mode -1)))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(setq whitespace-action '(auto-cleanup))
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
(custom-set-variables '(coffee-tab-width 2))
