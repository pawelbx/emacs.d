(require-package 'projectile)
(require-package 'counsel-projectile)

(projectile-global-mode t)
(setq projectile-remember-window-configs t)
(counsel-projectile-mode)

(define-key projectile-mode-map (kbd "s-<f1>") 'counsel-projectile-switch-project)
(define-key projectile-mode-map (kbd "s-<f2>") 'counsel-projectile-find-file)
(define-key projectile-mode-map (kbd "s-<f3>") 'counsel-projectile-rg)
(define-key projectile-mode-map (kbd "s-<f4>") 'counsel-projectile-find-dir)

(provide 'init-projectile)
