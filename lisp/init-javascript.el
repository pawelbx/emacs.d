(require-package 'coffee-mode)
(require-package 'rjsx-mode)
(require-package 'js2-mode)
(require-package 'prettier-js)

(require 'prettier-js)

(add-auto-mode 'rjsx-mode "\\.js\\'")

(add-hook 'coffee-mode-hook 'subword-mode)
(add-hook 'js2-mode-hook 'subword-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)

(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq coffee-tab-width 2)

(provide 'init-javascript)
