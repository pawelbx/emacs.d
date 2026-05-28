(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode +1)

  (setq projectile-switch-project-action #'magit-status)
  (setq projectile-indexing-method 'alien
        projectile-enable-caching t
        projectile-sort-order 'recentf)

  (setq projectile-globally-ignored-files '("package-lock.json" "yarn.lock" "go.sum"))
  (setq projectile-globally-ignored-file-suffixes
        '(".png" ".jpg" ".gif" ".woff" ".woff2" ".ttf" ".cache" ".min.js" ".bundle.css")))

(use-package counsel-projectile
  :ensure t
  :after (projectile counsel)
  :demand t                      ;; ← THIS is the key line
  :bind
  (("s-w"    . counsel-projectile-switch-project)
   ("s-<f2>" . counsel-projectile-find-file)
   ("s-<f3>" . counsel-projectile-rg)
   ("s-<f4>" . counsel-projectile-find-dir))
  :config
  (counsel-projectile-mode 1))

(provide 'init-projectile)
