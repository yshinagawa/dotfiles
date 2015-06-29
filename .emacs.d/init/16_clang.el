(require 'clang-format)

(defun my-clang-format-buffer-key ()
  "Set keymap used by `c-mode'."
  (local-set-key (kbd "C-c f") 'clang-format-buffer))
(add-hook 'c-mode-hook 'my-clang-format-buffer-key)
