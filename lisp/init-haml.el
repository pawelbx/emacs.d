(use-package haml-mode
  :ensure t
  :mode "\\.hamlc\\'"
  :config
  (define-key haml-mode-map (kbd "C-o") 'open-line))

(provide 'init-haml)
