(use-package haskell-mode
  :ensure t
  :mode "\\.hs\\'"
  :hook (haskell-mode . eglot-ensure))

(use-package haskell-ts-mode
  :ensure t
  :mode "\\.hs\\'")
