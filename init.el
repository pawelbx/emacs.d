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
(require 'init-winner)
(require 'init-projectile)
(require 'init-ruby)
(require 'init-org)
(require 'init-ag)
(require 'init-javascript)
(require 'init-haskell)
(require 'init-go)

(setq-default gc-cons-threshold 100000000
              gc-cons-percentage 0.5)

(setq-default tab-width 2)
(load-theme 'solarized-light t)
(smart-mode-line-enable)
(global-hl-line-mode 1)
;(set-face-background 'hl-line "#302942")
(fset 'yes-or-no-p 'y-or-n-p)

(desktop-save-mode 1)
(setq desktop-restore-eager 20)

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

(require 'yasnippet)
(yas-global-mode 1)

(require 'visual-regexp)

(setq custom-file (concat user-emacs-directory "customs.el"))
(load custom-file)

(define-key global-map (kbd "C-c q") 'vr/query-replace)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
