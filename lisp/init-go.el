(require-package 'go-mode)

(setenv "PATH" (concat (getenv "PATH") "/home/pbokota/go/bin"))
(setq exec-path (append exec-path '("/home/pbokota/go/bin")))
(setenv "GOPATH" "/home/pbokota/go")
(setq exec-path (append exec-path '("/home/pbokota/go")))

(require-package 'company-go)

(require 'company-go)
(add-to-list 'company-backends 'company-go)

(add-hook 'go-mode-hook 'subword-mode)

(provide 'init-go)
