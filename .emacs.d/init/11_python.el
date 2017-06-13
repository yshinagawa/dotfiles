(setenv "PYTHONIOENCODING" "utf-8")
;; pyenv-mode
(pyenv-mode)
;; elpy
(require 'package)
(add-to-list 'package-archives
           '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;; python mode
(add-hook 'python-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)
             (setq python-indent-guess-indent-offset nil)
             (package-initialize)
             (elpy-enable)
             (elpy-mode)
             ))
;; py-autopep8
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
