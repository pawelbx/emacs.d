(require-package 'projectile)
(require-package 'helm-projectile)

(projectile-global-mode t)
(setq projectile-remember-window-configs t)
(after-load 'helm
  (helm-projectile-on))

(setq projectile-mode-line
      '(:eval (format " Projectile[%s(%s)]"
                      (projectile-project-name))))

(define-key projectile-mode-map (kbd "s-<f1>") 'helm-projectile-switch-project)
(define-key projectile-mode-map (kbd "s-<f2>") 'helm-projectile-find-file)
(define-key projectile-mode-map (kbd "s-<f3>") 'helm-projectile-ag)
(define-key projectile-mode-map (kbd "s-<f4>") 'helm-projectile-find-dir)

(provide 'init-projectile)
