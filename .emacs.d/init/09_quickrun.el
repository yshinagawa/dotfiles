;; quickrun
(require 'quickrun)
(global-set-key (kbd "<f5>") 'quickrun)
(quickrun-add-command "ruby/ruby"
                      '((:command . "~/.rbenv/shims/ruby"))
                      :override t)
