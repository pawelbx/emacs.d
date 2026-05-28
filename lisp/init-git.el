(use-package transient :elpaca t)
(use-package magit
  :elpaca (magit :repo "https://github.com/magit/magit.git"
                 :ref "v4.5.0")
  :after (transient)
  :bind ("C-c s" . magit-status)
  :config)

(use-package git-timemachine
  :ensure t
  :bind ("C-c t" . git-timemachine))

(use-package diff-hl
  :ensure t
  :hook ((magit-pre-refresh  . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :init
  (global-diff-hl-mode)
  :config
  (diff-hl-flydiff-mode))

(provide 'init-git)
