(require-package 'magit)
(require-package 'git-gutter)

(global-git-gutter-mode t)
(git-gutter:linum-setup)

(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-c s") 'magit-status)

(provide 'init-git)
