(require-package 'haml-mode)

(after-load 'haml-mode
  (define-key haml-mode-map (kbd "C-o") 'open-line))

(add-auto-mode 'haml-mode "\\.hamlc")

(provide 'init-haml)
