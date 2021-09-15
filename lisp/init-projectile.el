(require-package 'projectile)
(require-package 'counsel-projectile)

(projectile-global-mode t)
(setq projectile-remember-window-configs t)
(counsel-projectile-mode)

(define-key projectile-mode-map (kbd "s-w") 'counsel-projectile-switch-project)
(define-key projectile-mode-map (kbd "s-<f2>") 'counsel-projectile-find-file)
(define-key projectile-mode-map (kbd "s-<f3>") 'counsel-projectile-rg)
(define-key projectile-mode-map (kbd "s-<f4>") 'counsel-projectile-find-dir)

(setq projectile-globally-ignored-files '("package-lock.json"))



(setq projectile-globally-ignored-file-suffixes
      '(".png" ".jpg" ".gif" ".woff" ".woff2" ".ttf" ".cache" ".min.js" ".bundle.css" ".min.css" ".bundle.js"))

(provide 'init-projectile)
