(require-package 'coffee-mode)
(require-package 'js2-mode)

(add-auto-mode 'js2-mode "\\.js\\'")

(add-hook 'coffee-mode-hook 'subword-mode)
(add-hook 'js2-mode-hook 'subword-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)

(setq js-indent-level 2)
(setq js2-basic-offset 2)

(provide 'init-javascript)
