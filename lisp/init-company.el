(use-package company
  :ensure t
  :init
  (global-company-mode 1)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.2)
  (company-tooltip-align-annotations t)
  (company-show-numbers t)
  (company-dabbrev-downcase nil)
  (company-global-modes '(not
                          eshell-mode
                          comint-mode
                          erc-mode
                          gud-mode
                          rcirc-mode
                          haskell-mode
                          message-mode
                          git-commit-mode
                          magit-log-edit-mode))
  :config
  (use-package company-statistics
    :ensure t
    :config
    (setq company-statistics-size 40000)
    (company-statistics-mode 1))
  (setq company-backends '((company-capf :with company-yasnippet)
                           (company-dabbrev-code company-keywords)
                           company-files
                           company-dabbrev)))

(provide 'init-company)
