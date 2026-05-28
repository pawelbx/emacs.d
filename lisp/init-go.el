(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :hook (go-mode . eglot-ensure)
  :config
  (add-hook 'before-save-hook 'eglot-format-buffer nil t))
