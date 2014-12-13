(require-package 'company)

(add-hook 'prog-mode-hook 'global-company-mode)

(eval-after-load 'company
  '(progn
     ;; can't work with TRAMP
     (setq company-backends (delete 'company-ropemacs company-backends))
     (setq company-backends (delete 'company-capf company-backends))
     ;; I don't like the downcase word in company-dabbrev
     ;; for languages use camel case naming convention
     (setq company-dabbrev-downcase nil)
     (setq company-show-numbers t)
     (setq company-begin-commands '(self-insert-command))
     (setq company-idle-delay 0.2)
     (setq company-clang-insert-arguments nil)
     ))

(provide 'init-company)
