(require-package 'magit)
;(require-package 'git-gutter)
(require-package 'git-timemachine)

;(global-git-gutter-mode t)
;(git-gutter:linum-setup)

;(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-c s") 'magit-status)

;magit-status will take all space in frame
(fullframe projectile-vc magit-mode-quit-window)
(fullframe magit-status magit-mode-quit-window)

(provide 'init-git)
