(require-package 'projectile)

(projectile-global-mode t)
(setq projectile-remember-window-configs t)
(after-load 'helm
  (helm-projectile-on))

(provide 'init-projectile)
