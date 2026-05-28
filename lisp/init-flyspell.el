(use-package flyspell
  :ensure nil
  :hook ((prog-mode . flyspell-prog-mode)
         (org-mode . flyspell-mode)
         (git-commit-mode . flyspell-mode))
  :config
  (add-to-list 'flyspell-prog-text-faces 'nxml-text-face)
  (setq flyspell-issue-message-flag nil)
  (setq flyspell-issue-welcome-message nil))

(provide 'init-flyspell)
