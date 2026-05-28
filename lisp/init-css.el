(use-package rainbow-mode
  :ensure t
  :hook (css-ts-mode-hook
         html-mode-hook
         sass-mode-hook))

(use-package css-mode
  :ensure nil
  :mode ("\\.css\\'" . css-ts-mode)
  :mode ("\\.scss\\'" . css-ts-mode)
  :hook ((css-ts-mode . eglot-ensure)
         (css-ts-mode . subword-mode))
  :config
  (setq css-indent-offset 2))

(use-package sass-mode
  :ensure t
  :mode "\\.sass\\'")

(provide 'init-css)
