;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-utils)
(require 'init-elpa)

(require-package 'diminish)
(require-package 'f)
(require 'f)

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
(require 'init-ivy)
;(require 'init-helm)
(require 'init-elfeed)
(require 'init-winner)
(require 'init-projectile)
(require 'init-ruby)
(require 'init-org)
(require 'init-javascript)
(require 'init-haskell)
(require 'init-go)
(require 'init-dired)
(require 'init-other)
(require 'init-erc)
(require 'init-web)
(require 'init-hydra)
(require 'init-pomidor)
(require 'custom-funcs)

(setq-default gc-cons-threshold 100000000
              gc-cons-percentage 0.5)

(setq-default tab-width 2)

(require-package 'gist)
(require-package 'solarized-theme)
(load-theme 'solarized-dark t)
(require-package 'smart-mode-line)
(smart-mode-line-enable)
(global-hl-line-mode 1)
;(set-face-background 'hl-line "#302942")
(fset 'yes-or-no-p 'y-or-n-p)

(desktop-save-mode 1)
(setq desktop-restore-eager 20)

(setq-default ispell-program-name "aspell")
(global-set-key (kbd "C-c c") 'ediff-regions-wordwise)
(global-set-key (kbd "M-s") 'other-window)

(global-set-key (kbd "M-1") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-`") 'delete-window) ; close current pane
(global-set-key (kbd "M-2") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-3") 'split-window-horizontally) ; split pane top/bottom

(when (string-equal system-type "darwin") ; Mac OS X
  (setq mac-option-key-is-meta nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq mac-right-option-modifier 'none))

(defalias 'list-buffers 'ibuffer)
(put 'dired-find-alternate-file 'disabled nil)

(require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)

(require-package 'visual-regexp)
(require 'visual-regexp)

(require-package 'rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(setq custom-file (concat user-emacs-directory "customs.el"))
(load custom-file)

(define-key global-map (kbd "C-c q") 'vr/query-replace)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(when (daemonp)
  (exec-path-from-shell-initialize))

(provide 'init)
