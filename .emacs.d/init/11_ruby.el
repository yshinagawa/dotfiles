;; rbenv
;(setq rbenv-show-active-ruby-in-modeline nil)
;(require 'rbenv)
;(global-rbenv-mode)

;; ruby
(setq ruby-insert-encoding-magic-comment nil)
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;; rubocop
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; robe
(add-hook 'ruby-mode-hook 'robe-mode)
;(add-hook 'robe-mode-hook 'ac-robe-setup)

;; company
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; rspec
(require 'rspec-mode)

;; ruby-end
(require 'ruby-end)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (add-to-list 'electric-pair-pairs '(?| . ?|))))
