(require-package 'go-mode)

(require-package 'company-go)

(require 'company-go)
(add-to-list 'company-backends 'company-go)

(add-hook 'go-mode-hook 'subword-mode)

(provide 'init-go)
