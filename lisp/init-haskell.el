(require-package 'haskell-mode)
(require-package 'intero)

(require 'haskell-mode)
(require 'intero)

(after-load "haskell-mode"
  (add-hook 'haskell-mode-hook 'intero-mode))

(provide 'init-haskell)
