(use-package dired
  :ensure nil ;; Built-in
  :config
  (setq dired-dwim-target t)
  (setq dired-listing-switches "-lah")
  (setq find-file-visit-truename t)
  (setq dired-listing-switches "-agho --group-directories-first"))

(use-package dired-x
  :ensure nil
  :bind ("C-x d" . dired-jump))

(provide 'init-dired)
