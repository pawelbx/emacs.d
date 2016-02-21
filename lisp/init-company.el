(require-package 'company)

(require-package 'company-statistics)

(add-hook 'prog-mode-hook 'global-company-mode)

(eval-after-load 'company
  '(progn
     (company-statistics-mode)
     (setq company-statistics-size 40000)
     ;; can't work with TRAMP
     (setq company-backends (delete 'company-ropemacs company-backends))
     ;; I don't like the downcase word in company-dabbrev
     ;; for languages use camel case naming convention
     (setq company-dabbrev-downcase nil)
     (setq company-show-numbers t)
     (setq company-begin-commands '(self-insert-command))
     (setq company-idle-delay 0.2)
     (setq company-clang-insert-arguments nil)

     (setq company-global-modes
           '(not
             eshell-mode comint-mode erc-mode gud-mode rcirc-mode))))

(provide 'init-company)
