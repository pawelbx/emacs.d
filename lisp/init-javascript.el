(require-package 'coffee-mode)
(require-package 'js2-mode)

(add-hook 'coffee-mode-hook 'subword-mode)
(add-hook 'js-2-mode-hook 'subword-mode)

(setq js-indent-level 2)
(setq js2-basic-offset 2)

(provide 'init-javascript)
