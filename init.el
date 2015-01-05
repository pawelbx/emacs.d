(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-utils)
(require 'init-elpa)

(require-package 'diminish)

(require 'init-gui-frames)
(require 'init-uniquify)
(require 'init-haml)
(require 'init-flycheck)
(require 'init-editing-utils)
(require 'init-css)
(require 'init-company)
(require 'init-git)
(require 'init-flyspell)
(require 'init-isearch)
(require 'init-helm)
(require 'init-elfeed)

(setq-default tab-width 2)
(ample-theme)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#27242E")
(fset 'yes-or-no-p 'y-or-n-p)

(winner-mode 1)

(global-set-key (kbd "C-c c") 'ediff-regions-wordwise)
(global-set-key (kbd "M-s") 'other-window)

(global-set-key (kbd "M-1") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-`") 'delete-window) ; close current pane
(global-set-key (kbd "M-2") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-3") 'split-window-horizontally) ; split pane top/bottom

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)

(defalias 'list-buffers 'ibuffer)

(put 'dired-find-alternate-file 'disabled nil)

(require 'projectile)
(projectile-global-mode t)
(setq projectile-remember-window-configs t)
(helm-projectile-on)

(require 'yasnippet)
(yas-global-mode 1)

(require 'visual-regexp)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
