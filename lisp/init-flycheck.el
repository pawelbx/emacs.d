(use-package flycheck
	:ensure (:ref "34.1")
  :defer t
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 0.8)

  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

(provide 'init-flycheck)
